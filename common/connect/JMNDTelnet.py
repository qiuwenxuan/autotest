from telnetlib import Telnet
from Connection import Connection
from robot.api import logger

class JMNDTelnet(Connection):
    def __init__(self, ip, port, endStr, timeout):
        self.type = "telnet"
        self.ip = ip
        self.port = port
        if isinstance(timeout, str):
            timeout = int(timeout)
        self.timeOut = timeout
        self.endStr = endStr

    def Connect(self):
        self.tn = Telnet(self.ip, port = self.port, timeout=10)
        return self.tn

    def Write(self, cmd):
        self.tn.write(cmd)

    def Read(self):
        ret = self.tn.read_very_eager() 
        return ret

    def Send(self, cmd, endStr = None, timeOut = None):
        logger.info("Send CMD: " + cmd)
        cmd = cmd + "\n"
        self.tn.write(cmd.encode('utf-8'))
        if endStr is None:
            endStr = self.endStr
        if timeOut is None:
            timeOut = self.timeOut
        if isinstance(timeOut, str):
            timeOut = int(timeout)
        ret = self.tn.read_until(endStr.encode('utf-8'), timeout = timeOut)
        logger.info(ret.decode('utf-8'))
        return ret.decode('utf-8')

    def DisConnect(self):
        self.tn.close()

    def __str__(self):
        msg = "{{\"type\": {0}, \"ip\": {1}, \"port\": {2}}}".format(self.type, self.ip, self.port)
        return msg