<%@page import="com.aroundog.model.domain.LostBoard"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	LostBoard lostboard = (LostBoard)request.getAttribute("lostboard");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임시보호 게시글 상세보기</title>
</head>
<script>
window.onload=function(){
	//alert("작동!!!");
}
</script>
<body>
<%=lostboard.getContent() %>
</body>
</html>