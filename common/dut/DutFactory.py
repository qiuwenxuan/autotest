import json
import re
import sys
import os
sys.path.append(os.path.realpath(os.path.join(__file__, '..', '..', 'connect')))
from Connection import Connection
from Dut import Dut
from JMNDTelnet import JMNDTelnet
from JMNDSsh import JMNDSsh
from JMNDUart import JMNDUart

class DutFactory:
    @staticmethod
    def GetDataByJson(jsonFile):
        fi = open(jsonFile, "r")
        jsondata = json.loads(fi.read())
        fi.close()         
        #print(jsondata["module_name"])
        return jsondata

    @staticmethod
    def CreatePort(portInfo):
        if portInfo["io"] == "telnet":
            port = JMNDTelnet(portInfo["ip"], portInfo["port"], portInfo["endStr"], portInfo["timeOut"])
            return port
        if portInfo["io"] == "ssh":
            # def __init__(self, ip, port, userName, passWord, endStr, timeout):
            port = JMNDSsh(portInfo["ip"], portInfo["port"], portInfo["sshname"], portInfo["sshpwd"], portInfo["endStr"], portInfo["timeOut"])
            return port
        else:
            return None

    @staticmethod
    def CreateDutFast(envName):
        jsonFile = os.path.join(os.path.realpath(os.path.join(__file__, '..', '..', 'environment_info')), envName + ".json")
        jsonData = DutFactory.GetDataByJson(jsonFile)
        name = jsonData["name"]
        dut = Dut(name)
        print(dut.name)
        portList = jsonData["ports"]
        for portInfo in portList:
            portNmae = portInfo["name"]
            port = DutFactory.CreatePort(portInfo)
            if port is not None:
                dut.ports[portNmae] = port
        return dut
    
    @staticmethod    
    def CreateDut(jsonFile):
        jsonData = DutFactory.GetDataByJson(jsonFile)
        name = jsonData["name"]
        dut = Dut(name)
        print(dut.name)
        portList = jsonData["ports"]
        for portInfo in portList:
            portNmae = portInfo["name"]
            port = DutFactory.CreatePort(portInfo)
            if port is not None:
                dut.ports[portNmae] = port
        return dut


if __name__ == "__main__":
    crete = DutFactory.CreateDut(os.path.join('..', 'environment_info', 'CreteEmu.json'))
    print(str(crete))
    crete1 = DutFactory.CreateDutFast("CreteEmu")
    print(str(crete1))

        