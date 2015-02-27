<div class="container">
<h1> Irium Dashboard - Parts Sales Menu</h1>
<?php 
if (!empty($_SESSION['message']))
{
	echo '<h2>'.$_SESSION['message'].'</h2>';
	unset($_SESSION['message']);
}

?>
<form action="<?php echo URL; ?>parts_detail_controller/SelectQuery" method="POST" accept-charset='UTF-8'>

<fieldset >
</br></br>
<table border="1">
<tr><td>Parts Detail Reports</td></tr>
<tr><td><input type="radio" name="partdetailmenuchoice" value="pdm1" checked>Parts Lines On Wait</td></tr>
<tr><td><input type="radio" name="partdetailmenuchoice" value="pdm2" checked>Parts Lines On requisition</td></tr>
<tr><td><input type="radio" name="partdetailmenuchoice" value="pdm3" checked>Parts Lines On Back Order</td></tr>
<tr><td><input type="radio" name="partdetailmenuchoice" value="pdm4" checked>Parts Lines On Transfer</td></tr>
<tr><td><input type="radio" name="partdetailmenuchoice" value="pdm5" checked>IBT Lines Awaiting Receipt</td></tr>
<tr><td><input type="radio" name="partdetailmenuchoice" value="pdm6" checked>Parts Lines Delivered Not Invoiced</td></tr>
<tr><td><input type="radio" name="partdetailmenuchoice" value="pdm7" checked>Invoices Not Printed</td></tr>
<tr><td><input type="radio" name="partdetailmenuchoice" value="pdm8" checked>Invoices Printed Not Integrated</td></tr>
<tr><td><input type="radio" name="partdetailmenuchoice" value="pdm9" checked>Proforma Invoices Not Cancelled</td></tr>
<tr><td><input type="radio" name="partdetailmenuchoice" value="pdm10" checked>Receipts In Progress</td></tr>
<tr><td><input type="radio" name="partdetailmenuchoice" value="pdm11" checked>Receipt Lines Not Integrated</td></tr>
<tr><td><input type="radio" name="partdetailmenuchoice" value="pdm12" checked>PO Invoice In Progress</td></tr>
<tr><td><input type="radio" name="partdetailmenuchoice" value="pdm13" checked>PO Invoices With Date > Today</td></tr>

</table>

<input type='submit' name='Submit' value='Submit' />

</fieldset>
</form>
You are in the View: application/views/menus/part_detail.php

</div>