<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>{$site->title}</title>
        <!-- Description, Keywords and Author -->
        <meta name="description" content="{$site->description}">
        <meta property="og:image" content="http://xackery.com{$site->image}">
        <meta property="og:title" content="{$site->title}">
        <meta property="og:description" content="{$site->description}">
        <meta name="keywords" content="{$site->keywords}">
        <meta name="author" content="Xackery">
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <!-- Styles -->
        <!-- Bootstrap CSS -->
        <link href="/web/public/assets/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font awesome CSS -->
        <link href="/web/public/assets/css/font-awesome.min.css" rel="stylesheet">
        <!-- Magnific Popup -->
        <link href="/web/public/assets/css/magnific-popup.css" rel="stylesheet">
        <!-- Owl carousel -->
        <link href="/web/public/assets/css/owl.carousel.css" rel="stylesheet">
        
        <!-- CSS for this page -->
        
        <!-- Base style -->
        <link href="/web/public/assets/css/styles/style.css" rel="stylesheet">
        <!-- Skin CSS -->
        <link href="/web/public/assets/css/styles/skin-lblue.css" rel="stylesheet" id="color_theme">
        
        
        <link href="/web/public/assets/css/custom.css" rel="stylesheet">
        
        <!-- Favicon -->
        <link rel="shortcut icon" href="/favicon.ico">
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