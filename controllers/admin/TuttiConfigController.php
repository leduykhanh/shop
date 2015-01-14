<?php
/**
* In order to make it work (without including js):
* the text area must have class ="autoload_rte"
* renderForm must call parent::renderForm()
*
* Note: u also can make it work by including js:
* var iso = 'en';
*	var pathCSS = '/prestashop/themes/default-bootstrap/css/';
*	var ad = '/prestashop/admin6357';
*	$(document).ready(function(){		
*			tinySetup({
*				editor_selector :"autoload_rte"
*			});
*		
*	});
*/
class TuttiConfigControllerCore extends AdminController
{
	public function __construct()
	{
		$this->bootstrap = true;
		$this->className = 'Configuration';
		$this->table = 'configuration';
		$this->lang = true;
		$this->initToolbar();
		parent::__construct();
		$this->fields_options = array(
			'product_comment' => array(
			'title' => $this->l('Product Comment'),
			'fields' =>	array(
				'PRODUCT_BUTTON' => array(
					'type' => 'input',
					'value' => 'Config',
					'title' => "<a href='index.php?controller=AdminModules&token=".Tools::getAdminTokenLite('AdminModules')."&configure=productcomments&tab_module=front_office_features&module_name=productcomments'>Config</a>",
					'onclick' => 'alert(1)'
				)
			)
			),
			'email' => array(
				'title' => $this->l('Email Sample'),
				'icon' => 'icon-envelope',
				'tinymce' => true,	
				'fields' =>	array(
					'EMAIL_TEMPLATE' => array(
						'title'=>'Email template',
						'type' => 'textarea',
						'autoload_rte' => true,
						'name' => 'type_textarea_rte',
						'label' => 'text area with rich text editor',
						'rows' => 10,
						'class' => 'rte',
						'lang' => true,
						'cols'=> 10,
						'html' => true,	
					),
				),
				'submit' => array('title' => $this->l('Save'))
			),
			'test' => array(
				'title' =>	$this->l('Test your email configuration'),
				'hide_multishop_checkbox' => true,
				'fields' =>	array(
					'PS_SHOP_EMAIL' => array(
						'title' => $this->l('Send a test email to'),
						'type' => 'text',
						'id' => 'testEmail',
						'no_multishop_checkbox' => true
						),
				),
				'bottom' => '<div class="row"><div class="col-lg-9 col-lg-offset-3">
					<div class="alert" id="mailResultCheck" style="display:none;"></div>
				</div></div>',
				'buttons' => array(
					array('title' => $this->l('Send an email test'),
						'icon' => 'process-icon-envelope',
						'name' => 'btEmailTest',
						'js' => 'verifyMail()',
						'class' => 'btn btn-default pull-right'
					)
				)
			)
		);
	}
	
	public function updateOptionPsMailPasswd($value)
	{
		if (Tools::getValue('PS_MAIL_PASSWD') == '' && Configuration::get('PS_MAIL_PASSWD'))
			return true;
		else
			Configuration::updateValue('PS_MAIL_PASSWD', Tools::getValue('PS_MAIL_PASSWD'));
	}
	/**
	 * AdminController::initContent() override
	 * @see AdminController::initContent()
	 */
	public function initContent()
	{
		$this->initTabModuleList();
		$this->initToolbar();
		$this->initPageHeaderToolbar();
		
		$this->addToolBarModulesListButton();
		unset($this->toolbar_btn['save']);
		$back = $this->context->link->getAdminLink('AdminDashboard');
		
		$this->toolbar_btn['back'] = array(
			'href' => $back,
			'desc' => $this->l('Back to the dashboard')
		);
		
		$this->content .= $this->renderOptions();
		$this->content .= $this->renderForm();

		$iso = file_exists(_PS_CORE_DIR_.'/js/tiny_mce/langs/'.$iso.'.js') ? $iso : 'en';;
		$pathCSS = _THEME_CSS_DIR_;;
		$ad = __PS_BASE_URI__.basename(_PS_ADMIN_DIR_);;
		$this->content .= "
			<script type='text/javascript'>
				var iso = '$iso';
				var pathCSS = '$pathCSS';
				var ad = '$ad';

				$(document).ready(function(){
					
					tinySetup({editor_selector:'textarea-autosize'});
				});
				
			</script>
		";
		$this->context->controller->addJS(_PS_JS_DIR_.'tiny_mce/tiny_mce.js');
		$this->context->controller->addJS(_PS_JS_DIR_.'tinymce.inc.js');

		$this->context->smarty->assign(array(
			'content' => $this->content,
			'url_post' => self::$currentIndex.'&token='.$this->token,
			'show_page_header_toolbar' => $this->show_page_header_toolbar,
			'page_header_toolbar_title' => $this->page_header_toolbar_title,
			'page_header_toolbar_btn' => $this->page_header_toolbar_btn,
			'tinymce' => true
		));
	}

