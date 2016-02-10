	<!-- Outer Starts -->
		<div class="outer">
			
			 {include file="../../../_header.tpl"}
			
			<!-- Main content starts -->
	
			<div class="main-block">
				
				<!-- Page heading two starts -->
				
				<div class="page-heading-two">
					<div class="container">
						<h2>Guides for {$mod->full_name} <span>Or at least, items I have reviewed so far.</span></h2>
						<div class="breads">
							<a href="/">Home</a> / <a href="/minecraft">Minecraft</a> / <a href="/minecraft/mod">Mods</a> / <a href="/minecraft/mod/{$mod->name}/about">{$mod->full_name}</a> / Guide
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				
				<!-- Page heading two ends -->
			
				<div class="container">
					
					<!-- blog One -->
					<div class="item-one">
						<div class="row">
							<!-- Mainbar column -->
							<div class="col-md-8">
							{if empty($items)}
				                No Items Found.
				            {else}
				                {foreach $items as $item}
									
									<div class="item-one-item">
										<div class="item-one-img">
											<a href="/minecraft/mod/{$mod->name}/item/{$item->id}/view/{$item->name}.html"><img src="/images/minecraft/mod/item/{$item->image}" alt="{$item->full_name}" class="img-responsive img-thumbnail" /></a>
										</div>
										<div class="item-one-content">
											<h3><a href="/minecraft/mod/{$mod->name}/item/{$item->id}/view/{$item->name}.html">{$item->full_name|truncate:256}</a></h3>
											<!-- Blog meta -->
											<div class="item-meta">
												Rawr
											</div>
											<p>{$item->description|truncate:256}</p>
										</div>
									</div>
				                {/foreach}
				             {/if}

								<!-- Pagination -->
								{$pagination}
							</div>
							
							<!-- Sidebar column -->
							<div class="col-md-4">
								<!-- Sidebar -->
								<div class="sidebar">
								
									<div class="s-widget">
										<div class="widget-content tabs">
											<div class="nav-tabs-two">
												<!-- Nav tabs -->
												<ul class="nav nav-tabs">
													<li><a href="#recent" data-toggle="tab">Recent</a></li>
													
												</ul>
												<!-- Tab content -->
												<div class="tab-content">
													
													<!-- Recent items -->
													<div class="tab-pane fade in active" id="recent">
														<ul>	
														{foreach $itemsRecent item=item}
														<li>
															<a href="/minecraft/mod/{$mod->name}/item/{$item->id}/view/{$item->name}.html">
																<!-- Item image -->
																<img src="/images/minecraft/mod/item/{$item->image}" alt="{$item->full_name} Image" class="img-responsive img-thumbnail" />
																<!-- Item title -->
																<span>{$item->full_name}</span>
																<div class="clearfix"></div>
															</a>
														</li>
														{/foreach}
														</ul>														
													</div>
												</div>
											</div>
										</div>
									</div>
									
								</div>
							</div>
						</div>
					</div>
									
				</div>
				  {include file="../../../_footer.tpl"}
			</div>
			
			<!-- Main content ends -->
			