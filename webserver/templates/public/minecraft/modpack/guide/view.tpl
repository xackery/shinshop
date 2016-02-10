	<!-- Outer Starts -->
		<div class="outer">
			
			 {include file="../../../_header.tpl"}
			
			<!-- Main content starts -->
	
			<div class="main-block">
				
				<!-- Page heading two starts -->
				
				<div class="page-heading-two">
					<div class="container">
						<h2>{$item->full_name} <span>{$item->short_description}</span></h2>
						<div class="breads">
							<a href="/">Home</a> / <a href="/minecraft">Minecraft</a> / <a href="/minecraft/modpack">Modpack</a> / <a href="/minecraft/modpack/{$mod->name}">{$mod->full_name}</a> / <a href="/minecraft/modpack/{$mod->name}/guide">Guide</a> / {$item->full_name}
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				
				<!-- Page heading two ends -->
			
				<div class="container">
					
					<!-- Actual content -->
					<div class="ecommerce">
						<div class="row box-shadow-block box-shadow-2">
							<div>
								<!-- Shopping items content -->
								<div class="shopping-content ">
								
									<div class="shopping-single">
										<div>
											
											<div class="col-md-8 col-sm-6 row">
												<div class="br-color padd-5 br-style-1">
												<p>{$item->description}</p>
												</div>
												</br>
												
											<div class="col-md-4 col-sm-6">
											
												<img class="img-responsive img-center center-block" src="/images/minecraft/modpack/guide/{$item->image}" alt="Minecraft in game photo"/>
												
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<br />
						
						
							
					  </div>
					  <div class="row fb-comments" data-href="http://xackery.com/{$uri}" data-numposts="10" data-colorscheme="light"></div>
                            <div id="fb-root"></div>
							
					</div>
									
				</div>
		{include file="../../../_footer.tpl"}
			</div>
			
			<!-- Main content ends -->