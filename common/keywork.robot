*** Settings ***
*** Variables ***
${evb_cpld_strap_imu_selfboot}    i2cset -f -y 4 0x74 0x8c 0x41
${evb_ip}         10.21.186.68
${evb_passwd}     0penBmc
${evb_uname}      root
${evb_alias}      bmc
${ap_ip}          10.21.186.168
${ap_passwd}      root
${ap_uname}       root
${ap_alias}       ap
${server_ip}      10.21.188.76
${server_uname}    jaguar
${server_passwd}    jaguar
${pc_ip}          10.21.187.107
${pc_uname}       root
${pc_passwd}      jaguar
${pc_alias}       virtio-host
${cpld_file}      21200101CDEAA_V1R0_CPLD_101_2023101519.svf
${imu_flash_file}    imu_flash.img
${scp_flash_file}    scp_flash_evb1_n2_2.4g_cmn_1.85g.img
${serdes_port0}    2
${serdes_port1}    6
${scp_alias}      scp
${imu_alias}      imu
${ap_alias}       ap
${imu_com}        COM35
${evb_com}        COM36
${scp_com}        COM37
${ap_com}         COM38
${IMU_DDR_SHARED}    0x43a11010:local:0x60000000-80000000 global:0x00400 en:1, 0x60000000 --> 0x0040000000, length:512MB
${IMU_DDR_RUN}    0x43a11030:local:0x80000000-a0000000 global:0x00200 en:1, 0x80000000 --> 0x0020000000, length:512MB
${DPE_REMAP_CFG}    0x43a11050:local:0xa0000000-a4000000 global:0x70000 en:1, 0xa0000000 --> 0x7000000000, length: 64MB
${DPE_REMAP_MAC}    0x43a11070:local:0xa4000000-ac000000 global:0x70680 en:1, 0xa4000000 --> 0x7068000000, length:128MB
${TCM_REMAP}      0x43a11090:local:0xac000000-b0000000 global:0x91000 en:1, 0xac000000 --> 0x9100000000, length: 64MB
${IOSUB_REMAP}    0x43a110b0:local:0xb0000000-b4000000 global:0x80000 en:1, 0xb0000000 --> 0x8000000000, length: 64MB
${MHU_REMAP}      0x43a110d0:local:0xb4000000-b6000000 global:0x80100 en:1, 0xb4000000 --> 0x8010000000, length: 32MB
${MHU_REMAP_SHARED}    0x43a110f0:local:0xb8000000-c0000000 global:0x60000 en:1, 0xb8000000 --> 0x6000000000, length:128MB
${QSPI_FLASH_REMAP}    0x43a11110:local:0xc0000000-c0400000 global:0x25402 en:1, 0xc0000000 --> 0x2540200000
${GLOBAL_DYNAMIC_REMAP}    0x43a111f0:local:0xdc000000-e0000000 global:0x40440 en:1, 0xdc000000 --> 0x4044000000, length: 64MB
${IMU0_PSUB_TLP_REMAP}    0x43a11150:local:0xca000000-cc000000 global:0x90820 en:1, 0xca000000 --> 0x9082000000, length: 32MB
${IMU0_TCM_REMAP}    0x43a11170:local:0xcc000000-ce000000 global:0x90850 en:1, 0xcc000000 --> 0x9085000000, length: 32MB
${IMU0_IOSUB_REMAP}    0x43a11190:local:0xd0000000-d0600000 global:0x2043a en:1, 0xd0000000 --> 0x2043a00000
${IMU0_PSUB_PCCU_REMAP}    0x43a111b0:local:0xd4000000-d5000000 global:0x001d8 en:1, 0xd4000000 --> 0x001d800000, length: 16MB
${IMU0_PSUB_PCIE_REMAP}    0x43a111d0:local:0xd8000000-d8100000 global:0x40400 en:1, 0xd8000000 --> 0x4040000000
${IMU0_PSUB_DMA_REMAP}    0x43a11130:local:0xc4000000-ca000000 global:0x90880 en:1, 0xc4000000 --> 0x9088000000, length: 96MB
${IMU_MPU_ENABLE}    [INFO] \ MPU \ \ \ \ : enable
${IMU0_TIMER32}    TIMER32 (READY)
${IMU0_TIME32_TOP_VALUE}    et_top_value
${IMU0_TIME32_SET_COUNTER}    Set counter in
${IMU0_TIMER64}    TIMER64 (READY)
${IMU0_TIME64_TOP_VALUE}    et_top_value
${IMU0_TIME64_SET_COUNTER}    Set counter in
${IMU0_WATCHDOG}    - WATCHDOG (READY)
${IMU0_ICACHE_ENABLE}    [INFO] \ I-Cache : enable
${IMU0_DCACHE_ENABLE}    [INFO] \ D-Cache : enable
${scp_master_offset}    xxx
${scp_master_ddr_phy_fw_offset}    xxx
${scp_slave_offset}    xxx
${scp_slave_ddr_phy_fw_offset}    xxx
${scp_len}        xxx
${scp_master_file}    xxx
${scp_master_ddr_phy_fw_file}    xxx
${scp_slave_file}    xxx
${scp_slave_ddr_phy_fw_file}    xxx
${imu_master_offset}    0x00100000
${imu_current_conf_offset}    xxx
${imu_factory_conf_offset}    xxx
${imu_slave_offset}    xxx
${imu_len}        0x00400000
${imu_master_file}    imu_version.img
${imu_current_conf_file}    xxx
${imu_factory_conf_file}    xxx
${imu_slave_file}    xxx

