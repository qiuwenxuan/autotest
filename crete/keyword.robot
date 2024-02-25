*** Settings ***

*** Variables ***
${server_ip}      10.21.188.76
${server_uname}    Amy.Feng
${server_passwd}    qwe123!@#
${qemu_alias}     qemu_env
${qemu_pathway}    /home/Amy.Feng/qemu
${crete_build_path}    /home/

*** Keywords ***
QEMU环境启动
    [Arguments]    ${server_ip}    ${server_uname}    ${server_passwd}    ${dev_alias}
    open connection    ${server_ip}    alias=${dev_alias}
    sleep    1s
    login    Amy.Feng    qwe123!@#
    sleep    1s
    write    cd ${qemu_pathway} \n
    sleep    1s
    write    ./crete_evb.sh \n
    sleep    1s

QEMU环境关闭
    [Arguments]    ${dev_alias}
    switch connection    ${dev_alias}
    sleep    1s
    write    cd ${qemu_pathway} \n
    sleep    1s
    write    ./crete_soc_clear.sh \n
    sleep    1s
    Close All Connections

拷贝文件
    [Arguments]    ${server_ip}
    open connection    ${server_ip}
    sleep    1s
    login    Amy.Feng    qwe123!@#
    sleep    1s
    write    cd ${qemu_pathway}/crete/firmware
    sleep    1s
    write    cp ${crete_build_path}/build/crete/imu_bmc/zephyr/imu_bmc.bin ./imu_bmc/
    write    cp ${crete_build_path}/build/crete/imu_bmc/zephyr/imu_bmc.elf ./imu_bmc/
    write    cp ${crete_build_path}/build/crete/imu_bmc/zephyr/imu_bmc.img ./imu_bmc/
    write    cp ${crete_build_path}/build/crete/imu_bmc/zephyr/imu_dpe.bin ./imu_dpe/
    write    cp ${crete_build_path}/build/crete/imu_bmc/zephyr/imu_dpe.elf ./imu_dpe/
    write    cp ${crete_build_path}/build/crete/imu_bmc/zephyr/imu_dpe.img ./imu_dpe/
    write    cp ${crete_build_path}/build/crete/imu_bmc/zephyr/imu_psub.bin ./imu_psub/
    write    cp ${crete_build_path}/build/crete/imu_bmc/zephyr/imu_psub.elf ./imu_psub/
    write    cp ${crete_build_path}/build/crete/imu_bmc/zephyr/imu_psub.img ./imu_psub/
    write    cp ${crete_build_path}/build/crete/imu_bmc/zephyr/imu_rdma.bin ./imu_rdma/
    write    cp ${crete_build_path}/build/crete/imu_bmc/zephyr/imu_rdma.elf ./imu_rdma/
    write    cp ${crete_build_path}/build/crete/imu_bmc/zephyr/imu_rdma.img ./imu_rdma/
    write    cp ${crete_build_path}/build/crete/imu_bmc/zephyr/imu_selfboot.bin ./imu_selfboot/
    write    cp ${crete_build_path}/build/crete/imu_bmc/zephyr/imu_selfboot.elf ./imu_selfboot/
    write    cp ${crete_build_path}/build/crete/imu_bmc/zephyr/imu_selfboot.img ./imu_selfboot/
    write    cp ${crete_build_path}/build/crete/imu_bmc/zephyr/scp_ramfw.bin ./scp_ramfw/
    write    cp ${crete_build_path}/build/crete/imu_bmc/zephyr/scp_ramfw.elf ./scp_ramfw/
    write    cp ${crete_build_path}/build/crete/imu_bmc/zephyr/scp_ramfw.img ./scp_ramfw/
    write    cp ${crete_build_path}/build/crete/imu_bmc/zephyr/scp_ramfw_bl3.bin ./scp_ramfw_bl3/
    write    cp ${crete_build_path}/build/crete/imu_bmc/zephyr/scp_ramfw_bl3.elf ./scp_ramfw_bl3/
    write    cp ${crete_build_path}/build/crete/imu_bmc/zephyr/scp_ramfw_bl3.img ./scp_ramfw_bl3/
    write    cp ${crete_build_path}/build/crete/imu_bmc/zephyr/scp_romfw.bin ./scp_romfw/
    write    cp ${crete_build_path}/build/crete/imu_bmc/zephyr/scp_romfw.elf ./scp_romfw/
    write    cp ${crete_build_path}/build/crete/imu_bmc/zephyr/scp_romfw.img ./scp_romfw/
