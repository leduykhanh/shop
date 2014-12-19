<?php
include_once(dirname(__FILE__).'/../../productcomments.php');

class TitanCommentsDefaultModuleFrontController extends ModuleFrontController
{

    public function __construct()
    {
        parent::__construct();

        $this->context = Context::getContext();
    }

    public function initContent()
    {
        parent::initContent();

        if (Tools::isSubmit('action'))
        {
            switch(Tools::getValue('action'))
            {
                case 'add_comment':
                    $this->ajaxProcessAddComment();
                    break;
            }
        }
    }

    protected function ajaxProcessAddComment(){
        /*TODO: implement this */
        die(Tools::jsonEncode(array("result"=>"success")));
    }
}