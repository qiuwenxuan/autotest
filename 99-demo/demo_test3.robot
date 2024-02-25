*** Settings ***
Documentation     测试用例demo，用例步骤在rf文件中编写
Suite Setup       suite_setup
Suite Teardown    suite_teardown
Test Timeout      5 minutes 10 seconds    # 每个用例最大执行时间，超过此时间则认为用例超时，强制设置用例结果为失败
Resource          ../common/port.robot

*** Variables ***
&{scp_uart}       id=0    type=telnet    ip=10.1.70.160    port=7665    endStr=shell_scp->    timeOut=10
&{vpe_uart}       id=1    type=telnet    ip=10.1.70.160    port=7666    endStr=shell_vpe->    timeOut=10
&{rpe_uart}       id=2    type=telnet    ip=10.1.70.160    port=7667    endStr=shell_rpe->    timeOut=10
&{host_ssh}       id=3    type=ssh    ip=10.1.70.160    port=22    name=cdns-edk    password=qwe123!@\#    endStr=$    timeOut=10

*** Test Cases ***
case1:
    [Documentation]    多连接，发送命令的Demo，发送命令使用默认的endStr（命令行结束标识符）和timeout（命令执行超时时间）。
    ${ret}    send_cmd    ${scp_uart.id}    show_version
    should_contain    ${ret}    retval =
    ${ret}    send_cmd    ${vpe_uart.id}    show_version
    should_contain    ${ret}    retval =
    ${ret}    send_cmd    ${rpe_uart.id}    show_version
    should_contain    ${ret}    retval =
    ${ret}    send_cmd    ${host_ssh.id}    uname -a
    should_contain    ${ret}    Ubuntu

case2:
    [Documentation]    发送命令时需要设置endStr的情况，比如在Host上执行切换root用户操作时，
    ...    回显无默认的命令行提示符，就需要设置其他字符串用于识别命令行执行完成
    ${ret}    send_cmd    ${host_ssh.id}    sudo -i    :
    ${ret}    send_cmd    ${host_ssh.id}    qwe123!@\#    \#
    ${ret}    send_cmd    ${host_ssh.id}    whoami    \#
    should_contain    ${ret}    root
    ${ret}    send_cmd    ${host_ssh.id}    exit

case3:
    [Documentation]    发送命令行时需要设置timeout的情况，比如发某些，下面例子并不是特别合适，只是提供设置timeout的例子
    ${ret}    send_cmd    ${host_ssh.id}    /home/cdns-edk/adolf/crete-bos/build/build_host/host.out    ${None}    15
    ${crtl_c}    Evaluate    chr(int(3))
    ${ret}    send_cmd    ${host_ssh.id}    ${crtl_c}

*** Keywords ***
suite_setup
    port_connect    ${scp_uart}
    port_connect    ${vpe_uart}
    port_connect    ${rpe_uart}
    port_connect    ${host_ssh}

suite_teardown
    port_disconnect    ${scp_uart.id}
    port_disconnect    ${vpe_uart.id}
    port_disconnect    ${rpe_uart.id}
    port_disconnect    ${host_ssh.id}
