<?php
//session_start();
/**
 * Class Login_Controller
 */
class Login_Controller extends Controller
{
    public function validate()
    { 
  	
// how many users with matching login and password
        $usercount = $this->Mymodel->getUserCount($_POST['username'], $_POST['password']);
//only 1 user matches so valid user
        if ($usercount == 1)
        {
        	$_SESSION['valid_user'] = 1;
//get company and branch queries
			$this->Mymodel->getCompanyBranchQueries();
//get all companies from DMS database and store in $_SESSION variable
        	$this->Ifxmodel->getAllCompanies();        	
//get all branches from DMS database and store in $_SESSION variable        	
        	$this->Ifxmodel->getAllBranches();
        	require APP . 'views/_templates/header.php';
        	require APP . 'views/menus/main_menu.php';
        	require APP . 'views/_templates/footer.php';
        } else {
        	require APP . 'views/_templates/header.php';
        	require APP . 'views/home/login.php';
        	require APP . 'views/_templates/footer.php';
        }
    }    
}