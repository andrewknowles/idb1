<div class="container">
<h1> Irium Dashboard - Labour Analysis Menu</h1>
<?php 
if (!empty($_SESSION['message']))
{
	echo '<h2>'.$_SESSION['message'].'</h2>';
	unset($_SESSION['message']);
}

?>
<form action="<?php echo URL; ?>tech_utilisation_controller/SelectQuery" method="POST" accept-charset='UTF-8'>

<fieldset >
</br></br>
<table border="1">
<tr><td><input type="radio" name="partsalemenuchoice" value="labutil" checked>Labour Utilisation</td></tr>
<tr><td><input type="radio" name="partsalemenuchoice" value="unprod" checked>Unproductive Analysis</td></tr>
<tr><td><input type="radio" name="partsalemenuchoice" value="d" checked>To define</td></tr>
<tr><td><input type="radio" name="partsalemenuchoice" value="c" checked>To define</td></tr>
</table>

<input type='submit' name='Submit' value='Submit' />

</fieldset>
</form>
You are in the View: application/views/menus/tech_utilisation.php

</div>