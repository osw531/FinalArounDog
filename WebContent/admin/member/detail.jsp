<%@page import="com.aroundog.model.domain.Admin"%>
<%@page import="com.aroundog.model.domain.Member"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Admin admin=(Admin)request.getSession().getAttribute("admin");
	Member member=(Member)request.getAttribute("member");
%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {font-family: Arial, Helvetica, sans-serif;}
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
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function(){
		$($("input[type='button']")[0]).click(function(){
			edit();
		});
		$($("input[type='button']")[1]).click(function(){
			location.href="/admin/memberList";
		});
	});

function edit(){
	if(!confirm("수정하시겠어요?")){
		return;
	}
	$("form").attr({
		action:"/admin/member/edit",
		method:"post"
	});
	$("form").submit();
}

</script>
</head>
<body>


<div class="container">
	<h3>회원 상세정보</h3>
  <form >
    <input type="hidden" name="member_id" value="<%=member.getMember_id()%>"> 
   
    <input type="text" name="id" value="<%=member.getId()%>">
    <input type="text" name="pass" value="<%=member.getPass()%>">
    <input type="text" name="name" value="<%=member.getName()%>">
    <input type="text" name="phone" value="<%=member.getPhone()%>">
    <input type="text" name="email" value="<%=member.getEmail()%>">
    <input type="button" value="수정">
    <input type="button" value="목록">
  </form>
</div>

</body>
</html>
