<div class="container">
<h1> Irium Dashboard - Parts Sales Menu</h1>
<?php 
if (!empty($_SESSION['message']))
{
	echo '<h2>'.$_SESSION['message'].'</h2>';
	unset($_SESSION['message']);
}

?>
<form action="<?php echo URL; ?>service_detail_controller/SelectQuery" method="POST" accept-charset='UTF-8'>

<fieldset >
</br></br>
<table border="1">
<tr><td>Parts Detail Reports</td></tr>
<tr><td><input type="radio" name="servicedetailmenuchoice" value="sdm1" checked>Parts Lines On Wait</td></tr>
<tr><td><input type="radio" name="servicedetailmenuchoice" value="sdm2" checked>Parts Lines On requisition</td></tr>
<tr><td><input type="radio" name="servicedetailmenuchoice" value="sdm3" checked>Parts Lines On Back Order</td></tr>
<tr><td><input type="radio" name="servicedetailmenuchoice" value="sdm4" checked>Parts Lines On Transfer</td></tr>
<tr><td><input type="radio" name="servicedetailmenuchoice" value="sdm5" checked>IBT Lines Awaiting Receipt</td></tr>
<tr><td><input type="radio" name="servicedetailmenuchoice" value="sdm6" checked>Parts Lines Delivered Not Invoiced</td></tr>
<tr><td><input type="radio" name="servicedetailmenuchoice" value="sdm7" checked>Invoices Not Printed</td></tr>
<tr><td><input type="radio" name="servicedetailmenuchoice" value="sdm8" checked>Invoices Printed Not Integrated</td></tr>
<tr><td><input type="radio" name="servicedetailmenuchoice" value="sdm9" checked>Proforma Invoices Not Cancelled</td></tr>
<tr><td><input type="radio" name="servicedetailmenuchoice" value="sdm10" checked>Receipts In Progress</td></tr>
<tr><td><input type="radio" name="servicedetailmenuchoice" value="sdm11" checked>Receipt Lines Not Integrated</td></tr>
<tr><td><input type="radio" name="servicedetailmenuchoice" value="sdm12" checked>PO Invoice In Progress</td></tr>
<tr><td><input type="radio" name="servicedetailmenuchoice" value="sdm13" checked>PO Invoices With Date > Today</td></tr>

</table>

<input type='submit' name='Submit' value='Submit' />

</fieldset>
</form>
You are in the View: application/views/menus/service_detail.php

</div>