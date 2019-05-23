<%@page import="com.aroundog.model.domain.LostComment"%>
<%@page import="java.util.List"%>
<%@page import="com.aroundog.model.domain.LostBoard"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   LostBoard lostboard = (LostBoard)request.getAttribute("lostboard");
   List lcList = (List)request.getAttribute("lostCommentList");
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 버튼 관련한 스타일 시트 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>

* {
  box-sizing: border-box;
}

ul {
  list-style-type: none;
  padding: 0;
  margin: 0;
  width:500px;
}

ul li {
  border: 1px solid #ddd;
  margin-top: -1px; /* Prevent double borders */
  background-color: #f6f6f6;
  padding: 12px;
}

/* 댓글 작성자 이름 나오는 파란 아이콘*/
.label {
  color: white;
  padding: 8px;
  font-family: Arial;
}
.info {background-color: #2196F3;} /* Blue */

/* 댓글 내용 나오는 부분*/
textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}
/* 이미지 위에 텍스트 얻는 스타일 관련 */
.container {
  position: relative;
  text-align: center;
  color: white;
}

.bottom-left {
  position: absolute;
  bottom: 8px;
  left: 16px;
}

.top-left {
  position: absolute;
  top: 8px;
  left: 16px;
}

.top-right {
  position: absolute;
  top: 8px;
  right: 16px;
}

.bottom-right {
  position: absolute;
  bottom: 8px;
  right: 16px;
}

.centered {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  color: black;
}
.imgClass {
   opacity:0.2;
   filter: alpha(opacity=100);
}
</style>
</head>
<script>
window.onload=function(lostboard_id){
   var lostboard_id=<%=lostboard.getLostboard_id()%>;
   console.log("lostboard_id ",lostboard_id);
}
function del(lostboard_id){
   if(!confirm("삭제하시겠어요?")){
      return;
   }
   
   $.ajax({
      url:"/admin/lostboardDelete/"+lostboard_id,
      type:"GET",
      success:function(result){
         var json = JSON.parse(result);
         if(json.resultCode==1){
            alert("삭제했습니다");
            closeWindow();
         }
      }
   });
   
}
function closeWindow(){
   window.opener.location.reload(); //winow.opener는 자식창을 열어준 창에 접근하는 접근자
   window.close();
}
</script>
<body>

<p><p>
<span class="label info"><%= lostboard.getMember().getName() %></span>
<div class="container">
  <img class="imgClass" src="/img/aroundog/bot5.jpg" alt="Snow" style="width:100%;">
  <div class="centered"><%=lostboard.getContent() %></div>
</div>
<%-- <textarea id="subject" name="subject" style="height:200px" readonly><%=lostboard.getContent()%></textarea> --%>

<ul>

  <li></li>
           <%if (lcList != null) {   %>
         <%   for (int i = 0; i < lcList.size(); i++) {%>
         <%      LostComment lostComment = (LostComment) lcList.get(i);%>
         <%      if (lostComment.getDepth() == 1) {%>
         <div class="comment-list">
            <div class="single-comment justify-content-between d-flex"
               id="free-com">
               <div class="user justify-content-between d-flex">
                  <div class="thumb">
                     <img src="/img/logo/6.png" alt="" id="img1" width="50px">
                  </div>
                  <div class="desc">
                     <h5><%=lostComment.getMember().getName()%></h5>
                     <p class="date"><%=lostComment.getRegdate()%>
                     </p>
                     <p class="comment"><%=lostComment.getContent()%></p>
                  </div>
               </div>
            </div>
         </div>
         <%
            }
         %>

         <!-- 댓글의 댓글 시작 -->
         <%if (lostComment.getDepth() == 2) {%>
         <div class="comment-list left-padding">
            <div class="single-comment justify-content-between d-flex">
               <div class="user justify-content-between d-flex">
                  <div class="thumb">
                     <i class="fa fa-reply fa-rotate-180" style="font-size: 24px"></i>
                     <img src="/img/logo/5.png" alt="" id="img2" width="50px">
                  </div>
                  <div class="desc">
                     <h5>
                        <a href="#"><%=lostComment.getMember().getName()%></a>
                     </h5>
                     <p class="date"><%=lostComment.getRegdate()%>
                     </p>
                     <p class="comment"><%=lostComment.getContent()%></p>
                  </div>
               </div>
               <form name="form-commentId">
                  <div class="reply-btn">
                     <input type="hidden" name="lostboard_id" value="<%=lostComment.getLostboard_id()%>">
                  </div>
               </form>
            </div>
         </div>
               <%}%>
            <%}%>
         <%}%>
</ul>
<form name="form-del" align="center">
<input type="button" class="btn btn-primary mb-2" onClick="del(<%=lostboard.getLostboard_id()%>)" value="삭제하기"/>
</form>
</body>
</html>