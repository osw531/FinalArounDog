<%@page import="com.aroundog.model.domain.Adoptboard"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List adoptboardList= (List) request.getAttribute("adoptboardList");
%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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

<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
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
	<link rel="stylesheet" href="/css/main.css">
<style>
.banner-area-min {
  background: url(/img/aroundog/16.jpg) center;
  background-size: cover;
}

.banner-area-min .primary-btn {
  padding-left: 30px;
  padding-right: 30px;
}

.banner-area-min .overlay-bg {
  background-color: rgba(0, 0, 0, 0.4);
}
.img-fluidmin {
  max-width: 100%;
  height: auto;
}

.text-white {
	color:#ffffff;
	padding:0px 150px;
}
#btn{
	padding:0px 150px;
}


</style>
<script>
function goAdopt(adoptboard_id){
   location.href="/user/adopt/adoptboardDetail?adoptboard_id="+adoptboard_id;
}   
</script>
</head>
<body>
<%@include file="/WEB-INF/user/inc/header.jsp" %>

	<!-- start banner Area -->
	<section class="banner-area-min relative" id="home">
		<div class="container">
			<div class="overlay overlay-bg"></div>
			<div class="row fullscreen d-flex align-items-center justify-content-start">
				<div class="banner-content col-lg-8 col-md-12">
					<h1 class="text-uppercase">
						Adopt Us. <br>
						We need your LOVE.		
					</h1>
					<p class="text-white sub-head">
						At the ArounDog, hundreds of dogs wait in anticipation of loving homes.<br> 
             			Many have been rescued from suffering on the streets.<br>
            			All are deserving of a forever home.<br>
					</p>
					<a href="/user/adopt/adoptboardList" class="primary-btn header-btn text-uppercase">Find a pet to adopt</a>
				</div>											
			</div>
		</div>
	</section>
	<!-- End banner Area -->

	<!-- Start image-carusel Area -->
	<section class="image-carusel-area">
		<div class="container">
			<div class="row">
				<div class="active-image-carusel">
					<%for(int i=0;i<adoptboardList.size();i++){ %>
              		 <%Adoptboard board= (Adoptboard)adoptboardList.get(i); %>
	              		 <div class="single-image-carusel" onClick="goAdopt(<%=board.getAdoptboard_id()%>)">
	                 		 <img class="img-fluid" src="/data/dogs/<%=board.getAdoptdog().getImg() %>" alt="">
	              		 </div>
              		 <%} %>   													
				</div>
			</div>
		</div>	
	</section>
	<!-- End image-carusel Area -->
	
	   <!-- Start callto-top Area -->
		  <section class="callto-top-area section-gap">
		     <div class="container">
		        <div class="row justify-content-between callto-top-wrap pt-40 pb-40">
		           <div class="col-lg-8 callto-top-left">
		              <h1>Please report the stray puppy!</h1>
		           </div>
		           <div class="col-lg-4 callto-top-right">
		              <a href="/user/report" class="primary-btn">Report Stray Puppy</a>
		           </div>
		        </div>
		     </div>
		  </section>
		  <!-- End callto-top Area -->
	

	<!-- Start home-about Area -->
	<section class="home-about-area">
		<div class="container-fluid">
			<div class="row align-items-center">	
				<div class="col-lg-6 home-about-left no-padding">
					<img src="/img/center.jpg" alt="">
				</div>
				<div class="col-lg-6 home-about-right no-padding">
					<h2>
                	  ArounDog는 안락사 없는 <br>유기견 보호소를 지향합니다.
             	  </h2>
               	  <p><p>
              	  <p>
		                  한 해에 발생하는 유기견이 10만 마리에 달하고 있습니다.<br>
		                  그중에서 안타깝게 주인을 만나지 못하고<br>안락사를 당하는 비율이 48%입니다.<br>
		                  건강하고 편안한 환경에서<br>모든 강아지를 최선을 다해 돌보고 있습니다.<br><br>
		                  부담없이 견학해보세요.<br>         
               </p>
				</div>
			</div>
		</div>	
	</section>
	<!-- End home-about Area -->
	

	<!-- Start video Area -->
	<section class="video-area section-gap">
		<div class="container">
			<div class="row justify-content-center align-items-center">
				<div class="col-lg-8">
					<div class="about-video-right justify-content-center align-items-center d-flex relative">
						<div class="overlay overlay-bg"></div>
						<a class="play-btn" href="https://www.youtube.com/watch?v=WybG8FesMc8"><img class="img-fluidmin mx-auto" src="/img/play-btn.png" alt=""></a>
					</div>
					<div class="description">
						<h4>Our mission</h4>
						<p>
							Aroundog는 “Happy Pet, Happy Life”라는 미션 하에 설립된 소셜벤처입니다. 
							국내 반려가구는 급속도로 성장하였지만, 사전지식 부족 및 섣부른 입양결정으로 유기동물의 수도 급격히 증가하고 있습니다. 
							이러한 문제점을 지속 가능한 방법으로 해결하는 것이 저희의 목표입니다.
						</p>								
					</div>
				</div>
			</div>
		</div>	
	</section>
	<!-- End video Area -->
	

	<!-- Start process Area -->
	<section class="process-area section-gap">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="menu-content pb-60 col-lg-8">
					<div class="title text-center">
						<h1 class="mb-10">Process to adopt a pet</h1>
						<p>Who are in extremely love with animal-friendly system.</p>
					</div>
				</div>
			</div>					
			<div class="row" style="padding-left:120px">
				<div class="col-lg-3 col-md-6">
					<div class="single-process">
						<span class="lnr lnr-thumbs-up"></span>
						<a href="#">
							<h4>
								공고 확인 후 문의
							</h4>
						</a>
						<p>
							홈페이지에서 보호동물 공고 확인 후 1-55-1321
						</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="single-process">
						<span class="lnr lnr-user"></span>
						<a href="#">
							<h4>
								보호 동물 면회
							</h4>
						</a>
						<p>
							방문을 통해 책임분양을 원하는 보호동물을 직접 면회
						</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="single-process">
						<span class="lnr lnr-license"></span>
						<a href="#">
							<h4>
								책임 분양 계약서 작성
							</h4>
						</a>
						<p>
							전문가를 통한 상담으로 분양에 관해 결정 한 후 책임 분양 계약서 작성
						</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="single-process">
						<span class="lnr lnr-magic-wand"></span>
						<a href="#">
							<h4>
								분양
							</h4>
						</a>
						<p>
							천사와 집으로~
						</p>
					</div>
				</div>																		
			</div>
		</div>	
	</section>
	<!-- End process Area -->
	

					

   <!-- Start calltoaction Area -->
   <section class="calltoaction-area section-gap relative">
      <div class="container">
         <div class="overlay overlay-bg"></div>
         <div class="row align-items-center justify-content-center">
 
            <h1 class="text-white">Want to help? Become a Volunteer</h1>
   
    
                  <p class="text-white">
                     Thank you for wanting to adopt a rescue.<br>
                     ArounDog Foundation will help you every step of the way.<br>
                     Our mission is to improve the welfare of dogs, resulting in better lives for both the animal and human communities,<br> 
                     to create a society without homeless animals, and to ultimately end animal cruelty.
                  </p>
      
                  <div class="buttons d-flex flex-row" id="btn">
                     <a href="/user/registPage" class="primary-btn text-uppercase">Join With Us</a>
                     <a href="/user/about" class="primary-btn text-uppercase">About our PetShelter</a>
                  </div>


         </div>
      </div>
   </section>
   <!-- End calltoaction Area -->
	
	
	
	<!-- Start footer Area -->
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