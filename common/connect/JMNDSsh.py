from telnetlib import Telnet
from Connection import Connection
import paramiko
import time
from robot.api import logger

class JMNDSsh(Connection):
    def __init__(self, ip, port, userName, passWord, endStr, timeout):
        self.type = "ssh"
        self.ip = ip
        self.port = port
        if isinstance(timeout, str):
            timeout = int(timeout)
        self.timeOut = timeout
        self.endStr = endStr
        self.userName = userName
        self.passWord = passWord

    def Connect(self):
        self.ssh = paramiko.SSHClient()
        self.ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        self.ssh.connect(hostname=self.ip, port=self.port, username=self.userName, password=self.passWord)
        self.channel = self.ssh.invoke_shell()
        if self.channel is not None:
            time.sleep(1)
            ret = self.channel.recv(2048)
            logger.info(ret)
        return self.channel

    def Write(self, cmd):
        self.channel.send(cmd)

    def Read(self):
        ret = self.channel.recv(1024)
        return ret.decode('utf-8')

    def Send(self, cmd, endStr = None, timeOut = None):
        logger.info("Send CMD: " + cmd)
        #stdin, stdout, stderr = self.ssh.exec_command(cmd.encode('utf-8'))
        cmd = cmd + "\n"
        self.channel.send(cmd.encode('utf-8'))
        if endStr is None:
            endStr = self.endStr
        if timeOut is None:
            timeOut = self.timeOut
        if isinstance(timeOut, str):
            timeOut = int(timeOut)
        #ret = stdout.read()
        ret = ""
        i = 0
        while True:
            if self.channel.recv_ready():
                ret += self.channel.recv(10240).decode('utf-8')
                if endStr in ret:
                    break
            else:
                time.sleep(1)
                i += 1
                if i >= timeOut:
                    break
        logger.info(ret)
        return ret

    def DisConnect(self):
        self.ssh.close()

    def __str__(self):
        msg = "{{\"type\": {0}, \"ip\": {1}, \"port\": {2}}}".format(self.type, self.ip, self.port)
        return msg
