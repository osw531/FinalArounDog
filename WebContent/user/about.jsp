<%@ page contentType="text/html; charset=UTF-8"%>
<meta charset="utf-8"/>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="img/fav.png">
<!-- Author Meta -->
<meta name="author" content="codepixer">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>Animal Shelter</title>

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<!--
			CSS
			============================================= -->
<link rel="stylesheet" href="css/linearicons.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/nice-select.css">
<link rel="stylesheet" href="css/animate.min.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/main.css">
<style>
#googleMap{
	text-align:center;
	margin:auto;
}
</style>
<script>
		function myMap() {
			var latLng = new google.maps.LatLng(37.571066, 126.992255);
			var mapProp = {
				center : latLng,
				zoom : 18,
			};
			var map = new google.maps.Map(document.getElementById("googleMap"),
					mapProp);
			var marker = new google.maps.Marker({
				position: latLng,
				animation:google.maps.Animation.BOUNCE,
				icon:"/user/img/dogmarker.png"
				});

			marker.setMap(map); //맵에 마커 등록!!!
			var infowindow = new google.maps.InfoWindow(
					{
						content : "이곳이 <h3 style='color:red'><img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaC0GwlHHA2DidMj50Vec2SR4IUaj_nUW1lgBTppttSiSv386dxQ'></h3>이다!"
					});

			// Zoom to 9 when clicking on marker
			google.maps.event.addListener(marker, 'click', function() {
				map.setCenter(marker.getPosition());
				infowindow.open(map, marker);
				var pos = map.getZoom(); //기존에 설정된 줌의 중심점!!
				map.setZoom(15);
				//일정 시간뒤에 무언가 하고 싶을 때
				window.setTimeout(function() {
					map.setZoom(pos);
				}, 2400);
			});

		}
	</script>
