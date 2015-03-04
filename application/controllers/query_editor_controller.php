<?php
session_start();
/**
 * Class Login_Controller
 */
class Query_Editor_Controller extends Controller
{
    public function select()
    { 
  	
//get all queries from MySQL database
		unset($_SESSION['quick_result']);
        $_SESSION['quick_result'] = $this->Mymodel->GetAllQueries();
        	require APP . 'views/_templates/header.php';
        	require APP . 'views/result/query_edit.php';
        	require APP . 'views/_templates/footer.php';
      
    } 

    public function SelectQueryByNumber($id)
    {
    	unset($_SESSION['quick_result']);
    	$_SESSION['quick_result'] = $this->Mymodel->GetQueryForEdit($id);
    	require APP . 'views/_templates/header.php';
    	require APP . 'views/result/query_edit_detail.php';
    	require APP . 'views/_templates/footer.php';
    }
    
    
   public function SaveQuery()
   {
   	$this->Mymodel->updateQuery($_POST['id'],$_POST['title'], $_POST['query'], $_POST['query2'], $_POST['query3'], $_POST['type'], $_POST['order'], $_POST['link'], $_POST['detail']);
//   	require APP . 'views/_templates/header.php';
//   	require APP . 'views/result/query_edit.php';
//   	require APP . 'views/_templates/footer.php';
   }

}