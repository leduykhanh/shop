<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <!-- Jquery -->
    

    <!-- Bootstrap -->
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <style type="text/css">
    	.back-button, .continue-button, .confirm-button {
    		border:none;
    		outline:none;
    		margin-top:3px;
    		box-shadow: 2px 2px 5px #111;
    		webkit-box-shadow: 2px 2px 5px #111;
    		width:100%;
    	}
    	.back-button:active, .continue-button:active, .confirm-button:active{
    		/*border-top:solid 1px #0071bc;*/
    		margin-top:4px;
    	}
    	.continue-button, .confirm-button {
    		/*margin-left:3px;*/
    	}
    	.ok-button {
    		border:none;
    		outline:none
    	}
    	.ok-button:active {
    		margin-top:1px;
    	}

    	.button-container {
    		margin-left:3px;
    	}

    	input[type="text"] {
    		margin:1px;
			padding: 0 10px 0 10px;
			border: none;
			/*border-bottom: solid 2px #fbb03b;*/
			transition: border 0.3s;
		}
		input[type="text"]:focus,
		input[type="text"].focus {
			border-bottom: solid 2px #fbb03b;
		}
		.col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7,
		.col-xs-8, .col-xs-9 {
			/*margin:3px 0;*/
		}
		.col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7,
		.col-md-8, .col-md-9 {
			/*margin:3px 0;*/
			/*padding:3px 0;*/
		}
		.col-xs-6,  .col-xs-7,  .col-xs-8,  .col-xs-9{
			margin:3px 0 4px 0;
		}
		.col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5 {
			margin-top:3px;
		}
		
		.checkbox {
			margin:3px 0 3px 0;
			color:#0071bc;
			font-weight:bold;
		}
		.checkbox a {
			color:#fbb03b;
		}
		.checkbox label {
			color:#0071bc;
			font-weight:bold;
		}

		.noselect {
		    -webkit-touch-callout: none;
		    -webkit-user-select: none;
		    -khtml-user-select: none;
		    -moz-user-select: none;
		    -ms-user-select: none;
		    user-select: none;
		}

		span.spinner {
			color:#fbb03b;
			font-weight:bold;
		}
		.spinner input {
			float:left;
			font-size: 1.2em;
		    text-transform: uppercase;
		    text-align: center;
		    background-color:#0071bc;
		    border:none;
		}

		.spinner input[type=number]::-webkit-inner-spin-button, input[type=number]::-webkit-outer-spin-button {
			-webkit-appearance: none;
		}

		span.spinner > .substract-button, span.spinner > .add-button {
			width: 35px;
			display: block;
			float:left;
			text-align: center;
		    font-family: Lato;
		    font-weight: 700;
		    font-size: 1.2em;
		    cursor:pointer;
		    cursor:hand;
		}
		.substract-button:active, .add-button:active {
			margin-top:1px;
		}

		.purchase-total {
			color:#fbb03b;
		}

		.purchase-head h1, .purchase-head h4, 
		.purchase-head h2, .purchase-head h5, 
		.purchase-head h3, .purchase-head h6 {
			margin:0;
			padding:0;
		}

    </style>
</head>
<body>
	{$HOOK_LEFT_COLUMN=false}
