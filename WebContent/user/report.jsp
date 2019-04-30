<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<%@ include file="/user/inc/head.jsp"%>
<script>
   //제출 기능 시작 ---------------------------
   $(function() {
      $("input[type='button']").click(function() {

         if ($("#title").val() == ""||$("#phone").val() == ""||$("#email").val() == ""||$("#content").val() == ""||$("#area").val() == "지역 선택"||markers.length==0) {
            alert("빈칸을 채워주세요!!");
         }else {
            report();
         }
      });
   });
   function report() {
      alert("등록 되었습니다!");
      $("form").attr({
         method : "post",
         action : "/user/report"
      });
      $("form").submit();

   }

   //----------------------------------제출 기능 끝

   // -------------------------------------------------------Google Map 관련------------------------

   //강아지 발견한 위치 지도에 찍기 -------------
   var map;
   function myMap() {
      var latLng = new google.maps.LatLng(37.571066, 126.992255);
      var mapProp = {
         center : latLng,
         zoom : 12
      };
      map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
      google.maps.event.addListener(map, 'click', function(event) {
         deleteMarker();
         addMarker(map, event.latLng);
      });

      google.maps.event.addListener(map, 'click', function(event) {
         //alert( "Latitude: "+event.latLng.lat()+" "+", longitude: "+event.latLng.lng() );  // <- 클릭한 위도 경도 값 확인
         $($("form").find("input[name='lati']")).val(event.latLng.lat()); //서버에 위도 경도 넘겨주어야하니까 히든 값 설정
         $($("form").find("input[name='longi']")).val(event.latLng.lng());
         //alert($($("form").find("input[name='area_lati']")).val()); // 히든값 제대로 들어오는거 확인   
      });
   }
   var markers = [];
   function addMarker(map, area) {
      var marker = new google.maps.Marker({
         position : area,
         icon : "/user/img/find_marker.png",
         map : map
      });
      markers.push(marker);
   }
   function deleteMarker() {
      for (var i = 0; i < markers.length; i++) {
         markers[i].setMap(null);
      }
      markers = [];
   }

   // -------------강아지 발견한 위치 지도에 찍기 끝

   //select 바꾸면 지도 줌 바꾸기 -------------
   function areaChange() {
      $.ajax({
         url : "/user/map/area",
         type : "get",
         data : {
            area : $("select[name='area']").val()
         },
         success : function(result) {
            var json = JSON.parse(result);
            map.setCenter(new google.maps.LatLng(json.lati, json.longi));
         }
      });
   }
   //-------------select 바꾸면 지도 줌 바꾸기  끝
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
               <h1 class="text-white">제보하기</h1>
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
                  <h1 class="mb-20">가여운 동물을 제보해주세요</h1>
                  <p>아래의 양식을 빠짐없이 입력하고 '제보하기' 버튼을 눌러주세요</p>
               </div>
            </div>
         </div>
         <div class="row justify-content-center">
            <form class="col-lg-9" enctype="multipart/form-data">
               <input type="hidden" name="member_id" value="1" />
               <div class="form-group">
                  <label for="first-name">제목</label> <input type="text" name="title"
                     class="form-control" placeholder="제목을 작성해주세요" id="title">
               </div>
               <div class="form-group">
                  <label for="first-name">전화번호</label> <input type="text"
                     name="phone" class="form-control" placeholder="연락받을 전화번호"
                     id="phone">
               </div>

               <div class="form-group">
                  <label for="last-name">이메일</label> <input type="text" name="email"
                     class="form-control" placeholder="연락받을 이메일" id="email">
               </div>
               <div class="form-row" style="display: block">
                  <div class="col-6 mb-30">
                     <label for="City">발견위치</label>
                     <div class="select-option" id="service-select">
                           <select name="area" id="area" onchange="areaChange()" required>
                              <option data-display="지역 선택">지역 선택</option>
                              <option value="서울">서울</option>
                              <option value="경기도">경기도</option>
                              <option value="인천">인천</option>
                              <option value="강원도">강원도</option>
                              <option value="부산">부산</option>
                              <option value="광주">광주</option>
                              <option value="대전">대전</option>
                           </select>
                        </div>
                     </div>
                  </div>
                  <br>
                  <!-- Google Map 관련 -->

                  <div class="select-option" id="service-select">
                     <div id="googleMap" style="width: 80%; height: 500px;"></div>
                     <input type="hidden" name="lati" /> <input type="hidden"
                        name="longi" />
                  </div>
                  <hr>
                  <!-- Google Map 끝 -->
                  <div class="form-group" style="width: 100%">
                     <label for="note">상세내용</label>
                     <textarea class="form-control" name="content" rows="5"
                        placeholder="제보하려는 동물에 대해서 상세한 내용을 적어주세요" id="content"></textarea>
                     <hr>
                     <input type="file"       name="myFile" multiple /> 
                     <input type="button"   value="제보하기" class="primary-btn float-right" />
                  </div>
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
                  <p>Few would argue that, despite the advanc ements off eminism
                     over the past three decades, women still face a double standard
                     when it comes to their behavior. While men’s
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
   <%@include file="/user/inc/tail.jsp"%>
</body>
</html>