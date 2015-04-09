<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title.' | '.$base; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/fonts.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/stylesheet.css" />
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<link href="http://fonts.googleapis.com/css?family=Alef" rel="stylesheet" type="text/css">
<meta name="robots" content="all,index,follow"/>
<meta name="googlebot" content="all,index,follow"/>
<meta name="allow-search" content="yes"/>
<meta name="audience" content="all"/>
<meta name="revisit" content="2 days"/>
<meta name="revisit-after" content="2 days"/>
<meta name="distribution" content="global"/>
<meta name="document-classification" content="general"/>
<meta name="rating" content="general"/>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="catalog/view/javascript/bootstrap/js/bootstrap.min.js"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
<!--[if IE 7]> 
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo img');
</script>
<![endif]-->
<?php if ($stores) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
<?php foreach ($stores as $store) { ?>
$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
<?php } ?>
});
//--></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body>
<div id="container" class="container">
	
<div id="header" class="navbar">
	
  <?php if ($logo) { ?>
  	<div id="logo" class="navbar-left col-sm-5">
		<a href="<?php echo $home; ?>"><img class="img-responsive" src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
	</div>
  <?php } ?>
  
  	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
	  <span class="sr-only">Toggle Menu</span>
	  <span class="fa fa-bars fa-2x"></span>
	</button>
	
	<div class="collapse navbar-collapse clearfix">
		
		<div class="navbar-right col-sm-6 col-xs-12">
		
			<div class="col-sm-7 col-xs-8">
				<?php echo $language; ?>
				<?php echo $currency; ?>	
				<?php echo $cart; ?>  		
			</div>

			<div id="search" class="col-sm-5 col-xs-12">
				<div class="button-search"></div>
				<input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
			</div>
		
			<!--div id="welcome">
			  <?php /* if (!$logged) { ?>
			  <?php echo $text_welcome; ?>
			  <?php } else { ?>
			  <?php echo $text_logged; ?>
			  <?php } */ ?>
			</div-->
			
			
		</div>
	
	</div><!--/.nav-collapse -->	
	
	<div class="navigation">
		<ul class="list-inline">
			<li><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a></li>
			<!--li><a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a></li>
			<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li-->
			<li><a href="<?php echo $news; ?>"><?php echo $text_news; ?></a></li>
			<li><a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a></li>
			<li><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></li>
		</ul>
	</div>
</div>
	
<?php if ($categories) { ?>
<div id="menu">
  <ul>
    <?php foreach ($categories as $category) { ?>
    <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
      <?php if ($category['children']) { ?>
      <div>
        <?php for ($i = 0; $i < count($category['children']);) { ?>
        <ul>
          <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
          <?php for (; $i < $j; $i++) { ?>
          <?php if (isset($category['children'][$i])) { ?>
          <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
          <?php } ?>
          <?php } ?>
        </ul>
        <?php } ?>
      </div>
      <?php } ?>
    </li>
    <?php } ?>
  </ul>
</div>
<?php } ?>
<div id="notification"></div>
