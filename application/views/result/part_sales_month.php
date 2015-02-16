<!DOCTYPE HTML>
<html>
<head>
<script type="text/javascript">
function ExportToExcel(mytblId){
       var htmltable= document.getElementById('TableData');
       var html = htmltable.outerHTML;
       window.open('data:application/vnd.ms-excel,' + encodeURIComponent(html));
    }

function goBack() {
    window.history.go(-1)
}
</script>
</head>

<body>
<div class="container">

<h1> Irium Dashboard - <?php echo $_SESSION['qtitle']; ?></h1>
<h3> Company - <?php echo $_SESSION['cpy']; ?> - Branch - <?php echo $_SESSION['bra']; ?> </h3>

<button type="button" style="width:75px; height:25px" onclick="ExportToExcel('TableData');"> EXPORT </button>
<button type="button" style="width:75px; height:25px" onclick="goBack()">BACK</button>

<?php
require APP . 'libs/table_lib.php';
require APP . 'libs/phpChart_Lite/conf.php';
$headings = (array_keys($_SESSION['detail_result'][0]));
$colcount = 0;
$tbl2 = new HTML_Table('TableData', 'demoTbl2', 1, array('cellpadding'=>1, 'cellspacing'=>0) );
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



echo 'You are in the View: application/views/result/part_sales_month.php';
$pc = new C_PhpChartX(array(array(11, 9, 5, 12, 14)),'basic_chart');
$pc->draw();

 
 ?>
 
</div>
</body>
</html>