*** Keywords ***
cpld_strap_更新
    [Arguments]    ${addr1}    ${var1}    ${addr2}    ${var2}    ${addr3}    ${var3}    ${addr4}    ${var4}    ${addr5}    ${var5}
    Write    i2cset -f -y 4 0x74 ${addr1} ${var1}
    sleep    3s
    Write    i2cset -f -y 4 0x74 ${addr2} ${var2}
    sleep    3s
    Write    i2cset -f -y 4 0x74 ${addr3} ${var3}
    sleep    3s
    Write    i2cset -f -y 4 0x74 ${addr4} ${var4}
    sleep    3s
    Write    i2cset -f -y 4 0x74 ${addr5} ${var5}
    sleep    3s

cpld_strap_dump
    Write    i2cdump -f -y 4 0x74
    ${cpld_dump}    read    delay=3s
    log    ${cpld_dump}

COM口开启
    [Arguments]    ${com}    ${baudrate}
    add port    ${com}    ${baudrate}

COM口关闭
    [Arguments]    ${com}
    close port    ${com}

环境登录
    [Arguments]    ${dev_addr}    ${username}    ${passwd}    ${wtime}=1
    ${dev_alias}    Generate Random String
    log    ${dev_addr}
    open connection    ${dev_addr}    ${dev_alias}    timeout=300s
    sleep    ${wtime}
    ${log}    login    ${username}    ${passwd}
    [Return]    ${dev_alias}

传输文件至evb
    [Arguments]    ${source_file}    ${dest_path}
    ${evb_alias}    环境登录    ${evb_ip}    ${evb_uname}    ${evb_passwd}
    sleep    1s
    log    ${source_file}
    put file    ${source_file}    ${dest_path}    mode=0744
    Sleep    5s
    Close Connection

从版本服务器拷贝文件
    [Arguments]    ${source_file}    ${dest_path}
    ${evb_alias}    环境登录    ${server_ip}    ${server_uname}    ${server_passwd}
    sleep    1s
    SSHLibrary.Get File    ${source_file}    ${dest_path}    mode=0744
    sleep    5s
    Close Connection

DPU下电
    write    ipmitool power off
    sleep    3s

DPU上电
    write    ipmitool power on
    sleep    3s

输入命令并获取回显
    [Arguments]    ${cmd}    ${wtime}=1
    Write    ${cmd}\r\n
    sleep    ${wtime}
    ${log}    Read
    log    ${log}
    [Return]    ${log}

