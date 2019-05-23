<%@page import="com.aroundog.model.domain.Notice"%>
<%@page import="com.aroundog.commons.Pager"%>
<%@page import="com.aroundog.model.domain.FreeBoard"%>
<%@page import="java.util.List"%>
<%@page import="com.aroundog.model.domain.Admin"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	Admin admin=(Admin)request.getSession().getAttribute("admin");				
%>
<!DOCTYPE html>
<html>
<head>
<title>공지사항 등록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<style>
<%@ include file="/WEB-INF/admin/inc/maincss.jsp" %>
#wrapper{background-color: orange;}
body {font-family: Arial, Helvetica, sans-serif;background-color: orange;}
* {box-sizing: border-box;}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

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

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
.hpp{
	color:black;
	text-align:center;
} 
</style>
</head>
<script src="//cdn.ckeditor.com/4.11.3/standard/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
<%@ include file="/WEB-INF/admin/inc/pagechange.jsp" %>
$(function(){
	/* CKEDITOR.replace('content'); */
	
	$($("input[type='button']")[0]).click(function(){
		regist();
	});
	$($("input[type='button']")[1]).click(function(){
		location.href="/admin/notice";
	});
});

function regist(){
	$("form").attr({
		method:"post",
		action:"/admin/notice/regist"
	});
	$("form").submit();
}

</script>
<body>
<form>

<%@include file="/WEB-INF/admin/inc/tablink.jsp" %>
<div class="loginName" style="text-align:right"><%=admin.getId()%>님 로그인중</div>
<div id="wrapper">
  <h3 class="hpp">공지사항</h3>
  <p class="hpp">관리자모드</p>
  <div class="container">

		<div>
		    <input type="text" name="title" placeholder="제목입력" style="width:100%">
		</div>
		<div>
		    <textarea id="subject" name="content" placeholder="상세페이지" style="height:600px" style="width:100%"></textarea>
		
		</div>
		<div align="right">
		    <input type="button" value="등록">
	    	<input type="button" value="목록">
		</div>
  </div>
	
</div>
</form>

   
</body>
</html> 
