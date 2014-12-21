<?php
class LeeHowItWorksController extends FrontController
{
	public $php_self = "leehowitworks";
	public $ssl = true;
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
		$this->setTemplate(_PS_THEME_DIR_.'lee-how-it-works.tpl');

		}
	}
	?>