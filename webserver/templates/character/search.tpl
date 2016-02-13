{{template "header" .}}
<div class="container">
	<div class="row" style="margin-top:60px;">
		<div class="row">
			<div class="col-md-12">
				<ul class="breadcrumb">
					<li><a href="/character/">Character</a></li>
					<li class="active">Search</li>
				</ul>
			</div>
		</div>
		<div class="col-md-8 col-md-offset-2">
			<div class="row">
				<form class="well bs-component" action="/character/search/" method="GET">
					<div class="form-group">
						<label class="control-label">Character Search</label>
						<div class="input-group">
							<input type="text" class="form-control" name="name" placeholder="{{.LastSearchQuery}}">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button">Search</button>
							</span>
						</div>
					</div>
				</form>
			</div>
			{{if .LastSearchQuery}}
			<div class="row">
				<div class="panel panel-default">
					
					<div class="panel-heading">
					{{if .Characters}}
						Found results.
					{{else}}
						There are no search results.
					{{end}}
					</div>					
					<div class="panel-body">
						<ul class="list-group">
						{{range $character := .Characters}}
							<li class="list-group-item">
								<span class="slot"></span>
								{{$character.Name}} {{if $character.GuildName}}&lt; {{$character.GuildName}} &gt; {{end}}{{$character.Level}}{{$character.ClassName}} (Last Logged In: {{$character.LastLoginText}})
								<br>
								<a href="/account/manager/?cid={{$character.Account_id}}" class="btn btn-primary btn-xs"> <i class="glyphicon glyphicon-user"></i> Account</a>
								<a href="/character/inventory/?cid={{$character.Id}}" class="btn btn-primary btn-xs"> <i class="glyphicon glyphicon-th"></i> Inventory</a>
							</li>
						</ul>
						{{end}}
					</div>
				</div>
			</div>
			{{end}}
		</div>
	</div>
</div>