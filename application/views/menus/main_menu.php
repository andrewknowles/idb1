<!DOCTYPE html>
<html>
<!--<head>
<script>
function loadXMLDoc()
{
	
var xmlhttp;
xmlhttp=new XMLHttpRequest();
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
    }
  }
window.alert("sometext");
xmlhttp.open("GET","ajax_info.txt",true);
xmlhttp.send();
}
</script>
</head>-->
<head>
<script>
function showUser(str) {
    if (str == "") {
        document.getElementById("txtHint").innerHTML = "";
        return;
    } else { 
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                document.getElementById("txtHint").innerHTML = xmlhttp.responseText;
            }
        }
        xmlhttp.open("GET","getuser.php?q="+str,true);
        xmlhttp.send();
    }
}
</script>
</head>


<body>
<div class="container">
<h1> Irium Dashboard - Main Menu</h1>
<?php 
if (!empty($_SESSION['message']))
{
	echo '<h2>'.$_SESSION['message'].'</h2>';
	unset($_SESSION['message']);
}

?>
<form action="<?php echo URL; ?>MenuChoice_Controller/SelectQuery" method="POST" accept-charset='UTF-8'>

<fieldset >

<select name="company" onchange="getbranch(this.value)">
<option value="">Select a company:</option>
<?php
foreach($_SESSION['companies'] as $x=>$x_value) {?>
<option value="<?php echo "'".$x."'";?>"><?php echo $x_value;?></option>
<?php }?>
</select>

<select name="branch">
<option value="">Select a branch:</option>
<?php
foreach($_SESSION['branches'] as $x=>$x_value) {?>
<option value="<?php echo "'".$x."'";?>"><?php echo $x_value;?></option>
<?php }?>
<option value = 'allbr'>All Branches</option>option>
</select>
</br></br>
<table border="1">
<td>Parts</td>
<td>Service</td>
<td>Unit Sales</td>
<td>Finance</td>
<tr>
<td><input type="radio" name="mainmenuchoice" value="quick" checked>Quick Status Parts</td>
<td><input type="radio" name="mainmenuchoice" value="quicks" checked>Quick Status Service</td>
<td><input type="radio" name="mainmenuchoice" value="b" checked>Quick Status Unit Sales</td>
<td><input type="radio" name="mainmenuchoice" value="quickf" checked>Quick Status Finance</td></tr>
<tr>
<td><input type="radio" name="mainmenuchoice" value="detailp" checked>Detail Reports Parts</td>
<td><input type="radio" name="mainmenuchoice" value="details" checked>Detail Reports Service</td>
<td><input type="radio" name="mainmenuchoice" value="detaile" checked>To define</td>
<td><input type="radio" name="mainmenuchoice" value="detailf" checked>To define</td></tr>
<tr>
<td><input type="radio" name="mainmenuchoice" value="h" checked>Parts Stocks</td>
<td><input type="radio" name="mainmenuchoice" value="wips" checked>Work In Progress</td>
<td><input type="radio" name="mainmenuchoice" value="j" checked>To define</td>
<td><input type="radio" name="mainmenuchoice" value="k" checked>To define</td></tr>
<tr>
<td><input type="radio" name="mainmenuchoice" value="part_sale" checked>Parts Sales</td>
<td><input type="radio" name="mainmenuchoice" value="tech_util" checked>Labour Analysis</td>
<td><input type="radio" name="mainmenuchoice" value="n" checked>To define</td>
<td><input type="radio" name="mainmenuchoice" value="o" checked>To define</td></tr>
</table>

<input type='submit' name='Submit' value='Submit' />

</fieldset>
</form>
<div>
            <button id="javascript-ajax-button">Click here to get the amount of songs via Ajax (will be displayed in #javascript-ajax-result-box)</button>
            <div id="javascript-ajax-result-box"></div>
        </div>
You are in the View: application/views/menus/main_menu.php

</div>
</body>