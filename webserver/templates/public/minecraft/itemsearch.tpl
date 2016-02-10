	<!-- Outer Starts -->
		<div class="outer">
			
			 {include file="../_header.tpl"}
			
			<!-- Main content starts -->
	
			<div class="main-block">
				
				<!-- Page heading two starts -->
				
				<div class="page-heading-two">
					<div class="container">
						<h2>Items for Minecraft <span>Or at least, items I have reviewed so far.</span></h2>
						<div class="breads">
							<a href="/">Home</a> / <a href="/minecraft">Minecraft</a> / Item Search
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				
				<!-- Page heading two ends -->
			
				<div class="container">
					
					<!-- blog One -->
					<div class="blog-one">
						<div class="row">
							<!-- Mainbar column -->
							<div class="col-md-8">
							{if empty($items)}
				                No Blog Entries Found.
				            {else}
				                {foreach $items as $item}

									<!-- Blog item starts -->
									<div class="blog-one-item">
										<!-- blog One Img -->
										<div class="blog-one-img">
											<!-- Image -->
											<a href="/minecraft/mod/{$item->mod_name}/item/{$item->id}/view/{$item->name}.html"><img src="/images/minecraft/mod/item/{$item->image}" alt="{$item->full_name}" class="img-responsive img-thumbnail" /></a>
										</div>
										<!-- blog One Content -->
										<div class="blog-one-content">
											<!-- Heading -->
											<h3><a href="/minecraft/mod/{$item->mod_name}/item/{$item->id}/view/{$item->name}.html">{$item->full_name|truncate:256}</a></h3>
											<!-- Blog meta -->
											<div class="blog-meta">
												
											</div>
											<!-- Paragraph -->
											<p>{$item->description|truncate:256}</p>
										</div>
									</div>
									<!-- Blog item ends -->
				                {/foreach}
				             {/if}

								<!-- Pagination -->
								{$pagination}
							</div>
							
							<!-- Sidebar column -->
							<div class="col-md-4">
								<!-- Sidebar -->
								<div class="sidebar">
									
									
									
									<!-- Nav tab widget - popular, recent and comments -->
									<div class="s-widget">
										<h5><i class="fa fa-tags color"></i>&nbsp; Nav Tabs</h5>
										<div class="widget-content tabs">
											<div class="nav-tabs-two">
												<!-- Nav tabs -->
												<ul class="nav nav-tabs">
													{*<li class="active"><a href="#popular" data-toggle="tab">Popular</a></li>*}
													<li><a href="#recent" data-toggle="tab">Recent</a></li>
													{*<li><a href="#comments" data-toggle="tab">Comments</a></li>*}
												</ul>
												<!-- Tab content -->
												<div class="tab-content">
													{*
													<!-- Popular items -->
													<div class="tab-pane fade in active" id="popular">
														<ul>
															<li>
																<a href="#">
																	<!-- Item image -->
																	<img src="/web/public/assets/demo-img/user/1.jpg" alt="" class="img-responsive img-thumbnail" />
																	<!-- Item title -->
																	<span>Neque porro quisquam estui dolorem ipsum quia dolor sit</span>
																	<div class="clearfix"></div>
																</a>
															</li>
															<li>
																<a href="#">
																	<!-- Item image -->
																	<img src="/web/public/assets/demo-img/user/2.jpg" alt="" class="img-responsive img-thumbnail" />
																	<!-- Item title -->
																	<span>Temporibus autem quibusdam et aut officiis  aut rerum</span>
																	<div class="clearfix"></div>
																</a>
															</li>
															<li>
																<a href="#">
																	<!-- Item image -->
																	<img src="/web/public/assets/demo-img/user/3.jpg" alt="" class="img-responsive img-thumbnail" />
																	<!-- Item title -->
																	<span>Voluptates repudiandae sint et molestiae non recusand</span>
																	<div class="clearfix"></div>
																</a>
															</li>
															<li>
																<a href="#">
																	<!-- Item image -->
																	<img src="/web/public/assets/demo-img/user/4.jpg" alt="" class="img-responsive img-thumbnail" />
																	<!-- Item title -->
																	<span>Neque porro quisquam estui dolorem ipsum quia dolor sit</span>
																	<div class="clearfix"></div>
																</a>
															</li>
														</ul>
													</div>
													*}
													<!-- Recent items -->
													<div class="tab-pane fade in active" id="recent">
														<ul>	
														</ul>														
													</div>
													{*
													<!-- Recent comments -->
													<div class="tab-pane fade" id="comments">
														<ul>
															<li>
																<a href="#">
																	<!-- Item image -->
																	<img src="/web/public/assets/demo-img/user/1.jpg" alt="" class="img-responsive img-thumbnail" />
																	<!-- Item title -->
																	<span>Neque porro quisquam estui dolorem ipsum quia dolor sit</span>
																	<div class="clearfix"></div>
																</a>
															</li>
															<li>
																<a href="#">
																	<!-- Item image -->
																	<img src="/web/public/assets/demo-img/user/2.jpg" alt="" class="img-responsive img-thumbnail" />
																	<!-- Item title -->
																	<span>Temporibus autem quibusdam et aut officiis  aut rerum</span>
																	<div class="clearfix"></div>
																</a>
															</li>
															<li>
																<a href="#">
																	<!-- Item image -->
																	<img src="/web/public/assets/demo-img/user/3.jpg" alt="" class="img-responsive img-thumbnail" />
																	<!-- Item title -->
																	<span>Voluptates repudiandae sint et molestiae non recusand</span>
																	<div class="clearfix"></div>
																</a>
															</li>
															<li>
																<a href="#">
																	<!-- Item image -->
																	<img src="/web/public/assets/demo-img/user/4.jpg" alt="" class="img-responsive img-thumbnail" />
																	<!-- Item title -->
																	<span>Neque porro quisquam estui dolorem ipsum quia dolor sit</span>
																	<div class="clearfix"></div>
																</a>
															</li>
														</ul>
													</div>
													*}
												</div>
											</div>
										</div>
									</div>
									
									{*
									<!-- Tag Widget -->
									<div class="s-widget">
										<h5><i class="fa fa-tags color"></i>&nbsp; Tags</h5>
										<!-- Widgets Content -->
										<div class="widget-content">
											<a href="#" class="label label-color">web</a> 
											<a href="#" class="label label-color">wordpress</a> 
											<a href="#" class="label label-color">php</a> 
											<a href="#" class="label label-color">jquery</a> 
											<a href="#" class="label label-color">java</a> 
											<a href="#" class="label label-color">photoshop</a> 
											<a href="#" class="label label-color">windows</a> 
											<a href="#" class="label label-color">android</a> 
											<a href="#" class="label label-color">ios</a> 
											<a href="#" class="label label-color">chrome</a> 
											<a href="#" class="label label-color">development</a> 
											<a href="#" class="label label-color">plugin</a> 
											<a href="#" class="label label-color">personal</a> 
											<a href="#" class="label label-color">general</a> 
										</div>
									</div>
									*}
									
									{*
									<!-- Gallery Widget -->
									<div class="s-widget">
										<!-- Heading -->
										<h5><i class="fa fa-photo color"></i>&nbsp; Gallery</h5>
										<!-- Widgets Content -->
										<div class="widget-content gallery">
											<a href="/web/public/assets/demo-img/gallery/small/1.jpg" class="lightbox"><img src="/web/public/assets/demo-img/gallery/small/1.jpg" alt="" class="img-responsive img-thumbnail" /></a>
											<a href="/web/public/assets/demo-img/gallery/small/2.jpg" class="lightbox"><img src="/web/public/assets/demo-img/gallery/small/2.jpg" alt="" class="img-responsive img-thumbnail" /></a>
											<a href="/web/public/assets/demo-img/gallery/small/3.jpg" class="lightbox"><img src="/web/public/assets/demo-img/gallery/small/3.jpg" alt="" class="img-responsive img-thumbnail" /></a>
											<a href="/web/public/assets/demo-img/gallery/small/1.jpg" class="lightbox"><img src="/web/public/assets/demo-img/gallery/small/1.jpg" alt="" class="img-responsive img-thumbnail" /></a>
											<a href="/web/public/assets/demo-img/gallery/small/2.jpg" class="lightbox"><img src="/web/public/assets/demo-img/gallery/small/2.jpg" alt="" class="img-responsive img-thumbnail" /></a>
											<a href="/web/public/assets/demo-img/gallery/small/3.jpg" class="lightbox"><img src="/web/public/assets/demo-img/gallery/small/3.jpg" alt="" class="img-responsive img-thumbnail" /></a>
										</div>
									</div>
									*}							
									
									{*
									<!-- Social media widget -->
									<div class="s-widget">
										<h5><i class="fa fa-share color"></i>&nbsp; Social Media</h5>
										<!-- Widgets Content -->
										<div class="widget-content brand-bg">
											<!-- Social Media Icons -->
											<a href="#" class="facebook"><i class="fa fa-facebook square-3 rounded-1"></i></a>
											<a href="#" class="twitter"><i class="fa fa-twitter square-3 rounded-1"></i></a>
											<a href="#" class="google-plus"><i class="fa fa-google-plus square-3 rounded-1"></i></a>
											<a href="#" class="linkedin"><i class="fa fa-linkedin square-3 rounded-1"></i></a>
											<a href="#" class="pinterest"><i class="fa fa-pinterest square-3 rounded-1"></i></a>
											<a href="#" class="dropbox"><i class="fa fa-dropbox square-3 rounded-1"></i></a>
											<a href="#" class="foursquare"><i class="fa fa-foursquare square-3 rounded-1"></i></a>
											<a href="#" class="flickr"><i class="fa fa-flickr square-3 rounded-1"></i></a>
											<a href="#" class="github"><i class="fa fa-github square-3 rounded-1"></i></a>
											<a href="#" class="instagram"><i class="fa fa-instagram square-3 rounded-1"></i></a>
											<a href="#" class="skype"><i class="fa fa-skype square-3 rounded-1"></i></a>
											<a href="#" class="tumblr"><i class="fa fa-tumblr square-3 rounded-1"></i></a>
											<a href="#" class="dribbble"><i class="fa fa-dribbble square-3 rounded-1"></i></a>
											<a href="#" class="youtube"><i class="fa fa-youtube square-3 rounded-1"></i></a>
										</div>
									</div>
									*}
									
								</div>
							</div>
						</div>
					</div>
									
				</div>
				  {include file="../_footer.tpl"}
			</div>
			
			<!-- Main content ends -->
			