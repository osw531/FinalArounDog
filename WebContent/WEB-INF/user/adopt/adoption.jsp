<%@page import="com.aroundog.model.domain.Member"%>
<%@page import="com.aroundog.model.domain.Adoptboard"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	int adoptboard_id=(int)request.getAttribute("adoptboard_id");

%>
   <!DOCTYPE html>
   <html lang="zxx" class="no-js">
   <head>
      <!-- Mobile Specific Meta -->
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <!-- Favicon-->
      <link rel="shortcut icon" href="/WEB-INF/user/img/fav.png">
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
<!-- 자바스크립트 부분 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
   $("button[name='btn']").click(function(){ // 등록 버튼 이벤트
      if ($("input[name='phone']").val() == ""||$("input[name='email']").val() == ""||$("input[name='envir']").val() == "" ||$("input[name='content']").val() == "") { 
         alert("빈칸을 채워주세요!!");
        }else {
           registAdoption();
        }
   });
});
function registAdoption(){
	   $("form").attr({
	      method:"post",
	      action:"/user/adopt/adoption"  
	   });
	   $("form").submit();
} 
</script>    
         
      </head>
      <body>
          <%@include file="/WEB-INF/user/inc/header.jsp" %>

         <!-- start banner Area -->
         <section class="banner-area relative" id="home">   
            <div class="overlay overlay-bg"></div>
            <div class="container">            
               <div class="row d-flex align-items-center justify-content-center">
                  <div class="about-content col-lg-12">
                     <h1 class="text-white">
                        입양 신청하기            
                     </h1>   
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
                        <h1 class="mb-20">사랑스러운 아이들의 보호자가 되어주세요</h1>
                        <p>아래의 양식을 빠짐없이 입력하고 '보내기' 버튼을 눌러주세요</p>
                     </div>
                  </div>
               </div>                  
               <div class="row justify-content-center">
                  <form class="col-lg-9">
                  	<input type="hidden" name="adoptboard_id" value="<%=adoptboard_id %>">
                  
                    <div class="form-group">
                      <label for="first-name">전화번호</label>
                      <input type="text" name="phone" class="form-control" placeholder="연락받을 전화번호" required>
                    </div>
                    <div class="form-group">
                      <label for="last-name">이메일</label>
                      <input type="text" name="email" class="form-control" placeholder="연락받을 이메일" required>
                    </div>                                   
                    <div class="form-row">
                       <div class="col-6 mb-30">
                          <label for="City">주거환경</label>
                           <div class="select-option" id="service-select"">
                           <select name="envir">
                              <option data-display="거주형태 선택">거주형태 선택</option>
                              <option value="아파트">아파트</option>
                              <option value="빌라">빌라</option>
                              <option value="오피스텔">오피스텔</option>
                              <option value="원룸">원룸</option>
                              <option value="단독주택(마당있음)">단독주택(마당있음)</option>
                              <option value="단독주택(마당없음)">단독주택(마당없음)</option>
                           </select>
                        </div>   
                       </div>                      
                    <div class="form-group" style="width:100%" >
                      <label for="note">입양이유</label>
                      <textarea class="form-control" name="content" id="exampleTextarea" rows="5" placeholder="입양하려는 이유와 하고싶은 말을 적어주세요"></textarea>
                    </div>                    
                    <button type="button" class="primary-btn float-right" name="btn">보내기</button>
                  </form>
               </div>
            </div>   
         </section>
         <!-- End Volunteer-form Area -->
                                                                     
         <!-- start footer Area -->      
         <%@include file="/WEB-INF/user/inc/footer.jsp" %>
         <!-- End footer Area -->   

         <script src="/js/vendor/jquery-2.2.4.min.js"></script>
         <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
         <script src="/js/vendor/bootstrap.min.js"></script>         
         <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
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