import sys
import os
sys.path.append(os.path.realpath(os.path.join(__file__, '..','connect')))
from robot.api import logger
from robot.libraries.BuiltIn import BuiltIn
from JMNDTelnet import JMNDTelnet
from JMNDSsh import JMNDSsh
from JMNDUart import JMNDUart


class Device:
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'
    def __init__(self, platform = 'qemu'):
        self.platform = platform                # 平台类型，暂未使用
        self.port = [None for _ in range(20)]   # 当前最多支持同时连接20个端口

    # 设置平台类型，暂未使用
    def setPlatform(self, platform):
        self.platform = platform

    # 连接一个设备端口
    def Connect(self, info):
        logger.info(info)
        if info["type"] == "telnet":
            new_connect = JMNDTelnet(info["ip"], info["port"], info["endStr"], info["timeOut"])
        elif info["type"] == "ssh":
            new_connect = JMNDSsh(info["ip"], info["port"], info["name"], info["password"], info["endStr"], info["timeOut"])
        elif info["type"] == "uart":
            new_connect = JMNDUart(info["com"], info["baud"], info["timeOut"])
        logger.info("connecting......")
        connect = new_connect.Connect()
        if connect is None:
            logger.error("connected fail!")
        else:
            logger.info("connected Success!")

        id = info["id"]
        if isinstance(id, str):
            id = int(id)
        self.port[id] = new_connect

    # 断开一个设备端口
    def DisConnect(self, port_id):
        if isinstance(port_id, str):
            port_id = int(port_id)
        self.port[port_id].DisConnect
        self.port[port_id] = None

    # 向指定端口发送命令
    # 输入参数: port_id - 端口ID，用于指定发送命令行的端口，可以是数值型变量，也可以是字符串型变量
    #          cmd - 待发送的命令行，字符串型
    #          endStr - 命令行执行结束标识字符串，当有该字符串输出时认为命令行执行结束，可选参数，默认为连接端口时在字典中指定的“endStr”参数，字符串型
    #          timeOut - 命令行执行超时时间，可选参数，默认为连接端口时在字典中指定的“timeOut”参数，可以是数值型变量，也可以是字符串型变量
    # 返回值: 命令行执行的回显，字符串型
    def Send(self, port_id, cmd, endStr = None, timeOut = None):
        if isinstance(port_id, str):
            port_id = int(port_id)
        if self.port[port_id] is None:
            logger.error("port unconnected!")
            assert False
            return
        return self.port[port_id].Send(cmd, endStr, timeOut)


if __name__ == "__main__":
    t = Device(platform = "qemu")
    uart_info = {"id": 0, "type":"telnet", "ip":"10.1.70.160", "port":"7665", "endStr":"shell_scp", "timeOut":10}
    t.Connect(uart_info)
    ret = t.Send(0, "show_version")
    print(ret)
    t.DisConnect()
