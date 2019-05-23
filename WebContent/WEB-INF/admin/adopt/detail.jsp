<%@page import="com.aroundog.model.domain.Adopt"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   Adopt adopt= (Adopt)request.getAttribute("adopt");
%>
<!DOCTYPE html>
<html>
<style>
body {font-family: Arial, Helvetica, sans-serif;}

form {
  border: 3px solid #f1f1f1;
  font-family: Arial;
}

.container {
  padding: 20px;
  background-color: #f1f1f1;
}

input[type=text], input[type=button] {
  width: 100%;
  padding: 12px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

input[type=checkbox] {
  margin-top: 16px;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  border: none;
}

input[type=button]:hover {
  opacity: 0.8;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
function goList(){
   location.href="/adopts";
}
function doCheck(){
   $("form").attr({
      action:"/admin/adopt/update",
      method:"post"
   });
   $("form").submit();
}
function goDelete(adopt_id){
   location.href="/admin/adopt/delete?adopt_id="+adopt_id;
}
</script>
<body>

<h2>입양요청 상세보기</h2>

  <div class="container">
    <h2>입양요청</h2>
    
  </div>

  <div class="container" style="background-color:white">
   <form>
      <label>신청자</label>
    <input type="text" value="<%=adopt.getMember().getName()%>" readonly> 
    <label>신청일</label>
    <input type="text" name="regdate" value="<%=adopt.getRegdate().substring(0,10)%>" readonly>
    <label>연락처</label>
    <input type="text" name="phone" value="<%=adopt.getPhone()%>">
    <label>e-mail</label>
    <input type="text" name="email" value="<%=adopt.getEmail()%>">
    <label>주거환경</label>
    <input type="text" name="envir" value="<%=adopt.getEnvir()%>">
    <label>상세내용</label>
    <input type="text" name="content" value="<%=adopt.getContent()%>">
    <input type="hidden" name="adopt_id" value="<%=adopt.getAdopt_id()%>">
    <input type="hidden" name="adoptboard_id" value="<%=adopt.getAdoptboard().getAdoptboard_id()%>">
    <input type="hidden" name="member_id" value="<%=adopt.getAdopt_id()%>">
    <input type="hidden" name="checking" value="<%=adopt.getChecking()%>">
   </form>
  </div>

  <div class="container">
    <input type="button" value="확인완료" onClick="doCheck()">
    <input type="button" value="목록" onClick="goList()">
    <input type="button" value="삭제하기" onClick="goDelete(<%=adopt.getAdopt_id() %>)">
  </div>
  

</body>
</html>