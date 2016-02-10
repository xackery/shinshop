<!-- Outer Starts -->
        <div class="outer">
            
            {include file="../_header.tpl"}
            <!-- Main content starts -->
	
			<div class="main-block">
				
				<!-- Page heading two starts -->
				
				<div class="page-heading-two">
					<div class="container">
						<h2>Login <span>Something goes here</span></h2>
						<div class="breads">
							Home / <a href="#">Page</a> / <a href="#">Sub Page</a>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				
				<!-- Page heading two ends -->
			
				<div class="container">
					
					<div class="row">
						<div class="col-md-7">
							<h4>Login to your account</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean egestas urna ut enim semper, tempus adipiscing nisi ornare. Vivamus ut rdum urna, at aliquam nulla. Fusce laoreet metus eget nisl varius posuere. Aliquam sapien augue, semper ut magna ut, rutrum malesuada sapien.</p>
							
							<h5>Your data are save with us</h5>
							<p>Mauris ac dui consectetur, condimentum est ac, tristique velit. Phasellus varius volutpat sem quis semper. Nullam id egestas purus, eget rhoncus erat. Aenean at nullaortis. In semper fermentum nibh, in congue urna sollicitudin eu. Curaagna. Proin egestas lorem vel tincidunt interdum. Integer aliquet varius tellus, eu feugiat justo vestibulum id. Morbi ultrices ultrices . Nullam rutrum sem ante, ut eleifend purus porttitor in.</p>
							
							<p>Mauris ac dui consectetur, condimentum est ac, tristique velit. Phasellus varius volutpat sem quis semper. Nullam id egestas purus, eget rhoncus erat. A diam laoreet lobortis. In semper fermentum nibh, in congue urna sollicitudin eu. Curaagna. Proin egestas lorem vel tincidunt interdum. Integer aliquet varius tellus, eu feugiat justo vestibulum id. Morbi ultrices ultrices . Nullam rutrum sem ante, ut eleifend purus porttitor in.</p>
							<br />
						</div>
						<div class="col-md-5">
							<!-- Login starts -->
							<div class="well login-reg-form">
								 {if isset($error->loginMessage)}
                                <div class="icon-box-5-item bg-red login-err padd-5">
                                    <h4 class="white"><a href="#" class="white"><i class="fa fa-bar-chart-o"></i>Error</a></h4>
                                    <p class="white">{$error->loginMessage}</p>
                                    
                                </div>
                                {/if}
                                
								<!-- Heading -->
								<h4>Login to your Account</h4>
								<hr />
								<!-- Form -->
								<form class="form-horizontal" role="form" method="POST">
									<!-- Form Group -->
                                    {assign "field" "email"}
                                    <div class="form-group">
                                        <!-- Label -->
                                        <label for="{$field}" class="col-sm-3 control-label">{$field|format_field}</label>
                                        <div class="col-sm-9">
                                            <!-- Input -->
                                            <input type="text" class="form-control" id="{$field}" name="{$field}" placeholder="Enter {$field|format_field}" value="{if !empty($post[$field]) && empty($error->$field)}{$post[$field]}{/if}">
                                            <p class="help-block">{if isset($error->$field)}{$error->$field}{/if}</p>
                                        </div>
                                    </div>
                                    {assign "field" "password"}
                                    <div class="form-group">
                                        <!-- Label -->
                                        <label for="{$field}" class="col-sm-3 control-label">{$field|format_field}</label>
                                        <div class="col-sm-9">
                                            <!-- Input -->
                                            <input type="password" class="form-control" id="{$field}" name="{$field}" placeholder="Enter {$field|format_field}" value="{if !empty($post[$field]) && empty($error->$field)}{$post[$field]}{/if}">
                                            <p class="help-block">{if isset($error->$field)}{$error->$field}{/if}</p>
                                        </div>
                                    </div>
									<div class="form-group">
										<div class="col-sm-offset-3 col-sm-9">
											<div class="checkbox">
												<label>
													<input type="checkbox"> Remember Me
												</label>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-3 col-sm-9">
											<!-- Button -->
											<button type="submit" class="btn btn-red">Login</button>&nbsp;
											<button type="submit" class="btn btn-white">Reset</button>
										</div>
									</div>
									<div class="col-sm-offset-3 col-sm-9">
										<a href="#" class="black">Forgot Password ?</a>
									</div>
								</form>
								<br />
								<hr />
								<!-- Social Media Login -->
								<div class="s-media text-center">
									<!-- Button -->
									<a href="#" class="btn btn-red"><i class="fa fa-google-plus"></i> &nbsp; Login with Google</a>
									<a href="#" class="btn btn-blue"><i class="fa fa-facebook"></i> &nbsp; Login with Facebook</a>
								</div>
							</div>
							<!-- Login ends -->
						</div>
					</div>
									
				</div>
                 {include file="../_footer.tpl"}
            </div>
            
            <!-- Main content ends -->
            