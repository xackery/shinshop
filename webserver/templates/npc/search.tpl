{include file="../_header.tpl"}
  <div class="container">

	<div class="row" style="margin-top:60px;">
		<div class="row">
	      <div class="col-md-12">
	        <ul class="breadcrumb">
	          <li><a href="/player/">NPC</a></li>
	          <li class="active">Search</li>
	        </ul>
	      </div>
	    </div>

	  	<div class="col-md-8 col-md-offset-2">
	  		<div class="row">
				<form class="well bs-component" action="/npc/search" method="GET">
					<div class="form-group">
			          <label class="control-label">NPC Search</label>
			          <div class="input-group">
			            <input type="text" class="form-control" name="q" placeholder="{if !empty($q)}{$q}{/if}">
			            <span class="input-group-btn">
			              <button class="btn btn-default" type="button">Search</button>
			            </span>
			          </div>
			        </div>
			     </form>
			 </div>
			 {if !empty($searchResults)}
			<div class="row">

			    <div class="panel panel-default">
                 
					<div class="panel-heading">

					{if empty($mobs)}
					There are no search results.
					</div>
	                    <div class="panel-body">
					{else}
					There {if $total == 1}is 1 player that matches {$q}.{else}are {$total} players that match '{$q}'. Showing {$start} to {$end}{/if} 
					</div>
						<div class="panel-body">
						<ul class="list-group">
							{foreach $mobs item=npc}
				  			<li class="list-group-item">
				  				<div class="col-md-1">
				  				<span class="slot">
				  					<img src="/images/items/item_500.gif">
				  				</span>
				  				</div>
				  				<div class="col-md-11">
					  				{$npc->clean_name} Lv. {$npc->level}
					  				<br>
					  				
				  				</div>
				  			</li>
							{/foreach}
						</ul>
					{/if}
					</div>
				</div> {*panel*}

			</div>
			{/if}
		</div>
	</div>
  </div>
    
{*include file="../_footer.tpl"*}