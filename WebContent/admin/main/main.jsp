<%@page import="com.aroundog.model.domain.FreeBoard"%>
<%@page import="java.util.List"%>
<%@page import="com.aroundog.model.domain.Admin"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Admin admin=(Admin)request.getSession().getAttribute("admin");
	List<FreeBoard> freeBoardList=(List)request.getAttribute("freeBoardList");
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<style>
* {box-sizing: border-box}

/* Set height of body and the document to 100% */
body, html {
  height: 100%;
  margin: 0;
  font-family: Arial;
}

/* Style tab links */
.tablink {
  background-color: #555;
  color: white;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  font-size: 17px;
  width: 14.2857%;
}

.tablink:hover {
  background-color: #777;
}

/* Style the tab content (and add height:100% for full page content) */
.tabcontent {
  color: white;
  display: none;
  padding: 100px 20px;
  height: 100%;
}

/* #User {background-color: red;}
#Report {background-color: green;}
#Adopt {background-color: blue;}
#Board {background-color: orange;}
#AdoptManager {background-color: pink;} */
</style>
</head>
<script>
<%@ include file="/admin/inc/pagechange.jsp" %>

</script>
<body>
<form>
<div class="loginName" style="text-align:right"><%=admin.getName() %>님 로그인중</div>
<button class="tablink" type="button" onclick="openPage('User', this, 'red')" id="defaultOpen"><i class="fas fa-user-friends" style="font-size:20px"></i>  회원관리</button> 
<button class="tablink" type="button" onclick="openPage('Report', this, 'green')"><i class="fas fa-bullhorn" style="font-size:20px"></i>  제보관리</button>
<button class="tablink" type="button" onclick="openPage('Adopt', this, 'blue')"><i class="far fa-edit" style="font-size:20px"></i>  입양신청관리</button>
<button class="tablink" type="button"><i class="far fa-comment-alt" 	style="font-size:20px"></i>  게시판관리</button>
<button class="tablink" type="button" onclick="openPage('AdoptManager', this, 'pink')"><i class="fas fa-dog" style="font-size:20px"></i>  입양게시물관리</button>
<button class="tablink" type="button" onclick="openPage('Lostboard', this, 'light-gray')"><i class="fas fa-dog" style="font-size:20px"></i>  임보게시판관리</button>
<button class="tablink" type="button" onclick="openPage('Notice', this, 'light-gray')"><i class="fas fa-dog" style="font-size:20px"></i>  공지사항관리</button>
</form>
<div id="User" class="tabcontent">
<%-- <%FreeBoard freeBoard=freeBoardList.get(0);%>  --%>
  <h3>회원관리</h3>
  <p>Home is where the heart is..</p>
<div><%-- <%=freeBoard.getContent() %> --%></div>
  
</div>

<div id="Report" class="tabcontent">
  <h3>제보관리</h3>
  <p>Some news this fine day!</p> 
</div>

<div id="Adopt" class="tabcontent">
  <h3>입양신청관리</h3>
  <p>Get in touch, or swing by for a cup of coffee.</p>
</div>

<div id="Board" class="tabcontent">
  <h3>자유게시판</h3>
  <p>자유게시판 관리</p>
<%@ include file="/admin/inc/freeboard.jsp" %>
</div>

<div id="AdoptManager" class="tabcontent">
  <h3>입양게시물관리</h3>
  <p>gregergre.dwqdqwdqwdqwdw</p>
</div>


   
</body>
</html> 
