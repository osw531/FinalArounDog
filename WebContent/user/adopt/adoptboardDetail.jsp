<%@page import="com.aroundog.model.domain.Adoptdog"%>
<%@page import="com.aroundog.model.domain.Adoptboard"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Adoptboard board=(Adoptboard)request.getAttribute("adoptboard");
	Adoptdog dog=board.getAdoptdog();
	
	int neutCode= dog.getNeut_id();
	int vaccinCode= dog.getVaccin_id();
	String neut=null;
	String vaccin=null;
	
	if(neutCode==1){
		neut="완료";
	}else{
		neut="미완료";
	}
	if(vaccinCode==1){
		vaccin="완료";
	}else{
		vaccin="미완료";
	}
%>
	<!DOCTYPE html>
	<html lang="zxx" class="no-js">
	<head>
		<!-- Mobile Specific Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Favicon-->
		<link rel="shortcut icon" href="/user/img/fav.png">
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

		<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
			<!--
			CSS
			============================================= -->
			<link rel="stylesheet" href="/user/css/linearicons.css">
			<link rel="stylesheet" href="/user/css/font-awesome.min.css">
			<link rel="stylesheet" href="/user/css/bootstrap.css">
			<link rel="stylesheet" href="/user/css/magnific-popup.css">
			<link rel="stylesheet" href="/user/css/nice-select.css">							
			<link rel="stylesheet" href="/user/css/animate.min.css">
			<link rel="stylesheet" href="/user/css/owl.carousel.css">
			<link rel="stylesheet" href="/user/css/main.css">
			
			<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>

<!-- 자바스크립트 부분 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
function goRegist(adoptboard_id){
	location.href="/user/adopt/adoption.jsp?adoptboard_id="+adoptboard_id;
} 
function goDelete(adoptboard_id){
	location.href="/admin/adopt/delete?adoptboard_id="+adoptboard_id;
} 

</script>
			
		</head>
		<body class="blog-page">	
			  <header id="header" id="home">
			    <div class="container main-menu">
			    	<div class="row align-items-center justify-content-between d-flex">
				      <div id="logo">
				        <a href="index.html"><img src="/user/img/logo.png" alt="" title="" /></a>
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
				            </ul>
				          </li>						          
				          <li><a href="contact.html">Contact</a></li>
				          <li class="menu-has-children"><a href="">Dropdown</a>
				            <ul>
				              <li><a href="elements.html">Elements</a></li>	
				              <li><a href="#">Item</a></li>
				              <li class="menu-has-children"><a href="">Level 2</a>
					            <ul>
					              <li><a href="#">Item 1</a></li>
					              <li><a href="#">Item 2</a></li>
					            </ul>
					          </li>	
				            </ul>
				          </li>				              
				        </ul>
				      </nav><!-- #nav-menu-container -->		    		
			    	</div>
			    </div>
			  </header><!-- #header -->

			<!-- start banner Area -->
			<section class="banner-area relative" id="home">	
				<div class="overlay overlay-bg"></div>
				<div class="container">				
					<div class="row d-flex align-items-center justify-content-center">
						<div class="about-content col-lg-12">
							<h1 class="text-white">
							상세페이지			
							</h1>	
							<p class="text-white link-nav"><a href="index.html">Home </a>  <span class="lnr lnr-arrow-right"></span><a href="blog-home.html">Blog </a> <span class="lnr lnr-arrow-right"></span> <a href="blog-single.html"> Blog Details Page</a></p>
						</div>	
					</div>
				</div>
			</section>
			<!-- End banner Area -->					  
			
			<!-- start post-edit Area -->
