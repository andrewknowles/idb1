<?php
session_start();
/**
 * Class Home
 *
 * Please note:
 * Don't use the same name for class and method, as this might trigger an (unintended) __construct of the class.
 * This is really weird behaviour, but documented here: http://php.net/manual/en/language.oop5.decon.php
 *
 */
class Home_Controller extends Controller
{
    /**
     * PAGE: index
     * This method handles what happens when you move to http://yourproject/home/index (which is the default page btw)
     */
    public function index()
    {
        // load views
        require APP . 'views/_templates/header.php';
        require APP . 'views/home/login.php';
        require APP . 'views/_templates/footer.php';
    }

    /**
     * PAGE: exampleone
     * This method handles what happens when you move to http://yourproject/home/exampleone
     * The camelCase writing is just for better readability. The method name is case-insensitive.
     */
    public function mainmenu()
    {
        // load views
        if (isset($_SESSION['valid_user']) && ($_SESSION['valid_user']== 1))
        {
        require APP . 'views/_templates/header.php';
        require APP . 'views/menus/main_menu.php';
        require APP . 'views/_templates/footer.php';
    	} else {
    		require APP . 'views/_templates/header.php';
    		require APP . 'views/home/login.php';
    		require APP . 'views/_templates/footer.php';
    	}
    }

    /**
     * PAGE: exampletwo
     * This method handles what happens when you move to http://yourproject/home/exampletwo
     * The camelCase writing is just for better readability. The method name is case-insensitive.
     */
    public function exampleTwo()
    {
        // load views
        require APP . 'views/_templates/header.php';
        require APP . 'views/home/example_two.php';
        require APP . 'views/_templates/footer.php';
    }
}