</head>
<body>
	<header id="header" id="home">
		<div class="container main-menu">
			<div class="row align-items-center justify-content-between d-flex">
				<div id="logo">
					<a href="index.html"><img src="img/logo.png" alt="" title="" /></a>
				</div>
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li class="menu-active"><a href="index.html">Home</a></li>
						<li><a href="about.html">About Us</a></li>
						<li><a href="cats.html">Cats</a></li>
						<li><a href="dogs.html">Dogs</a></li>
						<li><a href="volunteer.html">Volunteer</a></li>
						<li class="menu-has-children"><a href="">Blog</a>
							<ul>
								<li><a href="blog-home.html">Blog Home</a></li>
								<li><a href="blog-single.html">Blog Single</a></li>
							</ul></li>
						<li><a href="contact.html">Contact</a></li>
						<li class="menu-has-children"><a href="">Dropdown</a>
							<ul>
								<li><a href="elements.html">Elements</a></li>
								<li><a href="#">Item</a></li>
								<li class="menu-has-children"><a href="">Level 2</a>
									<ul>
										<li><a href="#">Item 1</a></li>
										<li><a href="#">Item 2</a></li>
									</ul></li>
							</ul></li>
					</ul>
				</nav>
				<!-- #nav-menu-container -->
			</div>
		</div>
	</header>
	<!-- #header -->

	<!-- start banner Area -->
	<section class="banner-area relative" id="home">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">About Us</h1>
					<p class="text-white link-nav">
						<a href="index.html">Home </a> <span class="lnr lnr-arrow-right"></span>
						<a href="about.html"> About Us</a>
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->
	<br>
	<!-- Start home-about Area -->
	<section class="home-about-area">
		<div class="container-fluid">
			<div class="row align-items-center">
				<div class="col-lg-6 home-about-left no-padding">
					<img src="img/about-img.jpg" alt="" style="width: 70%">
				</div>
				<div class="col-lg-6 home-about-right no-padding">
					<h1>Our Mission</h1>
					<h5>We are here to listen from you deliver exellence</h5>
					<p>Abandoned Pet Shelter (APS), founded in 2019,IRS tax-exempt,
						qualified non-profit charitable organization that rescues and
						shelters abandoned, abused, and neglected pets, rehabilitates them
						and finds them new homes. APS is one of the largest no kill animal
						shelters in Republic of Korea and is devoted to the welfare of all
						animals.</p>
					<a href="#" class="primary-btn text-uppercase">get details</a>
				</div>
			</div>
		</div>
	</section>
	<!-- End home-about Area -->

	<!-- Start testomial Area -->
	<section class="testomial-area section-gap" id="testimonail">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="menu-content pb-60 col-lg-8">
					<div class="title text-center">
						<h1 class="mb-10">Introducing our guardians who love dogs</h1>
						<p>Let me introduce you to the center manager who loves dogs.</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="active-testimonial-carusel">
					<div class="single-testimonial item">
						<img class="mx-auto" src="img/min.png" alt="">
						<p class="desc">He loves dogs and is always interested in
							problems with abandoned dogs, and he is a responsible manager. As
							a manager, He is doing his best for the puppies at the center.
						</h4>
						<h4>Kim Min Ho</h4>
						<p>CEO at Center</p>
					</div>
					<div class="single-testimonial item">
						<img class="mx-auto" src="img/kim.png" alt="">
						<p class="desc">She loves dogs and is always interested in
							problems with abandoned dogs, and she is a responsible manager.
							As a manager, She is doing her best for the puppies at the center.
						
						</h4>
						<h4>Kim Hyeon Hwa</h4>
						<p>Manager of Center</p>
					</div>
					<div class="single-testimonial item">
						<img class="mx-auto" src="img/kwon.png" alt="">
						<p class="desc">She loves dogs and is always interested in
							problems with abandoned dogs, and she is a responsible manager.
							As a manager, She is doing her best for the puppies at the center.
						
						</h4>
						<h4>Kwon Ji Young</h4>
						<p>Manager of Center</p>
					</div>
					<div class="single-testimonial item">
						<img class="mx-auto" src="img/dong.png" alt="">
						<p class="desc">He loves dogs and is always interested in
							problems with abandoned dogs, and he is a responsible manager. As
							a manager, He is doing his best for the puppies at the center.
						</h4>
						<h4>Hwang Dong Hyeon</h4>
						<p>Manager of Center</p>
					</div>
					<div class="single-testimonial item">
						<img class="mx-auto" src="img/sewon.png" alt="">
						<p class="desc">He loves dogs and is always interested in
							problems with abandoned dogs, and he is a responsible manager. As
							a manager, He is doing his best for the puppies at the center.
						</h4>
						<h4>Oh Se Won</h4>
						<p>Manager of Center</p>
					</div>
					<div class="single-testimonial item">
						<img class="mx-auto" src="img/zino1187.png" alt="">
						<p class="desc">The God of Coding</p>
						<h4>Min Zino</h4>
						<p>CEO at minssam.com</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End testomial Area -->
	<!-- 구글 지도 -->
	<div id="googleMap" style="width: 70%; height: 500px;"></div>
	<br>
	<br>
	<!-- Start calltoaction Area -->
	<section class="calltoaction-area section-gap relative">
		<div class="overlay overlay-bg"></div>
		<div class="container">

			<div class="row align-items-center justify-content-center">
				<h1 class="text-white">Want to help? Become a Volunteer</h1>
				<p class="text-white">Lorem ipsum dolor sit amet, consectetur
					adipisicing elit, sed do eiusmod tempor incididunt ut labore et
					dolore magna aliqua. Ut enim ad minim. Lorem ipsum dolor sit amet,
					consectetur adipisicing elit, sed do eiusmod tempor.</p>
				<div class="buttons d-flex flex-row">
					<a href="#" class="primary-btn text-uppercase">View pdf details</a>
					<a href="#" class="primary-btn text-uppercase">Register now</a>
				</div>
			</div>
		</div>
	</section>
	<!-- End calltoaction Area -->

	<!-- start footer Area -->
	<footer class="footer-area">
		<div class="container">
			<div class="row pt-120 pb-80">
				<div class="col-lg-4 col-md-6">
					<div class="single-footer-widget">
						<h6>About Us</h6>
						<p>Few would argue that, despite the advanc ements off eminism
							over the past three decades, women still face a double standard
							when it comes to their behavior. While menâs
							borderline-inappropriate behavior. Lorem ipsum dolor sit amet,
							consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
							labore et dolore magna aliqua.</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="single-footer-widget">
						<h6>Useful Links</h6>
						<div class="row">
							<ul class="col footer-nav">
								<li><a href="#">Home</a></li>
								<li><a href="#">Service</a></li>
								<li><a href="#">About</a></li>
								<li><a href="#">Case Study</a></li>
							</ul>
							<ul class="col footer-nav">
								<li><a href="#">Pricing</a></li>
								<li><a href="#">Team</a></li>
								<li><a href="#">Blog</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-4  col-md-6">
					<div class="single-footer-widget mail-chimp">
						<h6 class="mb-20">Contact Us</h6>
						<ul class="list-contact">
							<li class="flex-row d-flex">
								<div class="icon">
									<span class="lnr lnr-home"></span>
								</div>
								<div class="detail">
									<h4>Binghamton, New York</h4>
									<p>4343 Hinkle Deegan Lake Road</p>
								</div>
							</li>
							<li class="flex-row d-flex">
								<div class="icon">
									<span class="lnr lnr-phone-handset"></span>
								</div>
								<div class="detail">
									<h4>00 (953) 9865 562</h4>
									<p>Mon to Fri 9am to 6 pm</p>
								</div>
							</li>
							<li class="flex-row d-flex">
								<div class="icon">
									<span class="lnr lnr-envelope"></span>
								</div>
								<div class="detail">
									<h4>support@colorlib.com</h4>
									<p>Send us your query anytime!</p>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="copyright-text">
			<div class="container">
				<div class="row footer-bottom d-flex justify-content-between">
					<p class="col-lg-8 col-sm-6 footer-text m-0 text-white">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="fa fa-heart-o" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
					<div class="col-lg-4 col-sm-6 footer-social">
						<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
							class="fa fa-twitter"></i></a> <a href="#"><i
							class="fa fa-dribbble"></i></a> <a href="#"><i
							class="fa fa-behance"></i></a>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- End footer Area -->

	<script src="js/vendor/jquery-2.2.4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC7s3c6u5G3n7koVQkGfBn_qLQarZjjHlc&callback=myMap" />
<!-- <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script> -->
	<script src="js/easing.min.js"></script>
	<script src="js/hoverIntent.js"></script>
	<script src="js/superfish.min.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/mail-script.js"></script>
	<script src="js/main.js"></script>
</body>
</html>