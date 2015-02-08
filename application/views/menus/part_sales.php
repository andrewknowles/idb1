<div class="container">
<h1> Irium Dashboard - Parts Sales Menu</h1>
<?php 
if (!empty($_SESSION['message']))
{
	echo '<h2>'.$_SESSION['message'].'</h2>';
	unset($_SESSION['message']);
}

?>
<form action="<?php echo URL; ?>MenuChoice_Controller/SelectQuery" method="POST" accept-charset='UTF-8'>

<fieldset >
</br></br>
<table border="1">
<tr><td>Parts Sales</td></tr>
<tr><td><input type="radio" name="mainmenuchoice" value="sbm" checked>Parts Sales by Month</td></tr>
<tr><td><input type="radio" name="mainmenuchoice" value="a" checked>To define</td></tr>
<tr><td><input type="radio" name="mainmenuchoice" value="b" checked>To define</td></tr>
<tr><td><input type="radio" name="mainmenuchoice" value="c" checked>To define</td></tr>
</table>

<input type='submit' name='Submit' value='Submit' />

</fieldset>
</form>
You are in the View: application/views/menus/part_sales.php

</div>