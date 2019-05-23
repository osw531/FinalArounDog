<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String msg=(String)request.getAttribute("err");
%>
<script>
alert("검색한 값을 찾을수 없습니다.");
history.back();
</script>
