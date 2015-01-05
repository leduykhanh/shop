{include file="$tpl_dir./global.tpl"}
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <!-- Jquery -->
    <!-- Bootstrap -->
    <style>
        .product-header {
            height: 30px;
            background-color: #0071BC;
            border-top-right-radius: 50px !important;
            color: white;
        }

        .product-content {
            min-height: 200px;
            border: 1px solid #0071BC;
            color: #0071BC;
        }

        .divider {
            border: 1px #0071BC solid;
            margin-top: 40px;
            margin-bottom: 20px;;
        }

        .responsive-image {
            height:auto;
            width:100%;
        }

    </style>

</head>
<body>
    <div class="container">
        <div class="row text-center" style="margin-bottom: 30px; color: #0071BC;font-weight:bold">
            <h2><strong>HISTORY OF DEALS</strong></h2>
        </div>
        <div class="row">
			{foreach from=$products item=product}
			{assign var=image value=$product->getHistoryImage(Context::getContext()->cookie->id_lang)}
			{assign var=imageIds value="`$product->id`-`$image.id_image`"}
            <div class="col-md-3" style="margin-top: 10px; margin-bottom: 10px;font-weight:bold">
                <div class="col-md-12 product-header text-center">
                    <div class="row" style="margin-top: 5px;">
                        <span>{date("M d", strtotime($product->end_date))}</span>
                    </div>
                </div>
			
                <div class="col-md-12 product-content text-center">
                    <h4> {$product->brand_name}</h4>
                    <img style="position: absolute;  top: 0; bottom:0; left: 0; right:0; margin: auto; max-width: 150px;" align="middle" src="{$link->getImageLink($product->link_rewrite,  $imageIds,'')|escape:'html':'UTF-8'}">
                    <p style="position: absolute; bottom:0; left: 0; right: 0; margin: auto;"> {$product->name}</p>
                </div>
            </div>
			{/foreach}
          </div>
    </div>
</body>
</html>