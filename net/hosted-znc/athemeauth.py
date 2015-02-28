from xmlrpc.client import ServerProxy, Fault

import znc

class Atheme:
    def __init__(self, url):
        self.url = url
        self.proxy = ServerProxy(url)
        self.cookie = "*"
        self.username = "*"
        self._privset = None

    def login(self, username, password):
        self.username = username
        self.cookie = self.proxy.atheme.login(username, password)
        self.privs()

    def privs(self):
        if self._privset is not None:
            return self._privset

        self._privset = self.proxy.atheme.privset(self.cookie, self.username).split()
        return self._privset

class athemeauth(znc.Module):
    module_types = [znc.CModInfo.GlobalModule]

    def __init__(self):
        pass

    def OnLoginAttempt(self, auth):
        username = auth.GetUsername()
        password = auth.GetPassword()

        atheme = Atheme("http://173.10.70.249:8069/xmlrpc")
        user = znc.CZNC.Get().FindUser(username)

        if user != None:
            if user.GetPass() != "::":
                #Allow normal ZNC accounts to log in
                return znc.CONTINUE

        try:
            atheme.login(username, password)

        except Fault:
            return znc.CONTINUE

        if user == None:
            myuser = znc.CUser(username)

            auth.GetSocket().Write(":bnc.yolo-swag.com NOTICE * :*** Creating account for %s...\r\n" % username)
            auth.GetSocket().Write(":bnc.yolo-swag.com NOTICE * :*** Thank you for supporting ShadowNET!\r\n")

            baseuser = znc.CZNC.Get().FindUser("scrub")
            baseuser.thisown = 0

            s = znc.String()
            s.thisown = 0

            if not myuser.Clone(baseuser, s, False):
                print("WTF?", s)
                return znc.CONTINUE

            if not znc.CZNC.Get().AddUser(myuser, s):
                print("WTF?", s)
                return znc.CONTINUE
            user = myuser

            user.SetPass("::", znc.CUser.HASH_MD5, "::")

            #this is a new user, set up stuff
            user.SetNick(username)
            user.SetAltNick(username + "`")
            user.SetIdent(username[:8])
            user.SetRealName("ShadowNET hosted bnc user %s" % username)
            user.SetDenySetBindHost(True)
            user.SetQuitMsg("Shutting down!")
            user.SetMaxNetworks(1)
            user.SetAdmin(False)

            #They are going to want a network to talk on.
            user.AddNetwork("ShadowNET", s)
            network = user.FindNetwork("ShadowNET")
            network.AddServer("cyka.yolo-swag.com +6697")
            network.AddChan("#lobby", True)
            network.AddChan("#bnc", True)
            network.JoinChans()

            fout = open("/tmp/znc-cookie-%s" % username, "w")
            fout.write(atheme.cookie)
            fout.close()

            znc.CZNC.Get().WriteConfig()

        auth.GetSocket().Write(":bnc.yolo-swag.com NOTICE * :*** Welcome to the ShadowNET BNC %s!\r\n" % username)
        auth.GetSocket().Write(":bnc.yolo-swag.com NOTICE * :*** Your IP address is %s and may be checked for proxies.\r\n" % auth.GetRemoteIP())

        auth.AcceptLogin(user)
        user.thisown = 0

        return znc.HALT

