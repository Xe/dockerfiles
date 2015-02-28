import base64
import znc

class athemesasl(znc.Module):
    module_types = [znc.CModInfo.UserModule]

    def __init__(self):
        self.description = "Atheme SASL"

    def OnServerCapAvailable(self, scap):
        self.cookie = self.getCookie()
        self.username = self.GetUser().GetUserName()
        return scap == "sasl"

    def OnServerCapResult(self, scap, success):
        if scap == "sasl":
            if success:
                self.PutIRC("AUTHENTICATE AUTHCOOKIE")
                self.PutIRC("AUTHENTICATE " +
                        self.makeSaslAuthString(self.username, self.cookie))
            self.PutUser(":bnc.yolo-swag.com NOTICE * :*** Authenticated over Atheme XMLRPC")

    def makeSaslAuthString(self, username, cookie):
        return (base64.b64encode(bytes("%s\0%s\0%s" %
            (username, username, cookie), "utf-8"))).decode("utf-8")

    def getCookie(self):
        with open("/tmp/znc-cookie-%s" %
                self.GetUser().GetUserName(), "r") as fin:
            return fin.readline()

