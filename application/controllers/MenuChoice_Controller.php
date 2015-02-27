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
			
		if ($_POST['mainmenuchoice'] == 'quick')
		{

		$quickqueries =	$this->Mymodel->GetQueriesByType(1);	
		$this->Ifxmodel->RunQuickQueries();
		require APP . 'views/_templates/header.php';
		require APP . 'views/result/quickResult.php';
		require APP . 'views/_templates/footer.php';
		}
		
		if ($_POST['mainmenuchoice'] == 'detailp')
		{
		
			require APP . 'views/_templates/header.php';
			require APP . 'views/menus/parts_detail.php';
			require APP . 'views/_templates/footer.php';
		}
		
		if ($_POST['mainmenuchoice'] == 'details')
		{
		
			require APP . 'views/_templates/header.php';
			require APP . 'views/menus/service_detail.php';
			require APP . 'views/_templates/footer.php';
		}
		 
		if ($_POST['mainmenuchoice'] == 'quicks')
		{
		
			$quickqueries =	$this->Mymodel->GetQueriesByType(11);
			$this->Ifxmodel->RunQuickQueries();
			require APP . 'views/_templates/header.php';
			require APP . 'views/menus/quickResult.php';
			require APP . 'views/_templates/footer.php';
		}
		
		if ($_POST['mainmenuchoice'] == 'quickf')
		{
		
			$quickqueries =	$this->Mymodel->GetQueriesByType(31);
			$this->Ifxmodel->RunQuickQueries();
			require APP . 'views/_templates/header.php';
			require APP . 'views/result/quickResult.php';
			require APP . 'views/_templates/footer.php';
		}
		}
		
		
		if ($_POST['mainmenuchoice'] == 'part_sale')
		{
		
			require APP . 'views/_templates/header.php';
			require APP . 'views/menus/part_sales.php';
			require APP . 'views/_templates/footer.php';
		}
		
		if ($_POST['mainmenuchoice'] == 'tech_util')
		{
		
			require APP . 'views/_templates/header.php';
			require APP . 'views/menus/tech_utilisation.php';
			require APP . 'views/_templates/footer.php';
		}
				
	}
	
	
	public function PartsSales()
	{
		$quickqueries =	$this->Mymodel->GetQueriesByType(1);
		$this->Ifxmodel->RunQuickQueries();
		require APP . 'views/_templates/header.php';
		require APP . 'views/result/quickResult.php';
		require APP . 'views/_templates/footer.php';
	}
	

}

?>