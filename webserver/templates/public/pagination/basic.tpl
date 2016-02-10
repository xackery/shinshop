<ul class="pagination">
	<li>{if $first_page !== false}<a href="{$page->url($first_page)}" rel="first">First</a>{/if}</li>
	<li>{if $previous_page !== false}<a href="{$page->url($previous_page)}" rel="first">Previous</a>{/if}</li>
	{for $i=1 to $total_pages}
		{if $i == $current_page}
			<li class="active"><a><strong>{$i}</strong></a></li>
		{else}
			{if $i < $current_page && $i >= ($current_page - 2)}
				<li><a href="{$page->url($i)}">{$i}</a></li>	
			{/if}
			{if $i > $current_page && $i <= ($current_page + 2)}
				<li><a href="{$page->url($i)}">{$i}</a></li>	
			{/if}
		{/if}
	{/for}
	<li>{if $next_page !== FALSE}<a href="{$page->url($next_page)}" rel="next">Next</a>{/if}</li>
	<li>{if $last_page !== FALSE}<a href="{$page->url($last_page)}" rel="last">Last</a>{/if}</li>
</ul><!-- .pagination -->