<div class="container">
<h1> Irium Dashboard - Query Editor</h1>
<?php

require APP . 'libs/table_lib.php'; 
$tbl2 = new HTML_Table('', 'demoTbl2', 1, array('cellpadding'=>1, 'cellspacing'=>0) );
$tbl2->addCaption('', 'cap', array('id'=> 'tblCap') );
$tbl2->addRow();
$tbl2->addCell('Id','','header');
$tbl2->addCell('Title','','header');
$tbl2->addCell('Query','','header');
$tbl2->addCell('Query2','','header');
$tbl2->addCell('Query3','','header');
$tbl2->addCell('Type','','header');
$tbl2->addCell('Order','','header');
$tbl2->addCell('Link','','header');
$tbl2->addCell('Detail','','header');

foreach ($_SESSION['quick_result'] as $qry)
{
	$id = $qry['qry_id']; 
	$title = $qry['qry_title'];
	$qry1 = $qry['qry_qry']; 
	$qry2 = $qry['qry_qry2'];
	$qry3 = $qry['qry_qry3'];
	$type = $qry['qry_type'];
	$order = $qry['qry_order'];
	$link = $qry['qry_link'];
	$detail = $qry['qry_detail'];

	$tbl2->addRow();
	$pagelink =  '<a href= "'. URL.'query_editor_controller/SelectQueryByNumber/'.$qry['qry_id'].'">'.$qry['qry_id'].'</a>';
	$tbl2->addCell($pagelink);
	$tbl2->addCell($qry['qry_title']);
	$tbl2->addCell($qry['qry_qry']);
	$tbl2->addCell($qry['qry_qry2']);
	$tbl2->addCell($qry['qry_qry3']);
	$tbl2->addCell($qry['qry_type']);
	$tbl2->addCell($qry['qry_order']);
	$tbl2->addCell($qry['qry_link']);
	$tbl2->addCell($qry['qry_detail']);
}
echo $tbl2->display();
		?>

You are in the View: application/views/result/query_edit.php

</div>