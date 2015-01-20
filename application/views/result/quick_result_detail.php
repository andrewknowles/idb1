<div class="container">
<h1> Irium Dashboard - Quick Result Detail</h1>
<?php
require APP . 'libs/table_lib.php';
$headings = (array_keys($_SESSION['detail_result'][0]));
$colcount = 0;
$tbl2 = new HTML_Table('', 'demoTbl2', 1, array('cellpadding'=>1, 'cellspacing'=>0) );
$tbl2->addCaption('', 'cap', array('id'=> 'tblCap') );
$tbl2->addRow();
foreach($headings as $title)
{
	$tbl2->addCell($title,'','header');
	$colcount++;
}

foreach($_SESSION['detail_result'] as $res)
{
	$tbl2->addRow();	
	foreach($res as $x=>$x_value)
	{		
		$tbl2->addCell($x_value);
	}
}

echo $tbl2->display();
		?>

You are in the View: application/views/result/quickResult.php

</div>