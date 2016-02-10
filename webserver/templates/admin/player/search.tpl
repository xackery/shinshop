{include file="../_header.tpl"}
  <div class="container">

	<div class="row" style="margin-top:60px;">
		<div class="row">
	      <div class="col-md-12">
	        <ul class="breadcrumb">
	          <li><a href="/admin/player/">Player</a></li>
	          <li class="active">Search</li>
	        </ul>
	      </div>
	    </div>

	  	<div class="col-md-8 col-md-offset-2">
	  		<div class="row">
				<form class="well bs-component" action="/admin/player/search" method="GET">
					<div class="form-group">
			          <label class="control-label">Player Search</label>
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

					{if empty($characters)}
					There are no search results.
					</div>
	                    <div class="panel-body">
					{else}
					There {if $total == 1}is 1 player that matches {$q}.{else}are {$total} players that match '{$q}'. Showing {$start} to {$end}{/if} 
					</div>
						<div class="panel-body">
						<ul class="list-group">
							{foreach $characters item=character}
				  			<li class="list-group-item">
				  				<span class="slot"></span>
				  				{$character->name} {if !empty($character->guild_name)}&lt;{$character->guild_name}&gt; {/if}{$character->level} {$character->class_name} (Last Logged In: {$character->last_login_text})
				  				<br>
				  				<a href="/admin/account/manager/{$character->account_id}" class="btn btn-primary btn-xs"> <i class="glyphicon glyphicon-user"></i> Account</a> 
				  				<a href="/admin/player/inventory/{$character->id}" class="btn btn-primary btn-xs"> <i class="glyphicon glyphicon-th"></i> Inventory</a> 
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