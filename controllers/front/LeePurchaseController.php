<?php
class LeePurchaseController  extends FrontController
{
	public $php_self = 'leepurchase';
	public $ssl = true;
	public $lee = 11;
	public $product;
	public function initContent()
	{
		parent::initContent();
		if ($id_product = (int)Tools::getValue('id_product'))
			$this->product = new Product($id_product, true, $this->context->language->id, $this->context->shop->id);
		$this->setTemplate(_PS_THEME_DIR_.'lee-purchase.tpl');
		$this->context->smarty->assign(array('lee'=>$this->lee,
								'product'=>$this->product
								)
		);
		}
	}
	?>