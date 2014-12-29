{*
* 2007-2014 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2014 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
{include file="$tpl_dir./errors.tpl"}
{if $errors|@count == 0}
	{if !isset($priceDisplayPrecision)}
		{assign var='priceDisplayPrecision' value=2}
	{/if}
	{if !$priceDisplay || $priceDisplay == 2}
		{assign var='productPrice' value=$product->getPrice(true, $smarty.const.NULL, $priceDisplayPrecision)}
		{assign var='productPriceWithoutReduction' value=$product->getPriceWithoutReduct(false, $smarty.const.NULL)}
	{elseif $priceDisplay == 1}
		{assign var='productPrice' value=$product->getPrice(false, $smarty.const.NULL, $priceDisplayPrecision)}
		{assign var='productPriceWithoutReduction' value=$product->getPriceWithoutReduct(true, $smarty.const.NULL)}
	{/if}

<div itemscope itemtype="http://schema.org/Product">
	<div class="primary_block row no_row">
		{if !$content_only}
			<div class="container">
				<div class="top-hr"></div>
			</div>
		{/if}
		{if isset($adminActionDisplay) && $adminActionDisplay}
			<div id="admin-action">
				<p>{l s='This product is not visible to your customers.'}
					<input type="hidden" id="admin-action-product-id" value="{$product->id}" />
					<input type="submit" value="{l s='Publish'}" name="publish_button" class="exclusive" />
					<input type="submit" value="{l s='Back'}" name="lnk_view" class="exclusive" />
				</p>
				<p id="admin-action-result"></p>
			</div>
		{/if}
		{if isset($confirmation) && $confirmation}
			<p class="confirmation">
				{$confirmation}
			</p>
		{/if}
		<!-- left infos-->
		<div class="pb-left-column col-xs-12 col-sm-12 col-md-12">
			<!-- product img-->
			<div id="image-block" class="clearfix">
				{if $product->new}
				<!--	<span class="new-box">
						<span class="new-label">{l s='New'}</span>
					</span>
					-->
				{/if}
				{if $product->on_sale}
					<span class="sale-box no-print">
						<span class="sale-label">{l s='Sale!'}</span>
					</span>
				{elseif $product->specificPrice && $product->specificPrice.reduction && $productPriceWithoutReduction > $productPrice}
					<span class="discount">{l s='Reduced price!'}</span>
				{/if}
				{if $have_image}
					<span id="view_full_size">
						{if $jqZoomEnabled && $have_image && !$content_only}
							<a class="jqzoom" title="{if !empty($cover.legend)}{$cover.legend|escape:'html':'UTF-8'}{else}{$product->name|escape:'html':'UTF-8'}{/if}" rel="gal1" href="{$link->getImageLink($product->link_rewrite, $cover.id_image, 'thickbox_default')|escape:'html':'UTF-8'}" itemprop="url">
								<img itemprop="image" src="{$link->getImageLink($product->link_rewrite, $cover.id_image, 'large_default')|escape:'html':'UTF-8'}" title="{if !empty($cover.legend)}{$cover.legend|escape:'html':'UTF-8'}{else}{$product->name|escape:'html':'UTF-8'}{/if}" alt="{if !empty($cover.legend)}{$cover.legend|escape:'html':'UTF-8'}{else}{$product->name|escape:'html':'UTF-8'}{/if}"/>
							</a>
						{else}
							<img id="bigpic" itemprop="image" src="{$link->getImageLink($product->link_rewrite, $cover.id_image, 'large_default')|escape:'html':'UTF-8'}" title="{if !empty($cover.legend)}{$cover.legend|escape:'html':'UTF-8'}{else}{$product->name|escape:'html':'UTF-8'}{/if}" alt="{if !empty($cover.legend)}{$cover.legend|escape:'html':'UTF-8'}{else}{$product->name|escape:'html':'UTF-8'}{/if}" width="{$largeSize.width}" height="{$largeSize.height}"/>

						{/if}
					</span>
				{else}
				{/if}
			</div>
			
			<!-- end image-block -->
			<!-- slider -->
			<!---
			<div id="slider">
			  <a href="#" class="control_next">>></a>
			  <a href="#" class="control_prev"><</a>
			  <ul>
				<li>
				<img src="{$link->getImageLink($product->link_rewrite, $cover.id_image, 'large_default')|escape:'html':'UTF-8'}" />
				</li>
				<li style="background: #aaa;">SLIDE 2</li>
				<li>SLIDE 3</li>
				<li style="background: #aaa;">SLIDE 4</li>
			  </ul>  
			</div>

			<div class="slider_option">
			  <input type="checkbox" id="checkbox">
			  <label for="checkbox">Autoplay Slider</label>
			</div>
			<script>
			jQuery(document).ready(function ($) {

			  $('#checkbox').change(function(){
				setInterval(function () {
					moveRight();
				}, 3000);
			  });
			  
				var slideCount = $('#slider ul li').length;
				var slideWidth = $('#slider ul li').width();
				var slideHeight = $('#slider ul li').height();
				var sliderUlWidth = slideCount * slideWidth;
				
				$('#slider').css({ width: slideWidth, height: slideHeight });
				
				$('#slider ul').css({ width: sliderUlWidth, marginLeft: - slideWidth });
				
				$('#slider ul li:last-child').prependTo('#slider ul');

				function moveLeft() {
					$('#slider ul').animate({
						left: + slideWidth
					}, 200, function () {
						$('#slider ul li:last-child').prependTo('#slider ul');
						$('#slider ul').css('left', '');
					});
				};

				function moveRight() {
					$('#slider ul').animate({
						left: - slideWidth
					}, 200, function () {
						$('#slider ul li:first-child').appendTo('#slider ul');
						$('#slider ul').css('left', '');
					});
				};

				$('a.control_prev').click(function () {
					moveLeft();
				});

				$('a.control_next').click(function () {
					moveRight();
				});

			}); 
			</script>
			-->
			<!-- end slider -->
			<!-- stock -->
			<div class="pb-left-column col-xs-12 col-sm-12 col-md-12" style="top:-30px">
				<div style="border-top-right-radius:30px;border:solid 1px #ed1c24;text-align: left; color:red;
				font-size: 24px;padding-right: 40px;padding-top: 5px;padding-bottom: 5px;" class="col-md-3">
					<span id = "count_down">00:00:00</span>
					<script>
					setInterval(updateCountDown,1000);
					function updateCountDown(){
						var current_time = new Date();
						var difference = new Date("{$product->end_date}") - current_time;
						    var daysDifference = Math.floor(difference/1000/60/60/24);
								difference -= daysDifference*1000*60*60*24
							 
								var hoursDifference = Math.floor(difference/1000/60/60);
								difference -= hoursDifference*1000*60*60
							 
								var minutesDifference = Math.floor(difference/1000/60);
								difference -= minutesDifference*1000*60
							 
								var secondsDifference = Math.floor(difference/1000);
						var count_down = document.getElementById("count_down");
						count_down.innerHTML = hoursDifference + ":" + minutesDifference + ":" + secondsDifference;
						}
						function formatNumber(num)
							{
							return ("" + num).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, function($1) { return $1 + "'" });
							}
						$( document ).ready(function() {
							$("#our_price").text(formatNumber({$product->price}) + ".-");
							$("#catalog_price").text(formatNumber({$product->catalog_price}));
							$("#market_price").text(formatNumber({$product->market_price}));
							$("#shipping_cost").text(formatNumber({$product->shipping_1}));
						});
					</script>
				</div>
				<div style="border-top-right-radius:30px;background-color:#ed1c24;text-align: right; border:solid 1px #ed1c24;color:white;font-size: 24px;padding-right: 40px;padding-top: 5px;padding-bottom: 5px;"  class="col-md-9">
					<span>{$product->quantity/(float)$product->initial_quantity*100} % stock</span>
				</div>
			</div>
			<!--{l s="{var_dump($images)}"} 
			{l s="{isset($images) && count($images) > 0}"}-->
			{if isset($images) && count($images) > 0} 
				<!-- thumbnails -->
				
				<div id="views_block" class="clearfix {if isset($images) && count($images) < 2}hidden{/if}">
					{if isset($images) && count($images) > 2}
						<span class="view_scroll_spacer">
							<a id="view_scroll_left" class="" title="{l s='Other views'}" href="javascript:{ldelim}{rdelim}">
								{l s='Previous'}
							</a>
						</span>
					{/if}
					<div id="thumbs_list">
						<ul id="thumbs_list_frame">
						{if isset($images)}
							{foreach from=$images item=image name=thumbnails}
								{assign var=imageIds value="`$product->id`-`$image.id_image`"}
								{if !empty($image.legend)}
									{assign var=imageTitle value=$image.legend|escape:'html':'UTF-8'}
								{else}
									{assign var=imageTitle value=$product->name|escape:'html':'UTF-8'}
								{/if}
								<li id="thumbnail_{$image.id_image}"{if $smarty.foreach.thumbnails.last} class="last"{/if}>
									<a{if $jqZoomEnabled && $have_image && !$content_only} href="javascript:void(0);" rel="{literal}{{/literal}gallery: 'gal1', smallimage: '{$link->getImageLink($product->link_rewrite, $imageIds, 'large_default')|escape:'html':'UTF-8'}',largeimage: '{$link->getImageLink($product->link_rewrite, $imageIds, 'thickbox_default')|escape:'html':'UTF-8'}'{literal}}{/literal}"{else} href="{$link->getImageLink($product->link_rewrite, $imageIds, 'thickbox_default')|escape:'html':'UTF-8'}"	data-fancybox-group="other-views" class="fancybox{if $image.id_image == $cover.id_image} shown{/if}"{/if} title="{$imageTitle}">
										<img class="img-responsive" id="thumb_{$image.id_image}" src="{$link->getImageLink($product->link_rewrite, $imageIds, 'cart_default')|escape:'html':'UTF-8'}" alt="{$imageTitle}" title="{$imageTitle}" height="{$cartSize.height}" width="{$cartSize.width}" itemprop="image" />
									</a>
								</li>
							{/foreach}
						{/if}
						</ul>
					</div> 
					
					<!-- end thumbs_list -->
					{if isset($images) && count($images) > 2}
						<a id="view_scroll_right" title="{l s='Other views'}" href="javascript:{ldelim}{rdelim}">
							{l s='Next'}
						</a>
					{/if}
				</div> <!-- end views-block -->
				
				<!-- end thumbnails -->
			{/if}
			{if isset($images) && count($images) > 1}
				<p class="resetimg clear no-print">
					<span id="wrapResetImages" style="display: none;">
						<a href="{$link->getProductLink($product)|escape:'html':'UTF-8'}" name="resetImages">
							<i class="icon-repeat"></i>
							{l s='Display all pictures'}
						</a>
					</span>
				</p>
			{/if}
		</div> <!-- end pb-left-column -->
		<!-- end left infos-->
	</div> <!-- end primary_block -->
	{if !$content_only}
{if (isset($quantity_discounts) && count($quantity_discounts) > 0)}
			<!-- quantity discount -->
			<section class="page-product-box">
				<h3 class="page-product-heading">{l s='Volume discounts'}</h3>
				<div id="quantityDiscount">
					<table class="std table-product-discounts">
						<thead>
							<tr>
								<th>{l s='Quantity'}</th>
								<th>{if $display_discount_price}{l s='Price'}{else}{l s='Discount'}{/if}</th>
								<th>{l s='You Save'}</th>
							</tr>
						</thead>
						<tbody>
							{foreach from=$quantity_discounts item='quantity_discount' name='quantity_discounts'}
							<tr id="quantityDiscount_{$quantity_discount.id_product_attribute}" class="quantityDiscount_{$quantity_discount.id_product_attribute}" data-discount-type="{$quantity_discount.reduction_type}" data-discount="{$quantity_discount.real_value|floatval}" data-discount-quantity="{$quantity_discount.quantity|intval}">
								<td>
									{$quantity_discount.quantity|intval}
								</td>
								<td>
									{if $quantity_discount.price >= 0 || $quantity_discount.reduction_type == 'amount'}
										{if $display_discount_price}
											{convertPrice price=$productPrice-$quantity_discount.real_value|floatval}
										{else}
											{convertPrice price=$quantity_discount.real_value|floatval}
										{/if}
									{else}
										{if $display_discount_price}
											{convertPrice price = $productPrice-($productPrice*$quantity_discount.reduction)|floatval}
										{else}
											{$quantity_discount.real_value|floatval}%
										{/if}
									{/if}
								</td>
								<td>
									<span>{l s='Up to'}</span>
									{if $quantity_discount.price >= 0 || $quantity_discount.reduction_type == 'amount'}
										{$discountPrice=$productPrice-$quantity_discount.real_value|floatval}
									{else}
										{$discountPrice=$productPrice-($productPrice*$quantity_discount.reduction)|floatval}
									{/if}
									{$discountPrice=$discountPrice*$quantity_discount.quantity}
									{$qtyProductPrice = $productPrice*$quantity_discount.quantity}
									{convertPrice price=$qtyProductPrice-$discountPrice}
								</td>
							</tr>
							{/foreach}
						</tbody>
					</table>
				</div>
			</section>
		{/if}
		{if true}
					<!-- Lee added -->