串口登录
    [Arguments]    ${com_num}    ${baudrate}=115200
    add port    ${com_num}    baudrate=${baudrate}
    sleep    1s
    open port    ${com_num}
    sleep    1s
    set encoding    UTF-8
    ${a}    Get Encoding
    log    ${a}

日志匹配验证
    [Arguments]    ${log}    ${label}    ${times}
    Should Contain X Times    ${log}    ${label}    ${times}

evb环境登录
    [Arguments]    ${dev_addr}    ${username}    ${passwd}    ${wtime}=1
    open connection    ${dev_addr}
    sleep    ${wtime}
    ${log}    login    ${username}    ${passwd}

SCP flash部分烧写
    [Arguments]    ${offset}    ${len}    ${file}
    write    i2cset -f -y 4 0x74 0xbc 0x14
    sleep    1s
    write    i2cdump -f -y 4 0x74
    sleep    1s
    write    cd /sys/bus/platform/drivers/ASPEED_FMC_SPI/
    sleep    1s
    write    echo "1e631000.spi" > unbind
    sleep    1s
    write    echo "1e631000.spi" > bind
    sleep    1s
    write    cat /proc/mtd
    ${output}    read    delay=1s
    Should Contain    ${output}    mtd12
    write    mtd_debug erase /dev/mtd12 ${offset} ${len}
    sleep    30s
    ${imu_size}    execute command    stat -c '%s' ${file}
    log    ${imu_size}
    write    mtd_debug write /dev/mtd12 ${offset} ${imu_size} ${file}
    sleep    5s
    write    mtd_debug read /dev/mtd12 ${offset} ${imu_size} /tmp/readbk.bin
    sleep    5s
    write    diff /tmp/readbk.bin ${file}
    ${diff_log}    read    delay=1s
    Should Not Contain    ${diff_log}    differ
    write    i2cset -f -y 4 0x74 0xbc 0
    sleep    1s
    write    i2cdump -f -y 4 0x74
    sleep    1s

IMU flash部分烧写
    [Arguments]    ${offset}    ${len}    ${file}
    write    i2cset -f -y 4 0x74 0xbc 0x41
    sleep    1s
    write    i2cdump -f -y 4 0x74
    sleep    1s
    write    cd /sys/bus/platform/drivers/ASPEED_FMC_SPI/
    sleep    1s
    write    echo "1e631000.spi" > unbind
    sleep    1s
    write    echo "1e631000.spi" > bind
    sleep    1s
    write    cat /proc/mtd
    ${output}    read    delay=1s
    Should Contain    ${output}    mtd12
    write    mtd_debug erase /dev/mtd12 ${offset} ${len}
    sleep    30s
    ${imu_size}    execute command    stat -c '%s' ${file}
    log    ${imu_size}
    write    mtd_debug write /dev/mtd12 ${offset} ${imu_size} ${file}
    sleep    5s
    write    mtd_debug read /dev/mtd12 ${offset} ${imu_size} /tmp/readbk.bin
    sleep    5s
    write    diff /tmp/readbk.bin ${file}
    ${diff_log}    read    delay=1s
    Should Not Contain    ${diff_log}    differ
    write    i2cset -f -y 4 0x74 0xbc 0
    sleep    1s
    write    i2cdump -f -y 4 0x74
    sleep    1s

MINITERM环境登录中
    [Arguments]    ${pc_ip}    ${username}    ${passwd}    ${bmc_port}    ${dev_alias}    ${wtime}=1
    log    ${pc_ip}
    open connection    ${pc_ip}    alias=${dev_alias}    encoding=utf-8    encoding_errors=ignore
    sleep    2s
    login    ${username}    ${passwd}
    sleep    2s
    write    pyserial-miniterm.exe --raw ${bmc_port} 115200\r\n
    ${log}=    read    delay=3s
    # \ \ \ Start Command \ \ \ pyserial-miniterm.exe --raw ${bmc_port} 115200
    # \ \ \ sleep \ \ \ 2s
    # \ \ ${log}= \ \ \ \ \ \ \ \ Read Command Output
    log    ${log}
    sleep    2s
    [Return]    ${dev_alias}

