<?php

class My_Model
{
    /**
     * @param object $db A PDO database connection
     */
    function __construct()
    {
        try {
        	$options = array(PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_OBJ, PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING);
        	$this->MyDb = new PDO(DB_TYPE . ':host=' . DB_HOST . ';dbname=' . DB_NAME, DB_USER, DB_PASS, $options);
        	}
        	catch (PDOException $e)
        	{
        		define("ERRMSG", "Unable to connect to MySQL database - IDB Error No. 1 </br> System halted");
        		require APP . 'views/_templates/header.php';
        		require APP . 'views/error/error.php';
        		require APP . 'views/_templates/footer.php';
        		exit;
        	}
    }
    
    /**
     * Count queries
     */
    public function CountQueries()
    {
    	$sql = 'select count(*) from idb_query';
    	$query = $this->MyDb->prepare($sql);
    	$query->execute();
    	$qrycount = $query->fetchAll(PDO::FETCH_ASSOC);
    	var_dump($qrycount);
    	exit;
    	 return $qrycount;	 
    }
    
    /**
     * Get all queries for query editor
     */
    public function GetAllQueries()
    {
    	$sql = 'select qry_id, qry_title, qry_qry, qry_qry2, qry_qry3, qry_type, qry_order, qry_link, qry_detail  from idb_query order by qry_type, qry_order';
    	$query = $this->MyDb->prepare($sql);
    	$query->execute();
    	$allqueries = $query->fetchAll(PDO::FETCH_ASSOC);
    	return $allqueries;
    }
    
    /**
     * Get company and branch queries
     */
    public function getCompanyBranchQueries()
    {
    	$sql = 'select qry_id, qry_qry from idb_query where qry_type = 0';
    	$query = $this->MyDb->prepare($sql);
    	$query->execute();
    	$cpybranch = $query->fetchAll(PDO::FETCH_ASSOC);
        $_SESSION['cbqueries'] = array();
        foreach ($cpybranch as $cb)
        {
        	$_SESSION['cbqueries'] += array($cb['qry_id'] => $cb['qry_qry']);
        }
        return $_SESSION['cbqueries'];
    	
    	
    }

    /**
     * Count user records that match login and password
     */
    public function getUserCount($login, $password)
    {
		$sql = "select * from idb_users where usr_login = :login and usr_password = :password";
        $query = $this->MyDb->prepare($sql);
        $parameters = array(':login' => $login, ':password' => $password);
        $query->execute($parameters);
        
        return $query->rowCount();
 
    } 

    
   /**
    * Get queries by type
    */
   public function GetQueriesByType($type)
   {
   	
   	$sql = 'select qry_id, qry_title, qry_qry, qry_qry2, qry_qry3, qry_detail from idb_query where qry_type = :type order by qry_order';
   	$query = $this->MyDb->prepare($sql);
   	$parameters = array(':type' => $type);
  	$query->execute($parameters);
   	$query->execute();
   	$qqueries = $query->fetchAll(PDO::FETCH_ASSOC);
   	$_SESSION['qqueries'] = array();
   	foreach ($qqueries as $qquery)
   	{
 //  		$_SESSION['qqueries'] += array($qquery);
 array_push($_SESSION['qqueries'],$qquery);
   	}
   	return $_SESSION['qqueries'];
   	
   }
   
   /**
    * Get queries by number
    */
   public function GetQueriesByNumber($no)
   {
   	$sql = 'select qry_id, qry_title, qry_qry, qry_qry2, qry_qry3, qry_detail from idb_query where qry_id = :id';
   	$query = $this->MyDb->prepare($sql);
   	$parameters = array(':id' => $no);
   	$query->execute($parameters);
   	$query->execute();
   	$qqueries = $query->fetchAll(PDO::FETCH_ASSOC);
   	$_SESSION['qquery'] = array();
   	foreach ($qqueries as $qquery)
   	{
   		array_push($_SESSION['qquery'],$qquery);
   	}
   	return $_SESSION['qquery'];
   
   }
   
   /**
    * Get queries by number
    */
   public function GetQueryForEdit($no)
   {
   	$sql = 'select qry_id, qry_title, qry_qry, qry_qry2, qry_qry3, qry_type, qry_order, qry_link, qry_detail from idb_query where qry_id = :id';
   	$query = $this->MyDb->prepare($sql);
   	$parameters = array(':id' => $no);
   	$query->execute($parameters);
   	$query->execute();
   	$qqueries = $query->fetchAll(PDO::FETCH_ASSOC);
   	$_SESSION['qquery'] = array();
   	foreach ($qqueries as $qquery)
   	{
   		array_push($_SESSION['qquery'],$qquery);
   	}
   	return $_SESSION['qquery'];
   	 
   }
   
   /**
    * Update query record
    */
   public function updateQuery($id,$title,$query,$query2,$query3,$type,$order,$link,$detail)
   {

   	$sql = 'update idb_query set qry_title = :title  where qry_id = :id';
   	$query = $this->MyDb->prepare($sql);
   	$query->execute(array(":title" => $title,  ":id" => $id));
   	
   	$sql = 'update idb_query set qry_qry = :query  where qry_id = :id';
   	$query = $this->MyDb->prepare($sql);
   	$query->execute(array(":query" => $query,  ":id" => $id));
   	
   	$sql = 'update idb_query set qry_qry2 = :query2  where qry_id = :id';
   	$query = $this->MyDb->prepare($sql);
   	$query->execute(array(":query2" => $query2,  ":id" => $id));

   	$sql = 'update idb_query set qry_qry3 = :query3  where qry_id = :id';
   	$query = $this->MyDb->prepare($sql);
   	$query->execute(array(":query3" => $query3,  ":id" => $id));
   	

   	$sql = 'update idb_query set qry_type = :type  where qry_id = :id';
   	$query = $this->MyDb->prepare($sql);
   	$query->execute(array(":type" => $type,  ":id" => $id));
   	

   	$sql = 'update idb_query set qry_order = :order  where qry_id = :id';
   	$query = $this->MyDb->prepare($sql);
   	$query->execute(array(":order" => $order,  ":id" => $id));
   	

   	$sql = 'update idb_query set qry_link = :link  where qry_id = :id';
   	$query = $this->MyDb->prepare($sql);
   	$query->execute(array(":link" => $link,  ":id" => $id));
   	
   	$sql = 'update idb_query set qry_detail = :detail  where qry_id = :id';
   	$query = $this->MyDb->prepare($sql);
   	$query->execute(array(":detail" => $detail,  ":id" => $id));

   }
   

   
   /**
    * Insert int MySQL table
    * 
    */
   public function insertMySQL($table,$val1,$val2,$val3,$val4,$val5,$val6)
   {
   $sql = 'insert into idb_temp values(:val1, :val2, :val3, :val4, :val5, :val6 )';
   $query = $this->MyDb->prepare($sql);
   
   $query->execute(array(":val1" => $val1,
   						 ":val2" => $val2,
   						 ":val3" => $val3,
   						 ":val4" => $val4,
   						 ":val5" => $val5,
   						 ":val6" => $val6));
   }


}