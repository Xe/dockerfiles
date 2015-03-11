#!/usr/bin/python2

# Copyright (C) 2014 Christine Dodrill <xena@yolo-swag.com> All rights reserved.
#
# This software is provided 'as-is', without any express or implied
# warranty. In no event will the authors be held liable for any damages
# arising from the use of this software.
#
# Permission is granted to anyone to use this software for any purpose,
# including commercial applications, and to alter it and redistribute it
# freely, subject to the following restrictions:
#
# 1. The origin of this software must not be misrepresented; you must not
#    claim that you wrote the original software. If you use this software
#    in a product, an acknowledgment in the product documentation would be
#    appreciated but is not required.
#
# 2. Altered source versions must be plainly marked as such, and must not be
#    misrepresented as being the original software.
#
# 3. This notice may not be removed or altered from any source
#    distribution.
#

import baker
import docker
import json
import os
import subprocess
import time

client = docker.Client()

@baker.command
def build():
    """
    Builds the docker images
    """

    client.build(path="server", tag="xena/minecraft:server")
    client.build(path="data", tag="xena/minecraft:data")
    client.build(path="data-ambassador", tag="xena/minecraft:data-amb")
    client.build(path="backup", tag="xena/minecraft:backup")

@baker.command
def establish(prefix):
    """
    Establish a server name and setup its data container.

    The prefix prefixes the server container names.
    """

    spawn_data(prefix)

    spawn(prefix)

@baker.command
def spawn(prefix):
    """
    Respawn a server with prefix name
    """

    server_id = client.create_container("xena/minecraft:server", name="%s-mc-server" % prefix,
            ports=["25565"], stdin_open=True, tty=True)
    client.start(server_id, publish_all_ports=True, volumes_from="%s-mc-data" % prefix)

    print "Server %s started" % prefix

    portinfo(prefix)

@baker.command
def spawn_data(prefix):
    """
    Spawns the data container for a minecraft server
    """

    data_id = client.create_container("xena/minecraft:data", name="%s-mc-data" % prefix,
            detach=True)
    client.start(data_id)

    amb_id = client.create_container("xena/minecraft:data-amb", detach=False)
    client.start(amb_id, volumes_from="%s-mc-data" % prefix)
    client.wait(amb_id)
    client.remove_container(amb_id)

    print "Data for %s started and permissions set" % prefix

@baker.command
def addop(prefix, opname):
    """
    Arbitrarily add a server operator
    """

    subprocess.call(["bash", "scripts/addop.sh", opname, prefix])
    print "Op %s on %s added." % (opname, prefix)

@baker.command
def portinfo(prefix):
    """
    Gets the local and nonpersistent ip/port numbers for a server at prefix
    """

    server_id = "%s-mc-server" % prefix

    ip = None
    port = None

    container = client.inspect_container(server_id)
    ip = container["NetworkSettings"]["IPAddress"]
    port = container["NetworkSettings"]["Ports"]["25565/tcp"][0]["HostPort"]

    print "IP: %s" % ip
    print "Port: %s" % port

@baker.command
def logs(prefix):
    """
    Get logs for a prefix
    """

    subprocess.call(["docker", "logs", "%s-mc-server" % prefix])

@baker.command
def kill(prefix, purge=False):
    """
    Kills a minecraft server, optionally purging it
    """

    server_id = "%s-mc-server" % prefix

    subprocess.call(["bash", "scripts/kill-server.sh", prefix])

    client.stop(server_id)
    client.remove_container(server_id)

    print "stopped %s" % server_id

    if purge:
        data_id = "%s-mc-data" % prefix
        client.stop(data_id)
        client.remove_container(data_id)

        print "Data for %s removed" % prefix

@baker.command
def backup(prefix, mega=False):
    """
    Backup a minecraft server.
    """

    subprocess.call(["bash", "scripts/backup.sh", prefix])
    name = "%s-%s.tgz" % (prefix, time.time())
    os.rename("backup.tgz", name)

    print "Backup for %s written to %s." % (prefix, name)

    if mega:
        from mega import Mega

        config = {}

        with open(os.getenv("HOME") + "/.config/mineupload/conf.json", "r") as fin:
            config = json.loads(fin.read())

        username, password = config["u"], config["p"]

        print "Logging into mega..."

        mega = Mega({"verbose": True})
        m = mega.login(username, password)

        print "Uploading %s to mega..." % name

        fpointer = m.upload(name)

        print "URL: %s" % m.get_upload_link(fpointer)
        print "Local copy removed"

        os.remove(name)

baker.run()

