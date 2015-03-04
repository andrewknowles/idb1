<?php
session_start();


class service_detail_controller extends Controller
  {
    
    public function SelectQuery()
      { 
        if (empty($_SESSION['cpy']) || empty($_SESSION['bra']) || empty($_POST['servicedetailmenuchoice']))
          {
            $_SESSION['message'] = 'Must set company/branch';
            require APP . 'views/_templates/header.php';
            require APP . 'views/menus/main_menu.php';
            require APP . 'views/_templates/footer.php';
          }
        else
          {			
            switch($_POST['servicedetailmenuchoice'])
            {
            	case 'sdm1':
                $this->Mymodel->GetQueriesByNumber(76);
                break;
            	case 'sdm2':
                $this->Mymodel->GetQueriesByNumber(78);
                break;
            	case 'sdm3':
                $this->Mymodel->GetQueriesByNumber(80);
                break;
            	case 'sdm4':
                $this->Mymodel->GetQueriesByNumber(82);
                break;
            	case 'sdm5':
                $this->Mymodel->GetQueriesByNumber(84);
                break;
            	case 'sdm6':
                $this->Mymodel->GetQueriesByNumber(86);
                break;
            	case 'sdm7':
                $this->Mymodel->GetQueriesByNumber(88);
                break;
            	case 'sdm8':
                $this->Mymodel->GetQueriesByNumber(90);
                break;
            	case 'sdm9':
                $this->Mymodel->GetQueriesByNumber(92);
                break;
            	case 'sdm10':
                $this->Mymodel->GetQueriesByNumber(94);
                break;
            	case 'sdm11':
            	$this->Mymodel->GetQueriesByNumber(96);
            	break;
            	case 'sdm12':
                $this->Mymodel->GetQueriesByNumber(98);
                break;
            	case 'sdm13':
                $this->Mymodel->GetQueriesByNumber(100);
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