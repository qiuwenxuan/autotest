*** Settings ***
Suite Setup       host远程连接串口    ${evb_ip}    ${evb_uname}    ${evb_passwd}    ${evb_alias}    ${pc_ip}    ${pc_uname}    ${pc_passwd}    ${imu_alias}
Suite Teardown    host远程退出串口    ${imu_alias}
Library           SSHLibrary
Library           String
Library           OperatingSystem
Resource          ../common/keywork.robot
*** Test Cases ***
IMU_LOG获取
    [Tags]    bringup    evb1
    环境登录    ${evb_ip}    ${evb_uname}    ${evb_passwd}
    DPU下电
    DPU上电
    Close Connection
    switch connection    ${imu_alias}
    Set Client Configuration    timeout=300s
    ${imu_log}    Read    delay=240s
    Set Global Variable    ${imu_log}
    log    ${imu_log}

IMU环境拉起
    [Tags]    bringup    evb1
    switch connection    ${imu_alias}
    sleep    1s
    Write    display version\r\n
    sleep    1s
    ${log}    Read    delay=1s
    Should Contain    ${log}    image name imu_version.bin

COSSW-22265 loader最小系统启动到logo输出
    [Tags]    bringup    evb1    SW_TEST
    Should Contain    ${imu_log}    IMU loader

COSSW-22266 加载版本并跳转成功
    [Tags]    bringup    evb1
    Should Contain    ${imu_log}    IMU0

COSSW-22267 version最小系统启动到命令行
    [Tags]    bringup    evb1
    Should Contain    ${imu_log}    uart:~$

COSSW-22269 串口驱动UART_0加载成功
    [Tags]    bringup    evb1
    Should Contain    ${imu_log}    uart:~$

COSSW-22271 systick驱动sys_clock加载成功
    [Tags]    bringup    evb1
    switch connection    ${imu_alias}
    ${log}    输入命令并获取回显    device list\r\n
    Should Contain    ${log}    sys_clock (READY)

COSSW-22273 IMU0 DDR运行空间配置正确，全局地址为0x0_0000_4000_0000
    [Tags]    bringup    evb1
    Should Contain    ${imu_log}    ${IMU_DDR_RUN}

COSSW-22274 IMU0 DDR共享空间配置正确
    [Tags]    bringup    evb1
    Should Contain    ${imu_log}    ${IMU_DDR_SHARED}

COSSW-22275 IMU0 DPE空间CFG配置正确
    [Tags]    bringup    evb1
    Should Contain    ${imu_log}    ${DPE_REMAP_CFG}

COSSW-22276 IMU0 DPE空间MAC配置正确
    [Tags]    bringup    evb1
    Should Contain    ${imu_log}    ${DPE_REMAP_MAC}

COSSW-22280 IMU0 TCM配置空间配置正确
    [Tags]    bringup    evb1
    Should Contain    ${imu_log}    ${TCM_REMAP}

COSSW-22281 IMU0 IOSUB空间配置正确
    [Tags]    bringup    evb1
    Should Contain    ${imu_log}    ${IOSUB_REMAP}

COSSW-22285 IMU0 MHU配置空间配置正确
    [Tags]    bringup    evb1
    Should Contain    ${imu_log}    ${MHU_REMAP}

COSSW-22286 IMU0 MHU共享内存空间配置正确
    [Tags]    bringup    evb1
    Should Contain    ${imu_log}    ${MHU_REMAP_SHARED}

COSSW-22287 IMU0 QSPI flash空间配置正确，关键寄存器读写正常
    [Tags]    bringup    evb1
    Should Contain    ${imu_log}    ${QSPI_FLASH_REMAP}
    # \ \ \ Delete All Ports
    # \ \ \ 串口登录 \ \ \ ${imu_com}
    # \ \ \ ${log1} \ \ \ 输入命令并获取回显 \ \ \ devmem 0xD8000000 \ \ \ 10s
    # \ \ \ ${data} \ \ \ Generate Random String \ \ \ 4 \ \ \ 123456789ABCDEF
    # \ \ \ ${data_lowercase} \ \ \ Convert To Lowercase \ \ \ ${data}
    # \ \ \ ${log2} \ \ \ 输入命令并获取回显 \ \ \ devmem 0xD8000000 32 ${data_lowercase} \ \ \ 10s
    # \ \ \ ${log3} \ \ \ 输入命令并获取回显 \ \ \ devmem 0xD8000000 \ \ \ 10s
    # \ \ \ 日志匹配验证 \ \ \ ${log3} \ \ \ ${data_lowercase} \ \ \ 2
    # \ \ \ Delete All Ports

