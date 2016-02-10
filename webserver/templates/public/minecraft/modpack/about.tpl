	<!-- Outer Starts -->
		<div class="outer">
			
			 {include file="../../_header.tpl"}
			
			<!-- Main content starts -->
	
			<div class="main-block">
				
				<!-- Page heading two starts -->
				
				<div class="page-heading-two">
					<div class="container">
						<h2>{$mod->full_name} <span>{$mod->short_description}</span></h2>
						<div class="breads">
							<a href="/">Home</a> / <a href="/minecraft">Minecraft</a> / <a href="/minecraft/modpack">Modpack</a> / {$mod->full_name}
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				
				<!-- Page heading two ends -->
			
				<div class="container">
					<!-- Actual content -->
						<div class="row box-shadow-block box-shadow-2">
											
							<div class="col-md-8 col-sm-6 row">
								<div class="br-color padd-5 br-style-1">
								<p>{$mod->description}</p>
								</div>
								<br>
{*
								<div class="table-responsive">
									<table class="table table-striped">
										
										<tr>
											<th>Notes:</th>
											<td>
												<ul>
													<li>Requires a purchased copy.</li>
													<li>Is awesome</li>
												</ul>
											</td>
										</tr>
									</table>
								</div>
								*}
							</div>
							<div class="col-md-4 col-sm-6">
								<div class="row">
									<a href="{$mod->website}" target="_blank"><img class="img-responsive img-center center-block" src="/images/minecraft/modpack/{$mod->image}" alt="{$mod->name}"/><br>
								</div>
								<div class="row">
									<div class="text-center">Website</a></div>								
								</div>
							</div>
							<div class="col-md-12 row">
							<a href="/minecraft/modpack/{$mod->name}/guide/"><button class="btn btn-lblue">Guide List</button></a>
							</div>
						</div>
						
						<br />
						
						
							
					  <div class="row fb-comments" data-href="http://xackery.com/{$uri}" data-numposts="10" data-colorscheme="light"></div>
                            <div id="fb-root"></div>
							
					</div>
									
				</div>
		{include file="../../_footer.tpl"}
			</div>
			
			<!-- Main content ends -->