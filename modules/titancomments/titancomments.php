<?php
if(!defined('_PS_VERSION_'))
    exit;

class TitanComments extends Module{

    const INSTALL_SQL_FILE = 'install.sql';
    
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
            !Configuration::deleteByName('TITAN_COMMENTS_MINIMAL_TIME') ||
            !Configuration::deleteByName('TITAN_COMMENTS_ALLOW_GUESTS') ||
            !Configuration::deleteByName('TITAN_COMMENTS_ALLOW_VOTE') ||
            !Configuration::deleteByName('TITAN_COMMENTS_ALLOW_DELETE') ||
            !Configuration::deleteByName('TITAN_COMMENTS_MODERATE')||
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

    public function getContent(){
        include_once(dirname(__FILE__).'/TitanComment.php');
        $this->_html = '<div>This is a helper module for Product Comment module.</div>';
        $this->_html .= '<div>If you have not installed Product Comment, please do so</div>';

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

        $this->context->controller->addJS($this->_path.'js/jquery.textareaCounter.plugin.js');
        $this->context->controller->addJS($this->_path.'js/titancomments.js');

        $customer_name = Context::getContext()->customer->firstname.' '.Context::getContext()->customer->lastname;
        $this->context->smarty->assign(array(
            'titancomments_customer_name' => $customer_name,
            'titancomments_moderation_active' => (int)Configuration::get('PRODUCT_COMMENTS_MODERATE'),
            'titancomments_id_product_comment_form' => (int)Tools::getValue('id_product'),
            'titancomments_controller_url' => $this->context->link->getModuleLink('productcomments'),
            ));
        return ($this->display(__FILE__, '/titancomments.tpl'));
    }

    public function hookHeader($param){
        $this->context->controller->addCss($this->_path . 'titancomments.css', 'all');
    }
}