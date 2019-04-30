<%@page import="org.junit.internal.matchers.SubstringMatcher"%>
<%@page import="com.aroundog.model.domain.Adopt"%>
<%@page import="com.aroundog.model.domain.FreeBoard"%>
<%@page import="java.util.List"%>
<%@page import="com.aroundog.model.domain.Admin"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<% 
   Admin admin=(Admin)request.getSession().getAttribute("admin"); 
   List<Adopt> adoptList = (List)request.getAttribute("adoptList");
   String checking=null;
   
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
<%@ include file="/admin/inc/maincss.jsp" %>

#Adopt {background-color: white;}

</style>
</head>
<script>
<%@ include file="/admin/inc/pagechange.jsp" %>
function goDetail(){
   $("form").attr({
      action:"/admin/adopt/detail",
      type:"get",
   });
   $("form").submit();
}

</script>
<body>
<form>
<div class="loginName" style="text-align:right"><%=admin.getId() %>님 로그인중</div>
<button class="tablink" type="button"><i class="fas fa-user-friends" style="font-size:20px"></i>  회원관리</button> 
<button class="tablink" type="button"><i class="fas fa-bullhorn" style="font-size:20px"></i>  제보관리</button>
<button class="tablink" type="button"><i class="far fa-edit" style="font-size:20px"></i>  입양신청관리</button>
<button class="tablink" type="button"><i class="far fa-comment-alt"    style="font-size:20px"></i>  게시판관리</button>
<button class="tablink" type="button"><i class="fas fa-dog" style="font-size:20px"></i>  입양게시물관리</button>
<button class="tablink" type="button"><i class="fas fa-dog" style="font-size:20px"></i>  임보게시판관리</button>
</form>
<div id="Adopt" class="tabcontent">
  <h3>입양신청관리 게시판</h3>
 <table class="table table-striped">
  <tr>
     <th>No</th>
    <th>신청자</th>
    <th>전화번호</th>
    <th>신청일</th>
    <th>확인여부</th>
    <th>상세보기</th>
  </tr>
  <%for(int i=0;i<adoptList.size();i++){ %>
  <%Adopt adopt=adoptList.get(i); %>
  <%if(adopt.getChecking().equals("0")){ %>
     <% checking="미확인";%>
  <%}else{ checking="확인완료";} %>
  <form>
       <input type="hidden" name="adopt_id" value="<%=adopt.getAdopt_id()%>"/>
  </form>  
     <tr>
        <td><%=adopt.getAdopt_id() %></td>
       <td><%=adopt.getMember().getName() %></td>
       <td><%=adopt.getPhone() %></td>
       <td><%=adopt.getRegdate().substring(0,10) %></td> 
       <td><%=checking %></td>
       <td><button onClick="goDetail()">상세보기</button></td>  
     </tr>
  <%} %>
</table> 

</div>

   
</body>
</html> 