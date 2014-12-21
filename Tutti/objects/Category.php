<?php 
 class Category{
	public $name;
	public function __construct(){
	$this->name = "a";
	settype($this->name, "string");
	}
}
?>