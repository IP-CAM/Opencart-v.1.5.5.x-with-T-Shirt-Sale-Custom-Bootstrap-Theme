<?php /* ?>
<div class="slideshow">
  <div id="slideshow<?php echo $module; ?>" class="nivoSlider" style="width: <?php echo $width; ?>px; height: <?php echo $height; ?>px;">
    <?php foreach ($banners as $banner) { ?>
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
    <?php } ?>
    <?php } ?>
  </div>
</div>
<script type="text/javascript"><!--
$(document).ready(function() {
	//$('#slideshow<?php echo $module; ?>').nivoSlider();
});
--></script>
<?php */ ?>

	<div class="carousel slide slider-top" id="carousel-129056">
		<ol class="carousel-indicators">
			<?php 
			$g=0;
			foreach ($banners as $val) { ?>
				<li data-slide-to="<?php echo $g?>" data-target="#carousel-129056" class="<?php if ($g == 1) echo 'active';?>"></li>
			<?php 
			$g++;
			} 
			?>
		</ol>
		<div class="carousel-inner">
		<?php 
		$i=0;
		foreach ($banners as $banner) { ?>
			<div class="item <?php if ($i == 1) echo 'active';?>">
				<?php if ($banner['link']) { ?>
					<a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
				<?php } else { ?>
					<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
				<?php } ?>
				<div class="carousel-caption"><h4><?php echo $banner['title']; ?></h4></div>	
			</div>			
		<?php 
		$i++;
		} 
		?>
		</div> <a class="left carousel-control" href="#carousel-129056" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-129056" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
	</div>

<script type="text/javascript"><!--
$(document).ready(function() {
	$('.slider-top').carousel({
		interval: 6000
	});

	$('.slider-top').on('slide.bs.carousel', function () {
		$(this).fadeOut(250).fadeIn(250);
	})
	.hover(function() {
		$(this).find('.carousel-caption').animate({opacity:1,border:4},200,'swing');
	},
	function() {
		$(this).find('.carousel-caption').animate({opacity:0.7,border:0},200,'swing');
	}).show('100');
	$('.slider-top .carousel-caption h4').hide();
	$('.slider-top').hover(function() {
		//$(this).animate({borderWidth:2},100);
		$(this).find('h4').slideDown(250);
	},function(){
		//$(this).animate({borderWidth:0},100);		
		$(this).stop().find('h4').slideUp(250);
	});
	
});
--></script>
