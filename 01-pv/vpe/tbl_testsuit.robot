*** Settings ***
Documentation     测试用例demo，用例步骤在对应的python文件(tbl_testsuit.py)中编写，本rf文件只是套一个壳子
Suite Setup       suite_setup
Suite Teardown    suite_teardown
Test Setup        test_setup
Test Teardown     test_teardown
Test Timeout      5 minutes 10 seconds    # 每个用例最大执行时间，超过此时间则认为用例超时，强制设置用例结果为失败
Library           vpe_tbl_testsuit.py

*** Variables ***
${chip_info}      CreteQemu
${times}      1    
*** Test Cases ***
urm_rxuridx_tbl_check:
    vpe_tbl_testsuit.vpe_urm_rxuridx_tbl_mem_check_rw    ${times}

urm_txuridx_tbl_check:
    vpe_tbl_testsuit.vpe_urm_txuridx_tbl_mem_check_rw    ${times}

urm_drtymap_tbl_check:
    vpe_tbl_testsuit.vpe_urm_drtymap_tbl_mem_check_rw    ${times}

urm_drtycfg_tbl_check:
    vpe_tbl_testsuit.vpe_urm_drtycfg_tbl_mem_check_rw    ${times}

urm_rxmsixvec_tbl_check:
    vpe_tbl_testsuit.vpe_urm_rxmsixvec_tbl_mem_check_rw    ${times}

urm_txmsixvec_tbl_check:
    vpe_tbl_testsuit.vpe_urm_txmsixvec_tbl_mem_check_rw    ${times}

urm_rxurrng_tbl_check:
    vpe_tbl_testsuit.vpe_urm_rxurrng_tbl_mem_check_rw    ${times}

urm_txurrng_tbl_check:
    vpe_tbl_testsuit.vpe_urm_txurrng_tbl_mem_check_rw    ${times}

urm_rxfeature_tbl_check:
    vpe_tbl_testsuit.vpe_urm_rxfeature_tbl_mem_check_rw    ${times}

urm_txfeature_tbl_check:
    vpe_tbl_testsuit.vpe_urm_txfeature_tbl_mem_check_rw    ${times}

urm_tph_tbl_check:
    vpe_tbl_testsuit.vpe_urm_tph_tbl_mem_check_rw    ${times}

qmap_qmap_tbl_check:
    vpe_tbl_testsuit.vpe_qmap_qmap_tbl_mem_check_rw    ${times}

qmap_dev_tbl_check:
    vpe_tbl_testsuit.vpe_qmap_dev_tbl_mem_check_rw    ${times}

qmap_rx_que_qen_tbl_check:
    vpe_tbl_testsuit.vpe_qmap_rx_que_qen_tbl_mem_check_rw    ${times}

qmap_tx_que_qen_tbl_check:
    vpe_tbl_testsuit.vpe_qmap_tx_que_qen_tbl_mem_check_rw    ${times}

qmap_tx_que_fl_tbl_check:
    vpe_tbl_testsuit.vpe_qmap_tx_que_fl_tbl_mem_check_rw    ${times}

qmap_rx_que_fl_tbl_check:
    vpe_tbl_testsuit.vpe_qmap_rx_que_fl_tbl_mem_check_rw    ${times}

qmap_tx_que_pro_idx_tbl_check:
    vpe_tbl_testsuit.vpe_qmap_tx_que_pro_idx_tbl_mem_check_rw    ${times}

qmap_rx_que_pro_idx_tbl_check:
    vpe_tbl_testsuit.vpe_qmap_rx_que_pro_idx_tbl_mem_check_rw    ${times}

qmap_tx_que_con_idx_tbl_check:
    vpe_tbl_testsuit.vpe_qmap_tx_que_con_idx_tbl_mem_check_rw    ${times}

qmap_rx_que_con_idx_tbl_check:
    vpe_tbl_testsuit.vpe_qmap_rx_que_con_idx_tbl_mem_check_rw    ${times}

qmap_tx_que_qinfo_tbl_check:
    vpe_tbl_testsuit.vpe_qmap_tx_que_qinfo_tbl_mem_check_rw    ${times}

qmap_rx_que_qinfo_tbl_check:
    vpe_tbl_testsuit.vpe_qmap_rx_que_qinfo_tbl_mem_check_rw    ${times}

qmap_tx_que_err_tbl_check:
    vpe_tbl_testsuit.vpe_qmap_tx_que_err_tbl_mem_check_rw    ${times}

qmap_rx_que_err_tbl_check:
    vpe_tbl_testsuit.vpe_qmap_rx_que_err_tbl_mem_check_rw    ${times}

qmap_tx_que_sts_tbl_check:
    vpe_tbl_testsuit.vpe_qmap_tx_que_sts_tbl_mem_check_rw    ${times}

qmap_rx_que_sts_tbl_check:
    vpe_tbl_testsuit.vpe_qmap_rx_que_sts_tbl_mem_check_rw    ${times}

hdma_rxdescba_tbl_check:
    vpe_tbl_testsuit.vpe_hdma_rxdescba_tbl_mem_check_rw    ${times}

hdma_txdescba_tbl_check:
    vpe_tbl_testsuit.vpe_hdma_txdescba_tbl_mem_check_rw    ${times}

