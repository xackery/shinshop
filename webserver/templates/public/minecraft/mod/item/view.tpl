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
							<a href="/">Home</a> / <a href="/minecraft">Minecraft</a> / <a href="/minecraft/mod">Mod</a> / <a href="/minecraft/mod/twilight">The Twilight Forest</a> / <a href="/minecraft/mod/twilight/item">Item</a> / {$item->full_name}
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
												<!-- Product Details -->
												<div class="table-responsive">
													<table class="table table-striped">
														<tr>
															<th>Mod:</th>
															<td><a href="/minecraft/mod/{$mod->name}/about">{$mod->full_name}</a></td>
														</tr>
														<tr>
															<th>Categories:</th>
															<td>{$item->categoryList}</td>
														</tr>
														
														<tr>
														
															<th>Effectiveness:</th>
															<td>{for $rating=1 to 5}<i class="fa fa-star{if $rating <= $item->effectiveness} yellow{/if}"></i>{/for} &nbsp; ({$item->effectiveness})</td>
														</tr>
														<tr>
															<th>Difficulty To Obtain:</th>
															<td>{for $rating=1 to 5}<i class="fa fa-star{if $rating <= $item->difficulty} yellow{/if}"></i>{/for} &nbsp; ({$item->difficulty})</td>
														</tr>
														{foreach $item->notes as $note}
														<tr>
															<th>{$note->note_key}:</th><td>{$note->note_value}</td>
														</tr>
														{/foreach}
														{if !empty($item->charges)}
														<tr>
															<th>Item Charges:</th>
															<td>{$item->charges}</td>
														</tr>
														{/if}
													</table>
													{if !empty($item->youtube)}
													<div>
													<iframe width="420" height="315" src="https://www.youtube.com/embed/{$item->youtube}" frameborder="0" allowfullscreen></iframe>
													</div>
													{/if}
												</div>
											</div>
											<div class="col-md-4 col-sm-6">
											
												<img class="img-responsive img-center center-block" src="/images/minecraft/mod/item/{$item->image}" alt="Minecraft in game photo"/>
												
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