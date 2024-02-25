import sys
import os
sys.path.append(os.path.realpath(os.path.join(__file__, '..', '..','common')))
sys.path.append(os.path.realpath(os.path.join(__file__, '..', '..','common','Dut')))
from DutFactory import DutFactory
import re
from robot.api import logger

class testsuit1:
    #####################################
    # 类初始化必备，这部分不用改，照抄即可 #
    #####################################
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    ##############################
    # 下面方法根据自己需要自行实现 #
    ##############################
    # 设置链接的验证环境信息
    # 创建保存设备信息的类变量，RF在运行时会创建该类的实例，此时会执行此方法
    def suit_setup(self, env1="CreteEmu", env2="Host"):
        ##################################################################################################
        # 根据环境信息，创建DUT，环境详细信息在SupportPkg/enviroment_info/目录下, 入参为不带后缀的文件名
        # 使用方法：可在此处修改调用的json文件名，亦可在.robot脚本中调用suit_setup方法时通过传参数修改
        ##################################################################################################
        self.chip = DutFactory.CreateDutFast(env1)
        self.chip.Connect()  # 连接dut的所有port
        self.host = DutFactory.CreateDutFast(env2) # 创建HOST
        self.host.Connect() # 连接host
        logger.info("testsuit1 suit_setup")

    # 断开所有连接的端口
    def suit_teardown(self):
        self.chip.DisConnect() # 断开dut
        self.host.DisConnect() # 断开host
        logger.info("testsuit1 suit_teardown")

    # 每个用例执行前的公共前置步骤，非必须，可根据需要定义
    def test_setup(self):
        logger.info("testsuit1 test_setup")

    # 每个用例执行后的公共后置步骤，非必须，可根据需要定义
    def test_teardown(self):
        logger.info("testsuit1 test_teardown")

    # 测试用例demo1，连接多端口的例子
    def testcase1(self):
        # Step1：查询scp bos版本号，并提取版本时间信息
        # 往dut 的"uart0"发送命令，此处以“show_version"作为示范 获取回显存储在ret
        ret = self.chip.ports["uart0"].Send("show_version")     # 向指定端口发送命令行
        ret = re.search(r'(\d+):(\d+):(\d+)', ret)              # 利用正则表达式提取回显中需要的信息
        if ret:
            hour = ret.group(1).lower()
            mini = ret.group(2).lower()
            sec = ret.group(3).lower()
            logger.info( "time is {0} {1} {2}".format(hour, mini, sec))
            assert True                                         # 匹配到需要提取的信息，设置用例pass
        else:
            assert False                                        # 未匹配到需要提取的信息，设置用例fail

        # Step2：查询uart1的bos版本号
        # 往dut的"uart1"发送命令，此处以“show_version"作为示范 获取回显存储在ret
        ret = self.chip.ports["uart1"].Send("show_version")
        # print(ret)                # Send方法中默认会记录发送的内容和抓取的回显，不需要再记录一遍，直接处理结果即可
        assert "retval = " in ret   # 判断命令行执行的回显中是否包含“retval = ”这个字符串，包含则设置用例pass，否则设置用fail

        # Step3：查询uart2的bos版本号
        # 往dut的"uart2"发送命令，此处以“show_version"作为示范 获取回显存储在ret
        ret = self.chip.ports["uart2"].Send("show_version")
        assert "retval = " in ret

        # Step4：查询Host OS版本号，并判断是否为Ubuntu系统
        # 往host的"pc0"发送命令，此处以“uname -a"作为示范 获取回显存储在ret
        ret = self.host.ports["PC0"].Send("uname -a")
        assert "Ubuntu" in ret

    # 测试用例demo2，发送命令时需要设置endStr的情况，比如在Host上执行切换root用户操作时，
    # 回显无默认的命令行提示符，就需要设置其他字符串用于识别命令行执行完成
    def testcase2(self):
        ret = self.host.ports["PC0"].Send("sudo -i", ":")
        ret = self.host.ports["PC0"].Send("qwe123!@#", "#")
        ret = self.host.ports["PC0"].Send("whoami", "#")
        assert "root" in ret                        # 判断是否已经切换成root账号
        ret = self.host.ports["PC0"].Send("exit")    # 退出root账号，恢复环境

    # 发送命令行时需要设置timeout的情况，比如linux的top命令，并不会返回，若一直等待“结束符”则可能永远不会等到，就需要通过超时退出机制，让测试步骤走下去
    def testcase3(self):
        ret = self.host.ports["PC0"].Send("lspci -vx")
        ret = self.host.ports["PC0"].Send("top", None, 5)
        ret = self.host.ports["PC0"].Send("\003")

if __name__ == "__main__":
    t = testsuit1()
    t.suit_setup()
    t.testcase1()
    t.suit_teardown()