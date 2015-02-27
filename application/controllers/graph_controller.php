<?php 

session_start();

class graph_controller extends Controller
{
	
	public function display()
			
			{
				require APP . 'views/result/part_sales_month_test.php';
			}
	
}

?>