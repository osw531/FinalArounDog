<%@ page contentType="text/html; charset=UTF-8"%>
<%
   String msg= (String)request.getAttribute("err");
%>
<script>
alert(<%=msg %>);
location.href="/admin/adoptList";
</script>