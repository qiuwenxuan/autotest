
import sys
import os
sys.path.append(os.path.realpath(os.path.join(__file__, '..', '..', 'connect')))
from Connection import Connection

class Dut:
    name = ""
    ports = dict()

    def __init__(self, dutName):
        self.name = dutName

    def Connect(self):
        for port in self.ports.values():
            if isinstance(port, Connection):
                port.Connect()

    def DisConnect(self):
        for port in self.ports.values():
            if isinstance(port, Connection):
                port.DisConnect()
    
    def __str__(self):
        msg = "{{\"name\" : \"{0}\", \"ports\": [".format(self.name)
        portsMsg = list(map(str, self.ports.values()))
        msg += ", ".join(portsMsg)
        msg += "]}"
        return msg