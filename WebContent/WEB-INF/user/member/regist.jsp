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
   <link rel="stylesheet" href="/css/linearicons.css">
   <link rel="stylesheet" href="/css/font-awesome.min.css">
   <link rel="stylesheet" href="/css/bootstrap.css">
   <link rel="stylesheet" href="/css/magnific-popup.css">
   <link rel="stylesheet" href="/css/nice-select.css">                     
   <link rel="stylesheet" href="/css/animate.min.css">
   <link rel="stylesheet" href="/css/owl.carousel.css">
   <link rel="stylesheet" href="/css/main.css">
<style>
.banner-areaji {
  background: url(/img/aroundog/bot2.jpg) center;
  background-size: cover;
}

.banner-areaji .primary-btn {
  padding-left: 30px;
  padding-right: 30px;
}

.banner-areaji .overlay-bg {
  background-color: rgba(0, 0, 0, 0.4);
}
</style>
<!-- 자바스크립트 부분 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
var flag=false;
$(function(){
   $($("input[type='button']")[1]).click(function(){ //가입 버튼 이벤트
      if ($("input[name='name']").val() == ""||$("input[name='id']").val() == ""||$("input[name='pass']").val() == "" ||$("input[name='phone']").val() == ""||$("input[name='email']").val() == "") {
           alert("빈칸을 채워주세요!!");
        }else {
           regist();
        }
   });
   $($("input[type='button']")[2]).click(function(){//취소 버튼 이벤트
      location.href="/user/loginPage";
   });
});
// 회원등록_동기
function regist(){
   if(flag==false){
      alert("중복체크를 진행해주세요!");
   }else{
       $("form").attr({
            method:"post",
            action:"/user/member/regist"  ///members로 수정...예정(restful하게 만들 예정)
         });
         $("form").submit();
   }
}

//아이디 중복확인
function idCheck(){
   $.ajax({
        url : "/user/member/idCheck",
        type : "get",
        data : {
           id : $("input[name='id']").val()
        },
        success : function(result) {
           var json = JSON.parse(result);
           if(json.result==1){
              flag=true;
           }else if(json.result==0){
              $("input[name='id']").val("");
           }
           alert(json.msg);
        }
     });
}
</script>
<!-- 자바스크립트 부분 -->

</head>
<body>
<%@include file="/WEB-INF/user/inc/header.jsp" %>

   <!-- start banner Area -->
   <section class="banner-areaji relative" id="home">   
      <div class="overlay overlay-bg"></div>
      <div class="container">            
         <div class="row d-flex align-items-center justify-content-center">
            <div class="about-content col-lg-12">
               <h1 class="text-white">
                  회원가입         
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
                  <h1 class="mb-20">Become a Member</h1>
                  <p>어라운드도그의 회원이 되어주세요!</p>
               </div>
            </div>
         </div>                  
         <div class="row justify-content-center">
            <form class="col-lg-9">
              <div class="form-group">
                <label for="first-name">NAME</label>
                <input type="text" class="form-control" name="name" placeholder="이름 입력" >
              </div>
              <div class="form-group">
                <label for="first-name">ID</label>
                <input type="text" class="form-control" name="id" placeholder="아이디 입력" >
                <input  type="button" value="중복확인" class="primary-btn float-right" onClick="idCheck()">
              </div>
              <div class="form-group">
                <label for="last-name">PASSWORD</label>
                <input type="password" class="form-control" name="pass" placeholder="비밀번호 입력" >
              </div>                    
             
                 <div class="form-group">
                    <label for="email">Email </label>
                     <input type="email" class="form-control" name="email" placeholder="이메일 입력" >
                 </div>
                 <div class="form-group">
                    <label for="phone">Phone </label>
                     <input type="phone" class="form-control" name="phone" placeholder="전화번호 입력" >                          
                 </div>
              </div>   
              
               <input type="button" value="등록" class="primary-btn float-right">   
                 <input type="button" value="취소" class="primary-btn float-right">
              
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