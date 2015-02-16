<?php 
session_start();


class parts_sale_controller extends Controller
{

	public function SelectQuery()
	{	
		if (empty($_SESSION['cpy']) || empty($_SESSION['bra']) ||  empty($_POST['partsalemenuchoice']))
		{
$_SESSION['message'] = 'Must set company/branch';
			require APP . 'views/_templates/header.php';
        	require APP . 'views/menus/main_menu.php';
        	require APP . 'views/_templates/footer.php';
		} else {
		
//		$_SESSION['cpy'] = $_POST['company'];
//		$_SESSION['bra'] = $_POST['branch'];
			
		
		if ($_POST['partsalemenuchoice'] == 'sbm')
		{
			$quickqueries =	$this->Mymodel->GetQueriesByNumber(44);
			$this->Ifxmodel->RunDetailQuery();
			require APP . 'views/_templates/header.php';
			require APP . 'views/result/part_sales_month_test.php';
			require APP . 'views/_templates/footer.php';
		}
		
		if ($_POST['partsalemenuchoice'] == 'example')
		{
			require APP . 'views/_templates/header.php';
//			require APP . 'views/result/part_sales_month_test.php';
			require APP . 'views/_templates/footer.php';
		}
		
	}
	
	
	}	

}

?>