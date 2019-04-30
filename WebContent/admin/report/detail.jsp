<%@page import="com.aroundog.model.domain.Admin"%>
<%@page import="com.aroundog.model.domain.ReportImg"%>
<%@page import="java.io.Console"%>
<%@page import="com.aroundog.model.domain.Report"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   Report report = (Report)request.getAttribute("report");
   Admin admin=(Admin)request.getSession().getAttribute("admin");
%>
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
<link rel="stylesheet" href="/user/css/linearicons.css">
<link rel="stylesheet" href="/user/css/font-awesome.min.css">
<link rel="stylesheet" href="/user/css/bootstrap.css">
<link rel="stylesheet" href="/user/css/magnific-popup.css">
<link rel="stylesheet" href="/user/css/nice-select.css">
<link rel="stylesheet" href="/user/css/animate.min.css">
<link rel="stylesheet" href="/user/css/owl.carousel.css">
<link rel="stylesheet" href="/user/css/main.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<style>
<%@ include file ="/admin/inc/maincss.jsp" %> 
* {box-sizing: border-box}

/* Set height of body and the document to 100% */
body, html {
  height: 100%;
  margin: 0;
  font-family: Arial;
}

/* Style tab links */
.tablink {
  background-color: #555;
  color: white;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  font-size: 17px;
  width: 20%;
}

.tablink:hover {
  background-color: #777;
}

.tabcontent {
  color: white;
  display: none;
  padding: 100px 20px;
  height: 100%;
}
</style>

<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
<%@ include file="/admin/inc/pagechange.jsp" %>
$(function(){
   $($("input[type='button']")[0]).click(function(){
      showImg();
   });
   $($("input[type='button']")[1]).click(function(){
      readCheck();
   });
});

function myMap() {
   var latLng = new google.maps.LatLng(<%=report.getLati()%>,<%=report.getLongi()%>);
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
function showImg(){
   $.ajax({
      url:"/reportsimg/"+<%=report.getReport_id()%>,
      type:"get",
      success:function(result){
         var json = JSON.parse(result);
         if(json.length<1){
            alert("첨부파일이 존재하지 않습니다!!");
         }else{
            setData(json);
         }
      }
   });
}
function setData(json){
   $("#imgDiv img").remove(); //중첩되서 나오지 않게!!
   for(var i=0;i<json.length;i++){
      var img = $("<img>");
      img.attr("src","/data/"+json[i].img);
      img.appendTo("#imgDiv");
      $("#imgDiv img").mouseenter(function(){
         //alert("눌렀어?");
            var $target = $(this); 
            $target.width($target.width()+70); 
            $target.height($target.height()+50);      
      });
      $("#imgDiv img").mouseleave(function(){
         //alert("눌렀어?");
            var $target = $(this);
            $target.width($target.width()-70); 
            $target.height($target.height()-50);      
      });
   }
   $("#imgDiv img").width(130); 
   $("#imgDiv img").height(130);
}


//읽음표시 기능 ??
function readCheck(){
   //alert("확인버튼눌렀어");
   $("form").attr({
      action:"/reports/check",
      method:"post"
   });
   $("form").submit();
} 
</script>
</head>
<body>
<form>
<div class="loginName" style="text-align:right"><%=admin.getName() %>님 로그인중</div>
<button class="tablink" type="button"><i class="fas fa-user-friends" style="font-size:20px"></i>  회원관리</button> 
<button class="tablink" type="button"><i class="fas fa-bullhorn" style="font-size:20px"></i>  제보관리</button>
<button class="tablink" type="button"><i class="far fa-edit" style="font-size:20px"></i>  입양신청관리</button>
<button class="tablink" type="button"><i class="far fa-comment-alt"    style="font-size:20px"></i>  게시판관리</button>
<button class="tablink" type="button"><i class="fas fa-dog" style="font-size:20px"></i>  입양게시물관리</button>
<button class="tablink" type="button"><i class="fas fa-dog" style="font-size:20px"></i>  임보게시판관리</button>
</form>
   <!-- Start Volunteer-form Area -->

   <section class="Volunteer-form-area section-gap">
      <div class="container">
         <div class="row d-flex justify-content-center">
            <div class="menu-content pb-60 col-lg-9">
               <div class="title text-center">
                  <h1 class="mb-20">제보 상세내용</h1>
               </div>
            </div>
         </div>
         <div class="row justify-content-center">
            <form name="regist-form" class="col-lg-9">
               <input type="hidden" name="report_id" value="<%=report.getReport_id()%>">
               <div class="form-group">
                  <label for="first-name">제목</label> <input type="text"
                     class="form-control" name="title" value="<%=report.getTitle() %>" readonly>
               </div>
               <div class="form-group" style="width: 100%">
                  <label for="note">내용</label>
                  <textarea name="content" class="form-control" id="exampleTextarea"
                     rows="5" readonly><%=report.getContent() %>                
                      </textarea>
                      
                      <!-- 이미지 관련 -->
                      <input type="button" class="primary-btn float-right" value="첨부파일 보기"/>                                       
                      <hr>
                  <div id="imgDiv">
                  </div>
               <!-- 이미지 끝 -->
               </div>
               <div class="form-group">
                  <label for="first-name">전화번호</label> <input type="text"
                     class="form-control" name="phone" value="<%=report.getPhone() %>" readonly>
               </div>
               <div class="form-group">
                  <label for="last-name">이메일</label> <input type="text"
                     class="form-control" name="email" value="<%=report.getEmail() %>" readonly>
               </div>
               <div class="form-group">
                  <label for="last-name">위치</label>
                  <div id="googleMap" style="width: 100%; height: 500px;"></div>
               </div>
               <input type="button" value="확인" class="primary-btn float-right" />
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
   <script src="/user/js/vendor/jquery-2.2.4.min.js"></script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
      integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
      crossorigin="anonymous"></script>
   <script src="/user/js/vendor/bootstrap.min.js"></script>
   <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC7s3c6u5G3n7koVQkGfBn_qLQarZjjHlc&callback=myMap" />
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