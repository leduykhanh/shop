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

<script type="text/javascript">
var Customer = new Object();
var product_url = '{$link->getAdminLink('AdminProducts', true)|addslashes}';
var ecotax_tax_excl = parseFloat({$ecotax_tax_excl});
var priceDisplayPrecision = {$smarty.const._PS_PRICE_DISPLAY_PRECISION_|intval};

$(document).ready(function () {
	Customer = {
		"hiddenField": jQuery('#id_customer'),
		"field": jQuery('#customer'),
		"container": jQuery('#customers'),
		"loader": jQuery('#customerLoader'),
		"init": function() {
			jQuery(Customer.field).typeWatch({
				"captureLength": 1,
				"highlight": true,
				"wait": 50,
				"callback": Customer.search
			}).focus(Customer.placeholderIn).blur(Customer.placeholderOut);
		},
		"placeholderIn": function() {
			if (this.value == '{l s='All customers'}') {
				this.value = '';
			}
		},
		"placeholderOut": function() {
			if (this.value == '') {
				this.value = '{l s='All customers'}';
			}
		},
		"search": function()
		{
			Customer.showLoader();
			jQuery.ajax({
				"type": "POST",
				"url": "{$link->getAdminLink('AdminCustomers')|addslashes}",
				"async": true,
				"dataType": "json",
				"data": {
					"ajax": "1",
					"token": "{getAdminToken tab='AdminCustomers'}",
					"tab": "AdminCustomers",
					"action": "searchCustomers",
					"customer_search": Customer.field.val()
				},
				"success": Customer.success
			});
		},
		"success": function(result)
		{
			if(result.found) {
				var html = '<ul class="list-unstyled">';
				jQuery.each(result.customers, function() {
					html += '<li><a class="fancybox" href="{$link->getAdminLink('AdminCustomers')}&id_customer='+this.id_customer+'&viewcustomer&liteDisplaying=1">'+this.firstname+' '+this.lastname+'</a>'+(this.birthday ? ' - '+this.birthday:'');
					html += ' - '+this.email;
					html += '<a onclick="Customer.select('+this.id_customer+', \''+this.firstname+' '+this.lastname+'\'); return false;" href="#" class="btn btn-default">{l s='Choose'}</a></li>';
				});
				html += '</ul>';
			}
			else
				html = '<div class="alert alert-warning">{l s='No customers found'}</div>';
			Customer.hideLoader();
			Customer.container.html(html);
			jQuery('.fancybox', Customer.container).fancybox();
		},
		"select": function(id_customer, fullname)
		{
			Customer.hiddenField.val(id_customer);
			Customer.field.val(fullname);
			Customer.container.empty();
			return false;
		},
		"showLoader": function() {
			Customer.loader.fadeIn();
		},
		"hideLoader": function() {
			Customer.loader.fadeOut();
		}
	};
	Customer.init();
});
</script>
{capture assign=priceDisplayPrecisionFormat}{'%.'|cat:$smarty.const._PS_PRICE_DISPLAY_PRECISION_|cat:'f'}{/capture}
<div id="product-prices" class="panel product-tab">
	<input type="hidden" name="submitted_tabs[]" value="Prices" />
	<h3>{l s='Product price'}</h3>
	{include file="controllers/products/multishop/check_fields.tpl" product_tab="Prices"}
	<div class="form-group">
		<div class="col-lg-1"><span class="pull-right">{include file="controllers/products/multishop/checkbox.tpl" field="price" type="default"}</span></div>
		<label class="control-label col-lg-2" for="our_price">
			<span class="label-tooltip" data-toggle="tooltip" title="{l s='Our Price'}">
			{l s='Our price'}
		</label>
		<div class="input-group col-lg-2">
			<span class="input-group-addon">{$currency->prefix}{$currency->suffix}</span>
			<input maxlength="14" id="our_price" name="our_price" type="text" value="{{$product->our_price}}"/>
		</div>
	</div>
	<!-- lee --->
	<div class="form-group">
		<div class="col-lg-1"><span class="pull-right">{include file="controllers/products/multishop/checkbox.tpl" field="catalog_price" type="default"}</span></div>
		<label class="control-label col-lg-2" for="catalog_price">
			<span class="label-tooltip" data-toggle="tooltip" title="{l s='The Catalog Price'}">
			{l s='Catalog price'}</span>
		</label>
		<div class="input-group col-lg-2">
			<span class="input-group-addon">{$currency->prefix}{$currency->suffix}</span>
			<input maxlength="14" name="catalog_price" id="catalog_price" type="text" value="{{$product->catalog_price}}" onchange="this.value = this.value.replace(/,/g, '.');" />
		</div>
	</div>
	<div class="form-group">
		<div class="col-lg-1"><span class="pull-right">{include file="controllers/products/multishop/checkbox.tpl" field="market_price" type="default"}</span></div>
		<label class="control-label col-lg-2" for="market_price">
			<span class="label-tooltip" data-toggle="tooltip" title="{l s='Market price'}">
			{l s='Market price'}</span>
		</label>
		<div class="input-group col-lg-2">
			<span class="input-group-addon">{$currency->prefix}{$currency->suffix}</span>
			<input maxlength="14" name="market_price" id="market_price" type="text" value="{{$product->market_price}}" onchange="this.value = this.value.replace(/,/g, '.');" />
		</div>
	</div>
	<div class="form-group">
		<div class="col-lg-1"><span class="pull-right">{include file="controllers/products/multishop/checkbox.tpl" field="refferal_value" type="default"}</span></div>
		<label class="control-label col-lg-2" for="refferal_value">
			<span class="label-tooltip" data-toggle="tooltip" title="{l s='The Catalog Price'}">
			{l s='Referral value'}</span>
		</label>
		<div class="input-group col-lg-2">
			<span class="input-group-addon">{$currency->prefix}{$currency->suffix}</span>
			<input maxlength="14" name="refferal_value" id="refferal_value" type="text" value="{{$product->refferal_value}}" onchange="this.value = this.value.replace(/,/g, '.');" />
		</div>
	</div>
	<!-- lee --->

	</div>

	</div>

	<div class="panel-footer">
		<a href="{$link->getAdminLink('AdminProducts')|escape:'html':'UTF-8'}" class="btn btn-default"><i class="process-icon-cancel"></i> {l s='Cancel'}</a>
		<button type="submit" name="submitAddproduct" class="btn btn-default pull-right"><i class="process-icon-save"></i> {l s='Save'}</button>
		<button type="submit" name="submitAddproductAndStay" class="btn btn-default pull-right"><i class="process-icon-save"></i> {l s='Save and stay'}</button>
	</div>
