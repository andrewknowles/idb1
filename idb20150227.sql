-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2015 at 10:13 AM
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
-- Table structure for table `idb_login_attempts`
--

CREATE TABLE IF NOT EXISTS `idb_login_attempts` (
  `user_id` int(11) NOT NULL,
  `time` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=108 ;

--
-- Dumping data for table `idb_query`
--

INSERT INTO `idb_query` (`qry_id`, `qry_title`, `qry_qry`, `qry_qry2`, `qry_qry3`, `qry_type`, `qry_order`, `qry_link`, `qry_detail`) VALUES
(1, 'Company Select', 'select cpy_id, cpy_screen from cpy', '', '', 0, 0, 0, 0),
(2, 'Select Branches', 'select bra_id, bra_screen from bra', '', '', 0, 0, 0, 0),
(3, 'users', 'select usr_id, usr_first, usr_last, usr_authorize from idb_users\r\nwhere usr_login = ? and usr_passwd = ?', '', '', 0, 0, 0, 0),
(31, 'Part Lines On Wait', 'SELECT count(*) cnt \r\nFROM ofl, ofh, oft \r\nWHERE ofh_doc_id IS NOT NULL \r\nAND ofh.oft_id = oft.oft_id \r\nAND ofh_cancel = 0 \r\nAND ofh.ofh_id = ofl.ofh_id \r\nAND ofh.ofh_sqciw <> 1 \r\nAND ofl_q_wait <> 0 \r\nAND ofl_line = 1 \r\nAND ofh_status in (0,1) \r\nAND oft.oft_process = ''0''', 'AND ofh.bra_id = ? ORDER BY 1 ', 'AND ofh.cpy_id = ? ORDER BY 1', 1, 1, 0, 35),
(32, 'Part lines on requisition', 'SELECT count(*) cnt \r\nFROM ofl, ofh, oft\r\nWHERE ofh_doc_id IS NOT NULL \r\nAND ofh.oft_id = oft.oft_id \r\nAND ofh_cancel = 0 \r\nAND ofh.ofh_id = ofl.ofh_id \r\nAND ofh.ofh_sqciw <> 1 \r\nAND ofl_q_sreq <> 0 \r\nAND ofl_line = 1 \r\nAND ofh_status in (0,1) \r\nAND oft.oft_process = ''0''', 'AND ofh.bra_id = ? ORDER BY 1', 'AND ofh.cpy_id = ? ORDER BY 1', 1, 2, 0, 52),
(33, 'AP Register Invoices Not Returned', 'select count(*) cnt from gir where gir_returned <> 1\r\nand gir_cancel = 0', 'and gir.bra_id = ?', 'and gir.cpy_id = ?', 31, 1, 0, 54),
(34, 'Part lines on transfer', 'SELECT count(*) cnt \r\nFROM ofh, ofl, rfl, bra, oft\r\nWHERE ofl.ofh_id = rfl.ofh_id AND ofl.ofl_id = rfl.ofl_id\r\nAND ofh_doc_id IS NOT NULL\r\nAND ofh.ofh_sqciw <> 1\r\nAND ofh_cancel = 0\r\nAND ofl_line = 1\r\nAND oft.oft_process = ''0'' \r\nAND ofh.oft_id = oft.oft_id\r\nand ofl.ofh_id = ofh.ofh_id\r\nand ofh.bra_id = bra.bra_id\r\nAND ofh_status in (0,1)\r\nAND ( ofl_q_sord <> 0 AND rfl_ibt = 1 )', 'AND ofh.bra_id = ? ORDER BY 1', 'AND ofh.cpy_id = ? ORDER BY 1', 1, 4, 0, 56),
(35, 'Part Lines On Wait', 'SELECT ofh.ofh_doc_id Document, ofh.ofh_d_cre D_created, bra.bra_screen Branch, xvd.xvd_display Dept, xvd1.xvd_display Folder, ofl.pmf_id Mfr, ofl.pro_id PartNo, ofl.ofl_q_cord Ordered_Q, ofl.ofl_q_wait Wait_Q\r\nFROM ofh, bra, xvd, xvd xvd1, oft, ofl \r\nWHERE ofh_doc_id IS NOT NULL \r\nAND ofh.oft_id = oft.oft_id \r\nAND ofh_cancel = 0 \r\nAND ofh.ofh_id = ofl.ofh_id \r\nAND ofh.ofh_sqciw <> 1 \r\nAND ofl_q_wait <> 0 \r\nAND ofl_line = 1 \r\nAND ofh_status in (0,1) \r\nAND oft.oft_process = ''0'' \r\nAND ofh.bra_id = bra.bra_id \r\nAND ofh.dpr_id = xvd.xcv_id \r\nAND xvd.lng_id = 0 \r\nAND xvd.xcd_id = 1 \r\nAND xvd1.xcv_id = ofh.oft_id \r\nAND xvd1.lng_id = 0 \r\nAND xvd1.xcd_id = 24\r\n\r\n', 'and ofh.bra_id = ? \r\norder by 1,2\r\n', 'and ofh.cpy_id = ? \r\norder by 1,2', 2, 1, 0, 0),
(36, 'Unproductive Time Analysis', 'select bra.bra_screen branch, xvd_dpr.xvd_display dept , trim(tad.tad_name_last)||''  ''||trim(tad_name_first) technician, (year(ock_d_start) * 100 + month(ock_d_start)) period, xvd_unp.xvd_print reason, \r\n((((sum(ock_d_end - ock_d_start)::INTERVAL SECOND(9) TO SECOND)/60)*10)) minutes\r\nfrom ock, xvd xvd_unp, xvd xvd_dpr, bra, usr, tad where ock_reason is not null\r\nand ock.ock_reason = xvd_unp.xcv_id and xvd_unp.xcd_id = 96 and xvd_unp.lng_id = 0\r\nand ock.dpr_id = xvd_dpr.xcv_id and xvd_dpr.xcd_id = 1 and xvd_dpr.lng_id = 0\r\nand ock.usr_id = usr.usr_id\r\nand usr.thr_id = tad.thr_id\r\nand ock.bra_id = bra.bra_id\r\nand date(ock_d_start) > date(Current) - 365', 'and ock.bra_id = ? group by 1,2,3, 4,5 order by 1,2,3,4 ', 'group by 1,2,3, 4,5 order by 1,2,3,4 ', 13, 3, 0, 0),
(37, 'Receipt Not Integrated', 'SELECT srh_doc_id, srh.spp_id, srh_matchname, bra.bra_screen, xvd.xvd_display, round(sum(srl_q_rec * (srl_pnet_local + srl_pro_local)),2) \r\nFROM srh, srl, bra, xvd \r\nWHERE srh_rec_status = 1 \r\nAND srh_acc_status = 0\r\nAND srl.srh_id = srh.srh_id \r\nAND srh.dpr_id = xvd.xcv_id \r\nAND xvd.lng_id = 0 \r\nAND xvd.xcd_id = 1 \r\nAND srh.bra_id = bra.bra_id \r\nAND srl.srl_line = 1\r\nAND not exists (select * from sil where sil.srh_id = srl.srh_id and sil.srl_id = srl.srl_id)\r\n', 'AND srh.bra_id = ? ORDER BY 1', 'AND srh.cpy_id = ? ORDER BY 1', 2, 11, 0, 0),
(38, 'Receipts In Progress', 'SELECT srh_doc_id, srh.spp_id, srh_matchname, bra.bra_screen, xvd.xvd_display\r\nFROM srh, bra, xvd \r\nWHERE srh_rec_status = 0\r\nAND srh_acc_status = 0\r\nAND srh.dpr_id = xvd.xcv_id \r\nAND xvd.lng_id = 0 \r\nAND xvd.xcd_id = 1 \r\nAND srh.bra_id = bra.bra_id ', 'AND srh.bra_id = ? ORDER BY 1', 'AND srh.cpy_id = ? ORDER BY 1', 2, 10, 0, 0),
(39, 'Part Lines Delivered Not Invoiced', 'SELECT odh.odh_doc_id Document, odh_doc_id_seq Sequence, bra.bra_screen Branch, xvd.xvd_display Dept, odh.odh_d_closed D_closed, opl.pmf_id Mfr, opl.pro_id Part_no, sum(opl_q_del) Q_del, sum(opl_q_inv) Q_inv \r\nFROM opl, odh, bra, xvd, ofh, oft \r\nWHERE opl_status <5 \r\nAND opl_line = 1 \r\nAND odh.dpr_id = xvd.xcv_id \r\nAND xvd.lng_id = 0 \r\nAND xvd.xcd_id = 1 \r\nAND opl.opl_cancel=0\r\nAND opl.opl_q_all <> 0 \r\nAND odh.odh_cancel=0 \r\nAND odh.bra_id = bra.bra_id \r\nAND opl.odh_id = odh.odh_id\r\nand opl.ofh_id = ofh.ofh_id\r\nand ofh.oft_id = oft.oft_id\r\nand oft.oft_process = ''0'' ', 'AND odh.bra_id = ? GROUP BY 1,2,3,4,5,6,7 ORDER BY 1', 'AND odh.cpy_id = ? GROUP BY 1,2,3,4,5,6,7 ORDER BY 1', 2, 6, 0, 0),
(40, 'Parts lines on back order', 'SELECT count(*) cnt \r\nFROM ofl, ofh, oft\r\nWHERE ofh_doc_id IS NOT NULL \r\nAND ofh.oft_id = oft.oft_id \r\nAND ofh_cancel = 0 \r\nAND ofh.ofh_id = ofl.ofh_id \r\nAND ofh.ofh_sqciw <> 1 \r\nAND ofl_q_sord <> 0 \r\nAND ofl_line = 1 \r\nAND ofh_status in (0,1) \r\nAND oft.oft_process = ''0''', 'AND ofh.bra_id = ? ORDER BY 1', 'AND ofh.cpy_id = ? ORDER BY 1', 1, 3, 0, 43),
(41, 'Invoices Generated Not Printed', 'SELECT oih.oih_doc_id, oih.csc_id_inv, oih.oih_matchname, oih.oih_d_cre, bra.bra_screen, xvd.xvd_display FROM oih, bra, oft, outer xvd\r\nWHERE oih.oih_status < 3 \r\nAND oih.oih_cancel = 0 \r\nAND oih_process <> ''F''\r\nAND oih.bra_id = bra.bra_id \r\nAND oih.dpr_id = xvd.xcv_id \r\nAND xvd.lng_id = 0 \r\nAND xvd.xcd_id = 1\r\nAND oih.oft_id = oft.oft_id\r\nAND oft.oft_process = ''0''\r\n', 'AND oih.bra_id = ? ORDER BY 1', 'AND oih.cpy_id = ? ORDER BY 1', 2, 7, 0, 0),
(42, 'Invoiced Not Printed', 'SELECT COUNT(*) cnt\r\nFROM oih, oft\r\nWHERE oih.oih_status < 3 \r\nAND oih.oih_cancel = 0 \r\nAND oih_process <> ''F''\r\nAND oih.oft_id = oft.oft_id\r\nAND oft.oft_process = ''0''\r\n\r\n', 'AND oih.bra_id = ? ORDER BY 1', 'AND oih.cpy_id = ? ORDER BY 1', 1, 7, 0, 41),
(43, 'Part Lines on back order', 'SELECT ofl.ofh_id, ofl.pro_id FROM ofl, ofh, oft \r\nWHERE ofl_q_sord <> 0\r\nAND ofh_doc_id IS NOT NULL\r\nAND ofl.ofh_id = ofh.ofh_id \r\nAND ofh.ofh_sqciw <> 1\r\nAND ofh_cancel = 0 \r\nAND ofl_line = 1 \r\nAND ofh_status in (0,1)\r\nAND oft.oft_process = ''0'' \r\nAND ofh.oft_id = oft.oft_id', 'AND ofh.bra_id = ? ORDER BY 1', 'AND ofh.cpy_id = ? ORDER BY 1', 2, 3, 0, 0),
(44, 'Parts Sales by Month', 'select (year(oih_d_inv) * 100 + month(oih_d_inv)) period, \r\nround(sum(oil_q_inv * oil_pnet_local),2) value\r\nfrom oih, oil\r\nwhere oih_cancel = 0\r\nand oih_process = ''0''\r\nand oih_invtype in (0, 1)\r\nand ((year(oih_d_inv) = year(today)) or (((year(oih_d_inv)) = (year(today) -1))and month(oih_d_inv) > month(today)))\r\nand oil.oih_id = oih.oih_id\r\nand oil_line = 1', 'AND oih.bra_id = ? GROUP BY 1 ORDER BY 1', 'AND oih.cpy_id = ? GROUP BY 1 ORDER BY 1', 3, 1, 0, 0),
(45, 'Receipt Lines not Integrated', 'SELECT COUNT(*) cnt\r\nFROM srh, srl, bra, xvd \r\nWHERE srh_rec_status = 1\r\nAND srh_acc_status = 0 \r\nAND srl.srh_id = srh.srh_id\r\nAND srh.dpr_id = xvd.xcv_id \r\nAND xvd.lng_id = 0 \r\nAND xvd.xcd_id = 1 \r\nAND srh.bra_id = bra.bra_id \r\nAND srl.srl_line = 1 \r\nAND not exists\r\n(SELECT * FROM sil WHERE sil.srh_id = srl.srh_id AND sil.srl_id = srl.srl_id)', 'AND srh.bra_id = ? ORDER BY 1', 'AND srh.bra_id = ? ORDER BY 1', 1, 11, 0, 37),
(46, 'PO Invoices In Progress', 'SELET sih.sih_doc_id, sih.sih_inv_id, sih.sih_d_inv, sih.spp_id, sih.sih_matchname, sih.bra_id, sih.dpr_id, sih.sih_total_local \r\nFROM sih \r\nWHERE sih.sih_acc_status = 0  \r\nAND sih.sih_inv_status = 0', 'AND sih.bra_id = ? ORDER BY 1', 'AND sih.cpy_id = ? ORDER BY 1', 2, 12, 0, 0),
(47, 'PO Invoice In Progress', 'SELECT count(*) cnt\r\nFROM sih \r\nWHERE sih.sih_acc_status = 0  \r\nAND sih.sih_inv_status = 0', 'AND sih.bra_id = ? ORDER BY 1', 'AND sih.cpy_id = ? ORDER BY 1', 1, 12, 16, 46),
(48, 'Labour Utilisation - Pt1', 'select bra.bra_screen branch, xvd_dpr.xvd_display dept, (year(ock_d_start) * 100 + month(ock_d_start)) period,\r\ntrim(tad.tad_name_last)||''  ''||trim(tad_name_first) technician, \r\n((sum(ock_d_end - ock_d_start)::INTERVAL SECOND(9) TO SECOND)/60) minutes_clocked\r\nfrom ock, bra, xvd xvd_dpr, usr, tad  where \r\nock.bra_id = bra.bra_id\r\nand ock.dpr_id = xvd_dpr.xcv_id and xvd_dpr.xcd_id = 1 and xvd_dpr.lng_id = 0\r\nand ock.usr_id = usr.usr_id\r\nand usr.thr_id = tad.thr_id\r\n', 'and ock.bra_id = ? group by 1,2,3,4', 'group by 1,2,3,4', 13, 1, 0, 0),
(49, 'Receipts In Progress', 'SELECT count(*) cnt \r\nFROM srh \r\nWHERE srh_rec_status = 0', 'AND srh.bra_id = ? ORDER BY 1', 'AND srh.cpy_id = ? ORDER BY 1', 1, 10, 0, 38),
(50, 'Proforma Invoices Not Cancelled', 'SELECT count(*) cnt \r\nFROM oih, oft \r\nWHERE oih_status = 2 \r\nAND ( oih_cancel = 0 OR oih_cancel IS NULL ) \r\nAND oih_account = 0 \r\nAND oih_process = ''F''\r\nAND oih.oft_id = oft.oft_id\r\nAND oft.oft_process = ''0''', 'AND oih.bra_id = ? ORDER BY 1', 'AND oih.cpy_id = ? ORDER BY 1', 1, 9, 0, 53),
(51, 'Invoices Printed Not Integrated', 'SELECT count(*) cnt \r\nFROM oih, oft \r\nWHERE oih_status = 2 \r\nAND ( oih_cancel = 0 OR oih_cancel IS NULL ) \r\nAND oih_account = 0 \r\nAND oih_process <> ''F''\r\nAND oih.oft_id = oft.oft_id\r\nAND oft.oft_process = ''0''', 'AND oih.bra_id = ? ORDER BY 1', 'AND oih.cpy_id = ? ORDER BY 1', 1, 8, 0, 57),
(52, 'Part Lines On Requisition', 'SELECT ofh.ofh_doc_id, ofh.ofh_d_cre, bra.bra_screen, xvd.xvd_display, xvd1.xvd_display, ofl.pmf_id, ofl.pro_id, ofl.ofl_q_cord, ofl.ofl_q_sreq \r\nFROM ofh , oft,ofl, bra, xvd, xvd xvd1 \r\nWHERE ofh_doc_id IS NOT NULL \r\nAND ofh.oft_id = oft.oft_id \r\nAND ofh_cancel = 0 \r\nAND ofh.ofh_id = ofl.ofh_id \r\nAND ofh.ofh_sqciw <> 1 \r\nAND ofl_q_sreq <> 0 \r\nAND ofl_line = 1 \r\nAND ofh_status in (0,1) \r\nAND oft.oft_process = ''0'' \r\nAND ofh.bra_id = bra.bra_id \r\nAND ofh.dpr_id = xvd.xcv_id \r\nAND xvd.lng_id = 0 \r\nAND xvd.xcd_id = 1 \r\nAND xvd1.xcv_id = ofh.oft_id \r\nAND xvd1.lng_id = 0 \r\nAND xvd1.xcd_id = 24\r\n', 'AND ofh.bra_id = ? order by 1,2', 'AND ofh.cpy_id = ? order by 1,2', 2, 2, 0, 0),
(53, 'Proforma Invoices Not Cancelled', 'SELECT oih.oih_doc_id, oih.csc_id_inv, oih.oih_matchname, oih.oih_d_cre, bra.bra_screen, xvd.xvd_display \r\nFROM oih, bra, xvd, oft\r\nWHERE oih_status < 3 \r\nAND ( oih_cancel = 0 OR oih_cancel IS NULL ) \r\nAND oih_account = 0 \r\nAND oih_process = ''F''\r\nAND oih.bra_id = bra.bra_id \r\nAND oih.dpr_id = xvd.xcv_id \r\nAND xvd.lng_id = 0 \r\nAND xvd.xcd_id = 1\r\nAND oih.oft_id = oft.oft_id\r\nAND oft.oft_process = ''0''\r\n', 'AND oih.bra_id = ? ORDER BY 1', 'AND oih.cpy_id = ? ORDER BY 1', 2, 9, 0, 0),
(54, 'AP Register Not Returned', 'select bra_id, dpr_id, usr_id_ass, gir_doc_id, spp_id, gir_d_inv, gir_inv_id from gir where gir_returned <> 1 and gir_cancel = 0', 'and gir.bra_id = ? order by gir.usr_id_ass, gir_doc_id', 'and gir.cpy_id = ? order by gir.usr_id_ass, gir_doc_id', 32, 1, 0, 0),
(55, 'Part lines delivered not invoiced', 'SELECT count(*) cnt\r\nFROM opl, odh, ofh, oft\r\nWHERE opl_status = 4 \r\nAND opl_line = 1\r\nAND opl.opl_cancel=0 \r\nAND odh.odh_cancel=0\r\nAND opl.odh_id = odh.odh_id\r\nAND opl.ofh_id = ofh.ofh_id\r\nAND ofh.oft_id = oft.oft_id\r\nAND oft.oft_process = ''0''\r\n', 'AND odh.bra_id = ? ORDER BY 1', 'AND odh.cpy_id = ? ORDER BY 1', 1, 6, 0, 39),
(56, 'Part Lines On Transfer', 'SELECT ofl.ofl_id, ofh.ofh_doc_id, ofh.ofh_d_cre, bra.bra_screen, ofl.pmf_id, ofl.pro_id, ofl.ofl_q_cord, ofl.ofl_q_sord, \r\n(SELECT ofh_doc_id FROM ofh ofh1 WHERE ofh1.ofh_id = rfl.ofh_id_trf)  \r\nFROM ofh, ofl, rfl, bra, oft\r\nWHERE ofl.ofh_id = rfl.ofh_id AND ofl.ofl_id = rfl.ofl_id\r\nAND ofh_doc_id IS NOT NULL\r\nAND ofh.ofh_sqciw <> 1\r\nAND ofh_cancel = 0\r\nAND ofl_line = 1\r\nAND oft.oft_process = ''0'' \r\nAND ofh.oft_id = oft.oft_id\r\nAND ofl.ofh_id = ofh.ofh_id\r\nAND ofh.bra_id = bra.bra_id\r\nAND ofh_status in (0,1)\r\nAND ( ofl_q_sord <> 0 and rfl_ibt = 1 )\r\n', 'and ofh.bra_id = ? order by 1,2', 'and ofh.cpy_id = ? order by 1,2', 2, 4, 0, 0),
(57, 'Invoices Printed Not Integrated', 'SELECT oih_doc_id, csc_id_inv, oih_matchname, oih_d_cre, bra.bra_screen, xvd.xvd_display \r\nFROM oih, bra, xvd, oft \r\nWHERE oih_status = 2 \r\nAND ( oih_cancel = 0 OR oih_cancel IS NULL ) \r\nAND oih_account = 0 \r\nAND oih_process <> ''F''\r\nAND oih.bra_id = bra.bra_id \r\nAND oih.dpr_id = xvd.xcv_id \r\nAND xvd.lng_id = 0 \r\nAND xvd.xcd_id = 1\r\nAND oih.oft_id = oft.oft_id\r\nAND oft.oft_process = ''0''\r\n\r\n', 'AND oih.bra_id = ? ORDER BY 1', 'AND oih.cpy_id = ? ORDER BY 1', 2, 8, 0, 0),
(58, 'IBT Lines Awaiting Receipt', 'select count(*) cnt\r\nfrom sfh, sfl, rfl,ofl, oih, oil, ofh, oft\r\nwhere sfh.sfh_id = sfl.sfh_id and sfh_transfer = 1\r\nand sfl_q_sord <> (sfl_q_scan + sfl_q_srec)\r\nand sfl.sfh_id =rfl.sfh_id and sfl.sfl_id = rfl.sfl_id\r\nand ofh_id_trf = ofl.ofh_id and ofl_id_trf = ofl.ofl_id\r\nand oil.ofh_id = ofh_id_trf and oil.ofl_id = ofl_id_trf\r\nand oil.oih_id = oih.oih_id\r\nand NVL(ofl_q_cinv, 0) <> 0\r\nand ofl.ofh_id = ofh.ofh_id\r\nand ofh.oft_id = oft.oft_id\r\nand oft_process = ''0''', 'AND sfh.bra_id = ?', 'AND sfh.cpy_id = ?', 1, 5, 0, 59),
(59, 'IBT Lines Awaiting Receipt', 'select  bra.bra_screen branch, xvd_display dept, sfh_doc_id po_id, date(sfh_d_cre) po_created, sfl.pmf_id mfr, sfl.pro_id part_no, sfl_q_sord qty_ordered, \r\nsfl_q_scan qty_cancel, sfl_q_srec qty_received, oih.bra_id tfr_branch, ofh_doc_id transfer_order, ofl_q_cinv tfr_qty_inv, oih_doc_id tfr_inv, oih_d_inv inv_date\r\nfrom sfh, sfl, rfl,ofl, oih, oil, bra, xvd, ofh, oft\r\nwhere sfh.sfh_id = sfl.sfh_id and sfh_transfer = 1\r\nand sfl_q_sord <> (sfl_q_scan + sfl_q_srec)\r\nand sfl.sfh_id =rfl.sfh_id and sfl.sfl_id = rfl.sfl_id\r\nand ofh_id_trf = ofl.ofh_id and ofl_id_trf = ofl.ofl_id\r\nand oil.ofh_id = ofh_id_trf and oil.ofl_id = ofl_id_trf\r\nand oil.oih_id = oih.oih_id\r\nand sfh.bra_id = bra.bra_id\r\nand NVL(ofl_q_cinv, 0) <> 0\r\nand sfh.dpr_id = xvd.xcv_id and xvd.lng_id = 0 and xvd.xcd_id = ''1''\r\nand ofh.ofh_id = rfl.ofh_id_trf\r\nand ofl.ofh_id = ofh.ofh_id\r\nand ofh.oft_id = oft.oft_id\r\nand oft.oft_process = ''0''', 'and sfh.bra_id = ? order by sfh.bra_id, sfh.dpr_id, sfh_doc_id', 'and sfh.cpy_id = ? order by sfh.bra_id, sfh.dpr_id, sfh_doc_id', 2, 5, 0, 0),
(60, 'Open Work Order Segments', 'select count(*) cnt from ofs, oft\r\nwhere ofs_status < 3\r\nand ofs.oft_id = oft.oft_id\r\nand oft_process = ''1''\r\nand ofs.ofs_sqciw in (0,2,3,4)', 'and ofs.bra_id = ? ', 'and ofs.cpy_id = ?', 11, 1, 0, 72),
(61, 'PO Invoices with Date &gt; Today', 'select count(*) cnt from sih, sid where sih_d_inv > current and sih.sih_id = sid.sih_id\r\n', 'and sih.bra_id = ?', 'and sih.cpy_id = ?', 1, 13, 0, 62),
(62, 'PO Invoices with Date &gt; Today', 'select spp_id, sih_matchname, bra_id, dpr_id, sih_doc_id, sih_d_inv, sid_d_due from sih, sid where sih_d_inv > current and sih.sih_id = sid.sih_id', 'and sih.bra_id = ? order by bra_id, dpr_id', 'and sih.cpy_id = ? order by bra_id, dpr_id', 2, 13, 0, 0),
(63, 'PO Invoices not on AP Register', 'select count(*) cnt from sih, xvd \r\nwhere sih_acc_status = 0 and sih_inv_status = 2\r\nand sih.dpr_id = xvd.xcv_id and xvd.xcd_id = ''1'' and lng_id = ''0'' \r\nand not exists (SELECT gir_id FROM gir WHERE sih.sih_inv_id = gir.gir_inv_id \r\nAND gir.spp_id = sih.spp_id AND gir.cpy_id = sih.cpy_id)\r\n', 'and sih.bra_id =  ?', 'and sih.cpy_id =  ?', 31, 2, 0, 64),
(64, 'PO Invoices not on AP Register', 'select bra_id, xvd_desc, spp_id, sih_d_inv, sih_inv_id, sih_net_local, sih_tax_local, sih_total_local, sih_cancel, sih_authorized  from sih, xvd \r\nwhere sih_acc_status = 0 and sih_inv_status = 2\r\nand sih.dpr_id = xvd.xcv_id and xvd.xcd_id = ''1'' and lng_id = ''0'' \r\nand not exists (SELECT gir_id FROM gir WHERE sih.sih_inv_id = gir.gir_inv_id \r\nAND gir.spp_id = sih.spp_id AND gir.cpy_id = sih.cpy_id)\r\n', 'and sih.bra_id = ? order by sih.sih_doc_id', 'and sih.cpy_id = ? order by sih.sih_doc_id', 32, 2, 0, 0),
(65, 'Labour Utilisation - Pt2', 'select bra.bra_screen branch, xvd_dpr.xvd_display dept, \r\n(year(orl_d_clock) * 100 + month(orl_d_clock)) period, \r\ntrim(tad.tad_name_last)||''  ''||trim(tad_name_first) technician,\r\nsum(orl_q_passed - orl_q_gain) hours from orl, ofs, bra, xvd xvd_dpr, usr, tad\r\nwhere orl.ofh_id = ofs.ofh_id and orl.ofs_id = ofs.ofs_id\r\nand ofs.dpr_id = xvd_dpr.xcv_id and xvd_dpr.xcd_id = 1 and xvd_dpr.lng_id = 0\r\nand orl.usr_id = usr.usr_id\r\nand usr.thr_id = tad.thr_id\r\nand ofs.bra_id = bra.bra_id\r\nand date(orl_d_clock) > date(Current) - 365', 'and ofs.bra_id = ? group by 1,2,3,4 ', 'group by 1,2,3,4', 13, 2, 0, 0),
(66, 'PO Invoices with value &lt;&gt; AP Register', 'select sih_total_cur, gir_id, sih.cur_id, sih.sih_id, gir.gir_id,  sih_doc_id, gir_doc_id, sih_total_cur, gir_amt_cur, sih_tax_cur,  gir_amt_tax  from sih, gir\r\nWHERE sih.sih_inv_id = gir.gir_inv_id AND gir.spp_id = sih.spp_id AND gir.cpy_id = sih.cpy_id\r\nand (sih_total_cur <> gir_amt_cur or sih_tax_cur <> gir_amt_tax)\r\n\r\n', 'and sih.bra_id = ? order by sih.bra_id, sih.sih_doc_id', 'and sih.cpy_id = ? order by sih.bra_id, sih.sih_doc_id', 32, 3, 0, 0),
(67, 'PO Invoices not Integrated', 'select count(*) cnt from sih where sih_acc_status <> 2 and\r\nsih_cancel = 0 and sih_authorized = 1', 'and sih.bra_id = ?', 'and sih.cpy_id = ?', 31, 4, 0, 68),
(68, 'PO Invoice not Integrated', 'select sih_doc_id document_no, sih_d_inv inv_date, bra_id branch, dpr_id dept, sih_inv_status inv_status, sih_acc_status acc_status, sih_d_acc acc_date from sih where sih_acc_status <> 2 and\r\nsih_cancel = 0 and sih_authorized = 1\r\n', 'and sih.bra_id = ? order by sih.bra_id, sih.sih_inv_id', 'and sih.cpy_id = ? order by sih.bra_id, sih.sih_inv_id', 32, 4, 0, 0),
(69, 'PO Invoice value &lt;&gt; AP Register', 'select count(*) cnt  from sih, gir\r\nWHERE sih.sih_inv_id = gir.gir_inv_id AND gir.spp_id = sih.spp_id AND gir.cpy_id = sih.cpy_id\r\nand (sih_total_cur <> gir_amt_cur or sih_tax_cur <> gir_amt_tax)', 'and sih.bra_id = ?', 'and sih.cpy_id = ?', 31, 3, 0, 66),
(70, 'Parts Sales Month/Branch/dept/Mfr', 'select bra.bra_screen, xvd_print, oil.pmf_id, (year(oih_d_inv) * 100 + month(oih_d_inv)) period, \r\nround(sum(oil_q_inv * oil_pnet_local),2) value,\r\nround(sum(oil_q_inv * oil_cost),2) cost,\r\ncase when sum(oil_q_inv) <> 0 then\r\nround(100-(100/((round(sum(oil_q_inv * oil_pnet_local),2))/round(sum(oil_q_inv * oil_cost),2))),2)\r\nelse\r\n0\r\nend margin\r\nfrom oih, oil, bra, xvd\r\nwhere oih_cancel = 0\r\nand oih_process = ''0''\r\nand oih_invtype in (0,1)\r\nand ((year(oih_d_inv) = year(today)) or (((year(oih_d_inv)) = (year(today) -1))and month(oih_d_inv) > month(today)))\r\nand oil.oih_id = oih.oih_id\r\nand oil_line = 1\r\nAND oih.cpy_id = ''HMUK''\r\nand oil_pnet_local <> 0 and oil_cost <> 0\r\nand oih.bra_id = bra.bra_id\r\nand xvd.xcv_id = oih.dpr_id and xvd.xcd_id = 1 and xvd.lng_id = 0\r\n', 'AND oih.bra_id = ? group by 1,2,3,4\r\norder by 1,2,4,3', 'AND oih.cpy_id = ? group by 1,2,3,4\r\norder by 1,2,4,3', 3, 2, 0, 0),
(71, 'Parts Stock Rotation', 'select oih.bra_id, oil.pmf_id, round(sum(oil_q_inv * oil_cost),2) sales, round(sum(psk_q * pna_current),2) stock,\r\ncase when (sum(psk_q) <> 0 and sum(pna_current) <> 0) then \r\nround((round(sum(oil_q_inv * oil_cost),2)/ round(sum(psk_q * pna_current),2)),2)\r\nelse\r\n0\r\nend  ratio\r\nfrom psk, pna, oil, oih\r\nwhere oil.oih_id = oih.oih_id \r\nand oih_cancel = 0\r\nand oih_process = ''0''\r\nand oih_invtype in (0,1)\r\nand oil.oih_id = oih.oih_id\r\nand oil_line = 1\r\nand oih_d_inv > date(current) - 365\r\nand oih.dpr_id = ''300''\r\nand oil.pmf_id = psk.pmf_id and oil.pro_id = psk.pro_id and oih.bra_id = psk.bra_id and oih.dpr_id = psk.dpr_id\r\nand psk.pmf_id = pna.pmf_id and psk.pro_id = pna.pro_id\r\n', 'and oih.bra_id = ? group by 1,2 order by 1,2', 'and oih.cpy_id = ? group by 1,2 order by 1,2', 4, 1, 0, 0),
(72, 'Open Work Order Segments', 'select bra.bra_screen branch, xvd_dpr.xvd_print dept, ofh.ofh_doc_id document, ofs.ofs_id segment, xvd_oft.xvd_print folder, ofs.csc_id_inv cust_id, ofs.ofs_matchname customer, ofs_title title, date(ofs_d_cre) created, \r\nround(sum(ofl_q_cord * ofl_pnet_local),2) app_value \r\nfrom ofs, ofh, oft, bra, xvd xvd_dpr, xvd xvd_oft, outer ofl\r\nwhere ofs_status < 3\r\nand ofs.ofh_id = ofh.ofh_id\r\nand ofs.ofh_id = ofl.ofh_id and ofs.ofs_id = ofl.ofs_id\r\nand ofs.oft_id = oft.oft_id\r\nand oft_process = ''1''\r\nand ofs.bra_id = bra.bra_id\r\nand ofs.ofs_sqciw in (0,2,3,4)\r\nand xvd_dpr.xcd_id = 1 and xvd_dpr.xcv_id = ofs.dpr_id and xvd_dpr.lng_id = 0\r\nand xvd_oft.xcd_id = 24 and xvd_oft.xcv_id = ofs.oft_id and xvd_oft.lng_id = 0', 'and ofs.bra_id = ? group by 1,2,3,4,5,6,7,8,9 order by 1,2,9,3', 'and ofs.cpy_id = ? group by 1,2,3,4,5,6,7,8,9 order by 1,2,9,3', 12, 1, 0, 0),
(73, 'Outstanding Sub Let Lines', 'select count(*) cnt from ofl, ofs where ofl_line = 8 and ofl_q_cinv <> ofl_q_cord\r\nand ofl.ofh_id = ofs.ofh_id and ofl.ofs_id = ofs.ofs_id', ' and ofs.bra_id = ?', ' and ofs.cpy_id = ?', 11, 2, 0, 74),
(74, 'Outstanding Sub Let Lines', 'select bra.bra_screen, xvd_dpr.xvd_print, ofh.ofh_doc_id work_order, ofs.ofs_id segment, ofl_q_cord ord_qty, ofl_q_sord on_order, \r\nofl_q_to_inv to_invoice, ofl.pro_id item, sfh.sfh_doc_id po_number, sfh.spp_id supplier_id, sfh.sfh_matchname supplier, sfl.sfl_q_sord ordered, \r\n (select srl.srl_q_rec from srl where sub.srh_id = srl.srh_id and sub.srl_id = srl.srl_id) received\r\nfrom ofh, ofl, ofs, bra, xvd xvd_dpr,  outer (sub, sfl, sfh) \r\nwhere ofl_line = 8 and ofl_q_cinv <> ofl_q_cord\r\nand ofl.ofh_id = sub.ofh_id and ofl.ofl_id = sub.ofl_id\r\nand sub.sfh_id = sfl.sfh_id and sub.sfl_id = sfl.sfl_id\r\nand ofl.ofh_id = ofs.ofh_id and ofl.ofs_id = ofs.ofs_id\r\nand ofl.ofh_id = ofh.ofh_id\r\nand sub.sfh_id = sfh.sfh_id\r\nand ofs.ofs_sqciw in (0,1,2,3)\r\nand ofs.bra_id = bra.bra_id\r\nand xvd_dpr.xcd_id = 1 and xvd_dpr.xcv_id = ofs.dpr_id and xvd_dpr.lng_id = 0', ' and ofs.bra_id = ? order by 1,2,3', ' and ofs.cpy_id = ? order by 1,2,3', 12, 2, 0, 0),
(75, 'Part Lines ON Wait', 'SELECT count(*) cnt FROM ofl, ofh, oft WHERE ofh_doc_id IS NOT NULL AND ofh.oft_id = oft.oft_id AND ofh_cancel = 0 AND ofh.ofh_id = ofl.ofh_id AND ofh.ofh_sqciw <> 1 AND ofl_q_wait <> 0 AND ofl_line = 1 AND ofh_status in (0,1) AND oft.oft_process = ''1''', ' AND ofh.bra_id = ? ORDER BY 1', ' AND ofh.cpy_id = ? ORDER BY 1', 11, 3, 0, 76),
(76, 'Part Lines On Wait', 'SELECT ofh.ofh_doc_id Document, ofh.ofh_d_cre D_created, bra.bra_screen Branch, xvd.xvd_display Dept, xvd1.xvd_display Folder, ofl.pmf_id Mfr, ofl.pro_id PartNo, ofl.ofl_q_cord Ordered_Q, ofl.ofl_q_wait Wait_Q FROM ofh, bra, xvd, xvd xvd1, oft, ofl WHERE ofh_doc_id IS NOT NULL AND ofh.oft_id = oft.oft_id AND ofh_cancel = 0 AND ofh.ofh_id = ofl.ofh_id AND ofh.ofh_sqciw <> 1 AND ofl_q_wait <> 0 AND ofl_line = 1 AND ofh_status in (0,1) AND oft.oft_process = ''1'' AND ofh.bra_id = bra.bra_id AND ofh.dpr_id = xvd.xcv_id AND xvd.lng_id = 0 AND xvd.xcd_id = 1 AND xvd1.xcv_id = ofh.oft_id AND xvd1.lng_id = 0 AND xvd1.xcd_id = 24', ' and ofh.bra_id = ? order by 1,2', ' and ofh.cpy_id = ? order by 1,2', 12, 3, 0, 0),
(77, 'Parts Lines On Requisition', 'SELECT count(*) cnt FROM ofl, ofh, oft WHERE ofh_doc_id IS NOT NULL AND ofh.oft_id = oft.oft_id AND ofh_cancel = 0 AND ofh.ofh_id = ofl.ofh_id AND ofh.ofh_sqciw <> 1 AND ofl_q_sreq <> 0 AND ofl_line = 1 AND ofh_status in (0,1) AND oft.oft_process = ''1''', ' AND ofh.bra_id = ? ', ' AND ofh.cpy_id = ? ', 11, 4, 0, 78),
(78, 'Parts Lines On Resuisition', 'SELECT ofh.ofh_doc_id, ofh.ofh_d_cre, bra.bra_screen, xvd.xvd_display, xvd1.xvd_display, ofl.pmf_id, ofl.pro_id, ofl.ofl_q_cord, ofl.ofl_q_sreq FROM ofh , oft,ofl, bra, xvd, xvd xvd1 WHERE ofh_doc_id IS NOT NULL AND ofh.oft_id = oft.oft_id AND ofh_cancel = 0 AND ofh.ofh_id = ofl.ofh_id AND ofh.ofh_sqciw <> 1 AND ofl_q_sreq <> 0 AND ofl_line = 1 AND ofh_status in (0,1) AND oft.oft_process = ''1'' AND ofh.bra_id = bra.bra_id AND ofh.dpr_id = xvd.xcv_id AND xvd.lng_id = 0 AND xvd.xcd_id = 1 AND xvd1.xcv_id = ofh.oft_id AND xvd1.lng_id = 0 AND xvd1.xcd_id = 24', ' AND ofh.bra_id = ? order by 1,2', ' AND ofh.cpy_id = ? order by 1,2', 12, 4, 0, 0),
(79, 'Parts Lines On Back Order', 'SELECT count(*) cnt FROM ofl, ofh, oft WHERE ofh_doc_id IS NOT NULL AND ofh.oft_id = oft.oft_id AND ofh_cancel = 0 AND ofh.ofh_id = ofl.ofh_id AND ofh.ofh_sqciw <> 1 AND ofl_q_sord <> 0 AND ofl_line = 1 AND ofh_status in (0,1) AND oft.oft_process = ''1''', ' AND ofh.bra_id = ? ORDER BY 1', ' AND ofh.cpy_id = ? ORDER BY 1', 11, 5, 0, 80),
(80, 'Parts Lines On Backorder', 'SELECT ofl.ofh_id, ofl.pro_id FROM ofl, ofh, oft WHERE ofl_q_sord <> 0 AND ofh_doc_id IS NOT NULL AND ofl.ofh_id = ofh.ofh_id AND ofh.ofh_sqciw <> 1 AND ofh_cancel = 0 AND ofl_line = 1 AND ofh_status in (0,1) AND oft.oft_process = ''1'' AND ofh.oft_id = oft.oft_id', ' AND ofh.bra_id = ? ORDER BY 1', ' AND ofh.bra_id = ? ORDER BY 1', 12, 5, 0, 0),
(81, 'Part lines on transfer', 'SELECT count(*) cnt \r\nFROM ofh, ofl, rfl, bra, oft\r\nWHERE ofl.ofh_id = rfl.ofh_id AND ofl.ofl_id = rfl.ofl_id\r\nAND ofh_doc_id IS NOT NULL\r\nAND ofh.ofh_sqciw <> 1\r\nAND ofh_cancel = 0\r\nAND ofl_line = 1\r\nAND oft.oft_process = ''1'' \r\nAND ofh.oft_id = oft.oft_id\r\nand ofl.ofh_id = ofh.ofh_id\r\nand ofh.bra_id = bra.bra_id\r\nAND ofh_status in (0,1)\r\nAND ( ofl_q_sord <> 0 AND rfl_ibt = 1 )', 'AND ofh.bra_id = ? ORDER BY 1', 'AND ofh.cpy_id = ? ORDER BY 1', 11, 6, 0, 82),
(82, 'Part Lines On Transfer', 'SELECT ofl.ofl_id, ofh.ofh_doc_id, ofh.ofh_d_cre, bra.bra_screen, ofl.pmf_id, ofl.pro_id, ofl.ofl_q_cord, ofl.ofl_q_sord, \r\n(SELECT ofh_doc_id FROM ofh ofh1 WHERE ofh1.ofh_id = rfl.ofh_id_trf)  \r\nFROM ofh, ofl, rfl, bra, oft\r\nWHERE ofl.ofh_id = rfl.ofh_id AND ofl.ofl_id = rfl.ofl_id\r\nAND ofh_doc_id IS NOT NULL\r\nAND ofh.ofh_sqciw <> 1\r\nAND ofh_cancel = 0\r\nAND ofl_line = 1\r\nAND oft.oft_process = ''0'' \r\nAND ofh.oft_id = oft.oft_id\r\nAND ofl.ofh_id = ofh.ofh_id\r\nAND ofh.bra_id = bra.bra_id\r\nAND ofh_status in (0,1)\r\nAND ( ofl_q_sord <> 0 and rfl_ibt = 1 )\r\n', 'and ofh.bra_id = ? order by 1,2', 'and ofh.cpy_id = ? order by 1,2', 12, 6, 0, 0),
(83, 'IBT Lines Awaiting Receipt', 'select count(*) cnt\r\nfrom sfh, sfl, rfl,ofl, oih, oil, ofh, oft\r\nwhere sfh.sfh_id = sfl.sfh_id and sfh_transfer = 1\r\nand sfl_q_sord <> (sfl_q_scan + sfl_q_srec)\r\nand sfl.sfh_id =rfl.sfh_id and sfl.sfl_id = rfl.sfl_id\r\nand ofh_id_trf = ofl.ofh_id and ofl_id_trf = ofl.ofl_id\r\nand oil.ofh_id = ofh_id_trf and oil.ofl_id = ofl_id_trf\r\nand oil.oih_id = oih.oih_id\r\nand NVL(ofl_q_cinv, 0) <> 0\r\nand ofl.ofh_id = ofh.ofh_id\r\nand ofh.oft_id = oft.oft_id\r\nand oft_process = ''1''', 'AND sfh.bra_id = ?', 'AND sfh.cpy_id = ?', 11, 7, 0, 84),
(84, 'IBT Lines Awaiting Receipt', 'select  bra.bra_screen branch, xvd_display dept, sfh_doc_id po_id, date(sfh_d_cre) po_created, sfl.pmf_id mfr, sfl.pro_id part_no, sfl_q_sord qty_ordered, \r\nsfl_q_scan qty_cancel, sfl_q_srec qty_received, oih.bra_id tfr_branch, ofh_doc_id transfer_order, ofl_q_cinv tfr_qty_inv, oih_doc_id tfr_inv, oih_d_inv inv_date\r\nfrom sfh, sfl, rfl,ofl, oih, oil, bra, xvd, ofh, oft\r\nwhere sfh.sfh_id = sfl.sfh_id and sfh_transfer = 1\r\nand sfl_q_sord <> (sfl_q_scan + sfl_q_srec)\r\nand sfl.sfh_id =rfl.sfh_id and sfl.sfl_id = rfl.sfl_id\r\nand ofh_id_trf = ofl.ofh_id and ofl_id_trf = ofl.ofl_id\r\nand oil.ofh_id = ofh_id_trf and oil.ofl_id = ofl_id_trf\r\nand oil.oih_id = oih.oih_id\r\nand sfh.bra_id = bra.bra_id\r\nand NVL(ofl_q_cinv, 0) <> 0\r\nand sfh.dpr_id = xvd.xcv_id and xvd.lng_id = 0 and xvd.xcd_id = ''1''\r\nand ofh.ofh_id = rfl.ofh_id_trf\r\nand ofl.ofh_id = ofh.ofh_id\r\nand ofh.oft_id = oft.oft_id\r\nand oft.oft_process = ''1''', 'and sfh.bra_id = ? order by sfh.bra_id, sfh.dpr_id, sfh_doc_id', 'and sfh.cpy_id = ? order by sfh.bra_id, sfh.dpr_id, sfh_doc_id', 12, 7, 0, 0),
(85, 'Part lines delivered not invoiced', 'SELECT count(*) cnt\r\nFROM opl, odh, ofh, oft\r\nWHERE opl_status = 4 \r\nAND opl_line = 1\r\nAND opl.opl_cancel=0 \r\nAND odh.odh_cancel=0\r\nAND opl.odh_id = odh.odh_id\r\nAND opl.ofh_id = ofh.ofh_id\r\nAND ofh.oft_id = oft.oft_id\r\nAND oft.oft_process = ''1''\r\n', 'AND odh.bra_id = ? ORDER BY 1', 'AND odh.cpy_id = ? ORDER BY 1', 11, 8, 0, 86),
(86, 'Part Lines Delivered Not Invoiced', 'SELECT odh.odh_doc_id Document, odh_doc_id_seq Sequence, bra.bra_screen Branch, xvd.xvd_display Dept, odh.odh_d_closed D_closed, opl.pmf_id Mfr, opl.pro_id Part_no, sum(opl_q_del) Q_del, sum(opl_q_inv) Q_inv \r\nFROM opl, odh, bra, xvd, ofh, oft \r\nWHERE opl_status <5 \r\nAND opl_line = 1 \r\nAND odh.dpr_id = xvd.xcv_id \r\nAND xvd.lng_id = 0 \r\nAND xvd.xcd_id = 1 \r\nAND opl.opl_cancel=0\r\nAND opl.opl_q_all <> 0 \r\nAND odh.odh_cancel=0 \r\nAND odh.bra_id = bra.bra_id \r\nAND opl.odh_id = odh.odh_id\r\nand opl.ofh_id = ofh.ofh_id\r\nand ofh.oft_id = oft.oft_id\r\nand oft.oft_process = ''1'' ', 'AND odh.bra_id = ? GROUP BY 1,2,3,4,5,6,7 ORDER BY 1', 'AND odh.cpy_id = ? GROUP BY 1,2,3,4,5,6,7 ORDER BY 1', 12, 8, 0, 0),
(87, 'Invoiced Not Printed', 'SELECT COUNT(*) cnt\r\nFROM oih, oft\r\nWHERE oih.oih_status < 3 \r\nAND oih.oih_cancel = 0 \r\nAND oih_process <> ''F''\r\nAND oih.oft_id = oft.oft_id\r\nAND oft.oft_process = ''1''\r\n', 'AND oih.bra_id = ? ORDER BY 1', 'AND oih.cpy_id = ? ORDER BY 1', 11, 9, 0, 88),
(88, 'Invoices Generated Not Printed', 'SELECT oih.oih_doc_id, oih.csc_id_inv, oih.oih_matchname, oih.oih_d_cre, bra.bra_screen, xvd.xvd_display FROM oih, bra, oft, outer xvd\r\nWHERE oih.oih_status < 3 \r\nAND oih.oih_cancel = 0 \r\nAND oih_process <> ''F''\r\nAND oih.bra_id = bra.bra_id \r\nAND oih.dpr_id = xvd.xcv_id \r\nAND xvd.lng_id = 0 \r\nAND xvd.xcd_id = 1\r\nAND oih.oft_id = oft.oft_id\r\nAND oft.oft_process = ''1''\r\n', 'AND oih.bra_id = ? ORDER BY 1', 'AND oih.cpy_id = ? ORDER BY 1', 12, 9, 0, 0),
(89, 'Invoices Printed Not Integrated', 'SELECT count(*) cnt \r\nFROM oih, oft \r\nWHERE oih_status = 2 \r\nAND ( oih_cancel = 0 OR oih_cancel IS NULL ) \r\nAND oih_account = 0 \r\nAND oih_process <> ''F''\r\nAND oih.oft_id = oft.oft_id\r\nAND oft.oft_process = ''1''', 'AND oih.bra_id = ? ORDER BY 1', 'AND oih.cpy_id = ? ORDER BY 1', 11, 10, 0, 90),
(90, 'Invoices Printed Not Integrated', 'SELECT oih_doc_id, csc_id_inv, oih_matchname, oih_d_cre, bra.bra_screen, xvd.xvd_display \r\nFROM oih, bra, xvd, oft \r\nWHERE oih_status = 2 \r\nAND ( oih_cancel = 0 OR oih_cancel IS NULL ) \r\nAND oih_account = 0 \r\nAND oih_process <> ''F''\r\nAND oih.bra_id = bra.bra_id \r\nAND oih.dpr_id = xvd.xcv_id \r\nAND xvd.lng_id = 0 \r\nAND xvd.xcd_id = 1\r\nAND oih.oft_id = oft.oft_id\r\nAND oft.oft_process = ''1''\r\n\r\n', 'AND oih.bra_id = ? ORDER BY 1', 'AND oih.cpy_id = ? ORDER BY 1', 12, 10, 0, 0),
(91, 'Proforma Invoices Not Cancelled', 'SELECT count(*) cnt \r\nFROM oih, oft \r\nWHERE oih_status = 2 \r\nAND ( oih_cancel = 0 OR oih_cancel IS NULL ) \r\nAND oih_account = 0 \r\nAND oih_process = ''F''\r\nAND oih.oft_id = oft.oft_id\r\nAND oft.oft_process = ''1''', 'AND oih.bra_id = ? ORDER BY 1', 'AND oih.cpy_id = ? ORDER BY 1', 11, 11, 0, 92),
(92, 'Proforma Invoices Not Cancelled', 'SELECT oih.oih_doc_id, oih.csc_id_inv, oih.oih_matchname, oih.oih_d_cre, bra.bra_screen, xvd.xvd_display \r\nFROM oih, bra, xvd, oft\r\nWHERE oih_status < 3 \r\nAND ( oih_cancel = 0 OR oih_cancel IS NULL ) \r\nAND oih_account = 0 \r\nAND oih_process = ''F''\r\nAND oih.bra_id = bra.bra_id \r\nAND oih.dpr_id = xvd.xcv_id \r\nAND xvd.lng_id = 0 \r\nAND xvd.xcd_id = 1\r\nAND oih.oft_id = oft.oft_id\r\nAND oft.oft_process = ''1''\r\n', 'AND oih.bra_id = ? ORDER BY 1', 'AND oih.cpy_id = ? ORDER BY 1', 12, 11, 0, 0),
(93, 'Receipts In Progress', 'SELECT count(*) cnt \r\nFROM srh \r\nWHERE srh_rec_status = 0', 'AND srh.bra_id = ? ORDER BY 1', 'AND srh.cpy_id = ? ORDER BY 1', 11, 12, 0, 94),
(94, 'Receipts In Progress', 'SELECT srh_doc_id, srh.spp_id, srh_matchname, bra.bra_screen, xvd.xvd_display\r\nFROM srh, bra, xvd \r\nWHERE srh_rec_status = 0\r\nAND srh_acc_status = 0\r\nAND srh.dpr_id = xvd.xcv_id \r\nAND xvd.lng_id = 0 \r\nAND xvd.xcd_id = 1 \r\nAND srh.bra_id = bra.bra_id ', 'AND srh.bra_id = ? ORDER BY 1', 'AND srh.cpy_id = ? ORDER BY 1', 12, 12, 0, 0),
(95, 'Receipt Lines not Integrated', 'SELECT COUNT(*) cnt\r\nFROM srh, srl, bra, xvd \r\nWHERE srh_rec_status = 1\r\nAND srh_acc_status = 0 \r\nAND srl.srh_id = srh.srh_id\r\nAND srh.dpr_id = xvd.xcv_id \r\nAND xvd.lng_id = 0 \r\nAND xvd.xcd_id = 1 \r\nAND srh.bra_id = bra.bra_id \r\nAND srl.srl_line = 1 \r\nAND not exists\r\n(SELECT * FROM sil WHERE sil.srh_id = srl.srh_id AND sil.srl_id = srl.srl_id)', 'AND srh.bra_id = ? ORDER BY 1', 'AND srh.bra_id = ? ORDER BY 1', 11, 13, 0, 96),
(96, 'Receipt Not Integrated', 'SELECT srh_doc_id, srh.spp_id, srh_matchname, bra.bra_screen, xvd.xvd_display, round(sum(srl_q_rec * (srl_pnet_local + srl_pro_local)),2) \r\nFROM srh, srl, bra, xvd \r\nWHERE srh_rec_status = 1 \r\nAND srh_acc_status = 0\r\nAND srl.srh_id = srh.srh_id \r\nAND srh.dpr_id = xvd.xcv_id \r\nAND xvd.lng_id = 0 \r\nAND xvd.xcd_id = 1 \r\nAND srh.bra_id = bra.bra_id \r\nAND srl.srl_line = 1\r\nAND not exists (select * from sil where sil.srh_id = srl.srh_id and sil.srl_id = srl.srl_id)\r\n', 'AND srh.bra_id = ? ORDER BY 1', 'AND srh.cpy_id = ? ORDER BY 1', 12, 13, 0, 0),
(97, 'PO Invoice In Progress', 'SELECT count(*) cnt\r\nFROM sih \r\nWHERE sih.sih_acc_status = 0  \r\nAND sih.sih_inv_status = 0', 'AND sih.bra_id = ? ORDER BY 1', 'AND sih.cpy_id = ? ORDER BY 1', 11, 14, 16, 98),
(98, 'PO Invoices In Progress', 'SELET sih.sih_doc_id, sih.sih_inv_id, sih.sih_d_inv, sih.spp_id, sih.sih_matchname, sih.bra_id, sih.dpr_id, sih.sih_total_local \r\nFROM sih \r\nWHERE sih.sih_acc_status = 0  \r\nAND sih.sih_inv_status = 0', 'AND sih.bra_id = ? ORDER BY 1', 'AND sih.cpy_id = ? ORDER BY 1', 12, 14, 0, 0),
(99, 'PO Invoices with Date &gt; Today', 'select count(*) cnt from sih, sid where sih_d_inv > current and sih.sih_id = sid.sih_id\r\n', 'and sih.bra_id = ?', 'and sih.cpy_id = ?', 11, 15, 0, 100),
(100, 'PO Invoices with Date &gt; Today', 'select spp_id, sih_matchname, bra_id, dpr_id, sih_doc_id, sih_d_inv, sid_d_due from sih, sid where sih_d_inv > current and sih.sih_id = sid.sih_id', 'and sih.bra_id = ? order by bra_id, dpr_id', 'and sih.cpy_id = ? order by bra_id, dpr_id', 12, 15, 0, 0),
(101, 'x', 'x', 'x', 'x', 0, 0, 0, 0),
(102, 'x', 'x', 'x', 'x', 0, 0, 0, 0),
(103, 'x', 'x', 'x', 'x', 0, 0, 0, 0),
(104, 'x', 'x', 'x', 'x', 0, 0, 0, 0),
(105, 'x', 'x', 'x', 'x', 0, 0, 0, 0),
(106, 'x', 'x', 'x', 'x', 0, 0, 0, 0),
(107, 'x', 'x', 'x', 'x', 0, 0, 0, 0);

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
-- Table structure for table `idb_temp`
--

CREATE TABLE IF NOT EXISTS `idb_temp` (
  `char1` varchar(20) COLLATE utf8_bin NOT NULL,
  `char2` varchar(20) COLLATE utf8_bin NOT NULL,
  `char3` varchar(20) COLLATE utf8_bin NOT NULL,
  `char4` varchar(20) COLLATE utf8_bin NOT NULL,
  `val1` decimal(6,2) NOT NULL,
  `val2` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `idb_temp`
--

INSERT INTO `idb_temp` (`char1`, `char2`, `char3`, `char4`, `val1`, `val2`) VALUES
('Birmingham     ', 'Service        ', '201409', 'Vernon  Adam', '41.00', '41.00'),
('Birmingham     ', 'Service        ', '201501', 'Hill  Ian', '184.17', '152.75'),
('Hebburn        ', 'Service        ', '201410', 'Green  Kenneth', '4.50', '4.50'),
('Warrington     ', 'Service        ', '201410', 'Green  Kenneth', '226.67', '179.75'),
('Warrington     ', 'Service        ', '201411', 'Green  Kenneth', '163.67', '118.25'),
('Northampton    ', 'Service        ', '201409', 'Barraclough  Dean', '11.00', '11.00'),
('Northampton    ', 'Service        ', '201409', 'Hill  Ian', '28.50', '28.50'),
('Northampton    ', 'Service        ', '201411', 'Hill  Ian', '38.17', '34.75'),
('Hoddesdon      ', 'Service        ', '201502', 'Eden  Jason Van', '5.67', '5.75'),
('Hoddesdon      ', 'Service        ', '201410', 'McNulty  Kevin', '4.67', '4.75'),
('Hoddesdon      ', 'Service        ', '201410', 'Blanchard  Paul', '6.67', '6.75'),
('Hoddesdon      ', 'Service        ', '201410', 'Ripley  Paul', '19.67', '19.75'),
('Reading        ', 'Service        ', '201502', 'Barraclough  Dean', '5.00', '5.00'),
('Reading        ', 'Service        ', '201502', 'Eden  Jason Van', '189.67', '161.25'),
('Reading        ', 'Service        ', '201502', 'Blanchard  Paul', '176.67', '161.97'),
('Reading        ', 'Service        ', '201412', 'Ripley  Paul', '3.67', '1.75'),
('Wrotham        ', 'Service        ', '201412', 'Blanchard  Paul', '43.67', '43.75'),
('Wrotham        ', 'Service        ', '201412', 'Dodkins  Roland', '8.00', '8.00'),
('Bristol        ', 'Service        ', '201501', 'Hall  Alan', '36.83', '36.95'),
('Bristol        ', 'Service        ', '201410', 'Brooks  Matthew', '205.50', '183.00'),
('Okehampton     ', 'Service        ', '201410', 'Hall  Alan', '190.67', '171.75'),
('Okehampton     ', 'Service        ', '201412', 'Thompson  Steven', '196.50', '181.50'),
('Hebburn        ', 'Production     ', '201502', 'Rix  Darren', '139.50', '130.50'),
('Hebburn        ', 'Production     ', '201409', 'Short  Dean', '11.67', '8.50'),
('Hebburn        ', 'Production     ', '201501', 'Allan  Liam', '176.17', '174.50'),
('Hebburn        ', 'Production     ', '201412', 'Hibbert  Michael', '135.83', '123.20'),
('Hebburn        ', 'Production     ', '201410', 'Marshall  Stephen', '64.50', '0.00'),
('Hebburn        ', 'Production     ', '201411', 'Patterson  Shaun', '162.50', '154.50'),
('Birmingham     ', 'Service        ', '201412', 'Appleton  Ian', '7.50', '6.00'),
('Birmingham     ', 'Service        ', '201411', 'Vernon  Adam', '244.00', '226.00'),
('Birmingham     ', 'Service        ', '201412', 'Vernon  Adam', '198.00', '147.50'),
('Birmingham     ', 'Service        ', '201412', 'Hainsworth  Damien', '41.17', '41.25'),
('Birmingham     ', 'Service        ', '201412', 'Hill  Ian', '178.67', '154.00'),
('Hebburn        ', 'Service        ', '201410', 'Hall  Alan', '9.50', '8.00'),
('Hebburn        ', 'Service        ', '201501', 'Wallace  Gary', '38.50', '34.75'),
('Hebburn        ', 'Service        ', '201412', 'Brooks  Matthew', '0.17', '0.00'),
('Hebburn        ', 'Service        ', '201411', 'Calver  Stuart', '9.00', '9.00'),
('Warrington     ', 'Service        ', '201502', 'Appleton  Ian', '144.00', '36.75'),
('Warrington     ', 'Service        ', '201412', 'Green  Kenneth', '157.00', '110.00'),
('Northampton    ', 'Service        ', '201410', 'Barraclough  Dean', '16.50', '15.00'),
('Northampton    ', 'Service        ', '201410', 'Beville  Stephen', '6.00', '6.00'),
('Hoddesdon      ', 'Service        ', '201409', 'Calver  Stuart', '23.50', '23.25'),
('Hoddesdon      ', 'Service        ', '201410', 'Calver  Stuart', '252.50', '205.50'),
('Wrotham        ', 'Service        ', '201502', 'Ripley  Paul', '238.00', '237.00'),
('Wrotham        ', 'Service        ', '201502', 'Calver  Stuart', '8.17', '8.25'),
('Bristol        ', 'Service        ', '201409', 'Hainsworth  Damien', '5.50', '5.50'),
('Bristol        ', 'Service        ', '201502', 'Brooks  Matthew', '152.67', '125.50'),
('Bristol        ', 'Service        ', '201410', 'Raddenbury  Mark', '62.67', '62.75'),
('Bristol        ', 'Service        ', '201412', 'Raddenbury  Mark', '25.50', '21.00'),
('Okehampton     ', 'Service        ', '201411', 'White  Jeff', '204.17', '155.25'),
('Okehampton     ', 'Service        ', '201502', 'Thompson  Steven', '168.50', '120.50'),
('Swansea        ', 'Service        ', '201411', 'Raddenbury  Mark', '172.67', '152.25'),
('Swansea        ', 'Service        ', '201502', 'Raddenbury  Mark', '152.17', '123.25'),
('Hebburn        ', 'Production     ', '201412', 'Charlton  Adam', '136.00', '56.50'),
('Hebburn        ', 'Production     ', '201501', 'Charlton  Adam', '128.00', '84.25'),
('Hebburn        ', 'Production     ', '201412', 'Milner  Benjamin', '136.00', '91.75'),
('Hebburn        ', 'Production     ', '201501', 'Milner  Benjamin', '158.00', '78.00'),
('Hebburn        ', 'Production     ', '201501', 'Hainsworth  Damien', '7.00', '7.00'),
('Hebburn        ', 'Production     ', '201412', 'Jenkins  Daniel', '120.00', '104.00'),
('Hebburn        ', 'Production     ', '201501', 'Jenkins  Daniel', '168.00', '146.75'),
('Hebburn        ', 'Production     ', '201411', 'Nolan  Daniel', '160.00', '86.50'),
('Hebburn        ', 'Production     ', '201411', 'Rix  Darren', '162.00', '156.50'),
('Hebburn        ', 'Production     ', '201502', 'Robinson  David', '48.00', '0.00'),
('Hebburn        ', 'Production     ', '201411', 'Short  Dean', '113.00', '45.00'),
('Hebburn        ', 'Production     ', '201412', 'Allan  Liam', '120.00', '31.00'),
('Hebburn        ', 'Production     ', '201501', 'Pilcher  Maurice', '149.00', '0.00'),
('Hebburn        ', 'Production     ', '201502', 'Pilcher  Maurice', '54.50', '0.00'),
('Hebburn        ', 'Production     ', '201410', 'Patterson  Shaun', '176.00', '163.25'),
('Hebburn        ', 'Production     ', '201502', 'Patterson  Shaun', '171.67', '163.75'),
('Hebburn        ', 'Production     ', '201501', 'Smith  Steven', '171.00', '158.75'),
('Hebburn        ', 'Production     ', '201502', 'Rowland  Trevor', '145.00', '145.00'),
('Birmingham     ', 'Service        ', '201410', 'Hainsworth  Damien', '13.50', '13.50'),
('Birmingham     ', 'Service        ', '201411', 'Hill  Ian', '149.17', '142.50'),
('Birmingham     ', 'Service        ', '201501', 'White  Jeff', '8.17', '5.00'),
('Birmingham     ', 'Service        ', '201412', 'Green  Kenneth', '8.00', '7.50'),
('Birmingham     ', 'Service        ', '201501', 'Beville  Stephen', '233.50', '214.00'),
('Hebburn        ', 'Service        ', '201411', 'Appleton  Ian', '7.67', '7.75'),
('Hebburn        ', 'Service        ', '201409', 'Hainsworth  Damien', '10.00', '8.00'),
('Hebburn        ', 'Service        ', '201411', 'Green  Kenneth', '17.50', '17.00'),
('Warrington     ', 'Service        ', '201411', 'Appleton  Ian', '183.67', '172.25'),
('Hoddesdon      ', 'Service        ', '201412', 'Blanchard  Paul', '41.00', '41.00'),
('Hoddesdon      ', 'Service        ', '201502', 'Blanchard  Paul', '1.50', '1.50'),
('Hoddesdon      ', 'Service        ', '201409', 'Ripley  Paul', '5.17', '5.25'),
('Hoddesdon      ', 'Service        ', '201501', 'Ripley  Paul', '5.50', '5.50'),
('Hoddesdon      ', 'Service        ', '201501', 'Calver  Stuart', '218.50', '199.50'),
('Hoddesdon      ', 'Service        ', '201410', 'Aldridge  William', '19.67', '19.75'),
('Reading        ', 'Service        ', '201410', 'White  Jeff', '2.00', '0.00'),
('Reading        ', 'Service        ', '201411', 'Brooks  Matthew', '18.67', '18.75'),
('Reading        ', 'Service        ', '201409', 'Ripley  Paul', '10.00', '9.75'),
('Reading        ', 'Service        ', '201412', 'Dodkins  Roland', '157.17', '138.25'),
('Reading        ', 'Service        ', '201410', 'Calver  Stuart', '6.17', '4.75'),
('Reading        ', 'Service        ', '201409', 'Aldridge  William', '25.50', '9.75'),
('Wrotham        ', 'Service        ', '201412', 'Calver  Stuart', '3.50', '3.50'),
('Bristol        ', 'Service        ', '201410', 'Hall  Alan', '41.67', '41.75'),
('Bristol        ', 'Service        ', '201411', 'Hall  Alan', '30.00', '29.00'),
('Bristol        ', 'Service        ', '201409', 'Raddenbury  Mark', '12.00', '11.00'),
('Bristol        ', 'Service        ', '201501', 'Aldridge  William', '0.67', '0.75'),
('Okehampton     ', 'Service        ', '201411', 'Hainsworth  Damien', '8.67', '6.25'),
('Okehampton     ', 'Service        ', '201501', 'White  Jeff', '177.50', '112.50'),
('Okehampton     ', 'Service        ', '201502', 'Green  Kenneth', '3.00', '3.00'),
('Swansea        ', 'Service        ', '201501', 'Raddenbury  Mark', '201.00', '158.00'),
('Glasgow        ', 'Service        ', '201502', 'Hainsworth  Damien', '24.00', '24.00'),
('Hebburn        ', 'Production     ', '201412', 'Gales  Alex', '80.00', '77.75'),
('Hebburn        ', 'Production     ', '201410', 'Robinson  David', '24.00', '0.00'),
('Hebburn        ', 'Production     ', '201502', 'Short  Dean', '142.00', '91.75'),
('Hebburn        ', 'Production     ', '201410', 'Hibbert  Michael', '184.00', '142.75'),
('Birmingham     ', 'Service        ', '201502', 'Vernon  Adam', '158.00', '122.50'),
('Birmingham     ', 'Service        ', '201412', 'Barraclough  Dean', '188.00', '164.00'),
('Birmingham     ', 'Service        ', '201412', 'Aldridge  William', '8.17', '8.25'),
('Hebburn        ', 'Service        ', '201410', 'Patterson  Shaun', '4.17', '4.25'),
('Warrington     ', 'Service        ', '201412', 'Vernon  Adam', '5.50', '5.50'),
('Warrington     ', 'Service        ', '201501', 'Green  Kenneth', '179.17', '158.25'),
('Reading        ', 'Service        ', '201411', 'Dodkins  Roland', '189.50', '166.50'),
('Reading        ', 'Service        ', '201411', 'Calver  Stuart', '30.17', '28.50'),
('Okehampton     ', 'Service        ', '201409', 'Hall  Alan', '27.17', '19.25'),
('Swansea        ', 'Service        ', '201501', 'Hall  Alan', '6.17', '6.25'),
('Swansea        ', 'Service        ', '201502', 'Brooks  Matthew', '6.50', '6.50'),
('Glasgow        ', 'Service        ', '201501', 'Hainsworth  Damien', '5.00', '5.00'),
('Hebburn        ', 'Production     ', '201410', 'Jenkins  Daniel', '180.67', '76.25'),
('Hebburn        ', 'Production     ', '201501', 'Edwards  Gary', '91.00', '87.75'),
('Hebburn        ', 'Production     ', '201411', 'Hibbert  Michael', '160.00', '138.25'),
('Hebburn        ', 'Production     ', '201410', 'Burke  Patrick', '184.00', '149.50'),
('Hebburn        ', 'Production     ', '201501', 'Burke  Patrick', '178.00', '173.00'),
('Hebburn        ', 'Production     ', '201409', 'Richardson  Paul', '16.00', '16.00'),
('Hebburn        ', 'Production     ', '201411', 'Richardson  Paul', '126.00', '125.25'),
('Hebburn        ', 'Production     ', '201409', 'Stott  Peter', '16.00', '16.00'),
('Hebburn        ', 'Production     ', '201411', 'Chilton  Russell', '160.00', '113.50'),
('Hebburn        ', 'Production     ', '201409', 'Marshall  Stephen', '19.50', '0.00'),
('Hebburn        ', 'Production     ', '201409', 'Smith  Steven', '16.00', '16.00'),
('Birmingham     ', 'Service        ', '201411', 'Barraclough  Dean', '208.00', '166.50'),
('Birmingham     ', 'Service        ', '201409', 'Hainsworth  Damien', '5.00', '5.00'),
('Birmingham     ', 'Service        ', '201501', 'Aldridge  William', '2.00', '2.00'),
('Hebburn        ', 'Service        ', '201410', 'Hainsworth  Damien', '184.17', '111.25'),
('Hebburn        ', 'Service        ', '201411', 'Hainsworth  Damien', '192.50', '127.25'),
('Warrington     ', 'Service        ', '201502', 'Hainsworth  Damien', '4.17', '4.25'),
('Warrington     ', 'Service        ', '201412', 'Wallace  Gary', '21.17', '16.25'),
('Northampton    ', 'Service        ', '201410', 'Hill  Ian', '215.00', '198.50'),
('Hoddesdon      ', 'Service        ', '201501', 'Hainsworth  Damien', '3.17', '3.25'),
('Hoddesdon      ', 'Service        ', '201502', 'McNulty  Kevin', '18.50', '18.50'),
('Hoddesdon      ', 'Service        ', '201501', 'Dodkins  Roland', '9.50', '9.50'),
('Hoddesdon      ', 'Service        ', '201502', 'Calver  Stuart', '146.00', '107.50'),
('Reading        ', 'Service        ', '201410', 'McNulty  Kevin', '235.17', '154.75'),
('Reading        ', 'Service        ', '201410', 'Brooks  Matthew', '5.50', '5.50'),
('Reading        ', 'Service        ', '201501', 'Calver  Stuart', '18.00', '14.25'),
('Wrotham        ', 'Service        ', '201409', 'Ripley  Paul', '30.50', '30.50'),
('Wrotham        ', 'Service        ', '201410', 'Ripley  Paul', '273.50', '251.00'),
('Wrotham        ', 'Service        ', '201410', 'Calver  Stuart', '8.17', '5.50'),
('Bristol        ', 'Service        ', '201410', 'White  Jeff', '11.67', '3.75'),
('Okehampton     ', 'Service        ', '201501', 'Hall  Alan', '167.67', '142.25'),
('Okehampton     ', 'Service        ', '201502', 'Hall  Alan', '140.67', '121.25'),
('Okehampton     ', 'Service        ', '201409', 'White  Jeff', '32.00', '28.00'),
('Okehampton     ', 'Service        ', '201409', 'Thompson  Steven', '23.50', '20.75'),
('Swansea        ', 'Service        ', '201412', 'Raddenbury  Mark', '143.67', '99.00'),
('Glasgow        ', 'Service        ', '201412', 'Wallace  Gary', '175.00', '116.25'),
('Hebburn        ', 'Production     ', '201409', 'Charlton  Adam', '11.17', '8.25'),
('Hebburn        ', 'Production     ', '201411', 'Charlton  Adam', '158.17', '44.25'),
('Hebburn        ', 'Production     ', '201409', 'Gales  Alex', '16.00', '16.00'),
('Hebburn        ', 'Production     ', '201409', 'Milner  Benjamin', '16.00', '16.00'),
('Hebburn        ', 'Production     ', '201409', 'Jenkins  Daniel', '16.00', '1.50'),
('Hebburn        ', 'Production     ', '201409', 'Nolan  Daniel', '8.00', '8.00'),
('Hebburn        ', 'Production     ', '201409', 'Rix  Darren', '12.17', '12.25'),
('Hebburn        ', 'Production     ', '201502', 'Hibbert  Michael', '162.00', '140.75'),
('Hebburn        ', 'Production     ', '201412', 'Stott  Peter', '136.00', '115.00'),
('Hebburn        ', 'Production     ', '201412', 'Patterson  Shaun', '136.00', '128.00'),
('Birmingham     ', 'Service        ', '201410', 'Barraclough  Dean', '222.50', '203.00'),
('Hebburn        ', 'Service        ', '201412', 'Appleton  Ian', '2.67', '2.75'),
('Hebburn        ', 'Service        ', '201502', 'Hainsworth  Damien', '152.17', '141.50'),
('Warrington     ', 'Service        ', '201409', 'Appleton  Ian', '32.17', '20.75'),
('Warrington     ', 'Service        ', '201502', 'Wallace  Gary', '36.67', '33.75'),
('Hoddesdon      ', 'Service        ', '201410', 'Dodkins  Roland', '9.00', '9.00'),
('Hoddesdon      ', 'Service        ', '201411', 'Calver  Stuart', '185.00', '173.50'),
('Hoddesdon      ', 'Service        ', '201502', 'Aldridge  William', '5.00', '5.00'),
('Reading        ', 'Service        ', '201411', 'McNulty  Kevin', '231.00', '201.25'),
('Reading        ', 'Service        ', '201409', 'Blanchard  Paul', '34.00', '34.00'),
('Reading        ', 'Service        ', '201502', 'Ripley  Paul', '6.17', '6.25'),
('Reading        ', 'Service        ', '201501', 'Dodkins  Roland', '164.00', '125.50'),
('Reading        ', 'Service        ', '201409', 'Calver  Stuart', '5.17', '5.25'),
('Reading        ', 'Service        ', '201501', 'Aldridge  William', '185.67', '160.25'),
('Wrotham        ', 'Service        ', '201501', 'Eden  Jason Van', '22.00', '9.00'),
('Wrotham        ', 'Service        ', '201410', 'Raddenbury  Mark', '9.50', '0.00'),
('Wrotham        ', 'Service        ', '201411', 'Blanchard  Paul', '2.00', '2.00'),
('Wrotham        ', 'Service        ', '201411', 'Ripley  Paul', '315.17', '288.25'),
('Wrotham        ', 'Service        ', '201411', 'Dodkins  Roland', '8.50', '8.50'),
('Bristol        ', 'Service        ', '201412', 'Brooks  Matthew', '124.50', '56.00'),
('Bristol        ', 'Service        ', '201411', 'Raddenbury  Mark', '28.50', '27.50'),
('Bristol        ', 'Service        ', '201501', 'Raddenbury  Mark', '7.50', '4.50'),
('Okehampton     ', 'Service        ', '201412', 'White  Jeff', '161.50', '109.75'),
('Okehampton     ', 'Service        ', '201502', 'Calver  Stuart', '2.67', '2.75'),
('Okehampton     ', 'Service        ', '201411', 'Thompson  Steven', '220.17', '213.50'),
('Glasgow        ', 'Service        ', '201502', 'Wallace  Gary', '188.50', '174.25'),
('Hebburn        ', 'Production     ', '201410', 'Gales  Alex', '177.00', '112.75'),
('Hebburn        ', 'Production     ', '201412', 'Nolan  Daniel', '136.00', '0.00'),
('Hebburn        ', 'Production     ', '201501', 'Nolan  Daniel', '169.00', '149.50'),
('Hebburn        ', 'Production     ', '201409', 'Allan  Liam', '16.00', '15.25'),
('Hebburn        ', 'Production     ', '201502', 'Lakey jr  Les', '60.17', '23.25'),
('Hebburn        ', 'Production     ', '201411', 'Pilcher  Maurice', '125.00', '0.00'),
('Hebburn        ', 'Production     ', '201412', 'Raddenbury  Mark', '10.50', '10.50'),
('Hebburn        ', 'Production     ', '201409', 'Chilton  Russell', '10.67', '10.75'),
('Hebburn        ', 'Production     ', '201501', 'Chilton  Russell', '177.00', '167.50'),
('Birmingham     ', 'Service        ', '201410', 'Beville  Stephen', '232.50', '201.50'),
('Hebburn        ', 'Service        ', '201501', 'Hainsworth  Damien', '197.00', '158.50'),
('Hebburn        ', 'Service        ', '201410', 'Blanchard  Paul', '4.17', '4.25'),
('Hoddesdon      ', 'Service        ', '201501', 'McNulty  Kevin', '111.67', '102.75'),
('Hoddesdon      ', 'Service        ', '201412', 'McNulty  Kevin', '49.17', '48.25'),
('Hoddesdon      ', 'Service        ', '201412', 'Ripley  Paul', '5.17', '3.00'),
('Hoddesdon      ', 'Service        ', '201409', 'Thompson  Steven', '1.50', '1.50'),
('Hoddesdon      ', 'Service        ', '201501', 'Aldridge  William', '25.17', '25.25'),
('Reading        ', 'Service        ', '201411', 'Hainsworth  Damien', '3.17', '3.25'),
('Reading        ', 'Service        ', '201502', 'McNulty  Kevin', '158.00', '114.00'),
('Reading        ', 'Service        ', '201411', 'Aldridge  William', '210.17', '197.25'),
('Wrotham        ', 'Service        ', '201412', 'Ripley  Paul', '240.17', '207.00'),
('Okehampton     ', 'Service        ', '201411', 'Hall  Alan', '190.67', '190.75'),
('Okehampton     ', 'Service        ', '201412', 'Hall  Alan', '190.67', '135.75'),
('Glasgow        ', 'Service        ', '201411', 'Wallace  Gary', '207.17', '127.25'),
('Glasgow        ', 'Service        ', '201501', 'Wallace  Gary', '199.67', '155.25'),
('Hebburn        ', 'Production     ', '201411', 'Milner  Benjamin', '160.00', '138.00'),
('Hebburn        ', 'Production     ', '201501', 'Rix  Darren', '167.67', '166.75'),
('Hebburn        ', 'Production     ', '201501', 'Short  Dean', '166.00', '135.75'),
('Hebburn        ', 'Production     ', '201410', 'Allan  Liam', '195.67', '158.75'),
('Hebburn        ', 'Production     ', '201409', 'Hibbert  Michael', '8.00', '8.00'),
('Hebburn        ', 'Production     ', '201502', 'Burke  Patrick', '154.00', '146.00'),
('Hebburn        ', 'Production     ', '201409', 'Patterson  Shaun', '16.00', '16.00'),
('Hebburn        ', 'Production     ', '201502', 'Smith  Steven', '145.17', '145.25'),
('Hebburn        ', 'Production     ', '201411', 'Rowland  Trevor', '160.00', '155.75'),
('Birmingham     ', 'Service        ', '201501', 'Charlton  Adam', '8.50', '8.50'),
('Birmingham     ', 'Service        ', '201411', 'Appleton  Ian', '23.00', '23.00'),
('Hebburn        ', 'Service        ', '201501', 'Green  Kenneth', '6.00', '6.00'),
('Warrington     ', 'Service        ', '201410', 'Appleton  Ian', '230.50', '186.75'),
('Warrington     ', 'Service        ', '201501', 'Appleton  Ian', '165.00', '109.75'),
('Warrington     ', 'Service        ', '201410', 'Hainsworth  Damien', '25.67', '23.75'),
('Warrington     ', 'Service        ', '201410', 'Beville  Stephen', '5.50', '5.50'),
('Hoddesdon      ', 'Service        ', '201501', 'Eden  Jason Van', '7.17', '7.25'),
('Hoddesdon      ', 'Service        ', '201411', 'McNulty  Kevin', '7.50', '7.50'),
('Reading        ', 'Service        ', '201412', 'Brooks  Matthew', '5.50', '5.50'),
('Reading        ', 'Service        ', '201412', 'Blanchard  Paul', '151.00', '127.50'),
('Reading        ', 'Service        ', '201410', 'Ripley  Paul', '14.50', '6.50'),
('Reading        ', 'Service        ', '201412', 'Aldridge  William', '181.50', '151.75'),
('Wrotham        ', 'Service        ', '201501', 'Blanchard  Paul', '28.50', '28.50'),
('Wrotham        ', 'Service        ', '201502', 'Blanchard  Paul', '31.67', '31.73'),
('Wrotham        ', 'Service        ', '201501', 'Dodkins  Roland', '10.17', '10.25'),
('Bristol        ', 'Service        ', '201412', 'White  Jeff', '20.67', '16.25'),
('Bristol        ', 'Service        ', '201409', 'Brooks  Matthew', '18.17', '13.00'),
('Bristol        ', 'Service        ', '201501', 'Brooks  Matthew', '160.50', '143.50'),
('Okehampton     ', 'Service        ', '201411', 'Calver  Stuart', '2.67', '2.75'),
('Glasgow        ', 'Service        ', '201410', 'Wallace  Gary', '255.50', '227.53'),
('Hebburn        ', 'Production     ', '201502', 'Charlton  Adam', '154.17', '112.67'),
('Hebburn        ', 'Production     ', '201502', 'Milner  Benjamin', '138.00', '115.00'),
('Hebburn        ', 'Production     ', '201501', 'Hibbert  Michael', '185.00', '157.75'),
('Hebburn        ', 'Production     ', '201409', 'Fulton  Ryan', '16.00', '14.50'),
('Hebburn        ', 'Production     ', '201412', 'Smith  Steven', '136.00', '118.00'),
('Hebburn        ', 'Production     ', '201410', 'Rowland  Trevor', '164.17', '124.25'),
('Birmingham     ', 'Service        ', '201409', 'Barraclough  Dean', '24.17', '23.75'),
('Birmingham     ', 'Service        ', '201502', 'Hickman  Mark', '79.17', '32.50'),
('Birmingham     ', 'Service        ', '201409', 'Beville  Stephen', '16.00', '0.00'),
('Birmingham     ', 'Service        ', '201502', 'Beville  Stephen', '199.00', '194.00'),
('Hebburn        ', 'Service        ', '201502', 'Green  Kenneth', '14.00', '13.00'),
('Hoddesdon      ', 'Service        ', '201502', 'Ripley  Paul', '5.00', '5.00'),
('Reading        ', 'Service        ', '201501', 'McNulty  Kevin', '124.50', '115.00'),
('Reading        ', 'Service        ', '201411', 'Blanchard  Paul', '236.00', '221.25'),
('Reading        ', 'Service        ', '201502', 'Dodkins  Roland', '161.50', '156.00'),
('Reading        ', 'Service        ', '201410', 'Aldridge  William', '206.67', '137.00'),
('Bristol        ', 'Service        ', '201502', 'Hall  Alan', '50.17', '50.25'),
('Bristol        ', 'Service        ', '201502', 'White  Jeff', '23.50', '16.75'),
('Bristol        ', 'Service        ', '201411', 'Brooks  Matthew', '164.50', '124.50'),
('Bristol        ', 'Service        ', '201502', 'Raddenbury  Mark', '19.00', '17.00'),
('Okehampton     ', 'Service        ', '201410', 'White  Jeff', '202.17', '121.25'),
('Swansea        ', 'Service        ', '201410', 'Raddenbury  Mark', '148.50', '115.50'),
('Glasgow        ', 'Service        ', '201409', 'Wallace  Gary', '37.00', '26.25'),
('Hebburn        ', 'Production     ', '201410', 'Charlton  Adam', '200.17', '157.50'),
('Hebburn        ', 'Production     ', '201501', 'Gales  Alex', '189.67', '186.50'),
('Hebburn        ', 'Production     ', '201411', 'Jenkins  Daniel', '160.00', '96.00'),
('Hebburn        ', 'Production     ', '201410', 'Nolan  Daniel', '183.67', '163.75'),
('Hebburn        ', 'Production     ', '201412', 'Rix  Darren', '136.00', '127.00'),
('Hebburn        ', 'Production     ', '201410', 'Short  Dean', '193.00', '130.75'),
('Hebburn        ', 'Production     ', '201412', 'Short  Dean', '96.00', '11.50'),
('Hebburn        ', 'Production     ', '201410', 'Edwards  Gary', '7.50', '3.75'),
('Hebburn        ', 'Production     ', '201501', 'Lakey jr  Les', '92.50', '54.50'),
('Hebburn        ', 'Production     ', '201409', 'Pilcher  Maurice', '8.00', '8.00'),
('Hebburn        ', 'Production     ', '201502', 'Birch  Nicholas', '155.00', '0.00'),
('Hebburn        ', 'Production     ', '201409', 'Burke  Patrick', '16.00', '14.25'),
('Hebburn        ', 'Production     ', '201411', 'Burke  Patrick', '120.00', '98.00'),
('Hebburn        ', 'Production     ', '201412', 'Burke  Patrick', '120.00', '109.50'),
('Hebburn        ', 'Production     ', '201501', 'Stott  Peter', '172.00', '164.00'),
('Hebburn        ', 'Production     ', '201412', 'Chilton  Russell', '136.00', '125.75'),
('Hebburn        ', 'Production     ', '201410', 'Fulton  Ryan', '184.00', '178.25'),
('Hebburn        ', 'Production     ', '201411', 'Smith  Steven', '160.00', '150.25'),
('Birmingham     ', 'Service        ', '201502', 'Charlton  Adam', '8.00', '0.00'),
('Birmingham     ', 'Service        ', '201410', 'Vernon  Adam', '251.33', '225.83'),
('Birmingham     ', 'Service        ', '201501', 'Vernon  Adam', '221.00', '207.75'),
('Birmingham     ', 'Service        ', '201502', 'Barraclough  Dean', '163.50', '151.00'),
('Birmingham     ', 'Service        ', '201410', 'Hill  Ian', '7.17', '7.25'),
('Birmingham     ', 'Service        ', '201502', 'Hill  Ian', '160.83', '145.73'),
('Birmingham     ', 'Service        ', '201411', 'Beville  Stephen', '225.00', '189.50'),
('Birmingham     ', 'Service        ', '201412', 'Calver  Stuart', '3.50', '3.50'),
('Hebburn        ', 'Service        ', '201502', 'Barraclough  Dean', '10.50', '10.50'),
('Warrington     ', 'Service        ', '201412', 'Appleton  Ian', '183.00', '159.00'),
('Warrington     ', 'Service        ', '201412', 'Hainsworth  Damien', '4.67', '4.75'),
('Warrington     ', 'Service        ', '201410', 'Wallace  Gary', '11.67', '11.75'),
('Warrington     ', 'Service        ', '201409', 'Green  Kenneth', '28.50', '28.50'),
('Northampton    ', 'Service        ', '201412', 'Hill  Ian', '5.50', '5.50'),
('Hoddesdon      ', 'Service        ', '201411', 'Blanchard  Paul', '37.00', '37.00'),
('Hoddesdon      ', 'Service        ', '201501', 'Blanchard  Paul', '45.67', '45.25'),
('Hoddesdon      ', 'Service        ', '201412', 'Calver  Stuart', '174.50', '165.00'),
('Reading        ', 'Service        ', '201409', 'McNulty  Kevin', '31.00', '27.75'),
('Reading        ', 'Service        ', '201412', 'McNulty  Kevin', '160.67', '114.75'),
('Reading        ', 'Service        ', '201501', 'Blanchard  Paul', '186.00', '179.25'),
('Reading        ', 'Service        ', '201409', 'Dodkins  Roland', '27.17', '27.25'),
('Reading        ', 'Service        ', '201502', 'Aldridge  William', '186.50', '172.50'),
('Wrotham        ', 'Service        ', '201411', 'Calver  Stuart', '60.50', '60.50'),
('Wrotham        ', 'Service        ', '201501', 'Calver  Stuart', '5.00', '5.00'),
('Okehampton     ', 'Service        ', '201410', 'Brooks  Matthew', '14.17', '14.25'),
('Okehampton     ', 'Service        ', '201410', 'Calver  Stuart', '3.50', '2.50'),
('Okehampton     ', 'Service        ', '201501', 'Thompson  Steven', '211.67', '201.25'),
('Swansea        ', 'Service        ', '201501', 'Brooks  Matthew', '43.00', '43.00'),
('Swansea        ', 'Service        ', '201501', 'Aldridge  William', '4.67', '4.75'),
('Hebburn        ', 'Production     ', '201411', 'Gales  Alex', '160.00', '154.75'),
('Hebburn        ', 'Production     ', '201502', 'Jenkins  Daniel', '162.00', '162.00'),
('Hebburn        ', 'Production     ', '201502', 'Nolan  Daniel', '149.00', '131.25'),
('Hebburn        ', 'Production     ', '201501', 'Robinson  David', '92.17', '0.00'),
('Hebburn        ', 'Production     ', '201502', 'Edwards  Gary', '46.00', '43.75'),
('Hebburn        ', 'Production     ', '201410', 'Pilcher  Maurice', '184.50', '64.00'),
('Hebburn        ', 'Production     ', '201412', 'Pilcher  Maurice', '136.00', '0.00'),
('Hebburn        ', 'Production     ', '201501', 'Birch  Nicholas', '107.17', '0.00'),
('Hebburn        ', 'Production     ', '201410', 'Richardson  Paul', '184.00', '140.50'),
('Hebburn        ', 'Production     ', '201412', 'Richardson  Paul', '136.00', '101.50'),
('Hebburn        ', 'Production     ', '201501', 'Richardson  Paul', '161.50', '121.75'),
('Hebburn        ', 'Production     ', '201411', 'Stott  Peter', '160.00', '156.75'),
('Hebburn        ', 'Production     ', '201501', 'Patterson  Shaun', '180.50', '172.50'),
('Hebburn        ', 'Production     ', '201410', 'Smith  Steven', '184.00', '156.50'),
('Birmingham     ', 'Service        ', '201501', 'Appleton  Ian', '7.67', '7.75'),
('Birmingham     ', 'Service        ', '201501', 'Barraclough  Dean', '202.50', '174.00'),
('Birmingham     ', 'Service        ', '201412', 'Brooks  Matthew', '42.67', '42.25'),
('Birmingham     ', 'Service        ', '201412', 'Beville  Stephen', '199.50', '184.25'),
('Hebburn        ', 'Service        ', '201412', 'Hainsworth  Damien', '95.50', '42.25'),
('Hebburn        ', 'Service        ', '201410', 'Wallace  Gary', '5.67', '5.75'),
('Hebburn        ', 'Service        ', '201412', 'Wallace  Gary', '39.17', '35.25'),
('Hebburn        ', 'Service        ', '201502', 'Wallace  Gary', '9.50', '3.25'),
('Warrington     ', 'Service        ', '201409', 'Hainsworth  Damien', '18.67', '16.75'),
('Warrington     ', 'Service        ', '201502', 'Green  Kenneth', '156.50', '151.00'),
('Hoddesdon      ', 'Service        ', '201409', 'Blanchard  Paul', '5.67', '5.75'),
('Hoddesdon      ', 'Service        ', '201411', 'Ripley  Paul', '7.00', '7.00'),
('Hoddesdon      ', 'Service        ', '201409', 'Dodkins  Roland', '3.67', '3.75'),
('Hoddesdon      ', 'Service        ', '201412', 'Aldridge  William', '9.17', '9.25'),
('Reading        ', 'Service        ', '201410', 'Hainsworth  Damien', '2.50', '2.50'),
('Reading        ', 'Service        ', '201501', 'Eden  Jason Van', '202.50', '60.25'),
('Reading        ', 'Service        ', '201410', 'Blanchard  Paul', '271.50', '265.75'),
('Reading        ', 'Service        ', '201410', 'Dodkins  Roland', '217.50', '180.50'),
('Reading        ', 'Service        ', '201502', 'Calver  Stuart', '17.50', '13.25'),
('Wrotham        ', 'Service        ', '201502', 'Eden  Jason Van', '13.67', '9.50'),
('Wrotham        ', 'Service        ', '201501', 'Ripley  Paul', '285.67', '270.50'),
('Wrotham        ', 'Service        ', '201502', 'Dodkins  Roland', '6.50', '6.50'),
('Bristol        ', 'Service        ', '201412', 'Hall  Alan', '9.50', '9.50'),
('Bristol        ', 'Service        ', '201502', 'Blanchard  Paul', '11.00', '11.00'),
('Bristol        ', 'Service        ', '201411', 'Aldridge  William', '2.67', '2.75'),
('Okehampton     ', 'Service        ', '201502', 'White  Jeff', '136.50', '105.25'),
('Okehampton     ', 'Service        ', '201410', 'Thompson  Steven', '227.00', '212.50'),
('Swansea        ', 'Service        ', '201409', 'Raddenbury  Mark', '16.50', '15.50'),
('Glasgow        ', 'Service        ', '201410', 'Hainsworth  Damien', '4.67', '4.75'),
('Hebburn        ', 'Production     ', '201502', 'Gales  Alex', '170.00', '168.50'),
('Hebburn        ', 'Production     ', '201410', 'Milner  Benjamin', '184.00', '128.00'),
('Hebburn        ', 'Production     ', '201410', 'Rix  Darren', '176.17', '157.00'),
('Hebburn        ', 'Production     ', '201411', 'Allan  Liam', '80.00', '8.00'),
('Hebburn        ', 'Production     ', '201502', 'Allan  Liam', '167.17', '164.75'),
('Hebburn        ', 'Production     ', '201502', 'Richardson  Paul', '1.00', '1.00'),
('Hebburn        ', 'Production     ', '201410', 'Stott  Peter', '184.00', '157.00'),
('Hebburn        ', 'Production     ', '201502', 'Stott  Peter', '138.00', '138.00'),
('Hebburn        ', 'Production     ', '201410', 'Chilton  Russell', '144.00', '101.00'),
('Hebburn        ', 'Production     ', '201502', 'Chilton  Russell', '143.00', '96.75'),
('Hebburn        ', 'Production     ', '201409', 'Rowland  Trevor', '16.00', '0.00'),
('Hebburn        ', 'Production     ', '201412', 'Rowland  Trevor', '136.00', '131.75'),
('Hebburn        ', 'Production     ', '201501', 'Rowland  Trevor', '168.00', '168.00');

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
-- Table structure for table `idb_test2`
--

CREATE TABLE IF NOT EXISTS `idb_test2` (
  `usr_id` varchar(15) COLLATE utf8_bin NOT NULL,
  `xpf_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `idb_users`
--

CREATE TABLE IF NOT EXISTS `idb_users` (
  `usr_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `usr_login` varchar(10) COLLATE utf8_bin NOT NULL,
  `usr_password` varchar(10) COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `usr_id` (`usr_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Dumping data for table `idb_users`
--

INSERT INTO `idb_users` (`usr_id`, `usr_login`, `usr_password`) VALUES
(1, 'a', 'a');

-- --------------------------------------------------------

--
-- Table structure for table `idb_users1`
--

CREATE TABLE IF NOT EXISTS `idb_users1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) COLLATE utf8_bin NOT NULL,
  `email` varchar(50) COLLATE utf8_bin NOT NULL,
  `password` char(128) COLLATE utf8_bin NOT NULL,
  `salt` char(128) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Dumping data for table `idb_users1`
--

INSERT INTO `idb_users1` (`id`, `username`, `email`, `password`, `salt`) VALUES
(1, 'test_user', 'test@example.com', '00807432eae173f652f2064bdca1b61b290b52d40e429a7d295d76a71084aa96c0233b82f1feac45529e0726559645acaed6f3ae58a286b9f075916ebf66cacc', 'f9aab579fc1b41ed0c44fe4ecdbfcdb4cb99b9023abb241a6db833288f4eea3c02f76e0d35204a8695077dcf81932aa59006423976224be0390395bae152d4ef');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
