<div class="container">
<h1> Irium Dashboard - Parts Sales Menu</h1>
<?php 
if (!empty($_SESSION['message']))
{
	echo '<h2>'.$_SESSION['message'].'</h2>';
	unset($_SESSION['message']);
}

?>
<form action="<?php echo URL; ?>parts_sale_controller/SelectQuery" method="POST" accept-charset='UTF-8'>

<fieldset >
</br></br>
<table border="1">
<tr><td>Parts Sales</td></tr>
<tr><td><input type="radio" name="partsalemenuchoice" value="sbm" checked>Global Parts Sales by Month</td></tr>
<tr><td><input type="radio" name="partsalemenuchoice" value="psmbdm" checked>Part Sales by Month/Branch/Dept./Manufacturer</td></tr>
<tr><td><input type="radio" name="partsalemenuchoice" value="pstbdm" checked>Part Stock Turn by Month/Branch/Dept./Manufacturer</td></tr>
<tr><td><input type="radio" name="partsalemenuchoice" value="c" checked>To define</td></tr>
</table>

<input type='submit' name='Submit' value='Submit' />

</fieldset>
</form>
You are in the View: application/views/menus/part_sales.php

</div>