<div>
			<div role="tabpanel" class="col-xs-12">
							  <!-- Nav tabs -->
				<ul class="nav text-center nav-tabs col-xs-12" style="border:none;" role="tablist">
					<li role="presentation" class="active">
						<a id = "cc" style="border:none;background-color:#FFFFFF" href="#selection" aria-controls="selection" role="tab" data-toggle="tab" 
						onMouseOver="this.style.backgroundColor='#FFFFFF)'" 
						onMouseOut="this.style.backgroundColor='#FFFFFF'" >Selection</a></li>
					<li role="presentation">
					<a style="border:none;background-color:#FFFFFF"href="#product-details" aria-controls="product-details" role="tab" data-toggle="tab" onMouseOver="this.style.backgroundColor='#FFFFFF'" 
						onMouseOut="this.style.backgroundColor='#FFFFFF'">Address</a></li>
					<li role="presentation">
					<a style="border:none;background-color:#FFFFFF"href="#comments" aria-controls="comments" role="tab" data-toggle="tab"
						onMouseOver="this.style.backgroundColor='#FFFFFF'" 
						onMouseOut="this.style.backgroundColor='#FFFFFF'">Payments</a></li>
					<li role="presentation">
					<a style="border:none;background-color:#FFFFFF"href="#comments" aria-controls="comments" role="tab" data-toggle="tab"
						onMouseOver="this.style.backgroundColor='#FFFFFF'" 
						onMouseOut="this.style.backgroundColor='#FFFFFF'">Summary</a></li>
				  </ul>
				  <!--- tab panels --->
			<div class="tab-content col-xs-12">
					<div role="tabpanel" class="tab-pane active"  id="selection">
						<div style="background-color:#0071bc;color:white;border-top-right-radius:50px;margin:5px">
						
						<h2>{$product->name} </h2>
						<h3>{$product->brand_name} </h4>
						{$product->price} Per Unit
						</div>
						<div style="background-color:#0071bc;color:white;border-top-right-radius:0px;margin:5px">
							<div class = "col-xs-3" style="background-color:#0071bc;color:white;">. </div>
							<div class = "col-xs-6" style="background-color:#0071bc;color:white;">Unit</div>
							<div class = "col-xs-3" style="background-color:#0071bc;color:white;">1</div>
						
						</div>
						<div style="background-color:#0071bc;color:white;border-top-right-radius:0px;margin:5px">
							<div class = "col-xs-3" style="background-color:#0071bc;color:white;">. </div>
							<div class = "col-xs-6" style="background-color:#0071bc;color:white;">Sub-total</div>
							<div class = "col-xs-3" style="background-color:#0071bc;color:white;">{$product->price}</div>
						</div>
						<div style="background-color:#0071bc;color:white;border-top-right-radius:0px;margin:5px">
							<div class = "col-xs-3" style="background-color:#0071bc;color:white;">. </div>
							<div class = "col-xs-6" style="background-color:#0071bc;color:white;">Handling & Shipping</div>
							<div class = "col-xs-3" style="background-color:#0071bc;color:white;">{$product->additional_shipping_cost}
							</div>
						<div style="background-color:#0071bc;color:white;border-top-right-radius:0px;margin:5px">
							<div class = "col-xs-3" style="background-color:#0071bc;color:white;">. </div>
							<div class = "col-xs-6" style="background-color:#0071bc;color:white;">Promotional code</div>
							<div class = "col-xs-3" style="background-color:#0071bc;color:white;">
								<input type="text" >
							</div>
						</div>
						<div style="background-color:#0071bc;color:white;border-top-right-radius:0px;margin:5px">
							<div class = "col-xs-3" style="background-color:#0071bc;color:white;">. </div>
							<div class = "col-xs-6" style="background-color:#0071bc;color:white;">Total</div>
							<div class = "col-xs-3" style="background-color:#0071bc;color:white;">
								{$product->additional_shipping_cost + $product->price}
							</div>
						</div>
					</div>
			</div>
			</div>
</div>