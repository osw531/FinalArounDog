<%@ page contentType="text/html; charset=UTF-8"%>
<%
    session.invalidate();  // 1: 기존의 세션 데이터를 모두 삭제 로그아웃!!
%>
<script>
alert("로그아웃 되셨습니다!");
location.href="/user/main";
</script>