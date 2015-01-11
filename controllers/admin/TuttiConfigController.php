<?php

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
	public function renderForm()
	{
			$this->fields_form = array(
			'tinymce' => true,
			'legend' => array(
				'title' => $this->l('CMS Page'),
				'icon' => 'icon-folder-close'
			),
			'input' => array(
				// custom template
				array(
					'type' => 'textarea',
					'label' => $this->l('Page content'),
					'name' => 'content',
					'autoload_rte' => true,
					'lang' => true,
					'rows' => 5,
					'cols' => 40,
					'hint' => $this->l('Invalid characters:').' <>;=#{}'
				),
			),
			'submit' => array(
				'title' => $this->l('Save'),
			),
			'buttons' => array(
				'save_and_preview' => array(
					'name' => 'viewcms',
					'type' => 'submit',
					'title' => $this->l('Save and preview'),
					'class' => 'btn btn-default pull-right',
					'icon' => 'process-icon-preview'
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
		$this->context->controller->addJS(_PS_JS_DIR_.'tiny_mce/tiny_mce.js');
		$this->context->controller->addJS(_PS_JS_DIR_.'tinymce.inc.js');
		$this->addToolBarModulesListButton();
		unset($this->toolbar_btn['save']);
		$back = $this->context->link->getAdminLink('AdminDashboard');
		
		$this->toolbar_btn['back'] = array(
			'href' => $back,
			'desc' => $this->l('Back to the dashboard')
		);
		
		$this->content .= $this->renderOptions();
		$this->content .= $this->renderForm();
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
			$content = Configuration::get('EMAIL_TEMPLATE');
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
}
