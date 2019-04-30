<%@ page contentType="text/html; charset=UTF-8"%>
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
   <link rel="stylesheet" href="/user/css/linearicons.css">
   <link rel="stylesheet" href="/user/css/font-awesome.min.css">
   <link rel="stylesheet" href="/user/css/bootstrap.css">
   <link rel="stylesheet" href="/user/css/magnific-popup.css">
   <link rel="stylesheet" href="/user/css/nice-select.css">                     
   <link rel="stylesheet" href="/user/css/animate.min.css">
   <link rel="stylesheet" href="/user/css/owl.carousel.css">
   <link rel="stylesheet" href="/user/css/main.css">
<!-- 자바스크립트 부분 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
   $($("input[type='button']")[0]).click(function(){ //로그인 버튼 이벤트
      login();
   });
   $($("input[type='button']")[1]).click(function(){//회원가입 버튼 이벤트
      regist();
   });
});
// 로그인 관련
function login(){
	 $("form").attr({
	      method:"post",
	      action:"/user/member/login"  
	   });
	   $("form").submit();
}
//가입하기 관련
function regist(){
	location.href="/user/member/regist.jsp";
}
</script>
<!-- 자바스크립트 부분 -->   
</head>
<body>
<%@include file="/user/inc/header.jsp" %>

<!-- start banner Area -->
<section class="banner-area relative" id="home">   
   <div class="overlay overlay-bg"></div>
   <div class="container">            
      <div class="row d-flex align-items-center justify-content-center">
         <div class="about-content col-lg-12">
            <h1 class="text-white">
               어라운드도그         
            </h1>   
            <p class="text-white link-nav"><a href="index.html">Home </a>  <span class="lnr lnr-arrow-right"></span>  <a href="volunteer.html"> Become a Volunteer</a></p>
         </div>   
      </div>
   </div>
</section>
<!-- End banner Area -->   
   
<!-- Start Volunteer-form Area -->
<section class="Volunteer-form-area section-gap">
   <div class="container">
      <div class="row d-flex justify-content-center">
         <div class="menu-content pb-60 col-lg-9">
            <div class="title text-center">
               <h1 class="mb-20">Want to login? </h1>
               <p>어라운드 도그의 회원이 되어 더욱 다양한 서비스를 이용해보세요!</p>
            </div>
         </div>
      </div>                  
      <div class="row justify-content-center">
         <form class="col-lg-9">
           <div class="form-group">
             <label for="first-name">ID</label>
             <input type="text" class="form-control" name="id" placeholder="아이디 입력" >
           </div>
           <div class="form-group">
             <label for="last-name">PASSWORD</label>
             <input type="text" class="form-control" name="pass" placeholder="비밀번호 입력">
           </div>                    
           
            <input type="button" value="로그인" class="primary-btn float-right">   
           <input type="button" value="가입" class="primary-btn float-right">

         </form>
      </div>
   </div>   
</section>
<!-- End Volunteer-form Area -->
                                                            
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

      <script src="/user/js/vendor/jquery-2.2.4.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
      <script src="/user/js/vendor/bootstrap.min.js"></script>         
      <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
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