<?php 
session_start();


class MenuChoice_Controller extends Controller
{

	public function SelectQuery()
	{	
		if (empty($_POST['company']) || empty($_POST['branch']) || empty($_POST['mainmenuchoice']))
		{
$_SESSION['message'] = 'Must set company/branch';
			require APP . 'views/_templates/header.php';
        	require APP . 'views/menus/main_menu.php';
        	require APP . 'views/_templates/footer.php';
		} else {
		
		$_SESSION['cpy'] = $_POST['company'];
		$_SESSION['bra'] = $_POST['branch'];
			
		if ($_POST['mainmenuchoice'] = 'quick')
		{

		$quickqueries =	$this->Mymodel->GetQueriesByType(1);	
		$this->Ifxmodel->RunQuickQueries();
		require APP . 'views/_templates/header.php';
		require APP . 'views/result/quickResult.php';
		require APP . 'views/_templates/footer.php';
		}
		} 
		
	}
	

}

?>