	public function beforeUpdateOptions()
	{
		/* PrestaShop demo mode */
		if (_PS_MODE_DEMO_)
		{
			$this->errors[] = Tools::displayError('This functionality has been disabled.');
			return;
		}
		/* PrestaShop demo mode*/

		// We don't want to update the shop e-mail when sending test e-mails
		if (isset($_POST['PS_SHOP_EMAIL']))
			$_POST['PS_SHOP_EMAIL'] = Configuration::get('PS_SHOP_EMAIL');

		if (isset($_POST['PS_MAIL_METHOD']) && $_POST['PS_MAIL_METHOD'] == 2
			&& (empty($_POST['PS_MAIL_SERVER']) || empty($_POST['PS_MAIL_SMTP_PORT'])))
			$this->errors[] = Tools::displayError('You must define an SMTP server and an SMTP port. If you do not know it, use the PHP mail() function instead.');
	}

	public function ajaxProcessSendMailTest()
	{
		/* PrestaShop demo mode */
		if (_PS_MODE_DEMO_)
			die(Tools::displayError('This functionality has been disabled.'));
		/* PrestaShop demo mode */
		if ($this->tabAccess['view'] === '1')
		{
			$smtpChecked = (trim(Tools::getValue('mailMethod')) == 'smtp');
			$smtpServer = Tools::getValue('smtpSrv');
			$content = urldecode(Tools::getValue('testMsg'));
			$content = html_entity_decode($content);
			$subject = urldecode(Tools::getValue('testSubject'));
			$type = 'text/html';
			$to = Tools::getValue('testEmail');
			$from = Configuration::get('PS_SHOP_EMAIL');
			$smtpLogin = Tools::getValue('smtpLogin');
			$smtpPassword = Tools::getValue('smtpPassword');
			$smtpPassword = (!empty($smtpPassword)) ? urldecode($smtpPassword) : Configuration::get('PS_MAIL_PASSWD');
			$smtpPassword = str_replace(
				array('&lt;', '&gt;', '&quot;', '&amp;'), 
				array('<', '>', '"', '&'), 
				Tools::htmlentitiesUTF8($smtpPassword)
				);
			
			$smtpPort = Tools::getValue('smtpPort');
			$smtpEncryption = Tools::getValue('smtpEnc');
			
			$result = Mail::sendMailTest(Tools::htmlentitiesUTF8($smtpChecked), Tools::htmlentitiesUTF8($smtpServer), Tools::htmlentitiesUTF8($content), Tools::htmlentitiesUTF8($subject), Tools::htmlentitiesUTF8($type), Tools::htmlentitiesUTF8($to), Tools::htmlentitiesUTF8($from), Tools::htmlentitiesUTF8($smtpLogin), $smtpPassword, Tools::htmlentitiesUTF8($smtpPort), Tools::htmlentitiesUTF8($smtpEncryption));
			die($result === true ? 'ok' : $result);
		}
	}

