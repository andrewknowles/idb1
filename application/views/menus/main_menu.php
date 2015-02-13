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

<select name="company">
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
<td><input type="radio" name="mainmenuchoice" value="a" checked>Quick Status Service</td>
<td><input type="radio" name="mainmenuchoice" value="b" checked>Quick Status Unit Sales</td>
<td><input type="radio" name="mainmenuchoice" value="quickf" checked>Quick Status Finance</td></tr>
<tr>
<td><input type="radio" name="mainmenuchoice" value="d" checked>Detail Reports Parts</td>
<td><input type="radio" name="mainmenuchoice" value="e" checked>Detail Reports Service</td>
<td><input type="radio" name="mainmenuchoice" value="f" checked>To define</td>
<td><input type="radio" name="mainmenuchoice" value="g" checked>To define</td></tr>
<tr>
<td><input type="radio" name="mainmenuchoice" value="h" checked>Parts Stocks</td>
<td><input type="radio" name="mainmenuchoice" value="i" checked>Work In Progress</td>
<td><input type="radio" name="mainmenuchoice" value="j" checked>To define</td>
<td><input type="radio" name="mainmenuchoice" value="k" checked>To define</td></tr>
<tr>
<td><input type="radio" name="mainmenuchoice" value="part_sale" checked>Parts Sales</td>
<td><input type="radio" name="mainmenuchoice" value="m" checked>Technician Utilisation</td>
<td><input type="radio" name="mainmenuchoice" value="n" checked>To define</td>
<td><input type="radio" name="mainmenuchoice" value="o" checked>To define</td></tr>
</table>

<input type='submit' name='Submit' value='Submit' />

</fieldset>
</form>
You are in the View: application/views/menus/main_menu.php

</div>