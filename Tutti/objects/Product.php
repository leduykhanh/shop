<?php
class Product{
	public $brand_name;
	public $item_category;
	public $product_name;
	public $product_picture;
	public $our_price;
	public $market_price;
	public $catalog_price;
	public $initial_quantity;
	public $buffer_quantity;
	public $buffer_trigger;
	public $shipping_cost;
	public $referral_value;
	public $quantity_limit;
	public $payment_method;
	public $deal_end_date;
	public $word_of_the_day;
	public $fk_list;
	public function __construct(){
		$this->brand_name = "Hohon";
		$this->item_category = "1";
		$this->product_name = "Olympia Men";
		$this->product_picture = "a";
		$this->our_price = "1";
		$this->market_price = "1";
		$this->catalog_price = "1";
		$this->initial_quantity = "1";
		$this->buffer_quantity = "1";
		$this->buffer_trigger = "1";
		$this->shipping_cost = "1";
		$this->referral_value = "1";
		$this->quantity_limit = "1";
		$this->payment_method = "1";
		$this->deal_end_date = time();
		$this->word_of_the_day = "";
		$this->fk_list = array();
		settype($this->brand_name,"string");
		settype($this->item_category,"int");
		settype($this->product_name,"string");
		settype($this->product_picture,"string");
		settype($this->our_price,"int");
		settype($this->market_price,"int");
		settype($this->catalog_price,"int");
		settype($this->initial_quantity,"int");
		settype($this->buffer_quantity,"int");
		settype($this->buffer_trigger,"int");
		settype($this->shipping_cost,"int");
		settype($this->referral_value,"int");
		settype($this->quantity_limit,"int");
		settype($this->payment_method,"int");
		//settype($this->deal_end_date,"datetime");
		settype($this->word_of_the_day,"string");
		$this->fk_list["item_category"] = "Category(id)";

	}
}
?>
