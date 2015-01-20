<div class="container">
<h1> Irium Dashboard - Main Menu</h1>
<?php 
if (!empty($_SESSION['message']))
{
	echo '<h2>'.$_SESSION['message'].'</h2>';
	unset($_SESSION['message']);
}
var_dump($_SESSION['valid_user']);
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

<table>
<th>
<td>Parts</td>
<td>Service</td>
<td>Unit Sales</td>
<td>Finance</td>
</th>
<tr>
<td><input type="radio" name="mainmenuchoice" value="quick" checked>Quick Status</td>
<td><input type="radio" name="mainmenuchoice" value="a" checked>a</td>
<td><input type="radio" name="mainmenuchoice" value="b" checked>b</td>
<td><input type="radio" name="mainmenuchoice" value="c" checked>c</td></tr>
<tr>
<td><input type="radio" name="mainmenuchoice" value="d" checked>d</td>
<td><input type="radio" name="mainmenuchoice" value="e" checked>e</td>
<td><input type="radio" name="mainmenuchoice" value="f" checked>f</td>
<td><input type="radio" name="mainmenuchoice" value="g" checked>g</td></tr>
<tr>
<td><input type="radio" name="mainmenuchoice" value="h" checked>h</td>
<td><input type="radio" name="mainmenuchoice" value="i" checked>i</td>
<td><input type="radio" name="mainmenuchoice" value="j" checked>j</td>
<td><input type="radio" name="mainmenuchoice" value="k" checked>k</td></tr>
<tr>
<td><input type="radio" name="mainmenuchoice" value="l" checked>l</td>
<td><input type="radio" name="mainmenuchoice" value="m" checked>m</td>
<td><input type="radio" name="mainmenuchoice" value="n" checked>n</td>
<td><input type="radio" name="mainmenuchoice" value="o" checked>o</td></tr>
</table>

<input type='submit' name='Submit' value='Submit' />

</fieldset>
</form>
You are in the View: application/views/menus/main_menu.php

</div>