<!--			<div class = "row">
					<div id="homepage-slider">
						{if isset($homeslider_slides.0) && isset($homeslider_slides.0.sizes.1)}{capture name='height'}{$homeslider_slides.0.sizes.1}{/capture}{/if}
						<ul id="homeslider"{if isset($smarty.capture.height) && $smarty.capture.height} style="max-height:{$smarty.capture.height}px;"{/if}>
							{foreach from=$homeslider_slides item=slide}
								{if $slide.active}
									<li class="homeslider-container">
										<a href="{$slide.url|escape:'html':'UTF-8'}" title="{$slide.legend|escape:'html':'UTF-8'}">
											<img src="{$link->getMediaLink("`$smarty.const._MODULE_DIR_`homeslider/images/`$slide.image|escape:'htmlall':'UTF-8'`")}"{if isset($slide.size) && $slide.size} {$slide.size}{else} width="100%" height="100%"{/if} alt="{$slide.legend|escape:'htmlall':'UTF-8'}" />
										</a>
										{if isset($slide.description) && trim($slide.description) != ''}
											<div class="homeslider-description">{$slide.description}</div>
										{/if}
									</li>
								{/if}
							{/foreach}
						</ul>
					</div>
			</div>
-->
			<div style = "position:absolute;top:30px;right:50px;width:300px;color: white;font-weight: bold" class = "row no_row">
					<!--- name --->
					<div>
					<h1 style ="text-transform: uppercase;text-align: right; font-size:30px; color:{$product->product_name_color}">{$product->brand_name|escape:'html':'UTF-8'}</h1>
					<h2 style ="text-transform: uppercase;text-align: right;font-size:20px; color:{$product->product_name_color}"">{$product->name|escape:'html':'UTF-8'}</h2>
					</div>
					<!-- prices -->
					<div class="price" style = "background-color:#29abe2;border-top-right-radius: 90px;height: 80px; border:solid 2px #c2cbb4;margin-bottom:2px;color: white;" >
					<span id = "our_price" style="color:white;font-size:40px;padding-left:10px; position:relative; top:20px; "></span>
					<!-- shipping -->	
					<div style="font-size:20px; padding:10px; position:relative; top:10px">+ <span id = "shipping_cost"  > {$product->shipping_1} </span><span> of shipping</span>
							<span class="text-center" id = "catalog_hint" onMouseOver = "$(this).attr('title', 'This is the Iran catalog price');" style="border-radius:50%;border:solid 1px white;position:absolute;right:10px; cursor:pointer;
							width:18px;height:18px">i</span>
							</div>
					</div> <!-- end prices -->
					<!--- market price-->
					<div style = "background-color: #0071bc; border-bottom-left-radius: 90px;position:relative; height: 60px; z-index:2;border:solid 2px #c2cbb4" class="price">
						<div style="color:white;font-size:15px;padding-left:50px;top:5px;position:relative;"> Catalog price
							<span id = "catalog_price"  > </span>
							<span class="text-center" id = "catalog_hint" onMouseOver = "$(this).attr('title', 'This is the Iran catalog price');" style="border-radius:50%;border:solid 1px white;position:absolute;right:10px; cursor:pointer;
							width:18px;height:18px">i</span>
							</div>
						<div style="color:white;font-size:15px;padding-left:50px;top:5px;position:relative;">Market price 
							<span id = "market_price"  > {$product->market_price} </span>
							<span class="text-center" id = "market_hint" onMouseOver = "$(this).attr('title', 'This is the Iran market price');" style="border-radius:50%;border:solid 1px white;position:absolute;right:10px; cursor:pointer;
							width:18px;height:18px">i</span>							
							</div>
					</div>
					<!--- end of market price--->
					<!--- great I want it --->
					<div style = "background-color: #ed1c24;height: 120px; top:-60px;position:relative; z-index:1; padding-top: 65px;text-align: center;font-size: 30px;color:white ; border:solid 2px #c2cbb4">
					<!-- pb-right-column-->

					{if ($product->show_price && !isset($restricted_country_mode)) || isset($groups) || $product->reference || (isset($HOOK_PRODUCT_ACTIONS) && $HOOK_PRODUCT_ACTIONS)}
					<!-- add to cart form-->
					<form id="buy_block"{if $PS_CATALOG_MODE && !isset($groups) && $product->quantity > 0} class="hidden"{/if} action="{$link->getPageLink('cart')|escape:'html':'UTF-8'}" method="post">
						<!-- hidden datas -->
						<p class="hidden">
							<input type="hidden" name="token" value="{$static_token}" />
							<input type="hidden" name="id_product" value="{$product->id|intval}" id="product_page_product_id" />
							<input type="hidden" name="add" value="1" />
							<input type="hidden" name="id_product_attribute" id="idCombination" value="" />
						</p>
							
								<div {if (!$allow_oosp && $product->quantity <= 0) || !$product->available_for_order || (isset($restricted_country_mode) && $restricted_country_mode) || $PS_CATALOG_MODE} class="unvisible"{/if}>
										<button type="submit" name="Submit" style = "color:white; background-color:Transparent; background-repeat:no-repeat; border: none;cursor:pointer;overflow: hidden;outline:none;padding:10px">
											{if $content_only && (isset($product->customization_required) && $product->customization_required)}{l s='Customize'}{else}{l s='Great, I want it!'}{/if}
										</button>
								</div>
							</form>
					{/if}
		<!-- end pb-right-column-->
				<!--	<a href = "{$link->getPageLink('leepurchase', true)|escape:'html':'UTF-8'}&id_product={Tools::getValue('id_product')}" style = "color:white"> Great,I want it</a>
				-->
					</div>
					<!--- end great I want it --->
					<!-- refer -->
					<div style = "height: 50px; top:-40px;position:relative; z-index:1; padding-top: 1px;text-align: center;font-size: 20px;color:red">
					<img style="margin:10px" height= 47px src = "../../img/red_refer.png" />
					<a href = "{$link->getPageLink('leepurchase', true)|escape:'html':'UTF-8'}&id_product={Tools::getValue('id_product')}" style = "color:#ed1c24"> {$product->refferal_value} for each referral</a>
					</div>
					<!-- end reefer -->
			</div>
			<div class = "row no_row">
			<!-- Bootrap Lee -->
			<div role="tabpanel" class="col-xs-12">
							  <!-- Nav tabs -->
				<div class="row no_row">
				<div class="col-md-3"></div>
				<div class="col-md-6">

					<ul id="presentation_ul" class="nav text-center nav-tabs col-xs-12" style="border:none;" role="tablist">
						<li role="presentation" class="active col-md-4">
							<a id = "cc" href="#word-of-day" aria-controls="word-of-day" role="tab" data-toggle="tab" 
							onMouseOver="this.style.backgroundColor='#FFFFFF)'" 
							onMouseOut="this.style.backgroundColor='#FFFFFF'" >Word of Day</a></li>
						<li role="presentation"  class="col-md-4">
						<a href="#product-details" aria-controls="product-details" role="tab" data-toggle="tab" onMouseOver="this.style.backgroundColor='#FFFFFF'" 
							onMouseOut="this.style.backgroundColor='#FFFFFF'">Product Details</a></li>
						<li role="presentation"  class="col-md-4">
						<a href="#comments" aria-controls="comments" role="tab" data-toggle="tab"
							onMouseOver="this.style.backgroundColor='#FFFFFF'" 
							onMouseOut="this.style.backgroundColor='#FFFFFF'">Comments</a></li>
					  </ul>
				   </div>
				  <div class="col-md-3"></div>
				  </div>
				<!---
				  <ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active">
						<a style="border: solid 1px #0000FF;border-bottom-right-radius: 30px;z-index:3;
						background-color:#FFFFFF" href="#word-of-day" aria-controls="word-of-day" role="tab" data-toggle="tab" 
						onMouseOver="this.style.backgroundColor='#0000FF'" 
						onMouseOut="this.style.backgroundColor='#FFFFFF'">Word of day</a></li>
					<li role="presentation">
					<a style="border-left: none;border-right: solid 1px #0000FF;border-top: solid 1px #0000FF;z-index:2;border-bottom: solid 1px #0000FF;border-bottom-right-radius:30px; left:-30px; padding-left:30px;background-color:#FFFFFF"href="#product-details" aria-controls="product-details" role="tab" data-toggle="tab" onMouseOver="this.style.backgroundColor='#0000FF'" 
						onMouseOut="this.style.backgroundColor='#FFFFFF'">Product Details</a></li>
					<li role="presentation">
					<a style="border-left: none;border-right: solid 1px #0000FF;border-top: solid 1px #0000FF; z-index:1;border-bottom: solid 1px #0000FF;border-bottom-right-radius:30px; left:-60px; padding-left:30px;background-color:#FFFFFF"href="#comments" aria-controls="comments" role="tab" data-toggle="tab"
						onMouseOver="this.style.backgroundColor='#0000FF'" 
						onMouseOut="this.style.backgroundColor='#FFFFFF'">Comments</a></li>
				  </ul>
				--->
				  <!-- Tab panes -->
				  <div class="tab-content col-xs-6">
					<div role="tabpanel" class="tab-pane active"  id="word-of-day">
								{if $product->description_short || $packItems|@count > 0}
									<div id="short_description_block">
										{if $product->description_short}
											<div id="short_description_content" class="rte align_justify" itemprop="description">{$product->description_short}</div>
										{/if}

										<!--{if $packItems|@count > 0}
											<div class="short_description_pack">
											<h3>{l s='Pack content'}</h3>
												{foreach from=$packItems item=packItem}

												<div class="pack_content">
													{$packItem.pack_quantity} x <a href="{$link->getProductLink($packItem.id_product, $packItem.link_rewrite, $packItem.category)|escape:'html':'UTF-8'}">{$packItem.name|escape:'html':'UTF-8'}</a>
													<p>{$packItem.description_short}</p>
												</div>
												{/foreach}
											</div>
										{/if}-->
									</div> <!-- end short_description_block -->
								{/if}
					</div>
					<div role="tabpanel" class="tab-pane" id="product-details">
							{if $product->description}
							<!-- More info -->
							<section class="page-product-box">
								{if isset($product) && $product->description}
									<!-- full description -->
									<div  class="rte">{$product->description}</div>
								{/if}
							</section>
							<!--end  More info -->
						{/if}
					</div>
					<div role="tabpanel" class="tab-pane" id="comments">
						<div id="product_comments_block_tab">
							<div class="row no_row">
								<hr />
							</div>
							{if isset($HOOK_PRODUCT_TITAN_COMMENTS)  && $HOOK_PRODUCT_TITAN_COMMENTS} {$HOOK_PRODUCT_TITAN_COMMENTS} {/if}
							{if $comments}
								{foreach from=$comments item=comment}
									{if $comment.content}
									<div class="comment row no_row" itemprop="review" itemscope itemtype="http://schema.org/Review">
										<div class="comment_author col-sm-2">
											<div class="comment_author_infos">
												<strong itemprop="author">{$comment.customer_name|escape:'html':'UTF-8'}</strong>

											</div>
										</div> <!-- .comment_author -->

										<div class="comment_details col-sm-10">
											<p itemprop="reviewBody">{$comment.content|escape:'html':'UTF-8'|nl2br}</p>
												<meta itemprop="datePublished" content="{$comment.date_add|escape:'html':'UTF-8'|substr:0:10}" />
												<em>{dateFormat date=$comment.date_add|escape:'html':'UTF-8' full=0}</em>
											<ul>
												{if $comment.total_advice > 0}
													<li>
														<!-- voting markup -->
														<div class="voting_wrapper" id="XXXXXXX">
														    <div class="voting_btn">
														        <div class="up_button">&nbsp;</div><span class="up_votes">{$comment.total_useful}</span>
														    </div>
														    <div class="voting_btn">
														        <div class="down_button">&nbsp;</div><span class="down_votes">{$comment.total_advice-$comment.total_useful}</span>
														    </div>
														</div>
														<!-- voting markup end -->
													</li>
												{/if}
												{if $is_logged}
													{if !$comment.customer_advice}
													<li>
														<button class="usefulness_btn btn btn-default button button-small" data-is-usefull="1" data-id-product-comment="{$comment.id_product_comment}">
															<span>{l s='Up' mod='productcomments'}</span>
														</button>
														<button class="usefulness_btn btn btn-default button button-small" data-is-usefull="0" data-id-product-comment="{$comment.id_product_comment}">
															<span>{l s='Down' mod='productcomments'}</span>
														</button>
													</li>
													{/if}
													{if !$comment.customer_report}
													<li>
														<span class="report_btn" data-id-product-comment="{$comment.id_product_comment}">
															{l s='Report abuse' mod='productcomments'}
														</span>
													</li>
													{/if}
												{/if}
											</ul>
										</div><!-- .comment_details -->

									</div> <!-- .comment -->
									{/if}
								{/foreach}
								
							{else}
								
								<p class="align_center">{l s='No customer comments for the moment.' mod='productcomments'}</p>
								
							{/if}
						</div> <!-- #product_comments_block_tab -->
					</div>
					
				  </div>
				<div class="col-xs-6">
					<div style="background-color:#ed1c24;height:100px;border-top-left-radius:90px;padding-left: 50px; font-size:25px;margin: 10px; color:white">
						<img style="margin:10px" height= 70px src = "../../img/email.png" />
						<input type = "text" style="margin:10px" value = "{if $logged} {Context::getContext()->customer->email}{else}Send us an email
						{/if}"
						>
						</div>
					<div style="background-color:#ed1c24;height:100px;border-top-left-radius:90px;padding-left: 50px; font-size:25px;margin: 10px; color:white"> 	<img style="margin:10px" height= 70px src = "../../img/tellus.png" />Tell us what you want </div>
					<div style="background-color:#ed1c24;height:100px;border-top-left-radius:90px;padding-left: 50px; font-size:25px;margin: 10px; color:white">  <img style="margin:10px" height= 70px src = "../../img/refer.png" />Refer friends to earn value</div>
					<div style="background-color:whtie;height:100px;border-top-left-radius:90px;padding-left: 50px; font-size:25px;margin: 10px; color:#ed1c24;
					border:solid 2px #ed1c24"> <img style="margin:10px" height= 70px src = "../../img/enamad.png" />eNamad Certificated website</div>
				</div>
				<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
				
				<!-- Include all compiled plugins (below), or include individual files as needed -->
				
				</div>
						<!-- end bootrap Lee-->
			</div>
			<!-- end Lee added -->
		{/if}

		{if isset($accessories) && $accessories}
			<!--Accessories -->
			<section class="page-product-box">
				<h3 class="page-product-heading">{l s='Accessories'}</h3>
				<div class="block products_block accessories-block clearfix">
					<div class="block_content">
						<ul id="bxslider" class="bxslider clearfix">
							{foreach from=$accessories item=accessory name=accessories_list}
								{if ($accessory.allow_oosp || $accessory.quantity_all_versions > 0 || $accessory.quantity > 0) && $accessory.available_for_order && !isset($restricted_country_mode)}
									{assign var='accessoryLink' value=$link->getProductLink($accessory.id_product, $accessory.link_rewrite, $accessory.category)}
									<li class="item product-box ajax_block_product{if $smarty.foreach.accessories_list.first} first_item{elseif $smarty.foreach.accessories_list.last} last_item{else} item{/if} product_accessories_description">
										<div class="product_desc">
											<a href="{$accessoryLink|escape:'html':'UTF-8'}" title="{$accessory.legend|escape:'html':'UTF-8'}" class="product-image product_image">
												<img class="lazyOwl" src="{$link->getImageLink($accessory.link_rewrite, $accessory.id_image, 'home_default')|escape:'html':'UTF-8'}" alt="{$accessory.legend|escape:'html':'UTF-8'}" width="{$homeSize.width}" height="{$homeSize.height}"/>
											</a>
											<div class="block_description">
												<a href="{$accessoryLink|escape:'html':'UTF-8'}" title="{l s='More'}" class="product_description">
													{$accessory.description_short|strip_tags|truncate:25:'...'}
												</a>
											</div>
										</div>
										<div class="s_title_block">
											<h5 class="product-name">
												<a href="{$accessoryLink|escape:'html':'UTF-8'}">
													{$accessory.name|truncate:20:'...':true|escape:'html':'UTF-8'}
												</a>
											</h5>
											{if $accessory.show_price && !isset($restricted_country_mode) && !$PS_CATALOG_MODE}
											<span class="price">
												{if $priceDisplay != 1}
												{displayWtPrice p=$accessory.price}{else}{displayWtPrice p=$accessory.price_tax_exc}
												{/if}
											</span>
											{/if}
										</div>
										<div class="clearfix" style="margin-top:5px">
											{if !$PS_CATALOG_MODE && ($accessory.allow_oosp || $accessory.quantity > 0)}
												<div class="no-print">
													<a class="exclusive button ajax_add_to_cart_button" href="{$link->getPageLink('cart', true, NULL, "qty=1&amp;id_product={$accessory.id_product|intval}&amp;token={$static_token}&amp;add")|escape:'html':'UTF-8'}" data-id-product="{$accessory.id_product|intval}" title="{l s='Add to cart'}">
														<span>{l s='Add to cart'}</span>
													</a>
												</div>
											{/if}
										</div>
									</li>
								{/if}
							{/foreach}
						</ul>
					</div>
				</div>
			</section>
			<!--end Accessories -->
		{/if}
		{if isset($HOOK_PRODUCT_FOOTER) && $HOOK_PRODUCT_FOOTER}{$HOOK_PRODUCT_FOOTER}{/if}
		<!-- description & features -->
		{if (isset($product) && $product->description) || (isset($features) && $features) || (isset($accessories) && $accessories) || (isset($HOOK_PRODUCT_TAB) && $HOOK_PRODUCT_TAB) || (isset($attachments) && $attachments) || isset($product) && $product->customizable}
			{if isset($attachments) && $attachments}
			<!--Download -->
			<section class="page-product-box">
				<h3 class="page-product-heading">{l s='Download'}</h3>
				{foreach from=$attachments item=attachment name=attachements}
					{if $smarty.foreach.attachements.iteration %3 == 1}<div class="row no_row">{/if}
						<div class="col-lg-4">
							<h4><a href="{$link->getPageLink('attachment', true, NULL, "id_attachment={$attachment.id_attachment}")|escape:'html':'UTF-8'}">{$attachment.name|escape:'html':'UTF-8'}</a></h4>
							<p class="text-muted">{$attachment.description|escape:'html':'UTF-8'}</p>
							<a class="btn btn-default btn-block" href="{$link->getPageLink('attachment', true, NULL, "id_attachment={$attachment.id_attachment}")|escape:'html':'UTF-8'}">
								<i class="icon-download"></i>
								{l s="Download"} ({Tools::formatBytes($attachment.file_size, 2)})
							</a>
							<hr />
						</div>
					{if $smarty.foreach.attachements.iteration %3 == 0 || $smarty.foreach.attachements.last}</div>{/if}
				{/foreach}
			</section>
			<!--end Download -->
			{/if}
			{if isset($product) && $product->customizable}
			<!--Customization -->
			<section class="page-product-box">
				<h3 class="page-product-heading">{l s='Product customization'}</h3>
				<!-- Customizable products -->
				<form method="post" action="{$customizationFormTarget}" enctype="multipart/form-data" id="customizationForm" class="clearfix">
					<p class="infoCustomizable">
						{l s='After saving your customized product, remember to add it to your cart.'}
						{if $product->uploadable_files}
						<br />
						{l s='Allowed file formats are: GIF, JPG, PNG'}{/if}
					</p>
					{if $product->uploadable_files|intval}
						<div class="customizableProductsFile">
							<h5 class="product-heading-h5">{l s='Pictures'}</h5>
							<ul id="uploadable_files" class="clearfix">
								{counter start=0 assign='customizationField'}
								{foreach from=$customizationFields item='field' name='customizationFields'}
									{if $field.type == 0}
										<li class="customizationUploadLine{if $field.required} required{/if}">{assign var='key' value='pictures_'|cat:$product->id|cat:'_'|cat:$field.id_customization_field}
											{if isset($pictures.$key)}
												<div class="customizationUploadBrowse">
													<img src="{$pic_dir}{$pictures.$key}_small" alt="" />
														<a href="{$link->getProductDeletePictureLink($product, $field.id_customization_field)|escape:'html':'UTF-8'}" title="{l s='Delete'}" >
															<img src="{$img_dir}icon/delete.gif" alt="{l s='Delete'}" class="customization_delete_icon" width="11" height="13" />
														</a>
												</div>
											{/if}
											<div class="customizationUploadBrowse form-group">
												<label class="customizationUploadBrowseDescription">
													{if !empty($field.name)}
														{$field.name}
													{else}
														{l s='Please select an image file from your computer'}
													{/if}
													{if $field.required}<sup>*</sup>{/if}
												</label>
												<input type="file" name="file{$field.id_customization_field}" id="img{$customizationField}" class="form-control customization_block_input {if isset($pictures.$key)}filled{/if}" />
											</div>
										</li>
										{counter}
									{/if}
								{/foreach}
							</ul>
						</div>
					{/if}
					{if $product->text_fields|intval}
						<div class="customizableProductsText">
							<h5 class="product-heading-h5">{l s='Text'}</h5>
							<ul id="text_fields">
							{counter start=0 assign='customizationField'}
							{foreach from=$customizationFields item='field' name='customizationFields'}
								{if $field.type == 1}
									<li class="customizationUploadLine{if $field.required} required{/if}">
										<label for ="textField{$customizationField}">
											{assign var='key' value='textFields_'|cat:$product->id|cat:'_'|cat:$field.id_customization_field}
											{if !empty($field.name)}
												{$field.name}
											{/if}
											{if $field.required}<sup>*</sup>{/if}
										</label>
										<textarea name="textField{$field.id_customization_field}" class="form-control customization_block_input" id="textField{$customizationField}" rows="3" cols="20">{strip}
											{if isset($textFields.$key)}
												{$textFields.$key|stripslashes}
											{/if}
										{/strip}</textarea>
									</li>
									{counter}
								{/if}
							{/foreach}
							</ul>
						</div>
					{/if}
					<p id="customizedDatas">
						<input type="hidden" name="quantityBackup" id="quantityBackup" value="" />
						<input type="hidden" name="submitCustomizedDatas" value="1" />
						<button class="button btn btn-default button button-small" name="saveCustomization">
							<span>{l s='Save'}</span>
						</button>
						<span id="ajax-loader" class="unvisible">
							<img src="{$img_ps_dir}loader.gif" alt="loader" />
						</span>
					</p>
				</form>
				<p class="clear required"><sup>*</sup> {l s='required fields'}</p>
			</section>
			<!--end Customization -->
			{/if}
		{/if}
		{if isset($packItems) && $packItems|@count > 0}
		<section id="blockpack">
			<h3 class="page-product-heading">{l s='Pack content'}</h3>
			{include file="$tpl_dir./product-list.tpl" products=$packItems}
		</section>
		{/if}
	{/if}