aprx_enic0_bd_tbl_check:
    vpe_tbl_testsuit.vpe_aprx_enic0_bd_tbl_mem_check_rw    ${times}

aprx_enic0_idx_tbl_check:
    vpe_tbl_testsuit.vpe_aprx_enic0_idx_tbl_mem_check_rw    ${times}

aprx_enic0_qen_tbl_check:
    vpe_tbl_testsuit.vpe_aprx_enic0_qen_tbl_mem_check_rw    ${times}

aprx_enic0_flush_tbl_check:
    vpe_tbl_testsuit.vpe_aprx_enic0_flush_tbl_mem_check_rw    ${times}

aprx_enic0_error_tbl_check:
    vpe_tbl_testsuit.vpe_aprx_enic0_error_tbl_mem_check_rw    ${times}

aprx_enic0_idx_clear_check:
    vpe_tbl_testsuit.vpe_aprx_enic0_idx_clear_mem_check_rw    ${times}

aprx_enic1_bd_tbl_check:
    vpe_tbl_testsuit.vpe_aprx_enic1_bd_tbl_mem_check_rw    ${times}

aprx_enic1_idx_tbl_check:
    vpe_tbl_testsuit.vpe_aprx_enic1_idx_tbl_mem_check_rw    ${times}

aprx_enic1_qen_tbl_check:
    vpe_tbl_testsuit.vpe_aprx_enic1_qen_tbl_mem_check_rw    ${times}

aprx_enic1_flush_tbl_check:
    vpe_tbl_testsuit.vpe_aprx_enic1_flush_tbl_mem_check_rw    ${times}

aprx_enic1_error_tbl_check:
    vpe_tbl_testsuit.vpe_aprx_enic1_error_tbl_mem_check_rw    ${times}

aprx_enic1_idx_clear_check:
    vpe_tbl_testsuit.vpe_aprx_enic1_idx_clear_mem_check_rw    ${times}

aprx_queue_tbl_check:
    vpe_tbl_testsuit.vpe_aprx_queue_tbl_mem_check_rw    ${times}

aprx_rxen_tbl_check:
    vpe_tbl_testsuit.vpe_aprx_rxen_tbl_mem_check_rw    ${times}

aptx_que_lab_tbl_check:
    vpe_tbl_testsuit.vpe_aptx_que_lab_tbl_mem_check_rw    ${times}

aptx_enic_tx_cfg_tbl_check:
    vpe_tbl_testsuit.vpe_aptx_enic_tx_cfg_tbl_mem_check_rw    ${times}

txsch_vf_shp_cfg_check:
    vpe_tbl_testsuit.vpe_txsch_vf_shp_cfg_mem_check_rw    ${times}

txsch_vf_cos_wgt_cfg_check:
    vpe_tbl_testsuit.vpe_txsch_vf_cos_wgt_cfg_mem_check_rw    ${times}

top_staticidx_check:
    vpe_tbl_testsuit.vpe_top_staticidx_mem_check_rw    ${times}

top_rx_scast_pkt_cnt_check:
    vpe_tbl_testsuit.vpe_top_rx_scast_pkt_cnt_mem_check_rw    ${times}

top_rx_mcast_pkt_cnt_check:
    vpe_tbl_testsuit.vpe_top_rx_mcast_pkt_cnt_mem_check_rw    ${times}

top_rx_bcast_pkt_cnt_check:
    vpe_tbl_testsuit.vpe_top_rx_bcast_pkt_cnt_mem_check_rw    ${times}

top_rx_drop_pkt_cnt_check:
    vpe_tbl_testsuit.vpe_top_rx_drop_pkt_cnt_mem_check_rw    ${times}

top_rx_scast_byte_check:
    vpe_tbl_testsuit.vpe_top_rx_scast_byte_mem_check_rw    ${times}

top_rx_mcast_byte_check:
    vpe_tbl_testsuit.vpe_top_rx_mcast_byte_mem_check_rw    ${times}

top_rx_bcast_byte_check:
    vpe_tbl_testsuit.vpe_top_rx_bcast_byte_mem_check_rw    ${times}

top_tx_scast_pkt_cnt_check:
    vpe_tbl_testsuit.vpe_top_tx_scast_pkt_cnt_mem_check_rw    ${times}

top_tx_mcast_pkt_cnt_check:
    vpe_tbl_testsuit.vpe_top_tx_mcast_pkt_cnt_mem_check_rw    ${times}

top_tx_bcast_pkt_cnt_check:
    vpe_tbl_testsuit.vpe_top_tx_bcast_pkt_cnt_mem_check_rw    ${times}

top_tx_scast_byte_check:
    vpe_tbl_testsuit.vpe_top_tx_scast_byte_mem_check_rw    ${times}

top_tx_mcast_byte_check:
    vpe_tbl_testsuit.vpe_top_tx_mcast_byte_mem_check_rw    ${times}

top_tx_bcast_byte_check:
    vpe_tbl_testsuit.vpe_top_tx_bcast_byte_mem_check_rw    ${times}


*** Keywords ***
suite_setup
    vpe_tbl_testsuit.suit_setup    ${chip_info}

suite_teardown
    vpe_tbl_testsuit.suit_teardown

test_setup
    vpe_tbl_testsuit.test_setup

test_teardown
    vpe_tbl_testsuit.test_teardown