	protected function processUpdateOptions()
	{
		$this->beforeUpdateOptions();

		$languages = Language::getLanguages(false);

		$hide_multishop_checkbox = (Shop::getTotalShops(false, null) < 2) ? true : false;
		foreach ($this->fields_options as $category_data)
		{
			if (!isset($category_data['fields']))
				continue;

			$fields = $category_data['fields'];

			foreach ($fields as $field => $values)
			{
				if (isset($values['type']) && $values['type'] == 'selectLang')
				{
					foreach ($languages as $lang)
						if (Tools::getValue($field.'_'.strtoupper($lang['iso_code'])))
							$fields[$field.'_'.strtoupper($lang['iso_code'])] = array(
								'type' => 'select',
								'cast' => 'strval',
								'identifier' => 'mode',
								'list' => $values['list']
							);
				}
			}

			// Validate fields
			foreach ($fields as $field => $values)
			{
				// We don't validate fields with no visibility
				if (!$hide_multishop_checkbox && Shop::isFeatureActive() && isset($values['visibility']) && $values['visibility'] > Shop::getContext())
					continue;

				// Check if field is required
				if ((!Shop::isFeatureActive() && isset($values['required']) && $values['required']) 
					|| (Shop::isFeatureActive() && isset($_POST['multishopOverrideOption'][$field]) && isset($values['required']) && $values['required']))
					if (isset($values['type']) && $values['type'] == 'textLang')
					{
						foreach ($languages as $language)
							if (($value = Tools::getValue($field.'_'.$language['id_lang'])) == false && (string)$value != '0')
								$this->errors[] = sprintf(Tools::displayError('field %s is required.'), $values['title']);
					}
					elseif (($value = Tools::getValue($field)) == false && (string)$value != '0')
						$this->errors[] = sprintf(Tools::displayError('field %s is required.'), $values['title']);

				// Check field validator
				if (isset($values['type']) && $values['type'] == 'textLang')
				{
					foreach ($languages as $language)
						if (Tools::getValue($field.'_'.$language['id_lang']) && isset($values['validation']))
							if (!Validate::$values['validation'](Tools::getValue($field.'_'.$language['id_lang'])))
								$this->errors[] = sprintf(Tools::displayError('field %s is invalid.'), $values['title']);
				}
				elseif (Tools::getValue($field) && isset($values['validation']))
					if (!Validate::$values['validation'](Tools::getValue($field)))
						$this->errors[] = sprintf(Tools::displayError('field %s is invalid.'), $values['title']);

				// Set default value
				if (Tools::getValue($field) === false && isset($values['default']))
					$_POST[$field] = $values['default'];
			}

			if (!count($this->errors))
			{
				foreach ($fields as $key => $options)
				{
					if (!$hide_multishop_checkbox && Shop::isFeatureActive() && isset($options['visibility']) && $options['visibility'] > Shop::getContext())
						continue;

					if (!$hide_multishop_checkbox && Shop::isFeatureActive() && Shop::getContext() != Shop::CONTEXT_ALL && empty($options['no_multishop_checkbox']) && empty($_POST['multishopOverrideOption'][$key]))
					{
						Configuration::deleteFromContext($key);
						continue;
					}

					// check if a method updateOptionFieldName is available
					$method_name = 'updateOption'.Tools::toCamelCase($key, true);
					if (method_exists($this, $method_name))
						$this->$method_name(Tools::getValue($key));
					elseif (isset($options['type']) && in_array($options['type'], array('textLang', 'textareaLang')))
					{
						$list = array();
						foreach ($languages as $language)
						{
							$key_lang = Tools::getValue($key.'_'.$language['id_lang']);
							$val = (isset($options['cast']) ? $options['cast']($key_lang) : $key_lang);
							if ($this->validateField($val, $options))
							{
								if (Validate::isCleanHtml($val))
									$list[$language['id_lang']] = $val;
								else
									$this->errors[] = Tools::displayError('Can not add configuration '.$key.' for lang '.Language::getIsoById((int)$language['id_lang']));
							}
						}
						Configuration::updateValue($key, $list, $html=true);
					}
					else
					{
						$val = (isset($options['cast']) ? $options['cast'](Tools::getValue($key)) : Tools::getValue($key));
						if ($this->validateField($val, $options))
						{
							if (Validate::isCleanHtml($val))
								Configuration::updateValue($key, $val, $html=true);
							else
								$this->errors[] = Tools::displayError('Can not add configuration '.$key);
						}
					}
				}
			}
		}

		$this->display = 'list';
		if (empty($this->errors))
			$this->confirmations[] = $this->_conf[6];
	}

}
