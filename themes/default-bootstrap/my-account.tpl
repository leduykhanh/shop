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

{capture name=path}{l s='My account'}{/capture}
<div class="col-md-4"></div>
<div class="col-md-4">
	<h1 class="page-heading">{l s='My account'}</h1>
	{if isset($account_created)}
		<p class="alert alert-success">
			{l s='Your account has been created.'}
		</p>
	{/if}
	<div class="row addresses-lists">
		<div class="col-xs-12">
			<ul class="myaccount-link-list" >
				{if $has_customer_an_address}
				<li><a style="border:none" href="{$link->getPageLink('address', true)|escape:'html':'UTF-8'}" title="{l s='Add my first address'}"><span>{l s='Add my first address'}</span></a></li>
				{/if}
				<li><a style="border:none" href="{$link->getPageLink('history', true)|escape:'html':'UTF-8'}" title="{l s='Orders'}">
				<span style = "background-color: #0071BC; color:white; margin-left:0px; border-bottom-right-radius:30px ">{l s='Order history and details'}</span></a></li>
				{if $returnAllowed}
					<li><a href="{$link->getPageLink('order-follow', true)|escape:'html':'UTF-8'}" title="{l s='Merchandise returns'}"></i><span style = "background-color: #0071BC; color:white; margin-left:0px; border-bottom-right-radius:30px">{l s='My merchandise returns'}</span></a></li>
				{/if}
				<li><a style="border:none" href="{$link->getPageLink('addresses', true)|escape:'html':'UTF-8'}" title="{l s='Addresses'}"><span style = "background-color: #0071BC; color:white; margin-left:0px; border-bottom-right-radius:30px ">{l s='My addresses'}</span></a></li>
				<li><a style="border:none" href="{$link->getPageLink('identity', true)|escape:'html':'UTF-8'}" title="{l s='Information'}"><span style = "background-color: #0071BC; color:white; margin-left:0px; border-bottom-right-radius:30px">{l s='My personal information'}</span></a></li>
			</ul>
		</div>
	<!--<{if $voucherAllowed || isset($HOOK_CUSTOMER_ACCOUNT) && $HOOK_CUSTOMER_ACCOUNT !=''}
		div class="col-xs-12 col-sm-6 col-lg-4">
			<ul class="myaccount-link-list">
				{if $voucherAllowed}
					<li><a href="{$link->getPageLink('discount', true)|escape:'html':'UTF-8'}" title="{l s='Vouchers'}"><i class="icon-barcode"></i><span>{l s='My vouchers'}</span></a></li>
				{/if}
				{$HOOK_CUSTOMER_ACCOUNT}
			</ul>
		</div> 
	{/if}-->
	</div>
	<ul class="footer_links clearfix">
	<li><a class="btn btn-default button button-small" style = "background-color: red; color:white; padding:10px; border:none;border-bottom-right-radius:30px" href="{$base_dir}" title="{l s='Home'}"><span style = "background-color: red; color:white; padding:10px; border:none"><i class="icon-chevron-left"></i> {l s='Home'}</span></a></li>
	</ul>
</div>
<div class="col-md-4"></div>