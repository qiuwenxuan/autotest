import sys
import os
sys.path.append(os.path.realpath(os.path.join(__file__, '..', '..', '..','common')))
sys.path.append(os.path.realpath(os.path.join(__file__, '..', '..', '..','common','Dut')))
from DutFactory import DutFactory
import re
from robot.api import logger

class vpe_tbl_testsuit:
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    def suit_setup(self, env1="CreteQemu"):       
        self.chip = DutFactory.CreateDutFast(env1)
        self.chip.Connect()  # 连接dut的所有port
        self.chip.ports["PC0"].Send("telnet 192.168.123.200 6666", "character")
        self.chip.ports["PC0"].Send("pv shell")     # 向指定端口发送命令行
        logger.info("tbl_testsuit suit_setup")

    def suit_teardown(self):
        self.chip.DisConnect() # 断开dut
        logger.info("tbl_testsuit suit_teardown")

    def test_setup(self):
        
        logger.info("tbl_testsuit test_setup")

    def test_teardown(self):
        logger.info("tbl_testsuit test_teardown")

    def vpe_urm_rxuridx_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 0 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_urm_txuridx_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 1 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_urm_drtymap_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 2 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_urm_drtycfg_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 3 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_urm_rxmsixvec_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 4 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_urm_txmsixvec_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 5 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_urm_rxurrng_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 6 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_urm_txurrng_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 7 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_urm_rxfeature_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 8 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_urm_txfeature_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 9 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_urm_tph_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 10 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_qmap_qmap_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 11 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_qmap_dev_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 12 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_qmap_rx_que_qen_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 13 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_qmap_tx_que_qen_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 14 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_qmap_tx_que_fl_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 15 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_qmap_rx_que_fl_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 16 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_qmap_tx_que_pro_idx_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 17 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_qmap_rx_que_pro_idx_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 18 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_qmap_tx_que_con_idx_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 19 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_qmap_rx_que_con_idx_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 20 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_qmap_tx_que_qinfo_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 21 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_qmap_rx_que_qinfo_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 22 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_qmap_tx_que_err_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 23 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_qmap_rx_que_err_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 24 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_qmap_tx_que_sts_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 25 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_qmap_rx_que_sts_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 26 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_hdma_rxdescba_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 27 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_hdma_txdescba_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 28 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_aprx_enic0_bd_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 29 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_aprx_enic0_idx_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 30 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_aprx_enic0_qen_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 31 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_aprx_enic0_flush_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 32 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_aprx_enic0_error_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 33 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_aprx_enic0_idx_clear_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 34 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_aprx_enic1_bd_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 35 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_aprx_enic1_idx_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 36 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_aprx_enic1_qen_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 37 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_aprx_enic1_flush_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 38 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_aprx_enic1_error_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 39 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_aprx_enic1_idx_clear_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 40 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_aprx_queue_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 41 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_aprx_rxen_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 42 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_aptx_que_lab_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 43 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_aptx_enic_tx_cfg_tbl_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 44 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_txsch_vf_shp_cfg_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 45 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_txsch_vf_cos_wgt_cfg_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 46 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_top_staticidx_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 47 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_top_rx_scast_pkt_cnt_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 48 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_top_rx_mcast_pkt_cnt_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 49 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_top_rx_bcast_pkt_cnt_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 50 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_top_rx_drop_pkt_cnt_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 51 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_top_rx_scast_byte_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 52 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_top_rx_mcast_byte_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 53 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_top_rx_bcast_byte_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 54 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_top_tx_scast_pkt_cnt_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 55 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_top_tx_mcast_pkt_cnt_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 56 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_top_tx_bcast_pkt_cnt_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 57 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_top_tx_scast_byte_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 58 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_top_tx_mcast_byte_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 59 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret

    def vpe_top_tx_bcast_byte_mem_check_rw(self, times):
        cmd = "tc_vpe_tbl_mem_check_rw 60 %s" % (times)
        ret = self.chip.ports["PC0"].Send(cmd)
        logger.info(ret)
        assert "ERROR" not in ret