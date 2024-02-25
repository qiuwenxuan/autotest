*** Settings ***
Library           SSHLibrary
Library           SerialLibrary
Library           String
Library           OperatingSystem
Resource          ../common/keywork.robot

*** Test Cases ***
COSSW-23573 通过访问共享内存配置获取platform信息
    ${atf_log}    Read
    Should Contain    ${atf_log}    BL2: platform ID

COSSW-23574 通过访问共享内存配置获取安全启动信息
    ${atf_log}    Read
    Should Contain    ${atf_log}    ns

COSSW-23575 MMU页表配置及使能
    ${atf_log}    Read
    Should Contain    ${atf_log}    NOTICE: PA1 0x1f801000 :: Region: 0x1f801000 - 0x20000000 has attributes 0xa
    Should Contain    ${atf_log}

COSSW-23594 启动跳转BL31
    ${atf_log}    Read
    Should Contain    ${atf_log}    BL2: Booting BL31