</div>
{if isset($specificPriceModificationForm)}
<div class="panel" style="display:none">
	<h3>{l s='Specific prices'}</h3>
	<div class="alert alert-info">
		{l s='You can set specific prices for clients belonging to different groups, different countries, etc.'}
	</div>
	<div class="form-group">
		<div class="col-lg-12">
			<a class="btn btn-default" href="#" id="show_specific_price">
				<i class="icon-plus-sign"></i> {l s='Add a new specific price'}
			</a>
			<a class="btn btn-default" href="#" id="hide_specific_price" style="display:none">
				<i class="icon-remove text-danger"></i> {l s='Cancel new specific price'}
			</a>
		</div>
	</div>
	<script type="text/javascript">
		var product_prices = new Array();
		{foreach from=$combinations item='combination'}
			product_prices['{$combination.id_product_attribute}'] = '{$combination.price|@addcslashes:'\''}';
		{/foreach}
	</script>
	<div id="add_specific_price" class="well clearfix" style="display: none;">
		<div class="col-lg-12">
			<div class="form-group">
				<label class="control-label col-lg-2" for="{if !$multi_shop}spm_currency_0{else}sp_id_shop{/if}">{l s='For'}</label>
				<div class="col-lg-9">
					<div class="row">
					{if !$multi_shop}
						<input type="hidden" name="sp_id_shop" value="0" />
					{else}
						<div class="col-lg-3">
							<select name="sp_id_shop" id="sp_id_shop">
								{if !$admin_one_shop}<option value="0">{l s='All shops'}</option>{/if}
								{foreach from=$shops item=shop}
								<option value="{$shop.id_shop}">{$shop.name|htmlentitiesUTF8}</option>
								{/foreach}
							</select>
						</div>
					{/if}
						<div class="col-lg-3">
							<select name="sp_id_currency" id="spm_currency_0" onchange="changeCurrencySpecificPrice(0);">
								<option value="0">{l s='All currencies'}</option>
								{foreach from=$currencies item=curr}
								<option value="{$curr.id_currency}">{$curr.name|htmlentitiesUTF8}</option>
								{/foreach}
							</select>
						</div>
						<div class="col-lg-3">
							<select name="sp_id_country" id="sp_id_country">
								<option value="0">{l s='All countries'}</option>
								{foreach from=$countries item=country}
								<option value="{$country.id_country}">{$country.name|htmlentitiesUTF8}</option>
								{/foreach}
							</select>
						</div>
						<div class="col-lg-3">
							<select name="sp_id_group" id="sp_id_group">
								<option value="0">{l s='All groups'}</option>
								{foreach from=$groups item=group}
								<option value="{$group.id_group}">{$group.name}</option>
								{/foreach}
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-lg-2" for="sp_from">{l s='Available'}</label>
				<div class="col-lg-9">
					<div class="row">
						<div class="col-lg-4">
							<div class="input-group">
								<span class="input-group-addon">{l s='from'}</span>
								<input type="text" name="sp_from" class="datepicker" value="" style="text-align: center" id="sp_from" />
								<span class="input-group-addon"><i class="icon-calendar-empty"></i></span>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="input-group">
								<span class="input-group-addon">{l s='to'}</span>
								<input type="text" name="sp_to" class="datepicker" value="" style="text-align: center" id="sp_to" />
								<span class="input-group-addon"><i class="icon-calendar-empty"></i></span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			product_prices['0'] = $('#sp_current_ht_price').html();
			$('#id_product_attribute').change(function() {
				$('#sp_current_ht_price').html(product_prices[$('#id_product_attribute option:selected').val()]);
			});
			$('#leave_bprice').click(function() {
				if (this.checked)
					$('#sp_price').attr('disabled', 'disabled');
				else
					$('#sp_price').removeAttr('disabled');
			});
			$('.datepicker').datetimepicker({
				prevText: '',
				nextText: '',
				dateFormat: 'yy-mm-dd',
				// Define a custom regional settings in order to use PrestaShop translation tools
				currentText: '{l s='Now'}',
				closeText: '{l s='Done'}',
				ampm: false,
				amNames: ['AM', 'A'],
				pmNames: ['PM', 'P'],
				timeFormat: 'hh:mm:ss tt',
				timeSuffix: '',
				timeOnlyTitle: '{l s='Choose Time'}',
				timeText: '{l s='Time'}',
				hourText: '{l s='Hour'}',
				minuteText: '{l s='Minute'}',
			});
		});
	</script>
	<div class="table-responsive">
	<table id="specific_prices_list" class="table table-bordered">
		<thead>
			<tr>
				<th>{l s='Rule'}</th>
				<th>{l s='Combination'}</th>
				{if $multi_shop}<th>{l s='Shop'}</th>{/if}
				<th>{l s='Currency'}</th>
				<th>{l s='Country'}</th>
				<th>{l s='Group'}</th>
				<th>{l s='Customer'}</th>
				<th>{l s='Fixed price'}</th>
				<th>{l s='Impact'}</th>
				<th>{l s='Period'}</th>
				<th>{l s='From (quantity)'}</th>
				<th>{l s='Action'}</th>
			</tr>
		</thead>
		<tbody>
			{$specificPriceModificationForm}
				<script type="text/javascript">
					$(document).ready(function() {
						delete_price_rule = '{l s="Do you really want to remove this price rule?"}';
						calcPriceTI();
						unitPriceWithTax('unit');
						});
				</script>
			{/if}
