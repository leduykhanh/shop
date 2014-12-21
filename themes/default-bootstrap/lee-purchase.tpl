<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <!-- Jquery -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
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
						<a id = "cc" style="border:none;background-color:#FFFFFF;;color:#0071bc;" href="#selection" aria-controls="selection" role="tab" data-toggle="tab" 
						onMouseOver="this.style.backgroundColor='#FFFFFF)'" 
						onMouseOut="this.style.backgroundColor='#FFFFFF'" >Selection</a></li>
					<li role="presentation" class="col-xs-3">
					<a style="border:none;background-color:#FFFFFF;;color:#0071bc;"href="#address" aria-controls="address" role="tab" data-toggle="tab" onMouseOver="this.style.backgroundColor='#FFFFFF'" 
						onMouseOut="this.style.backgroundColor='#FFFFFF'">Address</a></li>
					<li role="presentation" class="col-xs-3">
					<a style="border:none;background-color:#FFFFFF;color:#0071bc;"href="#payment" aria-controls="payment" role="tab" data-toggle="tab"
						onMouseOver="this.style.backgroundColor='#FFFFFF'" 
						onMouseOut="this.style.backgroundColor='#FFFFFF'">Payments</a></li>
					<li role="presentation" class="col-xs-3">
					<a style="border:none;background-color:#FFFFFF;color:#0071bc;"href="#summary" aria-controls="summary" role="tab" data-toggle="tab"
						onMouseOver="this.style.backgroundColor='#FFFFFF'" 
						onMouseOut="this.style.backgroundColor='#FFFFFF'">Summary</a></li>
				  </ul>
			</div>
			<div class="col-md-2"></div>
		</div>
				  <!--- tab panels --->
		<div class="tab-content col-xs-12">
			
					<div role="tabpanel" class="tab-pane active"  id="selection">
						<div class="row">
							<div class="col-md-2"></div>
						
							<div class="col-md-8" style="background-color:#0071bc; color:white;border-top-right-radius:50px;margin:1px">
						
							<h2>{$product->name} </h2>
							<h3>{$product->brand_name} </h4>
							{$product->price} Per Unit
							</div>
							<div class="col-md-2"></div>
						</div>
						<div class = "row">
							<div class="col-md-2"></div>
							<div class="col-md-8" style="background-color:#0071bc; color:white;margin:1px">
								<div class = "col-xs-3" style="background-color:#0071bc;color:white;"> </div>
								<div class = "col-xs-6" style="background-color:#0071bc;color:white;">Unit</div>
								<div class = "col-xs-3" style="background-color:#0071bc;color:white;">1</div>
						
							</div>
							<div class="col-md-2"></div>
						</div>
						<div class = "row">
							<div class="col-md-2"></div>
							<div class="col-md-8" style="background-color:#0071bc;color:white;margin:1px">
								<div class = "col-xs-3" style="background-color:#0071bc;color:white;"> </div>
								<div class = "col-xs-6" style="background-color:#0071bc;color:white;">Sub-total</div>
								<div class = "col-xs-3" style="background-color:#0071bc;color:white;">{$product->price}</div>
							</div>
							<div class="col-md-2"></div>
						</div>
						<div class = "row">
							<div class="col-md-2"></div>
							<div class="col-md-8" style="background-color:#0071bc;color:white;margin:1px">
								<div class = "col-xs-3" style="background-color:#0071bc;color:white;"> </div>
								<div class = "col-xs-6" style="background-color:#0071bc;color:white;">Handling & Shipping</div>
								<div class = "col-xs-3" style="background-color:#0071bc;color:white;">{$product->additional_shipping_cost}
								</div>
							</div>
							<div class="col-md-2"></div>
						</div>
						<div class = "row">
							<div class="col-md-2"></div>
							<div class="col-md-8"style="background-color:#0071bc;color:white;margin:1px">
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
							<div class="col-md-8" style="background-color:#0071bc;color:white;margin:1px">
								<div class = "col-xs-3" style="background-color:#0071bc;color:white;"> </div>
								<div class = "col-xs-6" style="background-color:#0071bc;color:white;">Total</div>
								<div class = "col-xs-3" style="background-color:#0071bc;color:white;">
								{$product->additional_shipping_cost + $product->price}
								</div>
							</div>
							
							<div class="col-md-2"></div>
						</div>
					</div>
				<div role="tabpanel" class="tab-pane"  id="address">
						<div class = "row">
							<div class="col-md-2"></div>	
							<div class="col-md-8" style="background-color:#0071bc; color:white;border-top-right-radius:50px;margin:1px">
						
								<h2>{$product->name} </h2>
								<h3>{$product->brand_name} </h4>
									{$product->price} Per Unit
							</div>
							<div class="col-md-2"></div>
						</div>
						<div class = "row">
							<div class="col-md-2"></div>
							<div class="col-md-8"style="background-color:#0071bc;color:white;margin:1px">
								<div class = "col-xs-3" style="background-color:#0071bc;color:white;">Address </div>
								<div class = "col-xs-6" style="background-color:#0071bc;color:white;">
									<p>{$address[0]["firstname"]} {$address[0]["lastname"]}</p>
									<p>{$address[0]["address1"]}</p>
									<p>{$address[0]["address2"]}</p>
									<p>Tel: {$address[0]["phone"]}</p>
									<p>Mob: {$address[0]["phone_mobile"]}</p>
									<p>{$customer->email}</p>
								</div>
								<div class = "col-xs-3" style="background-color:#0071bc;color:white;">
									Edit
								</div>
							</div>
							<div class="col-md-2"></div>
						</div>
						<div class = "row">
							<div class="col-md-2"></div>
							<div class="col-md-8" style="padding:0px">
								<div class="col-md-6" style="padding:0px">
									<button style="display: table-cell;background-color:#0071bc;color:white; width:100%; border-bottom-left-radius:30px; margin:1px;padding-left:0px"type="button">Back</button>
								</div>
								<div class="col-md-6" style="padding:0px">
									<button style="display: table-cell;background-color:red;color:white; width:100%; border-top-right-radius:0px; margin:1px;padding-left:0px"type="button">Continue</button>
								</div>
							</div>
							<div class="col-md-2"></div>
						</div>	
				</div>
				<div role="tabpanel" class="tab-pane"  id="payment">
						<div class = "row">
							<div class="col-md-4"></div>	
							<div class="col-md-4" style="background-color:#0071bc; color:white;border-top-right-radius:50px;margin:1px">
						
								<h2>{$product->name} </h2>
								<h3>{$product->brand_name} </h4>
									{$product->price} Per Unit
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
								<div class="col-md-6" style="padding:0px">
									<button style="display: table-cell;background-color:#0071bc;color:white; width:100%; border-bottom-left-radius:30px; margin:1px;padding-left:0px"type="button">Back</button>
								</div>
								<div class="col-md-6" style="padding:0px">
									<button style="display: table-cell;background-color:red;color:white; width:100%; border-top-right-radius:0px; margin:1px;padding-left:0px"type="button">Continue</button>
								</div>
							</div>
							<div class="col-md-4"></div>
						</div>						
				</div>
				<div role="tabpanel" class="tab-pane"  id="summary">
						<div class = "row">
							<div class="col-md-4"></div>
							<div class="col-md-4"style="background-color:#0071bc;color:white; border-top-right-radius:50px;margin:1px">
						
								<h2>{$product->name} </h2>
								<h3>{$product->brand_name} </h4>
								{$product->price} Per Unit
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
								<div class="col-md-6" style="padding:0px">
									<button style="display: table-cell;background-color:#0071bc;color:white; width:100%; border-bottom-left-radius:30px; margin:1px;padding-left:0px"type="button">Back</button>
								</div>
								<div class="col-md-6" style="padding:0px">
									<button style="display: table-cell;background-color:red;color:white; width:100%; border-top-right-radius:0px; margin:1px;padding-left:0px"type="button">Confirm</button>
								</div>
							</div>
							<div class="col-md-4"></div>
						</div>
				</div>
			</div>
	</div>
</body>
</html>
