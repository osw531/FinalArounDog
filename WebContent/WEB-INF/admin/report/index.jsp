<%@page import="com.aroundog.commons.Pager"%>
<%@page import="com.aroundog.model.domain.Report"%>
<%@page import="com.aroundog.model.domain.FreeBoard"%>
<%@page import="java.util.List"%>
<%@page import="com.aroundog.model.domain.Admin"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%!Pager pager = new Pager();%>
<%
   Admin admin = (Admin) request.getSession().getAttribute("admin");
   List<Report> reportList = (List) request.getAttribute("reportList");
   pager.init(request, reportList.size());
%>
<!DOCTYPE html>
<html>
<head>
<title>게시판 관리</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
   integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
   crossorigin="anonymous">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<style>
<%@ include file ="/WEB-INF/admin/inc/maincss.jsp" %> 
#Report {
   background-color: white;
}
</style>
</head>
<script>
   
<%@ include file="/WEB-INF/admin/inc/pagechange.jsp" %>
   
</script>
<body>
   <form>
      <%@include file="/WEB-INF/admin/inc/tablink.jsp" %>
      <div class="loginName" style="text-align:right"><%=admin.getId()%>님 로그인중</div>
   </form>
   <div id="Report" class="tabcontent">
      <h3 style="color:black">제보 관리</h3>
  	  <p style="color:black">관리자모드</p>
      <table class="table table-bordered table-sm" style="text-align: center">
         <tr>
            <th>No</th>
            <th>제목</th>
            <th>이메일</th>
            <th>전화번호</th>
            <th>확인여부</th>
         </tr>
         <%int num = pager.getNum();%>
         <%int curPos = pager.getCurPos();%>
         <%for (int i = 0; i < pager.getPageSize(); i++) {%>
         <%   if (num < 1)   break;%>
         <%   Report report = reportList.get(curPos++);   %>
         <tr>
            <td width="30px" height="80px" style="vertical-align: middle"><%=num--%></td>
            <td style="vertical-align: middle"><a href="/reports/<%=report.getReport_id()%>"><%=report.getTitle()%></a></td>
            <td style="vertical-align: middle"><%=report.getEmail()%></td>
            <td style="vertical-align: middle"><%=report.getPhone()%></td>
            <td style="vertical-align: middle">
             <%if(report.getChecking().equals("1")){ %>
               <%="확인 완료" %>
            <%}else{%>
               <%="미확인" %>
            <%} %> 
            </td>
         </tr>
         <%}   %>
         <tr>
            <td colspan="5" align="center">
            <%if(pager.getFirstPage()-1>0){ %>
               <a href="/notice/list.jsp?currentPage<%=pager.getFirstPage()-1%>">◀</a>
            <%}else{ %>
               <a href="javascript:alert('첫번째 페이지입니다');">◀</a>
            <%} %>
               <%for (int i = pager.getFirstPage(); i <= pager.getLastPage(); i++) {%>
                  <%if (i > pager.getTotalPage()) break; %>
                   <a href="/reports?currentPage=<%=i%>">[<%=i%>]</a> 
                   <%   } %>
            <%if(pager.getLastPage()+1<pager.getTotalPage()){ %>
               <a href="/notice/list.jsp?currentPage=<%=pager.getLastPage()+1%>">▶</a>
            <%}else{ %>
               <a href="javascript:alert('마지막 페이지입니다!');">▶</a>
            <%} %>
            </td>
         </tr>
      </table>
   </div>
</body>
</html>