<%@page import="com.aroundog.model.domain.Admin"%>
<%@page import="com.aroundog.model.domain.ReportImg"%>
<%@page import="java.io.Console"%>
<%@page import="com.aroundog.model.domain.Report"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   Report report = (Report) request.getAttribute("report");
   Admin admin = (Admin) request.getSession().getAttribute("admin");
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
<link rel="stylesheet" href="/css/linearicons.css">
<link rel="stylesheet" href="/css/font-awesome.min.css">
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/magnific-popup.css">
<link rel="stylesheet" href="/css/nice-select.css">
<link rel="stylesheet" href="/css/animate.min.css">
<link rel="stylesheet" href="/css/owl.carousel.css">
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
   integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
   crossorigin="anonymous">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
   integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
   crossorigin="anonymous">
<style>
<%@
include file ="/WEB-INF/admin/inc/maincss.jsp" %> 
*{
   box-sizing: border-box
}
</style>

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
   
<%@ include file="/WEB-INF/admin/inc/pagechange.jsp" %>
   $(function() {
      $($("input[type='button']")[0]).click(function() {
         showImg();
      });
      $($("input[type='button']")[1]).click(function() {
         sendEmail();
      });
      $($("input[type='button']")[2]).click(function(){         
         readCheck();
      });
   });
   /* 이메일 관련 */
   function sendEmail(){
      $("#waitMail").append('<div><label>잠시만 기다려주세요...</label></div>');
      $.ajax({
         url:"/report/sendMail",
         type:"POST",
         data:{
            to:$($("form[name='email-form']").find("input[name='to']")).val(),
            mailTitle:$($("form[name='email-form']").find("input[name='mailTitle']")).val(),
            mailContent:$($("form[name='email-form']").find("textarea[name='mailContent']")).val()
         },
         success:function(result){
            var json=JSON.parse(result);
            if(json.result==1){
               alert("메일 발신 성공!");
               $("#waitMail label").remove();
            }
         }
      });
   }
   function myMap() {
      var latLng = new google.maps.LatLng(<%=report.getLati()%>,<%=report.getLongi()%>);
      var mapProp = {
         center : latLng,
         zoom : 16
      };
      map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
      var marker = new google.maps.Marker({
         position : latLng,
         animation : google.maps.Animation.BOUNCE,
         icon : "/img/find_marker.png"
      });
      marker.setMap(map);
   }
   
   function showImg() {
      $.ajax({
         url : "/reportsimg/"+<%=report.getReport_id()%>,
         type : "get",
         success : function(result) {
            var json = JSON.parse(result);
            if (json.length < 1) {
               alert("첨부파일이 존재하지 않습니다!!");
            } else {
               setData(json);
            }
         }
      });
   }
   function setData(json) {
      $("#imgDiv img").remove(); //중첩되서 나오지 않게!!
      for (var i = 0; i < json.length; i++) {
         var img = $("<img>");
         img.attr("src", "/data/" + json[i].img);
         img.appendTo("#imgDiv");
         $("#imgDiv img").mouseenter(function() {
            //alert("눌렀어?");
            var $target = $(this);
            $target.width($target.width() + 70);
            $target.height($target.height() + 50);
         });
         $("#imgDiv img").mouseleave(function() {
            //alert("눌렀어?");
            var $target = $(this);
            $target.width($target.width() - 70);
            $target.height($target.height() - 50);
         });
      }
      $("#imgDiv img").width(130);
      $("#imgDiv img").height(130);
   }

   //읽음표시 기능 ??
         
   function readCheck() {
      $("form").attr({
         action : "/reports/check",
         method : "post"
      });
      $("form").submit();
   }
</script>
</head>
<body>
   <form>

      <%@include file="/WEB-INF/admin/inc/tablink.jsp"%>
      <div class="loginName" style="text-align: right"><%=admin.getId()%>님
         로그인중
      </div>
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
               <div class="form-group">
                  <label for="first-name">제목</label> <input type="text"
                     class="form-control" name="title" value="<%=report.getTitle()%>"
                     readonly>
               </div>
               <div class="form-group" style="width: 100%">
                  <label for="note">내용</label>
                  <textarea name="content" class="form-control" id="exampleTextarea"
                     rows="5" readonly><%=report.getContent()%>                
                      </textarea>

                  <!-- 이미지 관련 -->
                  <input type="button" class="primary-btn float-right"
                     value="첨부파일 보기" />
                  <hr>
                  <div id="imgDiv"></div>
                  <!-- 이미지 끝 -->
               </div>
               <div class="form-group">
                  <label for="first-name">전화번호</label> <input type="text"
                     class="form-control" name="phone" value="<%=report.getPhone()%>"
                     readonly>
               </div>
               <div class="form-group">
                  <label for="last-name">이메일</label> <input type="text"
                     class="form-control" name="email" value="<%=report.getEmail()%>"
                     readonly>
               </div>
               <div class="form-group">
                  <label for="last-name">위치</label>
                  <div id="googleMap" style="width: 100%; height: 500px;"></div>
               </div>
            </form>
         </div>
         <hr>
      </div>
      
      <!-- email 양식 -->
      
      <div class="container">
         <div class="row d-flex justify-content-center">
            <form name="email-form" class="col-lg-9">
               <!-- 받는 사람 이메일 -->
               <div class="form-group">
                  <label for="first-name">상대방 이메일 주소 입력</label> 
                  <input type="text" name="to" class="form-control" value="<%=report.getEmail()%>">
               </div>
               <!-- 제목 -->
               <div class="form-group">
                  <label for="first-name">이메일 제목 입력</label> 
                  <input type="text" name="mailTitle" class="form-control" placeholder="제목을 입력해주세요">
               </div>
               <!-- 내용 -->
               <div class="form-group">
                  <label for="note">내용</label>
                  <textarea name="mailContent" class="form-control" id="exampleTextarea" rows="5" placeholder="내용"></textarea>
               </div>            
               <div id="waitMail">
                  <input type="button" id="sendEmail" value="mail 발송" class="primary-btn float-right"/>
               </div>
               </form>
            </div>
            <br>
            <form>
               <input type="hidden" name="report_id" value="<%=report.getReport_id()%>">
               <input type="button" value="확인 완료" class="primary-btn float-right" />
            </form>
            
         </div>
      </section>
   <!-- End Volunteer-form Area -->

   <script src="/js/vendor/jquery-2.2.4.min.js"></script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
      integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
      crossorigin="anonymous"></script>
   <script src="/js/vendor/bootstrap.min.js"></script>
   <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC7s3c6u5G3n7koVQkGfBn_qLQarZjjHlc&callback=myMap" />
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