<?php 
class Comment{
	public $user_id;
	public $product_id;
	public $comment;
	public $fk_list;
	public function __construct(){
		$this->user_id = "1";
		settype($this->user_id, "int");
		$this->product_id = "1";
		settype($this->product_id ,"int");
		$this->comment = "1";
		settype($this->comment, "string");
		$this->fk_list = array();
		$this->fk_list["user_id"] = "User(id)";
		$this->fk_list["product_id"] = "Product(id)";
	}
}
?>