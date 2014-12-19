<?php
if(!defined('_PS_VERSION_'))
    exit;

class TitanComments extends Module{

    const INSTALL_SQL_FILE = 'install.sql';

    /*TODO: other variables here*/
    
    private $_baseUrl ;
    public function __construct(){
        $this->name = "titancomments";
        $this->tab = 'front_office_features';
        $this->version = '1.0.0';
        $this->author = 'titan';
        $this->need_instance = 0;
        $this->bootstrap = true;

        parent::__construct();
        $this->secure_key = Tools::encrypt($this->name);
        $this->diaplayName = $this->l('Comment');
        $this->description = $this->l('Product comment');
    }

    public function install($keep = true){
        if($keep){
           /* if (!file_exists(dirname(__FILE__).'/'.self::INSTALL_SQL_FILE))
                return false;
            else if (!$sql = file_get_contents(dirname(__FILE__).'/'.self::INSTALL_SQL_FILE))
                return false;
            $sql = str_replace(array('PREFIX_', 'ENGINE_TYPE'), array(_DB_PREFIX_, _MYSQL_ENGINE_), $sql);
            $sql = preg_split("/;\s*[\r\n]+/", trim($sql));

            foreach ($sql as $query)
                if (!Db::getInstance()->execute(trim($query)))
                    return false;*/
        }
        if (parent::install() == false ||
            !$this->registerHook('header') ||
            !$this->registerHook('displayProductTitanComments') ||
            !Configuration::updateValue('TITAN_COMMENTS_MINIMAL_TIME', 30) ||
            !Configuration::updateValue('TITAN_COMMENTS_ALLOW_GUESTS', 0) ||
            !Configuration::updateValue('TITAN_COMMENTS_ALLOW_VOTE', 1) ||
            !Configuration::updateValue('TITAN_COMMENTS_ALLOW_DELETE', 0) ||
            !Configuration::updateValue('TITAN_COMMENTS_MODERATE', 1))
            return false;
        return true;
    }

    public function uninstall($keep = true){
        if (!parent::uninstall() || ($keep && !$this->deleteTables()) ||
            !Configuration::updateValue('TITAN_COMMENTS_MINIMAL_TIME', 30) ||
            !Configuration::updateValue('TITAN_COMMENTS_ALLOW_GUESTS', 0) ||
            !Configuration::updateValue('TITAN_COMMENTS_ALLOW_VOTE', 1) ||
            !Configuration::updateValue('TITAN_COMMENTS_ALLOW_DELETE', 0) ||
            !Configuration::updateValue('TITAN_COMMENTS_MODERATE', 1)||
            !$this->unregisterHook('header') ||
            !$this->unregisterHook('displayProductTitanComments'))
            return false;
        return true;
    }

    public function reset(){
        if(!$this->uninstall(false))
            return false;
        if(!$this->install(false))
            return false;
        return true;
    }

    public function deleteTables(){
        /*TODO: implement this **/
        return true;
    }

    public function getCacheId($id_product = null)
    {
        return parent::getCacheId().'|'.(int)$id_product;
    }

    protected function _postProcess(){
        if (Tools::isSubmit('productcomments'))
        {
            /*$id_product_comment = (int)Tools::getValue('id_product_comment');
            $comment = new ProductComment($id_product_comment);
            $comment->validate();
            ProductComment::deleteReports($id_product_comment);*/
        }
    }

    public function getContent(){
        include_once(dirname(__FILE__).'/TitanComment.php');
        $this->_html = '<div>cong hoa xa hoi chu nghia vietnam</div>';
        /*TODO: implement this */

        $this->_setBaseUrl();

        return $this->_html;
    }

    private function _setBaseUrl()
    {
        $this->_baseUrl = 'index.php?';
        foreach ($_GET as $k => $value)
            if (!in_array($k, array('deleteCriterion', 'editCriterion')))
                $this->_baseUrl .= $k.'='.$value.'&';
        $this->_baseUrl = rtrim($this->_baseUrl, '&');
    }

    public function hookDisplayProductTitanComments($param){
        $this->context->controller->addJS($this->_path.'js/jquery.voting.js');
        $this->context->controller->addJS($this->_path.'js/jquery.textareaCounter.plugin.js');
        $this->context->controller->addJS($this->_path.'js/titancomments.js');

        $this->context->smarty->assign(array(
            'titancomments_controller_url' => $this->context->link->getModuleLink('titancomments'),
            ));
        return ($this->display(__FILE__, '/titancomments.tpl'));
    }

    public function hookHeader($param){
        $this->context->controller->addCss($this->_path . 'titancomments.css', 'all');
       /* $this->page_name = Dispatcher::getInstance()->getController();
        if (in_array($this->page_name, array('product', 'producttitancommentvote')))
        {
            $this->context->controller->addJS($this->_path.'js/jquery.vote.js');
        }*/
    }
}