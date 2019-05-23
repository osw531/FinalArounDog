<%@page import="com.aroundog.commons.Pager"%>
<%@page import="java.util.List"%>
<%@page import="com.aroundog.model.domain.Adoptboard"%>
<%@page import="com.aroundog.model.domain.Admin"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   Admin admin=(Admin)request.getSession().getAttribute("admin");
   List<Adoptboard> adoptboardList=(List)request.getAttribute("adoptboardList");
   Pager pager=(Pager)request.getAttribute("pager");   
   
%>
<!DOCTYPE html>
<html>
<head>
<title>게시판 관리</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<style>
<%@ include file="/WEB-INF/admin/inc/maincss.jsp" %>

</style>
<!-- 버튼 css -->

<style>
input[type=button] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
input[type=button]:hover {
  background-color: #45a049;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
<%@ include file="/WEB-INF/admin/inc/pagechange.jsp" %>

function goDetail(adoptboard_id){ //상세보기 이동
   location.href="/admin/adoptmanager/detail?adoptboard_id="+adoptboard_id;
}
function goRegist(){ //페이지 이동
   location.href="/admin/adoptmanager/type"; 
}
</script>
</head>
<body>
<form>
<%@include file="/WEB-INF/admin/inc/tablink.jsp" %>
<div class="loginName" style="text-align:right"><%=admin.getId() %>님 로그인중</div>
</form>
<div id="AdoptManager" class="tabcontent">
  <h3>입양게시물 관리</h3>
  
  <table class="table table-striped">
  <tr>
    <th>No</th>
    <th>타입</th>
    <th>제목</th>
    <th>등록일</th>
    <th>상세보기</th>
  </tr>

   <%int num=pager.getNum(); %>
   <%int curPos=pager.getCurPos(); %>
   <%for(int i=0;i<pager.getPageSize();i++){ %>
   <%if(num<1)break; %>
     <%Adoptboard adoptboard=adoptboardList.get(curPos++); %>
     <tr>
        <td><%=num-- %></td>
        <td><%=adoptboard.getAdoptdog().getType().getInfo() %></td>
        <td><%=adoptboard.getTitle() %></td>
       <td><%=adoptboard.getRegdate() %></td> 
       <td>
          <input type="button" value="상세보기" onClick="goDetail(<%=adoptboard.getAdoptboard_id()%>)"/>
       </td>
     </tr>
  <%} %>
   <tr>
      <td colspan="5" align="center">
         <%if(pager.getFirstPage()-1>0){ %>
         <a href="/admin/adoptboardList?currentPage=<%=pager.getFirstPage()-1%>">◀</a>
         <%}else{ %>
         <a href="javascript:alert('첫번째 페이지입니다');">◀</a>
         <%} %>
                   
         <%for(int i=pager.getFirstPage();i<pager.getLastPage();i++){%>
            <%if(i>pager.getTotalPage())break; %>
            <a href="/admin/adoptboardList?currentPage=<%=i %>">[<%=i %>]</a>                 
            <%} %>
   
            <%if(pager.getLastPage()+1<pager.getTotalPage()){ %>
               <a href="/admin/adoptboardList?currentPage=<%=pager.getLastPage()+1%>">▶</a>
               <%}else{ %>
                  <a href="javascript:alert('마지막 페이지입니다!');">▶</a>
         <%} %>
      </td>
   </tr>
   <tr >
     <td colspan="5"><input type="button" value="글 쓰기" onClick="goRegist()"/></td>
   </tr>
     
</table> 

<div></div>
  
</div>




   
</body>
</html> 