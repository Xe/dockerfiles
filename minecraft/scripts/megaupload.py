# Copyright (C) 2014 Sam Dodrill <xena@yolo-swag.com> All rights reserved.
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

from mega import Mega

import json
import os
import sys

mega = Mega()

if len(sys.argv) > 2:
    print "Need file to upload"
    sys.exit(-1)

fname = sys.argv[1]

config = {}

with open(os.getenv("HOME") + "/.config/mineupload/conf.json", "r") as fin:
    config = json.loads(fin.read())

username, password = config["u"], config["p"]

m = mega.login(username, password)

fpointer = m.upload(fname)
print m.get_upload_link(fpointer)

