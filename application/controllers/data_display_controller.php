<?php 
session_start();


class Data_Display_Controller extends Controller
{

	public function RunQueryByNumber($qry)
	{		
		$quickquery =	$this->Mymodel->GetQueriesByNumber($qry);


		$this->Ifxmodel->RunDetailQuery();

		require APP . 'views/_templates/header.php';
		require APP . 'views/result/quick_result_detail.php';
		require APP . 'views/_templates/footer.php';
		
	}
	

}

?>