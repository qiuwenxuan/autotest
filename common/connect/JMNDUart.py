import serial
from Connection import Connection
from robot.api import logger

class JMNDUart(Connection):
    def __init__(self, com, baud, endStr, timeOut) :
        self.type = "uart"
        self.com = com
        self.baud = baud
        if isinstance(timeout, str):
            timeout = int(timeout)
        self.timeOut = timeout
        self.endStr = endStr

    def Connect(self):
        # self.serial = serial.Serial('COM3', 9600, timeout=0.5) #/dev/ttyUSB0
        self.serial = serial.Serial(self.com, self.baud, timeout=self.timeOut) #/dev/ttyUSB0
        return self.serial

    def Write(self, cmd):
        self.serial.write(data)

    def Read(self):
        data = self.serial.read_all()
        return data
    
    def Send(self, cmd, endStr = None, timeOut = None):
        logger.info("Send CMD: " + cmd)
        if endStr is None:
            endStr = self.endStr
        if timeOut is None:
            timeOut = self.timeOut
        if isinstance(timeOut, str):
            timeOut = int(timeOut)
        # TODO:

    def DisConnect(self):
        self.serial.close()

    def __str__(self):
        msg = "{{\"type\": {0}, \"com\": {1}, \"baud\": {2}}}".format(self.type, self.com, self.baud)
        return msg    