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

<button type="button" style="width:75px; height:50px" onclick="ExportToExcel('TableData');"> EXPORT </button>
<button type="button" style="width:75px; height:50px" onclick="goBack()">BACK</button>

<?php
require APP . 'libs/table_lib.php';
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

		?>

You are in the View: application/views/result/quick_result_detail.php

</div>
</body>