<section class="post-content-area single-post-area">
	<div class="container ">
		<div class="row" >
			<div class="col-lg-12 posts-list" >
				<div class="row align-items-center">
					<div class="col-lg-6 home-about-left no-padding">
						<img src="/user/data/dogs/<%=dog.getImg()%>" alt="" >
					</div>


					<div class="col-lg-6 home-about-right no-padding">
						<h1><%=dog.getType().getInfo() %></h1>
						<h5><%=board.getTitle() %></h5>
					
						<div class="single-post row">
							<div class="col-lg-12  col-md-3 meta-details">
								<div class="user-details row">
									<p class="user-name col-lg-12 col-md-12 col-6"><a ><%=dog.getGender() %> </a> <span class="fas fa-venus-double"></span></p>
									<p class="comments col-lg-12 col-md-12 col-6"><a ><%=dog.getAge() %> 세</a> <span class="fas fa-baby"></span></p>						
									<p class="date col-lg-12 col-md-12 col-6"><a ><%=board.getRegdate() %></a> <span class="far fa-calendar-alt"></span></p>
									<p class="view col-lg-12 col-md-12 col-6"><a >중성화 <%=neut %></a> <span class="fas fa-ban"></span></p>
									<p class="view col-lg-12 col-md-12 col-6"><a >접종 <%=vaccin %></a> <span class="fas fa-crutch"></span></p>
								</div>
							</div>
						</div>

						<input type="button" class="primary-btn text-uppercase col-lg-12" value="입양 신청" onClick='goRegist(<%=board.getAdoptboard_id()%>)'> 
					</div>
				</div>
			</div>
						<div>
							<input type="button" class="primary-btn text-uppercase col-lg-12" value="해당 입양 게시물 삭제" onClick='goDelete(<%=board.getAdoptboard_id()%>)'>
							<%=board.getContent()%>
						</div>
		</div>
	</div>	
</section>
			
			<!-- end post-edit Area -->
			
			<!-- start post-content Area -->
			<section class="post-content-area single-post-area">
				<div class="container">
					<div class="row">
							
							<div class="col-lg-12 posts-list">
							<div class="navigation-area">
								<div class="row">
									<div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
										<div class="thumb">
											<a href="#"><img class="img-fluid" src="/user/img/dg1.jpg" alt="" style='width:60px; height:60px'></a>
										</div>
										<div class="arrow">
											<a href="#"><span class="lnr text-white lnr-arrow-left"></span></a>
										</div>
										<div class="detials">
											<p>이전 글</p>
											<a href="#"><h4>말티즈</h4></a>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
										<div class="detials">
											<p>다음글</p>
											<a href="#"><h4>허스키</h4></a>
										</div>
										<div class="arrow">
											<a href="#"><span class="lnr text-white lnr-arrow-right"></span></a>
										</div>
										<div class="thumb">
											<a href="#"><img class="img-fluid" src="/user/img/dg2.jpg" alt="" style='width:60px; height:60px'></a>
										</div>										
									</div>									
								</div>
							</div>
					</div>
				</div>	
			</section>
			<!-- End post-content Area -->
			

			<!-- start footer Area -->		
			<footer class="footer-area">
				<div class="container">
					<div class="row pt-120 pb-80">
						<div class="col-lg-4 col-md-6">
							<div class="single-footer-widget">
								<h6>About Us</h6>
								<p>
									Few would argue that, despite the advanc ements off eminism over the past three decades, women still face a double standard when it comes to their behavior. While men’s borderline-inappropriate behavior. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
								</p>
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
											<p>
												4343 Hinkle Deegan Lake Road
											</p>
										</div>	
									</li>
									<li class="flex-row d-flex">
										<div class="icon">
											<span class="lnr lnr-phone-handset"></span>
										</div>
										<div class="detail">
											<h4>00 (953) 9865 562</h4>
											<p>
												Mon to Fri 9am to 6 pm
											</p>
										</div>	
									</li>
									<li class="flex-row d-flex">
										<div class="icon">
											<span class="lnr lnr-envelope"></span>
										</div>
										<div class="detail">
											<h4>support@colorlib.com</h4>
											<p>
												Send us your query anytime!
											</p>
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
							<p class="col-lg-8 col-sm-6 footer-text m-0 text-white"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
							<div class="col-lg-4 col-sm-6 footer-social">
								<a href="#"><i class="fa fa-facebook"></i></a>
								<a href="#"><i class="fa fa-twitter"></i></a>
								<a href="#"><i class="fa fa-dribbble"></i></a>
								<a href="#"><i class="fa fa-behance"></i></a>
							</div>
						</div>						
					</div>
				</div>
			</footer>
			<!-- End footer Area -->	

			<script src="js/vendor/jquery-2.2.4.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
			<script src="js/vendor/bootstrap.min.js"></script>			
			<!-- <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script> -->
  			<script src="/user/js/easing.min.js"></script>			
			<script src="/user/js/hoverIntent.js"></script>
			<script src="/user/js/superfish.min.js"></script>	
			<script src="/user/js/jquery.ajaxchimp.min.js"></script>
			<script src="/user/js/jquery.magnific-popup.min.js"></script>	
			<script src="/user/js/owl.carousel.min.js"></script>						
			<script src="/user/js/jquery.nice-select.min.js"></script>							
			<script src="/user/js/mail-script.js"></script>	
			<script src="/user/js/main.js"></script>	
		</body>
	</html>