COSSW-22288 IMU0 全局动态空间配置正确，典型地址读写正常
    [Tags]    bringup    evb1
    Should Contain    ${imu_log}    ${GLOBAL_DYNAMIC_REMAP}
    switch connection    ${imu_alias}
    ${log2}    输入命令并获取回显    phys read 0x25 0x40400ff0    10s
    Should Contain    ${log2}    0x2540400ff0: 0000000d

COSSW-22289 确认MPU配置开启
    [Tags]    bringup    evb1
    Should Contain    ${imu_log}    ${IMU_MPU_ENABLE}

COSSW-22301 IMU0 version中探测32位定时器
    [Tags]    bringup    evb1
    switch connection    ${imu_alias}
    ${log}    输入命令并获取回显    device list    10s
    Should Contain    ${log}    ${IMU0_TIMER32}

COSSW-22302 IMU0 version中设置32位定时器top值
    [Tags]    bringup    evb1
    switch connection    ${imu_alias}
    ${log}    输入命令并获取回显    demo counter    10s
    Should Contain    ${log}    ${IMU0_TIME32_TOP_VALUE}

COSSW-22303 IMU0 version中设定32位定时器倒数开始
    [Tags]    bringup    evb1
    switch connection    ${imu_alias}
    ${log}    输入命令并获取回显    demo counter    10s
    Should Contain    ${log}    ${IMU0_TIME32_SET_COUNTER}

COSSW-22305 IMU0 version中探测64位定时器
    [Tags]    bringup    evb1
    switch connection    ${imu_alias}
    ${log}    输入命令并获取回显    device list    10s
    Should Contain    ${log}    ${IMU0_TIMER64}

COSSW-22306 IMU0 version中设置64位定时器top值
    [Tags]    bringup    evb1
    switch connection    ${imu_alias}
    ${log}    输入命令并获取回显    demo counter64    10s
    Should Contain    ${log}    ${IMU0_TIME64_TOP_VALUE}

COSSW-22307 IMU0 version中设定64位定时器倒数开始
    [Tags]    bringup    evb1
    switch connection    ${imu_alias}
    ${log}    输入命令并获取回显    demo counter64    10s
    Should Contain    ${log}    ${IMU0_TIME64_SET_COUNTER}

COSSW-22309 IMU0 version中探测看门狗
    [Tags]    bringup    evb1
    switch connection    ${imu_alias}
    ${log}    输入命令并获取回显    device list    10s
    Should Contain    ${log}    ${IMU0_WATCHDOG}

COSSW-22277 PSUB空间TLP配置正确
    [Tags]    bringup    evb1
    Should Contain    ${imu_log}    ${IMU0_PSUB_TLP_REMAP}

COSSW-22280 TCM配置空间配置正确，关键寄存器读写正常
    [Tags]    bringup    evb1
    Should Contain    ${imu_log}    ${IMU0_PSUB_TLP_REMAP}

COSSW-22281 IOSUB空间配置正确，关键寄存器读写正常
    [Tags]    bringup    evb1
    Should Contain    ${imu_log}    ${IMU0_IOSUB_REMAP}

COSSW-22282 PSUB空间PCCU配置正确
    [Tags]    bringup    evb1
    Should Contain    ${imu_log}    ${IMU0_PSUB_PCCU_REMAP}

COSSW-22283 PSUB空间PCIeCfg配置正确
    [Tags]    bringup    evb1
    Should Contain    ${imu_log}    ${IMU0_PSUB_PCIE_REMAP}

COSSW-22284 PSUB空间DMA配置正确
    [Tags]    bringup    evb1
    Should Contain    ${imu_log}    ${IMU0_PSUB_DMA_REMAP}

COSSW-22292 icache和dcache开启
    [Tags]    bringup    evb1
    Should Contain    ${imu_log}    ${IMU0_ICACHE_ENABLE}
    Should Contain    ${imu_log}    ${IMU0_DCACHE_ENABLE}

