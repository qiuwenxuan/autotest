*** Settings ***
Library           SSHLibrary
Library           String
Library           OperatingSystem
Resource          ../common/keywork.robot

*** Test Cases ***
scp_flash烧写
    [Tags]
    环境登录    ${evb_ip}    ${evb_uname}    ${evb_passwd}
    DPU下电
    #传输文件至evb    ${scp_flash_file}    /tmp/
    log    ${scp_flash_file}
    put file    ${scp_flash_file}    /tmp/
    Sleep    5s
    write    firmware_tool.sh SCP /tmp/${scp_flash_file}
    Set Client Configuration    timeout=300s
    SSHLibrary.Read Until    upgrade end at
    [Teardown]    Close All Connections

imu_flash烧写
    [Tags]
    环境登录    ${evb_ip}    ${evb_uname}    ${evb_passwd}
    DPU下电
    #传输文件至evb    ${imu_flash_file}    /tmp/
    log    ${imu_flash_file}
    put file    ${imu_flash_file}    /tmp/
    Sleep    5s
    write    firmware_tool.sh AP /tmp/${imu_flash_file}
    Set Client Configuration    timeout=300s
    SSHLibrary.Read Until    upgrade end at
    [Teardown]    Close All Connections
