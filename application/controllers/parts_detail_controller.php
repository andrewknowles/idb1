<?php
session_start();


class parts_detail_controller extends Controller
  {
    
    public function SelectQuery()
      {
        if (empty($_SESSION['cpy']) || empty($_SESSION['bra']) || empty($_POST['partdetailmenuchoice']))
          {
            $_SESSION['message'] = 'Must set company/branch';
            require APP . 'views/_templates/header.php';
            require APP . 'views/menus/main_menu.php';
            require APP . 'views/_templates/footer.php';
          }
        else
          {			
            switch($_POST['partdetailmenuchoice'])
            {
            	case 'pdm1':
                $this->Mymodel->GetQueriesByNumber(35);
                break;
            	case 'pdm2':
                $this->Mymodel->GetQueriesByNumber(52);
                break;
            	case 'pdm3':
                $this->Mymodel->GetQueriesByNumber(43);
                break;
            	case 'pdm4':
                $this->Mymodel->GetQueriesByNumber(56);
                break;
            	case 'pdm5':
                $this->Mymodel->GetQueriesByNumber(59);
                break;
            	case 'pdm6':
                $this->Mymodel->GetQueriesByNumber(39);
                break;
            	case 'pdm7':
                $this->Mymodel->GetQueriesByNumber(41);
                break;
            	case 'pdm8':
                $this->Mymodel->GetQueriesByNumber(57);
                break;
            	case 'pdm9':
                $this->Mymodel->GetQueriesByNumber(53);
                break;
            	case 'pdm10':
                $this->Mymodel->GetQueriesByNumber(38);
                break;
            	case 'pdm11':
            	$this->Mymodel->GetQueriesByNumber(37);
            	break;
            	case 'pdm12':
                $this->Mymodel->GetQueriesByNumber(46);
                break;
            	case 'pdm13':
                $this->Mymodel->GetQueriesByNumber(62);
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