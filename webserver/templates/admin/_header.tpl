
<nav class="navbar navbar-fixed-top navbar-bootsnipp animate">
  <div class="container-fluid" style="background-color: #009966">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a href="/admin/" class="navbar-brand">ShinShop</a>
    </div>

    <div class="collapse navbar-collapse" id="nav-header">
      <ul class="nav navbar-nav">
        <li><a href="/admin/item"><span class="glyphicon glyphicon-leaf"></span> Item</a></li>
        <li><a href="/admin/npc"><span class="glyphicon glyphicon-knight"></span> NPC</a></li>
        <li><a href="/admin/player"><span class="glyphicon glyphicon-user"></span> Player</a></li>
        <li><a href="/admin/zone"><span class="glyphicon glyphicon-globe"></span> Zone</a></li>
        
      </ul>
      <form class="navbar-form navbar-left" action="/admin/player/search" role="search" method="GET">
        <div class="form-group">
          <input type="text" class="form-control" name="q" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">Guest <i class="glyphicon glyphicon-off"></i></a></li>
      </ul>
    </div>
  </div>
</nav>
             {* 
<nav class="navbar navbar-fixed-top navbar-bootsnipp animate" role="navigation">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <div class="animbrand">
        <a class="navbar-brand animate" href="/admin/">ShinShop</a>
      </div>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
      <ul class="nav navbar-nav navbar-right">
        <li class="visible-xs">
          <form action="http://bootsnipp.com/search" method="GET" role="search">
            <div class="input-group">
              <input type="text" class="form-control" name="q" placeholder="Search for snippets">
              <span class="input-group-btn">
                <button class="btn btn-primary" type="submit"><span class="glyphicon glyphicon-search"></span></button>
                <button class="btn btn-danger" type="reset"><span class="glyphicon glyphicon-remove"></span></button>
              </span>
            </div>
          </form>
        </li>
        <!--li class=""><a href="Player" class="animate">Player</a></li-->
        <li>
          <a href="#" class="dropdown-toggle animate " data-toggle="dropdown">Player <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li class=""><a href="./edit" class="animate">Edit Inventory <span class="pull-right glyphicon glyphicon-pencil"></span></a></li>
            <li class=""><a href="#" class="animate">Edit Profile <span class="pull-right glyphicon glyphicon-align-justify"></span></a></li>
          </ul>
        </li>
        <!--li class="dropdown">
          <a href="http://bootsnipp.com/snippets" class="dropdown-toggle animate" data-toggle="dropdown">Snippets <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li class=""><a href="http://bootsnipp.com/snippets/featured" class="animate">Featured <span class="pull-right glyphicon glyphicon-star"></span></a></li>
            <li class=""><a href="http://bootsnipp.com/tags" class="animate">Tags  <span class="pull-right glyphicon glyphicon-tags"></span></a></li>
            <li class="dropdown-header">By Bootstrap Version</li>
                          <li><a href="http://bootsnipp.com/tags/3.3.0" class="animate">3.3.0</a></li>
                          <li><a href="http://bootsnipp.com/tags/3.2.0" class="animate">3.2.0</a></li>
                          <li><a href="http://bootsnipp.com/tags/3.1.0" class="animate">3.1.0</a></li>
                          <li><a href="http://bootsnipp.com/tags/3.0.3" class="animate">3.0.3</a></li>
                          <li><a href="http://bootsnipp.com/tags/3.0.1" class="animate">3.0.1</a></li>
                          <li><a href="http://bootsnipp.com/tags/3.0.0" class="animate">3.0.0</a></li>
                          <li><a href="http://bootsnipp.com/tags/2.3.2" class="animate">2.3.2</a></li>
                      </ul>
        </li-->
        
                  <!--li class="active"><a href="http://bootsnipp.com/register" class="animate">Register</a></li-->
          

          <!--li id="nav-login-btn" class=""><a href="/login" class="animate">Login</a></li-->
          <li id="nav-login-btn" class=""><a href="#" class="animate">Guest</a></li>
        
        
        <li class="hidden-xs"><a href="#toggle-search" class="animate"><span class="glyphicon glyphicon-search"></span></a></li>
      </ul>
    </div>
  </div>
</nav>  *}