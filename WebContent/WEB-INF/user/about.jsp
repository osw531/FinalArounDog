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
<link rel="stylesheet" href="/css/linearicons.css">
<link rel="stylesheet" href="/css/font-awesome.min.css">
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/magnific-popup.css">
<link rel="stylesheet" href="/css/nice-select.css">
<link rel="stylesheet" href="/css/animate.min.css">
<link rel="stylesheet" href="/css/owl.carousel.css">
<link rel="stylesheet" href="/css/main.css">
<style>
#googleMap{
   text-align:center;
   margin:auto;
}
#imgimg{
	width:50%;
	margin-left:30%;
}
.banner-areawon {
  background: url(/img/dog1.jpg) center;
  background-size: cover;
}

.banner-areawon .primary-btn {
  padding-left: 30px;
  padding-right: 30px;
}

.banner-areawon .overlay-bg {
  background-color: rgba(0, 0, 0, 0.4);
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
            icon:"/img/dogmarker.png"
            });

         marker.setMap(map); //맵에 마커 등록!!!
 
         // Zoom to 9 when clicking on marker
         google.maps.event.addListener(marker, 'click', function() {
            map.setCenter(marker.getPosition());
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
 <%@include file="/WEB-INF/user/inc/header.jsp" %>
   <!-- start banner Area -->
   <section class="banner-areawon relative" id="home">
      <div class="overlay overlay-bg"></div>
      <div class="container">
         <div class="row d-flex align-items-center justify-content-center">
            <div class="about-content col-lg-12">
               <h1 class="text-white">About Us</h1>
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
            <div class="col-lg-6 home-about-left no-padding" style="text-align:center">
               <img src="/img/aroundog/32.jpg" alt="" style="width: 50%" id="imgimg">
            </div>
            <div class="col-lg-6 home-about-right no-padding">
               <h1>Welcome</h1>
               <h5>We are here to listen from you deliver exellence</h5>
               <p>‘잠시 집을 잃은 아이’에게 손을 내밀어 보세요. 
               <br>
               나로 인해 한 생명의 삶이 바뀌고, 
               <br>
               곧 내 삶에 기분 좋은 변화가 생기게 됩니다.
               <br>
               가정에서 임시보호 중인 유기견 정보 제공 및 집을 잃은 아이들을 임시 보호하고 있습니다. 
               <br>
               강아지 입양에 어려운 점이나 고민이 있으면 글을 남겨주세요.<br> 
               전문상담사가 항시 대기 중입니다 🙂</p>
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
                  <h1 class="mb-10">관리자 소개</h1>
                  <p>강아지를 사랑하는 센터 관리자들을 소개합니다</p>
               </div>
            </div>
         </div>
         <div class="row">
            <div class="active-testimonial-carusel">
               <div class="single-testimonial item">
                  <img class="mx-auto" src="/img/min.png" alt="">
                  <p class="desc">변함없는 사랑으로 아이들을 아끼며 ArounDog 센터 관리 뿐만 아니라 자선 봉사활동, 동물 보호협회, 유기견 공인 보호센터와 협력하여
                  집을 잃은 아이들을 보살피기 위해 헌신하고 있습니다. 
                  <br>
                  10년이 넘는 시간 동안 센터를 운영하고 있으며, 아이들의 부모로써 책임을 다하고 있습니다.
                  <h4>Kim Min Ho</h4>
                  <p>CEO at Center</p>
               </div>
               <div class="single-testimonial item">
                  <img class="mx-auto" src="/img/kim.png" alt="">
                  <p class="desc">
                  		 Aroundog에서 가장 동물을 사랑하는 수의사입니다.
                     	항상 동물권리에 관심을 가지고 있으며, 동물권익을 위해 노력 하고 있습니다.
              			 주요 업무는 구조된 아이들을 치료하고 돌보는 역할을 하고 있습니다. 
               			아이들이 건강하게 자랄수 있도록 입양되기 전 각종 예방접종과 수술을 담당하고 있습니다. 
              			 전담 수의사로서, 항상 최선을 다하겠습니다. 
                  
                  </h4>
                  <h4>Kim Hyeon Hwa</h4>
                  <p>Manager of Center</p>
               </div>
               <div class="single-testimonial item">
                  <img class="mx-auto" src="/img/kwon.png" alt="">
                  <p class="desc">Aroundog center의 상담사입니다. 전문 상담사 과정을 수료했으며 
                      더욱 많은 분들에게 도움이 되기 위해 지속적으로 노력합니다.
                      새로운 보호자님이 행복한 마음으로 유기견과 가족이 될 수 있도록 전문적인 상담과정을 진행합니다.
                      아픔이 있는 아이들이지만 사랑으로 보듬어주실 수 있도록 전폭적인 지원을 아끼지 않겠습니다.
                     Aroundog를 믿고 유기견에게 많은 애정과 관심 부탁드립니다. 
                  
                  </h4>
                  <h4>Kwon Ji Young</h4>
                  <p>Manager of Center</p>
               </div>
               <div class="single-testimonial item">
                  <img class="mx-auto" src="/img/dong.png" alt="">
                  <p class="desc">
						Aroundog Center Manager 입니다.
							Aroundog 는 설립 이후 유기견 관리와 입양될 아이들의 행복을 위해 지속적인 관심을 추구해왔습니다. 
							저희는 분양만을 하는 업체와 달리 고객님들께 차별화된 가치를 제공하고자 노력하고 있습니다. 
							어느 이유든 상처받은 반려동물에게 따뜻한 손길과 새로운 가족을 찾을 수 있게 많은 관심 부탁드립니다.
                  </h4>
                  <h4>Hwang Dong Hyeon</h4>
                  <p>Manager of Center</p>
               </div>
               <div class="single-testimonial item">
                  <img class="mx-auto" src="/img/sewon.png" alt="">
                  <p class="desc">
						Aroundog Center에서 근무하는 현직 Center Manager입니다.
						유기견 제보를 받아 구조하고 보호하는 역할을 수행하고 있습니다. 
						뿐만 아니라 시설내 아이들이 다른 환경에 잘 적응 할 수 있도록
						교육시스템을 마련하였습니다. 강아지는 사랑입니다.
                  </h4>
                  <h4>Oh Se Won</h4>
                  <p>Manager of Center</p>
               </div>
               <div class="single-testimonial item">
                  <img class="mx-auto" src="/img/zino1187.png" alt="">
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

   <!-- start footer Area -->
   <%@include file="/WEB-INF/user/inc/footer.jsp" %>
   <!-- End footer Area -->

   <%@include file="/WEB-INF/user/inc/tail.jsp" %>
</body>
</html>