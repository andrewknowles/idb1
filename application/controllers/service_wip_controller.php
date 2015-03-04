<?php
session_start();


class service_wip_controller extends Controller
  {
    
    public function SelectQuery()
      {
        if (empty($_SESSION['cpy']) || empty($_SESSION['bra']) || empty($_POST['servicewipmenuchoice']))
          {
            $_SESSION['message'] = 'Must set company/branch';
            require APP . 'views/_templates/header.php';
            require APP . 'views/menus/main_menu.php';
            require APP . 'views/_templates/footer.php';
          }
        else
          {			
            switch($_POST['servicewipmenuchoice'])
            {
            	case 'slwip':
                $this->Mymodel->GetQueriesByNumber(101);
                break;
            	case 'dlwip':
                $this->Mymodel->GetQueriesByNumber(102);
                break;
                case 'spwip':
                $this->Mymodel->GetQueriesByNumber(103);
                break;
                case 'dpwip':
                $this->Mymodel->GetQueriesByNumber(86);
                break;
            }
            
            $this->Ifxmodel->RunDetailQuery();
            require APP . 'views/_templates/header.php';
            require APP . 'views/result/display_result.php';
            require APP . 'views/_templates/footer.php';
            
            
          }
      }
    
  }

?>