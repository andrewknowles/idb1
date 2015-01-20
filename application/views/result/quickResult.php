<div class="container">
<h1> Irium Dashboard - Quick Result</h1>
<?php

require APP . 'libs/table_lib.php'; 
$tbl2 = new HTML_Table('', 'demoTbl2', 1, array('cellpadding'=>1, 'cellspacing'=>0) );
$tbl2->addCaption('', 'cap', array('id'=> 'tblCap') );
$tbl2->addRow();
$tbl2->addCell('Issue','','header');
$tbl2->addCell('Result','','header');

//$pagelink = '<a href="quick_status_detail.php?qry='.$result_array1[$x].'">'.$x.'</a>';

$report_links = array();
foreach ($_SESSION['qqueries'] as $qry)
{
	$title = $qry['qry_title'];
	$link = $qry['qry_detail'];
	$report_links[$title]=$link;	
}

//$_SESSION['quick_result'][$title]=$value;


foreach($_SESSION['quick_result'] as $x=>$x_value) {
$tbl2->addRow();
//$pagelink = '<a href= "URL; Data_Display_Controller/RunQueryByNumber('.$_SESSION['quick_result1'][$x].')"';
//$pagelink = '<a href="quick_status_detail.php?qry='.$_SESSION['quick_result1'][$x].'">'.$x.'</a>';
//<a href="<?php echo URL . 'songs/editsong/' . htmlspecialchars($song->id, ENT_QUOTES, 'UTF-8');
$pagelink =  '<a href= "'. URL.'Data_Display_Controller/RunQueryByNumber/'.$_SESSION['quick_result1'][$x].'">'.$x.'</a>';
// . ' Data_Display_Controller/RunQueryByNumber('.$_SESSION['quick_result1'][$x].')"'; 
//echo $pagelink;
//$ak = $x.'-'.$_SESSION['quick_result1'][$x];
$tbl2->addCell($pagelink);
$tbl2->addCell($x_value);
}
echo $tbl2->display();
		?>

You are in the View: application/views/result/quickResult.php

</div>




