*** Settings ***
Suite Setup       host远程连接串口    ${evb_ip}    ${evb_uname}    ${evb_passwd}    ${evb_alias}    ${pc_ip}    ${pc_uname}    ${pc_passwd}    ${ap_alias}
Suite Teardown    host远程退出串口    ${ap_alias}
Library           SSHLibrary
Library           String
Library           OperatingSystem
Resource          ../common/keywork.robot

*** Test Cases ***
AP环境拉起
    [Tags]    bringup
    switch connection    ${ap_alias}
    sleep    1s
    Write    lscpu
    sleep    1s
    ${ap_log}    Read    delay=5s
    Should Contain    ${ap_log}    CPU(s):
