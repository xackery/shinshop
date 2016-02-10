{include file="../_header.tpl"}
  <div class="container">

	<div class="row" style="margin-top:60px;">
		<div class="row">
	      <div class="col-md-12">
	        <ul class="breadcrumb">
	          <li><a href="/admin/player/">Item</a></li>
	          <li class="active">Search</li>
	        </ul>
	      </div>
	    </div>

	  	<div class="col-md-8 col-md-offset-2">
	  		<div class="row">
				<form class="well bs-component" action="/admin/item/search" method="GET">
					<div class="form-group">
			          <label class="control-label">Item Search</label>
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

					{if empty($items)}
					There are no search results.
					</div>
	                    <div class="panel-body">
					{else}
					There {if $total == 1}is 1 item that matches {$q}.{else}are {$total} items that match '{$q}'. Showing {$start} to {$end}{/if} 
					</div>
						<div class="panel-body">
						<ul class="list-group">
							{foreach $items item=item}
				  			<li class="list-group-item">
				  				<div class="col-md-1">
				  				<span class="slot">
				  					<img item-id="{$item->id}" item-name="{$item->Name}" item-icon="{$item->icon}" data-mask="{$item->slots}" class="draggable" src="/images/items/item_{$item->icon}.gif" is-bag={if $item->bagsize > 0}1{else}0{/if}>
				  				</span>
				  				</div>
				  				<div class="col-md-11">
				  				{$item->Name}
				  				<br>
				  				{*<a href="/admin/item/editor/{$item->id}" class="btn btn-primary btn-xs"> <i class="glyphicon glyphicon-edit"></i> Editor</a> *}
				  				{*<a href="/admin/player/inventory/{$item->id}" class="btn btn-primary btn-xs"> <i class="glyphicon glyphicon-th"></i> NPC Inventory</a>*}
				  				<a href="/admin/item/player/{$item->id}" class="btn btn-primary btn-xs"> <i class="glyphicon glyphicon-user"></i> Player Inventory</a> 
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