<?php
class LeeHistoryController extends FrontController
{
	public $php_self = "leehistory";
	public $ssl = true;
	public $products;
	public $customer;
	public $address;
	public $all_product_id;
	public function init()
		{
		$date = date("Y/m/d G:i");
		$this->display_column_left = false; // hides left column
		$this->display_footer =  false;
		parent::init();
		$this->all_product_id = LeeHistoryController::getHistoryProduct($date);
		if(count($this->all_product_id)>0){ 
			foreach( $this->all_product_id as $product_id)
			{
				$this->products[] = new Product($product_id['id_product'], true, $this->context->language->id, $this->context->shop->id);
				}
		}

	}  
	public function initContent()
	{
		parent::initContent();
		$this->setTemplate(_PS_THEME_DIR_.'lee-history.tpl');
				$this->context->smarty->assign(array(
								'products'=>$this->products,
								'all_product_id'=>$this->all_product_id
								)
								);
		}
	private static function getHistoryProduct($current, Context $context = null){
        if($context == null)
            $context = Context::getContext();
        $sql = new DbQuery();
        $sql->select('p.`id_product`');
        $sql->from('product', 'p');
        $sql->orderBy('p.`id_product` ASC');

        //This condition is somewhat wrong. 
        //TODO: ask customer for what does it mean by $start_date & $end_date
        //i.e: inclusive or exclusive
        //$sql->where('p.start_date <= \'' . $current . '\' and \'' . $current . '\'<= p.end_date');
        $result = Db::getInstance()->executeS($sql);

        if(!$result)
            return false;
        return $result;
    }
	}
	?>