<?php 
session_start();


class tech_utilisation_controller extends Controller
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
			
		
		if ($_POST['partsalemenuchoice'] == 'labutil')
		{
			
			$sql = 'truncate table idb_temp';
			$query = $this->Mymodel->MyDb->prepare($sql);
			$query->execute();
			
			$this->Mymodel->GetQueriesByNumber(48);
			$this->Ifxmodel->RunDetailQuery();
			foreach($_SESSION['detail_result'] as $res)
			{
				$this->Mymodel->insertMySQL('idb_temp', $res['branch'], $res['dept'], $res['period'], $res['technician'], $res['minutes_clocked'], 0);
				echo 'inserted';
			}
			$this->Mymodel->GetQueriesByNumber(65);
			$this->Ifxmodel->RunDetailQuery();

			foreach($_SESSION['detail_result'] as $res)
			{
				$sql = 'update idb_temp set val2 = :hours where char1 = :branch and char2 = :dept and char3 = :period and char4 = :technician'; 
				$query = $this->Mymodel->MyDb->prepare($sql);
				$parameters = array(':hours' => $res['hours'],
									':branch' => $res['branch'],
									':dept' => $res['dept'],
									':period' => $res['period'],
									':technician' => $res['technician']);
				$query->execute($parameters);
				$query->execute();
				echo 'xxxx';
			}
			
			$sql = 'update idb_temp set val1 = round((val1/60)*10,2) where 1=1';
					$query = $this->Mymodel->MyDb->prepare($sql);
					$query->execute();
					
			$sql = 'select char1 branch, char2 dept, char3 period, char4 technician, val1 clocked, val2 sold from idb_temp order by 4, 3,1,2';
					$query = $this->Mymodel->MyDb->prepare($sql);
					$query->execute();
					$qqueries = $query->fetchAll(PDO::FETCH_ASSOC);
   					$_SESSION['detail_result'] = array();
   					foreach ($qqueries as $qquery)
   						{
   						array_push($_SESSION['detail_result'],$qquery);
   						}
   						require APP . 'views/_templates/header.php';
   						require APP . 'views/result/part_sales_month.php';
   						require APP . 'views/_templates/footer.php';

		}
		if ($_POST['partsalemenuchoice'] == 'unprod')
		{
			$this->Mymodel->GetQueriesByNumber(36);
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
			
		
	}
	}
}
	