<div class="container">

	<div style = "margin: 10px;" role="tabpanel" class="col-xs-12">
							  <!-- Nav tabs -->
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<ul class="nav text-center nav-tabs col-xs-12" style="border:none;" role="tablist">
					<li role="presentation" class="active col-xs-3">
					<a style="border:none;background-color:#FFFFFF;;color:#0071bc;"href="#address" aria-controls="address" onMouseOver="this.style.backgroundColor='#fbb03b'" 
						onMouseOut="this.style.backgroundColor='#FFFFFF'">Address</a></li>

					<li role="presentation" class="col-xs-3">
						<a id = "cc" style="border:none;background-color:#FFFFFF;;color:#0071bc;" href="#selection" aria-controls="selection" onMouseOver="this.style.backgroundColor='#fbb03b'" 
						onMouseOut="this.style.backgroundColor='#FFFFFF'" >Selection</a></li>

					<li role="presentation" class="col-xs-3">
					<a style="border:none;background-color:#FFFFFF;color:#0071bc;"href="#payment" aria-controls="payment" 
						onMouseOver="this.style.backgroundColor='#fbb03b'" 
						onMouseOut="this.style.backgroundColor='#FFFFFF'">Payments</a></li>
					<li role="presentation" class="col-xs-3">
					<a style="border:none;background-color:#FFFFFF;color:#0071bc;"href="#summary" aria-controls="summary"
						onMouseOver="this.style.backgroundColor='#fbb03b'" 
						onMouseOut="this.style.backgroundColor='#FFFFFF'">Summary</a></li>
				  </ul>
			</div>
			<div class="col-md-2"></div>
		</div>
				  <!--- tab panels -->
		<div class="tab-content col-xs-12">
					{assign var='product' value=$products[0]}
					{assign var='productId' value=$product.id_product}
					{assign var='productAttributeId' value=$product.id_product_attribute}
					{assign var='quantityDisplayed' value=0}
					
					<div role="tabpanel" class="tab-pane active first-tab"  id="address">
						<div class = "row">
							<div class="col-md-2"></div>	
							<div class="col-md-8" style="background-color:#0071bc; color:white;border-top-right-radius:50px;margin:1px">
							{include file="$tpl_dir./lee-purchase-shopping-cart-product-line.tpl"}
							</div>
							<div class="col-md-2"></div>
						</div>
						<div class = "row">
							<div class="col-md-2"></div>
							<div class="col-md-8"style="background-color:#0071bc;color:white;margin:1px">
								<div class = "col-xs-3" style="background-color:#0071bc;color:white;">Address </div>
								<div class = "col-xs-6" style="background-color:#0071bc;color:white;">
									<ul id="address_delivery">
									</ul>
									
								</div>
								<div class = "col-xs-3" id ="update_address" style="background-color:#0071bc;color:white;">
									<a style="color:white;" href="address?back=order.php%3Fstep%3D1&id_address=0">Edit</a>
								</div>
							</div>
							<div class="col-md-2"></div>
						</div>
						<div class = "row">
							<div class="col-md-2"></div>
							<div class="col-md-8" style="padding:0px">
								<div class="col-md-3" style="padding:0px">
									<button class="back-button" style="display: table-cell;background-color:#0071bc;color:white; width:100%; border-bottom-left-radius:30px;padding-left:0px"type="button">Back</button>
								</div>
								<div class="col-md-9" style="padding:0px">
									<div class="button-container" ><button class = "continue-button" style="display: table-cell;background-color:red;color:white; width:100%; border-top-right-radius:0px;padding-left:0px"type="button">Continue</button> </div>
								</div>
							</div>
							<div class="col-md-2"></div>
						</div>	
					</div>

					<div role="tabpanel" class="tab-pane"  id="selection">
						<div class="row">
							<div class="col-md-2"></div>
						
							<div class="col-md-8" style="background-color:#0071bc; color:white;border-top-right-radius:50px;margin:1px">
							{include file="$tpl_dir./lee-purchase-shopping-cart-product-line.tpl"}
							</div>
							<div class="col-md-2"></div>
						</div>
						<div class = "row">
							<div class="col-md-2"></div>
							<div class="col-md-8" style="background-color:#0071bc; color:white;border-top:solid 1px #1182cd">
								<div class = "col-xs-3" style="background-color:#0071bc;color:white;"> </div>
								<div class = "col-xs-6" style="background-color:#0071bc;color:white;">Unit</div>
								<div class = "col-xs-3" style="background-color:#0071bc;color:white;">
									<span class="spinner noselect"><span class="substract-button" id="substract_button">-</span>
									<input id="purchase_unit" type="number" min="1" max="3" value="1" disabled="disabled">
									<span id="add_button" class="add-button">+</span>									  
								</div>
						
							</div>
							<div class="col-md-2"></div>
						</div>
						<div class = "row">
							<div class="col-md-2"></div>
							<div class="col-md-8" style="background-color:#0071bc;color:white;border-top:solid 1px #1182cd">
								<div class = "col-xs-3" style="background-color:#0071bc;color:white;"> </div>
								<div class = "col-xs-6" style="background-color:#0071bc;color:white;">Sub-total</div>
								<div id="purchase_sub_total" class = "col-xs-3" style="background-color:#0071bc;color:white;">{$product.price}</div>
							</div>
							<div class="col-md-2"></div>
						</div>
						<div class = "row">
							<div class="col-md-2"></div>
							<div class="col-md-8" style="background-color:#0071bc;color:white; border-top:solid 1px #1182cd">
								<div class = "col-xs-3" style="background-color:#0071bc;color:white;"> </div>
								<div class = "col-xs-6" style="background-color:#0071bc;color:white;">Handling & Shipping</div>
								<div id="purchase_additional_shipping_cost" class = "col-xs-3" style="background-color:#0071bc;color:white;">{$product.additional_shipping_cost}
								</div>
							</div>
							<div class="col-md-2"></div>
						</div>
						<div class = "row">
							<div class="col-md-2"></div>
							<div class="col-md-8"style="background-color:#0071bc;color:white;border-top:solid 1px #1182cd">
								<div class = "col-xs-3" style="background-color:#0071bc;color:white;"> </div>
								<div class = "col-xs-6" style="background-color:#0071bc;color:white;">Promotional code</div>
								<div class = "col-xs-3" style="background-color:#0071bc;color:white;">
								<input style="color:red;float:left;width:70%;" type="text" >
								<button class="ok-button" style="float:left;display: table-cell;background-color:red;color:white;border-radius:6px;margin-left:10px" type="button">OK</button>
								</div>
							</div>
							<div class="col-md-2"></div>
						</div>
						<div class = "row">
							<div class="col-md-2"></div>						
							<div class="col-md-8" style="background-color:#0071bc;color:white;border-top:solid 2px white">
								<div class = "col-xs-3" style="background-color:#0071bc;color:white;"> </div>
								<div class = "col-xs-6" style="background-color:#0071bc;color:white;">Total</div>
								<div id="purchase_total" class = "col-xs-3" style="background-color:#0071bc;color:white;">
								{$product.additional_shipping_cost + $product.price}
								</div>
							</div>
							
							<div class="col-md-2"></div>
						</div>

						<div class = "row">
							<div class="col-md-2"></div>
							<div class="col-md-8" style="background-color:white;color:white;border-top:solid 2px white">
								<div class = "col-xs-3" style="background-color:white;color:white;"> </div>	
								<div class = "col-xs-9" style="background-color:white;color:white;">				
									<div class="checkbox noselect">
										<div class="checker" id="uniform-cgv"><span><input type="checkbox" name="cgv" id="cgv" value="1"></span></div>
										<label for="cgv">I am 18 years old or older, have read and accept the</label>
										<a href="{$link_conditions|escape:'html':'UTF-8'}" class="iframe" rel="nofollow">Terms of Service</a>
									</div>
								</div>	
							</div>						
							<div class="col-md-2"></div>
						</div>

						<div class = "row">
							<div class="col-md-2"></div>
							<div class="col-md-8" style="padding:0px">
								<div class="col-md-3" style="padding:0px">
									<button class="back-button" style="display: table-cell;background-color:#0071bc;color:white; width:100%; border-bottom-left-radius:30px;padding-left:0px"type="button">Back</button>
								</div>
								<div class="col-md-9" style="padding:0px">
									<div class="button-container" ><button class = "continue-button" style="display: table-cell;background-color:red;color:white; border-top-right-radius:0px;padding-left:0px"type="button">Continue</button></div>
								</div>
							</div>
							<div class="col-md-2"></div>
						</div>	
					</div>
			
					<div role="tabpanel" class="tab-pane"  id="payment">
						<div class = "row">
							<div class="col-md-4"></div>	
							<div class="col-md-4" style="background-color:#0071bc; color:white;border-top-right-radius:50px;margin:1px">
								{include file="$tpl_dir./lee-purchase-shopping-cart-product-line.tpl"}
							</div>
							<div class="col-md-4"></div>
						</div>
						<div class = "row">
							<div class="col-md-4"></div>
							<div class="col-md-4"style="background-color:#0071bc;color:white;margin:1px">
						
								<h2>Payment Method </h2>
							    <select multiple style = "overflow: hidden;"class="form-control" id="sel2">
								<option>Online</option>
								<option>Card to Card</option>
								<option>Bank Transaction</option>
								<option>At the door</option>
							  </select>
							</div>
							<div class="col-md-4"></div>

						</div>
						<div class = "row">
							<div class="col-md-4"></div>
							<div class="col-md-4" style="padding:0px">
								<div class="col-md-3" style="padding:0px">
									<button class="back-button" style="display: table-cell;background-color:#0071bc;color:white; width:100%; border-bottom-left-radius:30px;padding-left:0px"type="button">Back</button>
								</div>
								<div class="col-md-9" style="padding:0px">
									<div class="button-container" ><button class = "continue-button" style="display: table-cell;background-color:red;color:white;border-top-right-radius:0px;padding-left:0px"type="button">Continue</button></div>
								</div>
							</div>
							<div class="col-md-4"></div>
						</div>						
				</div>
				<div role="tabpanel" class="tab-pane"  id="summary">
						<div class = "row">
							<div class="col-md-4"></div>
							<div class="col-md-4"style="background-color:#0071bc;color:white; border-top-right-radius:50px;margin:1px">
								{include file="$tpl_dir./lee-purchase-shopping-cart-product-line.tpl"}
							</div>
							<div class="col-md-4"></div>
						</div>
						<div class = "row">
							<div class="col-md-4"></div>
							<div class="col-md-4"style="background-color:#0071bc;color:white; border-top-right-radius:0px;margin:1px">
						
								<h2>Shipping address & Contact</h2>
								<ul id="shipping_address_and_contact"></ul>								
							</div>
							<div class="col-md-4"></div>
						</div>
						<div class = "row">
							<div class="col-md-4"></div>
							<div class="col-md-4" style="padding:0px">
								<div class="col-md-3" style="padding:0px">
									<button class="back-button" style="display: table-cell;background-color:#0071bc;color:white; width:100%; border-bottom-left-radius:30px;padding-left:0px"type="button">Back</button>
								</div>
								<div class="col-md-9" style="padding:0px">
									<div class="button-container" ><button id="confirm_button" class="confirm-button" style="display: table-cell;background-color:red;color:white;width:100%;border-top-right-radius:0px;padding-left:0px"type="button">Confirm</button></div>
								</div>
							</div>
							<div class="col-md-4"></div>
						</div>
				</div>
			</div>
	</div>
	<div style="display:none">
		<form id="purchaseForm" action="index.php/?controller=leepurchasebankwire">
			<input type="text" value="conghoa" name="test"></input>
		</form>
	</div>
