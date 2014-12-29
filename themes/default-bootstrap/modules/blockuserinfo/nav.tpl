<!-- Block user information module NAV  -->
<script>
	$(document).ready(function() {
		$(".login").fancybox();
		});
</script>
{if $is_logged}
	<div class="header_user_info">
		<a href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}" title="{l s='View my customer account' mod='blockuserinfo'}" class="account" rel="nofollow"><span>{$cookie->customer_firstname} {$cookie->customer_lastname}</span></a>
	</div>
{/if}
<div class="header_user_info">
	{if $is_logged}
		<a class="logout" href="{$link->getPageLink('index', true, NULL, "mylogout")|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Log me out' mod='blockuserinfo'}">
			{l s='Log out' mod='blockuserinfo'}
		</a>
	{else}
	<!--	<a class="login" href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Log in to your customer account' mod='blockuserinfo'}">
			{l s='Log in' mod='blockuserinfo'}
		</a>
	-->
	<a class="login" href="#login">Log in</a>
	{/if}
</div>
<div id = "login" class="col-xs-12" style="display:none; color:white; background-color:#0071BC; border-top-right-radius:70px">
			<form action="{$link->getPageLink('authentication', true)|escape:'html':'UTF-8'}" method="post" id="login_form" class="box" style="color:white;background-color:#0071BC;border-top-right-radius:70px; border:none; ">
				<div class="form_content clearfix">
					<div class="form-group">
						<label for="email" style="color:white;background-color:#0071BC">{l s='Email address'}</label>
						<input class="is_required validate account_input form-control" data-validate="isEmail" type="text" id="email" name="email" value="{if isset($smarty.post.email)}{$smarty.post.email|stripslashes}{/if}" />
					</div>
					<div class="form-group">
						<label for="passwd" style="color:white;background-color:#0071BC">{l s='Password'}</label>
						<span><input class="is_required validate account_input form-control" type="password" data-validate="isPasswd" id="passwd" name="passwd" value="{if isset($smarty.post.passwd)}{$smarty.post.passwd|stripslashes}{/if}" /></span>
					</div>
					<p class="lost_password form-group"><a style="color:white;" href="{$link->getPageLink('password')|escape:'html':'UTF-8'}" title="{l s='Recover your forgotten password'}" rel="nofollow">{l s='Forgot your password?'}</a></p>
					<p class="submit">
						{if isset($back)}<input type="hidden" class="hidden" name="back" value="{$back|escape:'html':'UTF-8'}" />{/if}
						<button type="submit" id="SubmitLogin" name="SubmitLogin" class="button btn btn-default button-medium">
							<span>
								<i class="icon-lock left"></i>
								{l s='Sign in'}
							</span>
						</button>
					</p>
				</div>
			</form>
		</div>
<!-- /Block usmodule NAV -->