</div> <!-- itemscope product wrapper -->
{strip}
{if isset($smarty.get.ad) && $smarty.get.ad}
	{addJsDefL name=ad}{$base_dir|cat:$smarty.get.ad|escape:'html':'UTF-8'}{/addJsDefL}
{/if}
{if isset($smarty.get.adtoken) && $smarty.get.adtoken}
	{addJsDefL name=adtoken}{$smarty.get.adtoken|escape:'html':'UTF-8'}{/addJsDefL}
{/if}
{addJsDef allowBuyWhenOutOfStock=$allow_oosp|boolval}
{addJsDef availableNowValue=$product->available_now|escape:'quotes':'UTF-8'}
{addJsDef availableLaterValue=$product->available_later|escape:'quotes':'UTF-8'}
{addJsDef attribute_anchor_separator=$attribute_anchor_separator|escape:'quotes':'UTF-8'}
{addJsDef attributesCombinations=$attributesCombinations}
{addJsDef currencySign=$currencySign|html_entity_decode:2:"UTF-8"}
{addJsDef currencyRate=$currencyRate|floatval}
{addJsDef currencyFormat=$currencyFormat|intval}
{addJsDef currencyBlank=$currencyBlank|intval}
{addJsDef currentDate=$smarty.now|date_format:'%Y-%m-%d %H:%M:%S'}
{if isset($combinations) && $combinations}
	{addJsDef combinations=$combinations}
	{addJsDef combinationsFromController=$combinations}
	{addJsDef displayDiscountPrice=$display_discount_price}
	{addJsDefL name='upToTxt'}{l s='Up to' js=1}{/addJsDefL}
{/if}
{if isset($combinationImages) && $combinationImages}
	{addJsDef combinationImages=$combinationImages}
{/if}
{addJsDef customizationFields=$customizationFields}
{addJsDef default_eco_tax=$product->ecotax|floatval}
{addJsDef displayPrice=$priceDisplay|intval}
{addJsDef ecotaxTax_rate=$ecotaxTax_rate|floatval}
{addJsDef group_reduction=$group_reduction}
{if isset($cover.id_image_only)}
	{addJsDef idDefaultImage=$cover.id_image_only|intval}
{else}
	{addJsDef idDefaultImage=0}
{/if}
{addJsDef img_ps_dir=$img_ps_dir}
{addJsDef img_prod_dir=$img_prod_dir}
{addJsDef id_product=$product->id|intval}
{addJsDef jqZoomEnabled=$jqZoomEnabled|boolval}
{addJsDef maxQuantityToAllowDisplayOfLastQuantityMessage=$last_qties|intval}
{addJsDef minimalQuantity=$product->minimal_quantity|intval}
{addJsDef noTaxForThisProduct=$no_tax|boolval}
{addJsDef customerGroupWithoutTax=$customer_group_without_tax|boolval}
{addJsDef oosHookJsCodeFunctions=Array()}
{addJsDef productHasAttributes=isset($groups)|boolval}
{addJsDef productPriceTaxExcluded=($product->getPriceWithoutReduct(true)|default:'null' - $product->ecotax)|floatval}
{addJsDef productBasePriceTaxExcluded=($product->base_price - $product->ecotax)|floatval}
{addJsDef productBasePriceTaxExcl=($product->base_price|floatval)}
{addJsDef productReference=$product->reference|escape:'html':'UTF-8'}
{addJsDef productAvailableForOrder=$product->available_for_order|boolval}
{addJsDef productPriceWithoutReduction=$productPriceWithoutReduction|floatval}
{addJsDef productPrice=$productPrice|floatval}
{addJsDef productUnitPriceRatio=$product->unit_price_ratio|floatval}
{addJsDef productShowPrice=(!$PS_CATALOG_MODE && $product->show_price)|boolval}
{addJsDef PS_CATALOG_MODE=$PS_CATALOG_MODE}
{if $product->specificPrice && $product->specificPrice|@count}
	{addJsDef product_specific_price=$product->specificPrice}
{else}
	{addJsDef product_specific_price=array()}
{/if}
{if $display_qties == 1 && $product->quantity}
	{addJsDef quantityAvailable=$product->quantity}
{else}
	{addJsDef quantityAvailable=0}
{/if}
{addJsDef quantitiesDisplayAllowed=$display_qties|boolval}
{if $product->specificPrice && $product->specificPrice.reduction && $product->specificPrice.reduction_type == 'percentage'}
	{addJsDef reduction_percent=$product->specificPrice.reduction*100|floatval}
{else}
	{addJsDef reduction_percent=0}
{/if}
{if $product->specificPrice && $product->specificPrice.reduction && $product->specificPrice.reduction_type == 'amount'}
	{addJsDef reduction_price=$product->specificPrice.reduction|floatval}
{else}
	{addJsDef reduction_price=0}
{/if}
{if $product->specificPrice && $product->specificPrice.price}
	{addJsDef specific_price=$product->specificPrice.price|floatval}
{else}
	{addJsDef specific_price=0}
{/if}
{addJsDef specific_currency=($product->specificPrice && $product->specificPrice.id_currency)|boolval} {* TODO: remove if always false *}
{addJsDef stock_management=$stock_management|intval}
{addJsDef taxRate=$tax_rate|floatval}
{addJsDefL name=doesntExist}{l s='This combination does not exist for this product. Please select another combination.' js=1}{/addJsDefL}
{addJsDefL name=doesntExistNoMore}{l s='This product is no longer in stock' js=1}{/addJsDefL}
{addJsDefL name=doesntExistNoMoreBut}{l s='with those attributes but is available with others.' js=1}{/addJsDefL}
{addJsDefL name=fieldRequired}{l s='Please fill in all the required fields before saving your customization.' js=1}{/addJsDefL}
{addJsDefL name=uploading_in_progress}{l s='Uploading in progress, please be patient.' js=1}{/addJsDefL}
{addJsDefL name='product_fileDefaultHtml'}{l s='No file selected' js=1}{/addJsDefL}
{addJsDefL name='product_fileButtonHtml'}{l s='Choose File' js=1}{/addJsDefL}
{/strip}
{/if}


