<div class="container">
<h1> Irium Dashboard - Service WIP Menu</h1>
<?php 
if (!empty($_SESSION['message']))
{
	echo '<h2>'.$_SESSION['message'].'</h2>';
	unset($_SESSION['message']);
}

?>
<form action="<?php echo URL; ?>service_wip_controller/SelectQuery" method="POST" accept-charset='UTF-8'>

<fieldset >
</br></br>
<table border="1">
<tr><td>Service WIP</td></tr>
<tr><td><input type="radio" name="servicewipmenuchoice" value="slwip" checked>Labour WIP Summary By Branch/Dept</td></tr>
<tr><td><input type="radio" name="servicewipmenuchoice" value="dlwip" checked>Labour WIP Detail</td></tr>
<tr><td><input type="radio" name="servicewipmenuchoice" value="spwip" checked>Parts WIP Summary</td></tr>
<tr><td><input type="radio" name="servicewipmenuchoice" value="dpwip" checked>Parts WIP Detail</td></tr>
</table>

<input type='submit' name='Submit' value='Submit' />

</fieldset>
</form>
You are in the View: application/views/menus/service_wip.php

</div>