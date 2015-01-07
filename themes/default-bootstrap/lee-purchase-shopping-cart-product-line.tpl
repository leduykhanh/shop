<div style="padding:5px;width:100%;" class="col-md-10">
    <div class="col-xs-3" style="height:100%; padding:3px;">
        <img src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'small_default')|escape:'html':'UTF-8'}" alt="{$product.name|escape:'html':'UTF-8'}" {if isset($smallSize)} width="{$smallSize.width-10}" {/if} />
    </div>
    <div class="col-xs-9" " > 
        <h4>{$product.name|escape:'html':'UTF-8'}<h4>
        <h6>{if $product.reference}<small class="cart_ref">{l s='SKU'} : {$product.reference|escape:'html':'UTF-8'}</small>{/if}</h6>
        <h7>{if isset($product.attributes) && $product.attributes}<small><a href="{$link->getProductLink($product.id_product, $product.link_rewrite, $product.category, null, null, $product.id_shop, $product.id_product_attribute)|escape:'html':'UTF-8'}">{$product.attributes|escape:'html':'UTF-8'}</a></small>{/if}</h7>
        <h7>{$product.brand_name} </h7>
        <h6>{convertPrice price=$product.price} Per Unit </h6>
    </div>
</div>
