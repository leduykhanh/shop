<?php
class LeePurchaseController  extends FrontController
{
	public $php_self = 'leepurchase';
	public $ssl = true;
	public $lee = 11;
	public $product;
	public $customer;
	public $address;
	public function init()
	{
		$this->display_column_left = false; // hides left column
		parent::init();
	}  
	public function initContent()
	{
		parent::initContent();
		$this->display_column_left = false;
		$this->display_column_right = false;
		
		if ($id_product = (int)Tools::getValue('id_product'))
			$this->product = new Product($id_product, true, $this->context->language->id, $this->context->shop->id);
		if(1){
			$this->customer = $this->context->customer;
			$this->address = $this->context->customer->getAddresses($this->context->language->id);
			}
		$this->setTemplate(_PS_THEME_DIR_.'lee-purchase.tpl');
		$this->context->smarty->assign(array('lee'=>$this->lee,
								'product'=>$this->product,
								'customer'=>$this->customer,
								'address'=>$this->address
								)
		);
		}
	}
	?>