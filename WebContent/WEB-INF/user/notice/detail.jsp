<%@page import="com.aroundog.model.domain.Notice"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Notice notice=(Notice)request.getAttribute("notice");

%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="/img/fav.png">
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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<!--
	CSS
	============================================= -->
	<link rel="stylesheet" href="/css/linearicons.css">
	<link rel="stylesheet" href="/css/font-awesome.min.css">
	<link rel="stylesheet" href="/css/bootstrap.css">
	<link rel="stylesheet" href="/css/magnific-popup.css">
	<link rel="stylesheet" href="/css/nice-select.css">							
	<link rel="stylesheet" href="/css/animate.min.css">
	<link rel="stylesheet" href="/css/owl.carousel.css">
	<link rel="stylesheet" href="/css/freeboard.css">
	
<style>
#lockIcon{
	margin-left:6px;
}
#category-name{
	display:inline;
	color:#d94013;
}
.table-head{
	padding:25px 0px;
}
.banner-area-min {
  background: url(/img/aroundog/14.jpg) center;
  background-size: cover;
}

.banner-area-min .primary-btn {
  padding-left: 30px;
  padding-right: 30px;
}

.banner-area-min .overlay-bg {
  background-color: rgba(0, 0, 0, 0.4);
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
function goList(){
	location.href="/user/notices";
}
</script>
</head>
<body>
<%@include file="/WEB-INF/user/inc/header.jsp" %>
	  
	<!-- start banner Area -->
	<section class="banner-area-min relative" id="home">	
		<div class="overlay overlay-bg"></div>
		<div class="container">				
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">
						Notice Board	
					</h1>	
					<p class="text-white link-nav">공지사항 게시판 입니다.</p>
				</div>	
			</div>
		</div>
	</section>
	<!-- End banner Area -->	

	

	<!-- Start Align Area -->
	<!-- 제일 상단 이미지 -->
	<div class="whole-wrap">
		<div class="container">
		
			<!-- 실제 테이블 -->
			<div class="section-top-border">
				<h3 class="mb-30"><%=notice.getTitle() %></h3>
				<div class="row">
					<div class="col-lg-12">
						<blockquote class="generic-blockquote">
							<%=notice.getContent() %> 
						</blockquote>
					</div>
				</div>
			</div>
			
			<form name="form-edit">
				<div>
					<input type="button" class="primary-btn float-right" value="목록으로" onClick="goList()"></button>			
				</div>						
			</form>	
		
			<div class="section-top-border">
				<div class="row gallery-item">
					<div class="col-md-4">
						<a href="/img/aroundog/bot11.jpg" class="img-pop-up"><div class="single-gallery-image" style="background: url(/img/aroundog/bot11.jpg);"></div></a>
					</div>
					<div class="col-md-4">
						<a href="/img/aroundog/bot12.jpg" class="img-pop-up"><div class="single-gallery-image" style="background: url(/img/aroundog/bot12.jpg);"></div></a>
					</div>
					<div class="col-md-4">
						<a href="/img/aroundog/bot13.jpg" class="img-pop-up"><div class="single-gallery-image" style="background: url(/img/aroundog/bot13.jpg);"></div></a>
					</div>
					<div class="col-md-6">
						<a href="/img/aroundog/bot5.jpg" class="img-pop-up"><div class="single-gallery-image" style="background: url(/img/aroundog/bot5.jpg);"></div></a>
					</div>
					<div class="col-md-6">
						<a href="/img/aroundog/bot10.jpg" class="img-pop-up"><div class="single-gallery-image" style="background: url(/img/aroundog/bot10.jpg);"></div></a>
					</div>
					<div class="col-md-4">
						<a href="/img/aroundog/bot9.jpg" class="img-pop-up"><div class="single-gallery-image" style="background: url(/img/aroundog/bot9.jpg);"></div></a>
					</div>
					<div class="col-md-4">
						<a href="/img/aroundog/bot8.jpg" class="img-pop-up"><div class="single-gallery-image" style="background: url(/img/aroundog/bot8.jpg);"></div></a>
					</div>
					<div class="col-md-4">
						<a href="/img/aroundog/bot7.jpg" class="img-pop-up"><div class="single-gallery-image" style="background: url(/img/aroundog/bot7.jpg);"></div></a>
					</div>
				</div>
			</div>
			
		
		
			
			
			
			
			
			
		</div>
	</div>
	<!-- End Align Area -->

<!-- 여기가 제일 밑에 검은 about나오는 곳 -->
	<!-- start footer Area -->		
	<%@include file="/WEB-INF/user/inc/footer.jsp" %>
	<!-- End footer Area -->	

	<script src="/js/vendor/jquery-2.2.4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="/js/vendor/bootstrap.min.js"></script>			
	<!-- <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script> -->
 			<script src="/js/easing.min.js"></script>			
		<script src="/js/hoverIntent.js"></script>
		<script src="/js/superfish.min.js"></script>	
		<script src="/js/jquery.ajaxchimp.min.js"></script>
		<script src="/js/jquery.magnific-popup.min.js"></script>	
		<script src="/js/owl.carousel.min.js"></script>						
		<script src="/js/jquery.nice-select.min.js"></script>							
		<script src="/js/mail-script.js"></script>	
		<script src="/js/main.js"></script>	
	</body>
</html>