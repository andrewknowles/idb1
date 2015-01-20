<?php

class Controller
{
    /**
     * @var null Database Connection
     */
    public $IfxCon = null;
    public $MyCon = null;

    /**
     * @var null Model
     */
    public $Ifxmodel = null;
    public $Mymodel = null;

    /**
     * Whenever a controller is created, open a database connection too and load "the model".
     */
    function __construct()
    {
    	require APP . 'model/ifx_model.php';
    	$this->Ifxmodel = new Ifx_Model();
    	
    	require APP . 'model/my_model.php';
    	$this->Mymodel = new My_Model();

    }

}
