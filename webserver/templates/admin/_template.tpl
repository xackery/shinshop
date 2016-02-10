<html xmlns="http://www.w3.org/1999/xhtml" xmlns:og="http://ogp.me/ns#" xmlns:fb="https://www.facebook.com/2008/fbml"><head>
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta property="og:title" content="HTML Snippets for Twitter Boostrap framework : Bootsnipp.com">
      <meta property="og:type" content="website">
      <meta property="twitter:account_id" content="786331568">
      <meta itemprop="name" content="Bootsnipp">
      <meta itemprop="description" content="Free HTML snippets for Bootstrap HTML CSS JS Framework">
      <meta property="og:url" content="http://bootsnipp.com">
      <meta property="og:image" content="http://bootsnipp.com/img/logo.jpg">
      <meta property="og:site_name" content="Bootsnipp.com">
      <meta property="og:description" content="Bootsnipp is an element gallery for web designers and web developers, anybody who is using Bootstrap will find this website essential in their craft.">
      <meta name="description" content="Bootsnipp is an element gallery for web designers and web developers, anybody who is using Bootstrap will find this website essential in their craft.">
      <meta name="author" content="Maks Surguy, @msurguy">
    <title>{$site->title} | ShinShop</title>
    <link rel="apple-touch-icon-precomposed" href="apple-touch-icon-precomposed.gif">
    <link rel="apple-touch-icon-precomposed" href="apple-touch-icon-72x72-precomposed.gif">
    <link rel="apple-touch-icon-precomposed" href="apple-touch-icon-114x114-precomposed.gif">
    <link rel="apple-touch-icon-precomposed" href="apple-touch-icon-144x144-precomposed.gif">

    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css">
    
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    	<script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.6.2/html5shiv.js"></script>
    	<script src="//cdnjs.cloudflare.com/ajax/libs/respond.js/1.2.0/respond.js"></script>
    <![endif]-->
    
        
        <!-- Favicon -->
        <!--link rel="shortcut icon" href="/favicon.ico"-->
        <!-- Template JS -->
        {if !empty($jsTopTemplate)}{$jsTopTemplate}{/if}
        <!-- Page JS -->
        {if !empty($jsTopPage)}{$jsTopPage}{/if}
    </head>
    
    <body>
      
    
        {$content}
        
        
        {*<span class="totop"><a href="#"><i class="fa fa-angle-up bg-color"></i></a></span>*}
        
        <!-- Template JS -->
        {if !empty($jsBotTemplate)}{$jsBotTemplate}{/if}
        <!-- Page JS -->
        {if !empty($jsBotPage)}{$jsBotPage}{/if}
    </body> 
</html>