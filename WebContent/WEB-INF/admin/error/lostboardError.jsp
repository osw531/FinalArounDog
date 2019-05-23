<%@ page contentType="text/html; charset=UTF-8"%>
<% RuntimeException msg= (RuntimeException)request.getAttribute("err"); %>
<script>
alert("<%=msg.getMessage() %>");
history.back();
</script>