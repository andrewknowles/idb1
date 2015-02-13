-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 13, 2015 at 05:05 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `idb`
--

-- --------------------------------------------------------

--
-- Table structure for table `idb_error`
--

CREATE TABLE IF NOT EXISTS `idb_error` (
  `err_id` int(11) NOT NULL,
  `err_cause` varchar(200) COLLATE utf8_bin NOT NULL,
  `err_detail` varchar(500) COLLATE utf8_bin NOT NULL,
  `err_callfrom` varchar(250) COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `err_id` (`err_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `idb_error`
--

INSERT INTO `idb_error` (`err_id`, `err_cause`, `err_detail`, `err_callfrom`) VALUES
(1, 'Connection error to MySQL database', 'Thrown by mysqli_connect_error', 'db_Mylib2.php - function openConnection'),
(2, 'Connection error to Informix database', 'Thrown by odbc_connect', 'db_Ifxlib2.php - openConnection'),
(3, 'Critical error occured - Program halted', 'Generic message displayed when $_SESSION[''error_flag''] === 1', 'Multiple locations'),
(4, 'Failed to read queries from idb_query table in idb database', 'Thrown by mysqli_prepare', 'db_Mylib2.php - function idbquerybytype'),
(5, 'Informix query with no parameters failed', 'Thrown by odbc_exec', 'db_Ifxlib2.php - function query0'),
(6, 'Single parameter Informix query failed', 'Thrown by odbc_prepare', 'db_Ifxlib2.php - function query1'),
(7, 'Selected branch code not in list of branches for t...', 'Thrown by array_key_exists', 'validation.php - function validatebranch'),
(8, 'Selected company code does not exist in list of co...', 'Thrown by array_key_exists', 'validation.php - function validatecompany'),
(9, 'Failed to select a query by number from idb_query', 'Thrown by mysqli_prepare', 'db_Mylin2.php - function idbquerybyno'),
(10, '$_SESSION[''branches''] is not set', '', 'called from parts_report2.php');

-- --------------------------------------------------------

--
-- Table structure for table `idb_query`
--

CREATE TABLE IF NOT EXISTS `idb_query` (
  `qry_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `qry_title` varchar(50) COLLATE utf8_bin NOT NULL,
  `qry_qry` varchar(2000) COLLATE utf8_bin NOT NULL,
  `qry_qry2` varchar(2000) COLLATE utf8_bin NOT NULL,
  `qry_qry3` varchar(2000) COLLATE utf8_bin NOT NULL,
  `qry_type` int(11) NOT NULL,
  `qry_order` int(11) NOT NULL,
  `qry_link` int(11) NOT NULL,
  `qry_detail` int(11) NOT NULL,
  UNIQUE KEY `qry_id` (`qry_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=73 ;

--
-- Dumping data for table `idb_query`
--

INSERT INTO `idb_query` (`qry_id`, `qry_title`, `qry_qry`, `qry_qry2`, `qry_qry3`, `qry_type`, `qry_order`, `qry_link`, `qry_detail`) VALUES
(1, 'Company Select', 'select cpy_id, cpy_screen from cpy', '', '', 0, 0, 0, 0),
(2, 'Select Branches', 'select bra_id, bra_screen from bra', '', '', 0, 0, 0, 0),
(31, 'Part Lines On Wait', 'SELECT count(*) cnt \r\nFROM ofl, ofh, oft \r\nWHERE ofh_doc_id IS NOT NULL \r\nAND ofh.oft_id = oft.oft_id \r\nAND ofh_cancel = 0 \r\nAND ofh.ofh_id = ofl.ofh_id \r\nAND ofh.ofh_sqciw <> 1 \r\nAND ofl_q_wait <> 0 \r\nAND ofl_line = 1 \r\nAND ofh_status in (0,1) \r\nAND oft.oft_process = ''0''', 'AND ofh.bra_id = ? ORDER BY 1 ', 'AND ofh.cpy_id = ? ORDER BY 1', 1, 1, 0, 35),
(32, 'Part lines on requisition', 'SELECT count(*) cnt \r\nFROM ofl, ofh, oft\r\nWHERE ofh_doc_id IS NOT NULL \r\nAND ofh.oft_id = oft.oft_id \r\nAND ofh_cancel = 0 \r\nAND ofh.ofh_id = ofl.ofh_id \r\nAND ofh.ofh_sqciw <> 1 \r\nAND ofl_q_sreq <> 0 \r\nAND ofl_line = 1 \r\nAND ofh_status in (0,1) \r\nAND oft.oft_process = ''0''', 'AND ofh.bra_id = ? ORDER BY 1', 'AND ofh.cpy_id = ? ORDER BY 1', 1, 2, 0, 52),
(33, 'AP Register Invoices Not Returned', 'select count(*) cnt from gir where gir_returned <> 1\r\nand gir_cancel = 0', 'and gir.bra_id = ?', 'and gir.cpy_id = ?', 31, 2, 0, 54),
(34, 'Part lines on transfer', 'SELECT count(*) cnt \r\nFROM ofh, ofl, rfl, bra, oft\r\nWHERE ofl.ofh_id = rfl.ofh_id AND ofl.ofl_id = rfl.ofl_id\r\nAND ofh_doc_id IS NOT NULL\r\nAND ofh.ofh_sqciw <> 1\r\nAND ofh_cancel = 0\r\nAND ofl_line = 1\r\nAND oft.oft_process = ''0'' \r\nAND ofh.oft_id = oft.oft_id\r\nand ofl.ofh_id = ofh.ofh_id\r\nand ofh.bra_id = bra.bra_id\r\nAND ofh_status in (0,1)\r\nAND ( ofl_q_sord <> 0 AND rfl_ibt = 1 )', 'AND ofh.bra_id = ? ORDER BY 1', 'AND ofh.cpy_id = ? ORDER BY 1', 1, 4, 0, 56),
(35, 'Part Lines On Wait', 'SELECT ofh.ofh_doc_id Document, ofh.ofh_d_cre D_created, bra.bra_screen Branch, xvd.xvd_display Dept, xvd1.xvd_display Folder, ofl.pmf_id Mfr, ofl.pro_id PartNo, ofl.ofl_q_cord Ordered_Q, ofl.ofl_q_wait Wait_Q\r\nFROM ofh, bra, xvd, xvd xvd1, oft, ofl \r\nWHERE ofh_doc_id IS NOT NULL \r\nAND ofh.oft_id = oft.oft_id \r\nAND ofh_cancel = 0 \r\nAND ofh.ofh_id = ofl.ofh_id \r\nAND ofh.ofh_sqciw <> 1 \r\nAND ofl_q_wait <> 0 \r\nAND ofl_line = 1 \r\nAND ofh_status in (0,1) \r\nAND oft.oft_process = ''0'' \r\nAND ofh.bra_id = bra.bra_id \r\nAND ofh.dpr_id = xvd.xcv_id \r\nAND xvd.lng_id = 0 \r\nAND xvd.xcd_id = 1 \r\nAND xvd1.xcv_id = ofh.oft_id \r\nAND xvd1.lng_id = 0 \r\nAND xvd1.xcd_id = 24\r\n\r\n', 'and ofh.bra_id = ? \r\norder by 1,2\r\n', 'and ofh.cpy_id = ? \r\norder by 1,2', 2, 1, 0, 0),
(36, 'PO Invoice Not Integrated', 'SELET sih.sih_doc_id, sih.sih_inv_id, sih.sih_d_inv, sih.spp_id, sih.sih_matchname, sih.bra_id, sih.dpr_id, sih.sih_total_local \r\nFROM sih \r\nWHERE sih.sih_acc_status <> 0  \r\nAND sih.sih_inv_status = 0', 'AND sih.bra_id = ? ORDER BY 1', 'AND sih.cpy_id = ? ORDER BY 1', 2, 12, 0, 0),
(37, 'Receipt Not Integrated', 'SELECT srh_doc_id, srh.spp_id, srh_matchname, bra.bra_screen, xvd.xvd_display, round(sum(srl_q_rec * (srl_pnet_local + srl_pro_local)),2) \r\nFROM srh, srl, bra, xvd \r\nWHERE srh_rec_status = 1 \r\nAND srh_acc_status = 0\r\nAND srl.srh_id = srh.srh_id \r\nAND srh.dpr_id = xvd.xcv_id \r\nAND xvd.lng_id = 0 \r\nAND xvd.xcd_id = 1 \r\nAND srh.bra_id = bra.bra_id \r\nAND srl.srl_line = 1\r\nAND not exists (select * from sil where sil.srh_id = srl.srh_id and sil.srl_id = srl.srl_id)\r\n', 'AND srh.bra_id = ? ORDER BY 1', 'AND srh.cpy_id = ? ORDER BY 1', 2, 10, 0, 0),
(38, 'Receipts In Progress', 'SELECT srh_doc_id, srh.spp_id, srh_matchname, bra.bra_screen, xvd.xvd_display\r\nFROM srh, bra, xvd \r\nWHERE srh_rec_status = 0\r\nAND srh_acc_status = 0\r\nAND srh.dpr_id = xvd.xcv_id \r\nAND xvd.lng_id = 0 \r\nAND xvd.xcd_id = 1 \r\nAND srh.bra_id = bra.bra_id ', 'AND srh.bra_id = ? ORDER BY 1', 'AND srh.cpy_id = ? ORDER BY 1', 2, 9, 0, 0),
(39, 'Part Lines Delivered Not Invoiced', 'SELECT odh.odh_doc_id Document, odh_doc_id_seq Sequence, bra.bra_screen Branch, xvd.xvd_display Dept, odh.odh_d_closed D_closed, opl.pmf_id Mfr, opl.pro_id Part_no, sum(opl_q_del) Q_del, sum(opl_q_inv) Q_inv \r\nFROM opl, odh, bra, xvd \r\nWHERE opl_status <5 \r\nAND opl_line = 1 \r\nAND odh.dpr_id = xvd.xcv_id \r\nAND xvd.lng_id = 0 \r\nAND xvd.xcd_id = 1 \r\nAND opl.opl_cancel=0\r\nAND opl.opl_q_all <> 0 \r\nAND odh.odh_cancel=0 \r\nAND odh.bra_id = bra.bra_id \r\nAND opl.odh_id = odh.odh_id ', 'AND odh.bra_id = ? GROUP BY 1,2,3,4,5,6,7 ORDER BY 1', 'AND odh.cpy_id = ? GROUP BY 1,2,3,4,5,6,7 ORDER BY 1', 2, 6, 0, 0),
(40, 'Parts lines on back order', 'SELECT count(*) cnt \r\nFROM ofl, ofh, oft\r\nWHERE ofh_doc_id IS NOT NULL \r\nAND ofh.oft_id = oft.oft_id \r\nAND ofh_cancel = 0 \r\nAND ofh.ofh_id = ofl.ofh_id \r\nAND ofh.ofh_sqciw <> 1 \r\nAND ofl_q_sord <> 0 \r\nAND ofl_line = 1 \r\nAND ofh_status in (0,1) \r\nAND oft.oft_process = ''0''', 'AND ofh.bra_id = ? ORDER BY 1', 'AND ofh.cpy_id = ? ORDER BY 1', 1, 3, 0, 43),
(41, 'Invoices Generated Not Printed', 'SELECT oih.oih_doc_id, oih.csc_id_inv, oih.oih_matchname, oih.oih_d_cre, bra.bra_screen, xvd.xvd_display FROM oih, bra, outer xvd\r\nWHERE oih.oih_status < 3 \r\nAND oih.oih_cancel = 0 \r\nAND oih_process <> ''F''\r\nAND oih.bra_id = bra.bra_id \r\nAND oih.dpr_id = xvd.xcv_id \r\nAND xvd.lng_id = 0 \r\nAND xvd.xcd_id = 1\r\n', 'AND oih.bra_id = ? ORDER BY 1', 'AND oih.cpy_id = ? ORDER BY 1', 2, 7, 0, 0),
(42, 'Invoiced Not Printed', 'SELECT COUNT(*) cnt\r\nFROM oih\r\nWHERE oih.oih_status < 3 \r\nAND oih.oih_cancel = 0 \r\nAND oih_process <> ''F''\r\n\r\n', 'AND oih.bra_id = ? ORDER BY 1', 'AND oih.cpy_id = ? ORDER BY 1', 1, 7, 0, 41),
(43, 'Part Lines on back order', 'SELECT ofl.ofh_id, ofl.pro_id FROM ofl, ofh, oft \r\nWHERE ofl_q_sord <> 0\r\nAND ofh_doc_id IS NOT NULL\r\nAND ofl.ofh_id = ofh.ofh_id \r\nAND ofh.ofh_sqciw <> 1\r\nAND ofh_cancel = 0 \r\nAND ofl_line = 1 \r\nAND ofh_status in (0,1)\r\nAND oft.oft_process = ''0'' \r\nAND ofh.oft_id = oft.oft_id', 'AND ofh.bra_id = ? ORDER BY 1', 'AND ofh.cpy_id = ? ORDER BY 1', 2, 3, 0, 0),
(44, 'Parts Sales by Month', 'SELECT (YEAR(oih_d_inv) * 100 + MONTH(oih_d_inv)) ym, \r\nSUM(oih_net_local)\r\nFROM oih\r\nWHERE oih_cancel = 0\r\nAND oih_process = ''0''\r\nAND oih_invtype in (0, 1)\r\nAND ((YEAR(oih_d_inv) = YEAR(TODAY)) OR (((YEAR(oih_d_inv)) = (YEAR(TODAY) -1))AND MONTH(oih_d_inv) > MONTH(TODAY)))', 'AND oih.bra_id = ? GROUP BY 1 ORDER BY 1', 'AND oih.cpy_id = ? GROUP BY 1 ORDER BY 1', 3, 1, 0, 0),
(45, 'Receipt Lines not Integrated', 'SELECT COUNT(*) cnt\r\nFROM srh, srl, bra, xvd \r\nWHERE srh_rec_status = 1\r\nAND srh_acc_status = 0 \r\nAND srl.srh_id = srh.srh_id\r\nAND srh.dpr_id = xvd.xcv_id \r\nAND xvd.lng_id = 0 \r\nAND xvd.xcd_id = 1 \r\nAND srh.bra_id = bra.bra_id \r\nAND srl.srl_line = 1 \r\nAND not exists\r\n(SELECT * FROM sil WHERE sil.srh_id = srl.srh_id AND sil.srl_id = srl.srl_id)', 'AND srh.bra_id = ? ORDER BY 1', 'AND srh.bra_id = ? ORDER BY 1', 1, 11, 0, 37),
(46, 'PO Invoices In Progress', 'SELET sih.sih_doc_id, sih.sih_inv_id, sih.sih_d_inv, sih.spp_id, sih.sih_matchname, sih.bra_id, sih.dpr_id, sih.sih_total_local \r\nFROM sih \r\nWHERE sih.sih_acc_status = 0  \r\nAND sih.sih_inv_status = 0', 'AND sih.bra_id = ? ORDER BY 1', 'AND sih.cpy_id = ? ORDER BY 1', 2, 11, 0, 0),
(47, 'PO Invoice In Progress', 'SELECT count(*) cnt\r\nFROM sih \r\nWHERE sih.sih_acc_status = 0  \r\nAND sih.sih_inv_status = 0', 'AND sih.bra_id = ? ORDER BY 1', 'AND sih.cpy_id = ? ORDER BY 1', 1, 12, 16, 46),
(48, 'PO Invoice Not Integrated', 'SELECT count(*) cnt\r\nFROM sih \r\nWHERE sih.sih_acc_status <> 0  \r\nAND sih.sih_inv_status = 0', 'AND sih.bra_id = ? ORDER BY 1 ', 'AND sih.cpy_id = ? ORDER BY 1', 1, 13, 0, 36),
(49, 'Receipts In Progress', 'SELECT count(*) cnt \r\nFROM srh \r\nWHERE srh_rec_status = 0', 'AND srh.bra_id = ? ORDER BY 1', 'AND srh.cpy_id = ? ORDER BY 1', 1, 10, 0, 38),
(50, 'Proforma Invoices Not Cancelled', 'SELECT count(*) cnt \r\nFROM oih \r\nWHERE oih_status = 2 \r\nAND ( oih_cancel = 0 OR oih_cancel IS NULL ) \r\nAND oih_account = 0 \r\nAND oih_process = ''F''', 'AND oih.bra_id = ? ORDER BY 1', 'AND oih.cpy_id = ? ORDER BY 1', 1, 9, 0, 53),
(51, 'Invoices Printed Not Integrated - Count', 'SELECT count(*) cnt \r\nFROM oih \r\nWHERE oih_status = 2 \r\nAND ( oih_cancel = 0 OR oih_cancel IS NULL ) \r\nAND oih_account = 0 \r\nAND oih_process <> ''F''', 'AND oih.bra_id = ? ORDER BY 1', 'AND oih.cpy_id = ? ORDER BY 1', 1, 8, 0, 57),
(52, 'Part Lines On Requisition', 'SELECT ofh.ofh_doc_id, ofh.ofh_d_cre, bra.bra_screen, xvd.xvd_display, xvd1.xvd_display, ofl.pmf_id, ofl.pro_id, ofl.ofl_q_cord, ofl.ofl_q_sreq \r\nFROM ofh , oft,ofl, bra, xvd, xvd xvd1 \r\nWHERE ofh_doc_id IS NOT NULL \r\nAND ofh.oft_id = oft.oft_id \r\nAND ofh_cancel = 0 \r\nAND ofh.ofh_id = ofl.ofh_id \r\nAND ofh.ofh_sqciw <> 1 \r\nAND ofl_q_sreq <> 0 \r\nAND ofl_line = 1 \r\nAND ofh_status in (0,1) \r\nAND oft.oft_process = ''0'' \r\nAND ofh.bra_id = bra.bra_id \r\nAND ofh.dpr_id = xvd.xcv_id \r\nAND xvd.lng_id = 0 \r\nAND xvd.xcd_id = 1 \r\nAND xvd1.xcv_id = ofh.oft_id \r\nAND xvd1.lng_id = 0 \r\nAND xvd1.xcd_id = 24\r\n', 'AND ofh.bra_id = ? order by 1,2', 'AND ofh.cpy_id = ? order by 1,2', 2, 2, 0, 0),
(53, 'Proforma Invoices Not Cancelled', 'SELECT oih.oih_doc_id, oih.csc_id_inv, oih.oih_matchname, oih.oih_d_cre, bra.bra_screen, xvd.xvd_display \r\nFROM oih, bra, xvd\r\nWHERE oih_status < 3 \r\nAND ( oih_cancel = 0 OR oih_cancel IS NULL ) \r\nAND oih_account = 0 \r\nAND oih_process = ''F''\r\nAND oih.bra_id = bra.bra_id \r\nAND oih.dpr_id = xvd.xcv_id \r\nAND xvd.lng_id = 0 \r\nAND xvd.xcd_id = 1\r\n', 'AND oih.bra_id = ? ORDER BY 1', 'AND oih.cpy_id = ? ORDER BY 1', 2, 5, 0, 0),
(54, 'AP Register Not Returned', 'select bra_id, dpr_id, usr_id_ass, gir_doc_id, spp_id, gir_d_inv, gir_inv_id from gir where gir_returned <> 1 and gir_cancel = 0', 'and gir.bra_id = ? order by gir.usr_id_ass, gir_doc_id', 'and gir.cpy_id = ? order by gir.usr_id_ass, gir_doc_id', 32, 1, 0, 0),
(55, 'Part lines delivered not invoiced', 'SELECT count(*) cnt\r\nFROM opl, odh\r\nWHERE opl_status = 4 \r\nAND opl_line = 1\r\nAND opl.opl_cancel=0 \r\nAND odh.odh_cancel=0\r\nAND opl.odh_id = odh.odh_id\r\n', 'AND odh.bra_id = ? ORDER BY 1', 'AND odh.cpy_id = ? ORDER BY 1', 1, 6, 0, 39),
(56, 'Part Lines On Transfer', 'SELECT ofl.ofl_id, ofh.ofh_doc_id, ofh.ofh_d_cre, bra.bra_screen, ofl.pmf_id, ofl.pro_id, ofl.ofl_q_cord, ofl.ofl_q_sord, \r\n(SELECT ofh_doc_id FROM ofh ofh1 WHERE ofh1.ofh_id = rfl.ofh_id_trf)  \r\nFROM ofh, ofl, rfl, bra, oft\r\nWHERE ofl.ofh_id = rfl.ofh_id AND ofl.ofl_id = rfl.ofl_id\r\nAND ofh_doc_id IS NOT NULL\r\nAND ofh.ofh_sqciw <> 1\r\nAND ofh_cancel = 0\r\nAND ofl_line = 1\r\nAND oft.oft_process = ''0'' \r\nAND ofh.oft_id = oft.oft_id\r\nAND ofl.ofh_id = ofh.ofh_id\r\nAND ofh.bra_id = bra.bra_id\r\nAND ofh_status in (0,1)\r\nAND ( ofl_q_sord <> 0 and rfl_ibt = 1 )\r\n', 'and ofh.bra_id = ? order by 1,2', 'and ofh.cpy_id = ? order by 1,2', 2, 8, 0, 0),
(57, 'Invoices Printed Not Integrated', 'SELECT oih_doc_id, csc_id_inv, oih_matchname, oih_d_cre, bra.bra_screen, xvd.xvd_display \r\nFROM oih, bra, xvd \r\nWHERE oih_status = 2 \r\nAND ( oih_cancel = 0 OR oih_cancel IS NULL ) \r\nAND oih_account = 0 \r\nAND oih_process <> ''F''\r\nAND oih.bra_id = bra.bra_id \r\nAND oih.dpr_id = xvd.xcv_id \r\nAND xvd.lng_id = 0 \r\nAND xvd.xcd_id = 1\r\n\r\n', 'AND oih.bra_id = ? ORDER BY 1', 'AND oih.cpy_id = ? ORDER BY 1', 2, 13, 0, 0),
(58, 'IBT Lines Awaiting Receipt', 'select count(*) cnt\r\nfrom sfh, sfl, rfl,ofl, oih, oil\r\nwhere sfh.sfh_id = sfl.sfh_id and sfh_transfer = 1\r\nand sfl_q_sord <> (sfl_q_scan + sfl_q_srec)\r\nand sfl.sfh_id =rfl.sfh_id and sfl.sfl_id = rfl.sfl_id\r\nand ofh_id_trf = ofl.ofh_id and ofl_id_trf = ofl.ofl_id\r\nand oil.ofh_id = ofh_id_trf and oil.ofl_id = ofl_id_trf\r\nand oil.oih_id = oih.oih_id\r\nand NVL(ofl_q_cinv, 0) <> 0', 'AND sfh.bra_id = ?', 'AND sfh.cpy_id = ?', 1, 5, 0, 59),
(59, 'IBT Lines Awaiting Receipt', 'select bra.bra_screen branch, xvd_display dept, sfh_doc_id po_id, date(sfh_d_cre) po_created, sfl.pmf_id mfr, sfl.pro_id part_no, sfl_q_sord qty_ordered, \r\nsfl_q_scan qty_cancel, sfl_q_srec qty_received, oih.bra_id tfr_branch, ofh_doc_id transfer_order, ofl_q_cinv tfr_qty_inv, oih_doc_id tfr_inv, oih_d_inv inv_date\r\nfrom sfh, sfl, rfl,ofl, oih, oil, bra, xvd, ofh\r\nwhere sfh.sfh_id = sfl.sfh_id and sfh_transfer = 1\r\nand sfl_q_sord <> (sfl_q_scan + sfl_q_srec)\r\nand sfl.sfh_id =rfl.sfh_id and sfl.sfl_id = rfl.sfl_id\r\nand ofh_id_trf = ofl.ofh_id and ofl_id_trf = ofl.ofl_id\r\nand oil.ofh_id = ofh_id_trf and oil.ofl_id = ofl_id_trf\r\nand oil.oih_id = oih.oih_id\r\nand sfh.bra_id = bra.bra_id\r\nand NVL(ofl_q_cinv, 0) <> 0\r\nand sfh.dpr_id = xvd.xcv_id and xvd.lng_id = 0 and xvd.xcd_id = ''1''\r\nand ofh.ofh_id = rfl.ofh_id_trf', 'and sfh.bra_id = ? order by sfh.bra_id, sfh.dpr_id, sfh_doc_id', 'and sfh.cpy_id = ? order by sfh.bra_id, sfh.dpr_id, sfh_doc_id', 2, 4, 0, 0),
(60, 'Non invoiced delivered parts on WO', 'drop table if exists ak;\r\n\r\nselect ofl.ofh_id, ofl.ofs_id, ofl.ofl_id, ofl.pmf_id, ofl.pro_id, ofl_line, ofl_d_cre, ofl_d_all, ofl_q_cord, ofl_q_all_my, ofl_q_to_del, ofl_q_to_inv, ofl_q_wait, ofl_q_lost, ofl_q_lost_nopdc, ofl_q_cinv, ofs.ofs_status, opl.opl_status, opl_q_inv, \r\n(select sum(oil_q_inv) from oil where oil.ofh_id = ofl.ofh_id and oil.ofl_id = ofl.ofl_id) q_inv, ofl_transfer_status from ofl, ofs, opl where ofs.ofs_status = 3 and  opl_status <> 5 and ofl_line = 1 and opl.ofh_id = ofl.ofh_id and opl.ofl_id = ofl.ofl_id\r\nand ofl.ofh_id = ofs.ofh_id and ofl.ofs_id = ofs.ofs_id \r\norder by ofl_d_all desc into temp ak;\r\n\r\n\r\nselect * from ak where (ofl_q_cord - ofl_q_lost - ofl_q_wait - ofl_q_lost_nopdc) <> q_inv', '', '', 999, 1, 0, 0),
(61, 'PO Invoices with Date &gt; Today', 'select count(*) cnt from sih, sid where sih_d_inv > current and sih.sih_id = sid.sih_id\r\n', 'and sih.bra_id = ?', 'and sih.cpy_id = ?', 31, 1, 0, 62),
(62, 'PO Invoices with Date &gt; Today', 'select spp_id, sih_matchname, bra_id, dpr_id, sih_doc_id, sih_d_inv, sid_d_due from sih, sid where sih_d_inv > current and sih.sih_id = sid.sih_id', 'and sih.bra_id = ? order by bra_id, dpr_id', 'and sih.cpy_id = ? order by bra_id, dpr_id', 32, 2, 0, 0),
(63, 'x', 'x', 'x', 'x', 0, 0, 0, 0),
(64, 'x', 'x', 'x', 'x', 0, 0, 0, 0),
(65, 'x', 'x', 'x', 'x', 0, 0, 0, 0),
(66, 'x', 'x', 'x', 'x', 0, 0, 0, 0),
(67, 'x', 'x', 'x', 'x', 0, 0, 0, 0),
(68, 'x', 'x', 'x', 'x', 0, 0, 0, 0),
(69, 'x', 'x', 'x', 'x', 0, 0, 0, 0),
(70, 'x', 'x', 'x', 'x', 0, 0, 0, 0),
(71, 'x', 'x', 'x', 'x', 0, 0, 0, 0),
(72, 'x', 'x', 'x', 'x', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `idb_settings`
--

CREATE TABLE IF NOT EXISTS `idb_settings` (
  `idb_setting_id` int(11) NOT NULL,
  `idb_setting_char` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `idb_settings`
--

INSERT INTO `idb_settings` (`idb_setting_id`, `idb_setting_char`) VALUES
(1, 'aaa');

-- --------------------------------------------------------

--
-- Table structure for table `idb_tables`
--

CREATE TABLE IF NOT EXISTS `idb_tables` (
  `tab_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tab_tabname` varchar(15) COLLATE utf8_bin NOT NULL,
  `tab_colname` varchar(20) COLLATE utf8_bin NOT NULL,
  `tab_coltype` varchar(20) COLLATE utf8_bin NOT NULL,
  `tab_colvalues` varchar(100) COLLATE utf8_bin NOT NULL,
  `tab_comment` varchar(500) COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `tab_id` (`tab_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='able layout of idb tables' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `idb_tables`
--

INSERT INTO `idb_tables` (`tab_id`, `tab_tabname`, `tab_colname`, `tab_coltype`, `tab_colvalues`, `tab_comment`) VALUES
(1, 'idb_query', 'qry_type', 'INT', '0= Quick Status Count\r\n1= Quick Status Detail\r\n2=', '');

-- --------------------------------------------------------

--
-- Table structure for table `idb_test`
--

CREATE TABLE IF NOT EXISTS `idb_test` (
  `col1` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `col2` varchar(10) COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `col1` (`col1`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Dumping data for table `idb_test`
--

INSERT INTO `idb_test` (`col1`, `col2`) VALUES
(1, 'aaa'),
(2, 'bbb');

-- --------------------------------------------------------

--
-- Table structure for table `idb_users`
--

CREATE TABLE IF NOT EXISTS `idb_users` (
  `usr_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `usr_first` varchar(30) COLLATE utf8_bin NOT NULL,
  `usr_last` varchar(30) COLLATE utf8_bin NOT NULL,
  `usr_login` varchar(10) COLLATE utf8_bin NOT NULL,
  `usr_passwd` varchar(10) COLLATE utf8_bin NOT NULL,
  `usr_authorize` int(11) NOT NULL,
  UNIQUE KEY `usr_id` (`usr_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Dumping data for table `idb_users`
--

INSERT INTO `idb_users` (`usr_id`, `usr_first`, `usr_last`, `usr_login`, `usr_passwd`, `usr_authorize`) VALUES
(1, 'andrew', 'knowles', 'a', 'a', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
