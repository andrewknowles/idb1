<div class="container">
<h1> Irium Dashboard</h1>

<form action="<?php echo URL; ?>login_controller/validate" method="POST" accept-charset='UTF-8'>
<fieldset >
<legend>Login</legend>
<input type='hidden' name='submitted' id='submitted' value='1'/>
 
<label for='username' >UserName*:</label>
<input type='text' name='username' id='username'  value = 'a' maxlength="50" />
 
<label for='password' >Password*:</label>
<input type='password' name='password' id='password' value = 'a' maxlength="50" />
 
<input type='submit' name='Submit' value='Submit' />
 
</fieldset>
</form>
You are in the View: application/views/home/login.php
  
</div>