<script type="text/javascript">
	$(document).ready(function(){
		
		formatedAddressFieldsValuesList = {Tools::jsonEncode($formatedAddressFieldsValuesList)};

		initializeVariables();
		updateAddress();
		$("#confirm_button").click(function(ev){
			//$.post('index.php/?controller=leepurchasebankwire', $("#purchaseForm").serialize());
			//$.post('index.php/?controller=leepurchaseparentorder', JSON.stringify(leePurchase));
			var url = 'index.php/?controller=leepurchaseparentorder';
			$.ajax({
				type: "POST",
				url: url,
				data: leePurchase,
				success: function(data){
					console.log(data);
				},
				dataType: 'json'
			});
		});

		initializeTabs();
		initializeViews();
	});

	function initializeViews(){
		if (!!$.prototype.fancybox)
		$("a.iframe").fancybox({
			'type': 'iframe',
			'width': 600,
			'height': 600
		});
		var purchase_unit = $("#purchase_unit");

		$("#substract_button").click(function(){

			if(leePurchase.unit <=1) return;
			leePurchase.unit -= 1;
			purchase_unit.val(leePurchase.unit);
			calculateForSelectionTab();
			updateSelectionTab()
		});
		$("#add_button").click(function(){

			if(leePurchase.unit >=3) return;
			leePurchase.unit += 1;
			purchase_unit.val(leePurchase.unit);
			calculateForSelectionTab();
			updateSelectionTab()
		});

		var summary_purchase_total = $("#summary .purchase-total span");
		summary_purchase_total.parent().css("display","inline");
		summary_purchase_total.html(leePurchase.total);
	}

	function updateSelectionTab(){
		var purchase_total = $("#purchase_total");
		var purchase_sub_total = $("#purchase_sub_total");
		purchase_sub_total.html(leePurchase.subTotal);
		purchase_total.html(leePurchase.total);

		var summary_purchase_total = $("#summary .purchase-total span");
		summary_purchase_total.html(leePurchase.total);
	}

	function calculateForSelectionTab(){
		leePurchase.subTotal = leePurchase.unit * leePurchase.unitPrice;
		leePurchase.total = leePurchase.subTotal + leePurchase.additionalShippingCost;
	}

	function initializeVariables(){
		window.leePurchase = {};
		leePurchase.id_address_delivery = 0;
		leePurchase.ajax = 1; //submit ajax
		leePurchase.paymentMethod = "bankwire";
		leePurchase.productId = {$productId};
		leePurchase.unitPrice = {$product.price};
		leePurchase.unit = parseInt(1);
		leePurchase.additionalShippingCost = {$product.additional_shipping_cost};
		leePurchase.subTotal = {$product.price} * leePurchase.unit;
		leePurchase.total = leePurchase.additionalShippingCost + leePurchase.subTotal;
	}

	function initializeTabs(){
		window.leePurchaseTabNumber = 0;
		var currentTab = $(".tab-content .active");

		$("ul.nav-tabs li a").click(function(ev){
			ev.preventDefault();
			triggerClick($(this));
		});

		function triggerClick(a){
			var t = findRelativeLiA(currentTab);
			t.parent().removeClass("active");
			currentTab.hide();
			currentTab.removeClass("active");


			currentTab = $(a.attr("href"));
			currentTab.show();
			currentTab.addClass("active");
			
			t = findRelativeLiA(currentTab);
			t.parent().addClass("active");
		}

		function findRelativeLiA(tab){
			aS = $("ul.nav-tabs li a");
			for(a in aS){					
				if($(aS[a]).attr("href") == ("#" + tab.attr("id"))) {
					return $(aS[a]);
				}
			}
		}

		$(".back-button").click(function(ev){
			ev.preventDefault();
			var parent = $(this).parents(".tab-pane");
			var prevOfParent = parent.prev(".tab-pane");
			if(!parent.hasClass("first-tab"))
			{
				triggerClick(findRelativeLiA(prevOfParent));
			}
		});
		$(".continue-button").click(function(ev){
			ev.preventDefault();
			var parent = $(this).parents(".tab-pane");
			var nextOfParent = parent.next(".tab-pane");
			if(!parent.hasClass("last-tab"))
			{
				triggerClick(findRelativeLiA(nextOfParent));
			}
		});
	}

	function updateAddress() {
		if (typeof formatedAddressFieldsValuesList == 'undefined' || formatedAddressFieldsValuesList.length <= 0)
		return;

		for(key in formatedAddressFieldsValuesList){
			id_address = key;
		}
		if (isNaN(id_address))
			return;
		else
			leePurchase.id_address_delivery = id_address; //see function initializeVariables();

		var address_delivery = $("#address_delivery");
		address_delivery.html('');
		var li_content = formatedAddressFieldsValuesList[id_address]['formated_fields_values'];
		var li_content = formatedAddressFieldsValuesList[id_address]['formated_fields_values'];

		var ordered_fields_name = ['title'];
		var reg = new RegExp("[ ]+", "g");
		ordered_fields_name = ordered_fields_name.concat(formatedAddressFieldsValuesList[id_address]['ordered_fields']);
		ordered_fields_name = ordered_fields_name.concat(['update']);
		
		appendAddressList(address_delivery, li_content, ordered_fields_name);
		
		//update the link to edit address
		var link = $('#update_address a').attr('href');
		var expression = /id_address=\d+/;
		if (link)
		{
			link = link.replace(expression, 'id_address=' + id_address);
			$('#update_address a').attr('href', link);
		}

		var shipping_address_and_contact = $("#shipping_address_and_contact");
		shipping_address_and_contact.html(address_delivery.html());
	}
	function appendAddressList(dest_comp, values, fields_name)
	{
		for (var item in fields_name)
		{
			var name = fields_name[item].replace(",", "");
			var value = getFieldValue(name, values);
			if (value != "")
			{
				var new_li = document.createElement('li');
				var reg = new RegExp("[ ]+", "g");
				var classes = name.split(reg);
				new_li.className = '';
				for (clas in classes)
					new_li.className += 'address_' + classes[clas].toLowerCase().replace(":", "_") + ' ';
				new_li.className = new_li.className.trim();
				new_li.innerHTML = value;
				dest_comp.append(new_li);
			}
		}
	}

	function getFieldValue(field_name, values)
	{
		var reg = new RegExp("[ ]+", "g");
		var items = field_name.split(reg);
		var vals = new Array();
		for (var field_item in items)
		{
			items[field_item] = items[field_item].replace(",", "");
			vals.push(values[items[field_item]]);
		}
		return vals.join(" ");
	}

	
</script>
</body>
</html>
