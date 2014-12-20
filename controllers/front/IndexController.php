<?php
/*
* 2007-2014 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Open Software License (OSL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/osl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2014 PrestaShop SA
*  @license    http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*/

class IndexControllerCore extends ProductController
{
    public $php_self = 'index';
 
    /**
     * Assign template vars related to page content
     * @see FrontController::initContent()
     */
     public function init(){
        $date = date("Y/m/d G:i");
        
        $id_product = IndexControllerCore::searchByDate($date);
        
        $_GET['id_product'] = $id_product;
        parent::init();
     }

    public function initContent()
    {
        parent::initContent();
    }

    /**
    * Search for a product that has the effective date contains a $date
    * TODO: this should be put in a helper function or a model class
    */
    private static function searchByDate($current, Context $context = null){
        if($context == null)
            $context = Context::getContext();
        $sql = new DbQuery();
        $sql->select('p.`id_product`');
        $sql->from('product', 'p');
        $sql->orderBy('p.`id_product` ASC');

        //This condition is somewhat wrong. 
        //TODO: ask customer for what does it mean by $start_date & $end_date
        //i.e: inclusive or exclusive
        $sql->where('p.start_date <= \'' . $current . '\' and \'' . $current . '\'<= p.end_date');
        $result = Db::getInstance()->executeS($sql);

        if(!$result)
            return false;
        return $result[0]['id_product'];
    }
}