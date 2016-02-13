<nav class="navbar navbar-fixed-top navbar-bootsnipp animate">
	<div class="container-fluid" style="background-color: #009966">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			</button>
			<a href="/" class="navbar-brand">ShinShop</a>
		</div>
		<div class="collapse navbar-collapse" id="nav-header">
			<ul class="nav navbar-nav">
				<li><a href="/item"><span class="glyphicon glyphicon-leaf"></span> Item</a></li>
				<li><a href="/character/"><span class="glyphicon glyphicon-user"></span> Character</a></li>
				<li><a href="/map/editor/"><span class="glyphicon glyphicon-map"></span> Map</a></li>
				
			</ul>
			<form class="navbar-form navbar-left" action="/character/search/" role="search" method="GET">
				<div class="form-group">
					<input type="text" class="form-control" name="name" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
			</form>
		</div>
	</div>
</nav>