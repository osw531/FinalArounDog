<%@page import="com.aroundog.model.domain.LostBoardImg"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.aroundog.model.domain.LostBoard"%>
<% 
   LostBoard lostBoard = (LostBoard)request.getAttribute("lostBoard");
   List imgList = (List)request.getAttribute("imgList");
%>

<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<%@include file="/user/inc/head.jsp" %>
<script>
   $(function(){
   $($("input[type='button']")[0]).click(function(){
      	del();
   });
   $($("input[type='button']")[1]).click(function(){
		edit();
	});
   $($("input[type='button']")[2]).click(function(){
	      location.href="/user/lostboard/lostboardlist";
	});
   
});
function edit(){
	if(!confirm("수정하시겠어요?")){
		return;
	}
	$("form").attr({
		method:"post",
		action:"/user/lostboard/lostboarddetail/update"
	});
$("form").submit();
}
function del(){
	if(!confirm("삭제하시겠어요?")){
		return;
	}
	$("form").attr({
			method:"post",
			action:"/user/lostboard/lostboarddetail/delete"
		});
	$("form").submit();
}
function myMap() {
   var latLng = new google.maps.LatLng(<%=lostBoard.getLati()%>,<%=lostBoard.getLongi()%>);
   var mapProp = {
      center : latLng,
      zoom : 16
   };
   map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
   var marker = new google.maps.Marker({
      position: latLng,
      animation:google.maps.Animation.BOUNCE,
      icon:"/user/img/find_marker.png"
   });
   marker.setMap(map);
}

</script>
</head>
<body>
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
               <h1 class="text-white">임시보호 게시판</h1>
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
                  <h1 class="mb-20"><%=lostBoard.getTitle()%></h1>
               </div>
            </div>
         </div>
         <div class="row justify-content-center">
            <form class="col-lg-9" enctype="multipart/form-data">
            	<input type="hidden" name="lostboard_id" value="<%=lostBoard.getLostboard_id()%>"/>
               <input type="hidden" name="member_id" value="1" />
               <div class="form-group" style="width: 100%">
                  <div contentEditable="false"><%for(int i=0;i<imgList.size();i++){ %>
                     <%LostBoardImg lbi = (LostBoardImg)imgList.get(i);%>
                         <img src="/data/<%=lbi.getImg()%> "style="width:30%"/>
                      <%} %>
                      
                   <hr>
                   <div class="form-group" style="width: 100%">
                  <textarea class="form-control" name="content" rows="5" readonly
                     placeholder="보호하고 있는 동물에 대해서 상세한 내용을 적어주세요" id="content"><%=lostBoard.getContent() %>   
                     </textarea>
                  <hr>         
                      </div>
                  </div>
                              <div class="form-row" style="display: block">
                     <label for="City">발견위치</label>
                     <hr>
                  </div>
                  <!-- Google Map 관련 -->
                  <div class="select-option" id="service-select">
                     <div id="googleMap" style="width: 80%; height: 500px;"></div>
                  </div>
                  <hr>
                  <div class="form-group">
                  <label for="first-name">보호기간</label> 
                  <input type="text" class="form-control" name="startdate" value="<%=lostBoard.getStartdate()%>" readonly>
                  <br>
                  ~
                  <br>
                  <br>
                  <input type="text" class="form-control" name="enddate" value="<%=lostBoard.getEnddate()%>" readonly>
               </div>
                  <br>
                     <input type="button" value="삭제" class="primary-btn float-right"/>
                     <input type="button" value="수정" class="primary-btn float-right"/>
                     <input type="button" value="목록으로" class="primary-btn float-right"/>
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
   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC7s3c6u5G3n7koVQkGfBn_qLQarZjjHlc&callback=myMap"/>
   <%@include file="/user/inc/tail.jsp"%>
</body>
</html>