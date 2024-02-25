*** Settings ***
Suite Setup       host远程连接串口    ${evb_ip}    ${evb_uname}    ${evb_passwd}    ${evb_alias}    ${pc_ip}    ${pc_uname}    ${pc_passwd}    ${scp_alias}
Suite Teardown    host远程退出串口    ${scp_alias}
Library           SSHLibrary
Library           String
Library           OperatingSystem
Resource          ../common/keywork.robot
*** Test Cases ***
SCP环境拉起
    [Tags]    bringup    SCP
    [Setup]
    环境登录    ${evb_ip}    ${evb_uname}    ${evb_passwd}
    DPU下电
    DPU上电
    Close Connection
    switch connection    ${scp_alias}
    Set Client Configuration    timeout=300s
    ${scp_log}    Read    delay=240s
    log    ${scp_log}
    Should Contain    ${scp_log}    load and wakeup AP done
