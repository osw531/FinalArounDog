<%@page import="com.aroundog.commons.Pager"%>
<%@page import="com.aroundog.model.domain.FreeBoard"%>
<%@page import="java.util.List"%>
<%@page import="com.aroundog.model.domain.Admin"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Admin admin=(Admin)request.getSession().getAttribute("admin");
	FreeBoard freeBoard=(FreeBoard)request.getAttribute("freeboard");
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
<%@ include file="/admin/inc/maincss.jsp" %>

#Board {background-color: orange;}
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

input[type=text], select {
  width: 40%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

.detailbutton {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  text-align:center;
}

.detailbutton:hover {
  background-color: #45a049;
}
.freelabel{
  color: black;
  width:8%;
  text-align:center;
}
.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
.rowrow{
	width:100%;
}
.freecontent{
  width: 100%;
  height:400px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}
</style>
</head>
<script>
<%@ include file="/admin/inc/pagechange.jsp" %>

function goList(){
	location.href="/admin/freeboard";
}
</script>
<body>
<form>
<div class="loginName" style="text-align:right"><%=admin.getName() %>님 로그인중</div>
<button class="tablink" type="button"><i class="fas fa-user-friends" style="font-size:20px"></i>  회원관리</button> 
<button class="tablink" type="button"><i class="fas fa-bullhorn" style="font-size:20px"></i>  제보관리</button>
<button class="tablink" type="button"><i class="far fa-edit" style="font-size:20px"></i>  입양신청관리</button>
<button class="tablink" type="button"><i class="far fa-comment-alt" 	style="font-size:20px"></i>  게시판관리</button>
<button class="tablink" type="button"><i class="fas fa-dog" style="font-size:20px"></i>  입양게시물관리</button>
<button class="tablink" type="button"><i class="fas fa-dog" style="font-size:20px"></i>  임보게시판관리</button>
</form>

<div id="Board" class="tabcontent">
  <h3>자유게시판</h3>
  <p>관리자모드</p>
	<div class="container">

	  <form action="/action_page.php">
	  <div class="rowrow">
		    <label for="fname" class="freelabel">#</label>
		    <input type="text" id="fname" name="firstname" value="<%=freeBoard.getFreeboard_id() %>" >
		    <label for="lname" class="freelabel">Member_id</label>
		    <input type="text" id="lname" name="lastname" value="<%=freeBoard.getMember() %>">
	   </div>
	   <div class="rowrow">
		    <label for="lname" class="freelabel">Title</label>
		    <input type="text" id="lname" name="lastname" value="<%=freeBoard.getTitle() %>">
		    <label for="lname" class="freelabel">Regdate</label>
		    <input type="text" id="lname" name="lastname" value="<%=freeBoard.getRegdate() %>">
	    </div>
		    <div class="rowrow">
		    <label for="subject" class="freelabel">Content</label>
		    <textarea id="subject" class="freecontent"><%=freeBoard.getContent() %></textarea>
		</div>	    
		<div class="rowrow">
		    <input type="button" value="목록으로" class="detailbutton" onClick="goList()">
	    </div>
	  </form>
	</div>
  
</div>

  





   
</body>
</html> 
