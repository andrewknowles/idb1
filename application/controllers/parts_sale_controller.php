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
			require APP . 'views/result/part_sales_month.php';
			require APP . 'views/_templates/footer.php';
		}
		
		if ($_POST['partsalemenuchoice'] == 'psmbdm')
		{
			$this->Mymodel->GetQueriesByNumber(70);
			$this->Ifxmodel->RunDetailQuery();
			require APP . 'views/_templates/header.php';
			require APP . 'views/result/part_sales_month.php';
			require APP . 'views/_templates/footer.php';
		}
		
		if ($_POST['partsalemenuchoice'] == 'pstbdm')
		{
			$this->Mymodel->GetQueriesByNumber(71);
			$this->Ifxmodel->RunDetailQuery();
			require APP . 'views/_templates/header.php';
			require APP . 'views/result/part_sales_month.php';
			require APP . 'views/_templates/footer.php';
		}
		
		if ($_POST['partsalemenuchoice'] == 'tt')
		{
			$this->Mymodel->GetQueriesByNumber(48);
			$this->Ifxmodel->RunDetailQuery();
			foreach($_SESSION['detail_result'] as $usr)
			{
				echo $usr['usr_id'];
				$this->Mymodel->insertMySQL('idb_test2', $usr['usr_id'], $usr['xpf_id']);
			}
		}
		
	}
	
	
	}	

}

?>