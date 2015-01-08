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
    	.continue-button, .confirm-button {
    		/*margin-left:3px;*/
    	}
    	.button-container {
    		margin-left:3px;
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
								<div class = "col-xs-3" style="background-color:#0071bc;color:white;">1</div>
						
							</div>
							<div class="col-md-2"></div>
						</div>
						<div class = "row">
							<div class="col-md-2"></div>
							<div class="col-md-8" style="background-color:#0071bc;color:white;border-top:solid 1px #1182cd">
								<div class = "col-xs-3" style="background-color:#0071bc;color:white;"> </div>
								<div class = "col-xs-6" style="background-color:#0071bc;color:white;">Sub-total</div>
								<div class = "col-xs-3" style="background-color:#0071bc;color:white;">{$product->price}</div>
							</div>
							<div class="col-md-2"></div>
						</div>
						<div class = "row">
							<div class="col-md-2"></div>
							<div class="col-md-8" style="background-color:#0071bc;color:white; border-top:solid 1px #1182cd">
								<div class = "col-xs-3" style="background-color:#0071bc;color:white;"> </div>
								<div class = "col-xs-6" style="background-color:#0071bc;color:white;">Handling & Shipping</div>
								<div class = "col-xs-3" style="background-color:#0071bc;color:white;">{$product->additional_shipping_cost}
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
								<input style="color:red" type="text" >
								</div>
							</div>
							<div class="col-md-2"></div>
						</div>
						<div class = "row">
							<div class="col-md-2"></div>						
							<div class="col-md-8" style="background-color:#0071bc;color:white;border-top:solid 2px white">
								<div class = "col-xs-3" style="background-color:#0071bc;color:white;"> </div>
								<div class = "col-xs-6" style="background-color:#0071bc;color:white;">Total</div>
								<div class = "col-xs-3" style="background-color:#0071bc;color:white;">
								{$product->additional_shipping_cost + $product->price}
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
								<p>{$address[0]["firstname"]} {$address[0]["lastname"]}</p>
								<p>{$address[0]["address1"]}</p>
								<p>{$address[0]["address2"]}</p>
								<p>Tel: {$address[0]["phone"]}</p>
								<p>Mob: {$address[0]["phone_mobile"]}</p>
								<p>{$customer->email}</p>
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
		updateAddress();
		$("#confirm_button").click(function(ev){
			$.post('index.php/?controller=leepurchasebankwire', $("#purchaseForm").serialize());
		});

		initializeTabs();
	});

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