COSSW-22272 获取cycle和uptime有变化
    串口登录    ${imu_com}
    ${log11}    输入命令并获取回显    kernel cycles    10s
    ${log11}    Replace String    ${log11}    \r\n    ${SPACE}
    ${log12}    输入命令并获取回显    kernel cycles    10s
    ${log12}    Replace String    ${log12}    \r\n    ${SPACE}
    ${data11}    Evaluate    "${log11}".split(${SPACE})[1]
    ${data12}    Evaluate    "${log12}".split(${SPACE})[1]
    Should Not Be Equal As Numbers    ${data11}    ${data12}
    ${log21}    输入命令并获取回显    kernel uptime    10s
    ${log21}    Replace String    ${log21}    \r\n    ${SPACE}
    ${log22}    输入命令并获取回显    kernel uptime    10s
    ${log22}    Replace String    ${log22}    \r\n    ${SPACE}
    ${data21}    Evaluate    "${log21}".split(${SPACE})[1]
    ${data22}    Evaluate    "${log22}".split(${SPACE})[1]
    Should Not Be Equal As Numbers    ${data21}    ${data22}
    [Teardown]    Delete All Ports

主区SCP flash 烧写
    evb环境登录    10.21.186.3    root    0penBmc
    write    ipmitool power off
    sleep    1s
    write    cp ${scp_master_file} /tmp/
    SCP flash 部分烧写    ${scp_master_offset}    ${scp_len}    /tmp/${scp_master_file}
    write    ipmitool power on
    sleep    1s

主区SCP_DDR_PHY_FW flash 烧写
    evb环境登录    10.21.186.3    root    0penBmc
    write    ipmitool power off
    sleep    1s
    write    cp ${scp_master_ddr_phy_fw_file} /tmp/
    SCP flash 部分烧写    ${scp_master_ddr_phy_fw_offset}    ${scp_len}    /tmp/${scp_master_ddr_phy_fw_file}
    write    ipmitool power on
    sleep    1s

从区SCP flash 烧写
    evb环境登录    10.21.186.3    root    0penBmc
    write    ipmitool power off
    sleep    1s
    write    cp ${scp_slave_file} /tmp/
    SCP flash 部分烧写    ${scp_slave_offset}    ${scp_len}    /tmp/${scp_slave_file}
    write    ipmitool power on
    sleep    1s

从区SCP DDR_PHY_FW flash 烧写
    evb环境登录    10.21.186.3    root    0penBmc
    write    ipmitool power off
    sleep    1s
    write    cp ${scp_slave_ddr_phy_fw_file} /tmp/
    SCP flash 部分烧写    ${scp_slave_ddr_phy_fw_offset}    ${scp_len}    /tmp/${scp_slave_ddr_phy_fw_file}
    write    ipmitool power on
    sleep    1s

主区IMU flash 烧写
    evb环境登录    10.21.186.3    root    0penBmc
    write    ipmitool power off
    sleep    1s
    write    cp ${imu_master_file} /tmp/
    IMU flash 部分烧写    ${imu_master_offset}    ${imu_len}    /tmp/${imu_master_file}
    write    ipmitool power on
    sleep    1s

当前配置区 IMU flash 烧写
    evb环境登录    10.21.186.3    root    0penBmc
    write    ipmitool power off
    sleep    1s
    write    cp ${imu_current_conf_file} /tmp/
    SCP flash 部分烧写    ${imu_current_conf_offset}    ${imu_len}    /tmp/${imu_current_conf_file}
    write    ipmitool power on
    sleep    1s

出场配置区 IMU flash 烧写
    evb环境登录    10.21.186.3    root    0penBmc
    write    ipmitool power off
    sleep    1s
    write    cp ${imu_factory_conf_file} /tmp/
    SCP flash 部分烧写    ${imu_factory_conf_offset}    ${imu_len}    /tmp/${imu_factory_conf_file}
    write    ipmitool power on
    sleep    1s

从区IMU flash 烧写
    evb环境登录    10.21.186.3    root    0penBmc
    write    ipmitool power off
    sleep    1s
    write    cp ${imu_slave_file} /tmp/
    SCP flash 部分烧写    ${imu_slave_offset}    ${imu_len}    /tmp/${imu_slave_file}
    write    ipmitool power on
    sleep    1s
