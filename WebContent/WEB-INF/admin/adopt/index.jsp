<%@page import="com.aroundog.commons.Pager"%>
<%@page import="org.junit.internal.matchers.SubstringMatcher"%>
<%@page import="com.aroundog.model.domain.Adopt"%>
<%@page import="com.aroundog.model.domain.FreeBoard"%>
<%@page import="java.util.List"%>
<%@page import="com.aroundog.model.domain.Admin"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<% 
   Admin admin=(Admin)request.getSession().getAttribute("admin"); 
   List<Adopt> adoptList = (List)request.getAttribute("adoptList");
   Pager pager=(Pager)request.getAttribute("pager");   
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
<%@ include file="/WEB-INF/admin/inc/maincss.jsp" %>
body{background-color: white;}
#Adopt {background-color: white;}

</style>
</head>
<script>
<%@ include file="/WEB-INF/admin/inc/pagechange.jsp" %>
function goDetail(adopt_id){
   location.href="/admin/adopt/detail?adopt_id="+adopt_id;
   
   /* $("form").attr({
      action:"/admin/adopt/detail",
      type:"get",
   });
   $("form").submit(); */
}

</script>
<body>
<form>
<%@include file="/WEB-INF/admin/inc/tablink.jsp" %>
<div class="loginName" style="text-align:right"><%=admin.getId() %>님 로그인중</div>
</form>
<div id="Adopt" class="tabcontent">
  <h3 style="color:black">입양신청 관리</h3>
  <p style="color:black">관리자모드</p>
 <table class="table table-striped">
  <tr>
     <th>No</th>
    <th>신청자</th>
    <th>전화번호</th>
    <th>신청일</th>
    <th>확인여부</th>
    <th>상세보기</th>
  </tr>
     <%int num=pager.getNum(); %>
   <%int curPos=pager.getCurPos(); %>
   <%for(int i=0;i<pager.getPageSize();i++){ %>
   <%if(num<1)break; %>
     <%Adopt adopt=adoptList.get(curPos++); %>
        <%if(adopt.getChecking().equals("0")){ %>
           <% checking="미확인";%>
        <%}else{ checking="확인완료";} %>
     <%-- <form>
       <input type="hidden" name="adopt_id" value="<%=adopt.getAdopt_id()%>"/>
     </form> --%>  
     <tr>
       <td><%=num-- %></td>
       <td><%=adopt.getMember().getName() %> </td>
       <td><%=adopt.getPhone() %></td>
       <td><%=adopt.getRegdate().substring(0,10) %></td> 
       <td><%=checking %></td>
       <td><button onClick="goDetail(<%=adopt.getAdopt_id()%>)">상세보기</button></td>  
     </tr>
  <%} %>
     <tr>
         <td colspan="6" align="center">
         <%if(pager.getFirstPage()-1>0){ %>
                 <a href="/adopts?currentPage=<%=pager.getFirstPage()-1%>">◀</a>
              <%}else{ %>
                 <a href="javascript:alert('첫번째 페이지입니다');">◀</a>
              <%} %>
                        
         <%for(int i=pager.getFirstPage();i<pager.getLastPage();i++){%>
         <%if(i>pager.getTotalPage())break; %>
         <a href="/adopts?currentPage=<%=i %>">[<%=i %>]</a>                 
         <%} %>
            
         <%if(pager.getLastPage()+1<pager.getTotalPage()){ %>
                 <a href="/adopts?currentPage=<%=pager.getLastPage()+1%>">▶</a>
              <%}else{ %>
                 <a href="javascript:alert('마지막 페이지입니다!');">▶</a>
              <%} %>
         </td>
      </tr>
</table> 

</div>

   
</body>
</html> 