MINITERM环境退出中
    [Arguments]    ${dev_alias}
    SSHLibrary.Switch Connection    ${dev_alias}
    ${mt_exit}    Evaluate    chr(int(29))
    SSHLibrary.Write    ${mt_exit}\r\n

host远程连接串口
    [Arguments]    ${evb_ip}    ${evb_uname}    ${evb_passwd}    ${evb_alias}    ${pc_ip}    ${pc_uname}    ${pc_passwd}    ${dev_alias}
    ${bmc_alias}    DPU.bmc切换串口    ${evb_ip}    ${evb_uname}    ${evb_passwd}    ${evb_alias}    ${dev_alias}
    ${dev_alias}    登录执行机    ${pc_ip}    ${pc_uname}    ${pc_passwd}    ${dev_alias}
    log    evb_ip=${evb_ip}
    log    evb_uname=${evb_uname}
    log    evb_passwd=${evb_passwd}
    log    evb_alias=${evb_alias}
    log    pc_ip=${pc_ip}
    log    pc_uname=${pc_uname}
    log    pc_passwd=${pc_passwd}
    log    dev_alias=${dev_alias}
    Switch Connection    ${dev_alias}
    write    ipmitool -I lanplus -H 10.21.186.68 -U root -P 0penBmc sol deactivate
    sleep    3s
    write    ipmitool -I lanplus -H 10.21.186.68 -U root -P 0penBmc sol activate
    sleep    3s
    Run Keyword And Ignore Error    write    \r\n\r\n    timeout=5s
    sleep    2s
    Run Keyword And Ignore Error    write    \r\n    timeout=5s
    Run Keyword If    '${dev_alias.upper()}' == 'AP'    执行登录N2命令
    log    host已连接到${dev_alias.upper()}串口！
    [Return]    ${dev_alias}

host远程退出串口
    [Arguments]    ${dev_alias}
    Switch Connection    ${dev_alias}
    ${mt_exit}    Evaluate    chr(int(29))
    Run Keyword And Ignore Error    Write    ${mt_exit}\r\n    timeout=5s

登录DPU.bmc
    [Arguments]    ${bmc_ip}    ${bmc_username}    ${bmc_passwd}    ${bmc_alias}
    open connection    ${bmc_ip}    alias=${bmc_alias}    encoding=utf-8    encoding_errors=ignore
    Login    ${bmc_username}    ${bmc_passwd}
    sleep    1s
    [Return]    ${bmc_alias}

登录执行机
    [Arguments]    ${host_ip}    ${host_username}    ${host_passwd}    ${host_alias}
    open connection    ${host_ip}    alias=${host_alias}    encoding=utf-8    encoding_errors=ignore
    Login    ${host_username}    ${host_passwd}
    sleep    1s
    [Return]    ${host_alias}

DPU.bmc切换串口
    [Arguments]    ${bmc_ip}    ${bmc_username}    ${bmc_passwd}    ${bmc_alias}    ${Serial_Type}
    登录DPU.bmc    ${bmc_ip}    ${bmc_username}    ${bmc_passwd}    ${bmc_alias}
    Run Keyword If    '${Serial_Type.upper()}' == 'SCP'    执行切换scp串口命令
    ...    ELSE IF    '${Serial_Type.upper()}' == 'IMU'    Run Keyword    执行切换imu串口命令
    ...    ELSE IF    '${Serial_Type.upper()}' == 'AP'    Run Keyword    执行切换ap串口命令
    ...    ELSE    Log    Unsupported Serial Type: ${Serial_Type}
    Log    DPU.bmc切换${Serial_Type.upper()}串口成功！
    [Return]    ${bmc_alias}

执行切换scp串口命令
    write    i2cset -f -y 4 0x74 0xbe 0x73\r\n

执行切换imu串口命令
    write    i2cset -f -y 4 0x74 0xbe 0x77\r\n

执行切换ap串口命令
    write    i2cset -f -y 4 0x74 0xbe 0x7b\r\n

执行登录N2命令
    write    root\r\n
    sleep    2s
    write    root\r\n
    sleep    2s
