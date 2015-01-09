<?php

if (!defined('_PS_VERSION_'))
    exit;

define(logfile, "thanhtest.txt");

class LeePurchaseParentOrderController  extends FrontController
{
    public function initContent(){
        file_put_contents(logfile, "bonj");
        parent::initContent();
        file_put_contents(logfile, "hello");
        $id_address_delivery = Tools::getValue("id_address_delivery");
        file_put_contents(logfile, "address".$id_address_delivery);
        $id_product = Tools::getValue("productId");
        file_put_contents(logfile, "productid".$id_product);
        $paymentMethod = Tools::getValue("paymentMethod");
        file_put_contents(logfile, "paymentmethod".$paymentMethod);
        $quantity = Tools::getValue("unit");

        //TODO: checking on veriables
        file_put_contents(logfile, $quantity);
        $quantity = $quantity - 1;
        $this->context->cart->updateQty($quantity, $id_product);
        
        if($paymentMethod == "bankwire"){
            
            Tools::redirect("index.php?fc=module&module=bankwire&controller=validation");
            //Tools::redirect("modules/bankwire/payment");
        }
    }    
}