<%@page import="com.aroundog.model.domain.Member"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<%@ include file="/WEB-INF/user/inc/head.jsp"%>
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
/*파일 업로드 꾸미기 */
[type="file"] {
  height: 0;
  overflow: hidden;
  width: 0;
}

[type="file"] + label {
  background: #f15d22;
  border: none;
  border-radius: 5px;
  color: #fff;
  cursor: pointer;
  display: inline-block;
   font-family: 'Poppins', sans-serif;
   font-size: inherit;
  font-weight: 600;
  margin-bottom: 1rem;
  outline: none;
  padding: 1rem 50px;
  position: relative;
  transition: all 0.3s;
  vertical-align: middle;
  
  &:hover {
    background-color: darken(#f15d22, 10%);
  }
  &.btn-2 {
    background-color: #99c793;
    border-radius: 50px;
    overflow: hidden;
    
    &::before {
      color: #fff;
      content: "\f382";
      font-family: "Font Awesome 5 Pro";
      font-size: 100%;
      height: 100%;
      right: 130%;
      line-height: 3.3;
      position: absolute;
      top: 0px;
      transition: all 0.3s;
    }

    &:hover {
      background-color: darken(#99c793, 30%);
        
      &::before {
        right: 75%;
      }
    }
  }
}
</style>
<script>
$(function() {
   $($("input[type='button']")[0]).click(function() {
      edit();
   });
   /* $($("input[type='button']")[1]).click(function() {
      del();
   }); */
   $($("input[type='button']")[2]).click(function() {
      home();
   });
});
   
//멤버 정보 수정
function edit() {
   $("form").attr({
      method : "post",
      action : "/user/member/edit"
   });
   $("form").submit();
}
//멤버 탈퇴
function del(member_id) {
   $("form").attr({
      method : "get",
      action : "/user/member/delete?member_id="+member_id
   });
   $("form").submit();
}
//홈으로 가기
function home() {
   $("form").attr({
      method : "get",
      action : "/"
   });
   $("form").submit();
}
</script>
</head>
<body>
<%@include file="/WEB-INF/user/inc/header.jsp" %>
   <!-- start banner Area -->
   <section class="banner-areaji relative" id="home">
      <div class="overlay overlay-bg"></div>
      <div class="container">
         <div class="row d-flex align-items-center justify-content-center">
            <div class="about-content col-lg-12">
               <h1 class="text-white">마이 페이지</h1>
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
                  <h1 class="mb-20"><%=member.getName()%>님의 정보</h1>
                  <p>Aroundog에 등록된 정보를 확인하세요!</p>
               </div>
            </div>
         </div>
         <div class="row justify-content-center">
           
         <form class="col-lg-9">
            <input type="hidden" name="member_id" value="<%=member.getMember_id()%>" />
			<%-- <input type="hidden" name="pass" value="<%=member.getPass()%>" /> --%>
           
            <div class="form-group">
               <label for="first-name">아이디</label> 
               <input type="text" name="id" class="form-control" value="<%=member.getId()%>" id="id">
            </div>
            <div class="form-group">
               <label for="first-name">이름</label> 
               <input type="text" name="name" class="form-control" value="<%=member.getName()%>" id="name">
            </div>
            <div class="form-group">
               <label for="first-name">전화번호</label> 
               <input type="text" name="phone" class="form-control" value="<%=member.getPhone()%>" id="phone">
            </div>
            <div class="form-group">
               <label for="first-name">이메일</label> 
               <input type="text" name="email" class="form-control" value="<%=member.getEmail()%>" id="email">
            </div>
            <div class="form-group">
               <input type="button" class="primary-btn float-left" value="수정하기" >
               <input type="button" class="primary-btn float-left" value="탈퇴하기" onClick="del(<%=member.getMember_id() %>)">
               <input type="button" class="primary-btn float-right" value="홈으로" >
            </div>
         </form>
            
         </div>
      </div>
   </section>
   <!-- End Volunteer-form Area -->

   <!-- start footer Area -->   
   <%@include file="/WEB-INF/user/inc/footer.jsp" %>
   <!-- End footer Area -->
   <%@include file="/WEB-INF/user/inc/tail.jsp"%>
</body>
</html>