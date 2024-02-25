*** Settings ***
Suite Setup       QEMU环境启动    ${server_ip}    ${server_uname}    ${server_passwd}    ${qemu_alias}
Suite Teardown    QEMU环境关闭    ${qemu_alias}
Library           SSHLibrary
Resource          keyword.robot

*** Test Cases ***
环境部署
    拷贝文件    ${server_ip}

scp bl3 拉起
    switch connection    ${qemu_alias}
    ${log}    read    delay=1s
    should contain    ${log}    Crete SCP BL3
    write    \n
    ${name}    read    delay=1s
    should contain    ${name}    uart:~$

imu0拉起
    open connection    ${server_ip}
    login    Amy.Feng    qwe123!@#
    sleep    1s
    write    telnet localhost 6666
    write    \n
    ${log}    read    delay=1s
    should contain    ${log}    uart:~$
    close connection

imu1拉起
    open connection    ${server_ip}
    login    Amy.Feng    qwe123!@#
    write    telnet localhost 6667
    write    \n
    ${log}    read    delay=1s
    should contain    ${log}    uart:~$
    close connection

imu2拉起
    open connection    ${server_ip}
    login    Amy.Feng    qwe123!@#
    write    telnet localhost 6668
    write    \n
    ${log}    read    delay=1s
    should contain    ${log}    uart:~$
    close connection

imu3拉起
    open connection    ${server_ip}
    login    Amy.Feng    qwe123!@#
    write    telnet localhost 6669
    write    \n
    ${log}    read    delay=1s
    should contain    ${log}    uart:~$
    close connection
