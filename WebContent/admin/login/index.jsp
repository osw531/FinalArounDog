<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	background-color: black;
}

* {
	box-sizing: border-box;
}

/* Add padding to containers */
.container {
	padding: 16px;
	background-color: white;
}

/* Full-width input fields */
input[type=text], input[type=password] {
	width: 100%;
	padding: 15px;
	margin: 5px 0 22px 0;
	display: inline-block;
	border: none;
	background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
	background-color: #ddd;
	outline: none;
}

/* Overwrite default styles of hr */
hr {
	border: 1px solid #f1f1f1;
	margin-bottom: 25px;
}

/* Set a style for the submit button */
.registerbtn {
	background-color: #4CAF50;
	color: white;
	padding: 16px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
	opacity: 0.9;
}

.registerbtn:hover {
	opacity: 1;
}

/* Add a blue text color to links */
a {
	color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
	background-color: #f1f1f1;
	text-align: center;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
	$("button").click(function(){
		loginCheck();
	});
});
//서버에 아이디/패스워드를 비동기로 정송하여 결과를 받아와 알맞은 처리하자!!
function loginCheck(){
 /* 	$.ajax({
		url:"/admin/login",
		type:"post",
		data:{
			id:$("form :input[name='id']").val(),
			pass:$("form :input[name='pass']").val()
		},
		success:function(result){
			//var json=JSON.parse(result);//문자열을 json 객체화
			if(result.resultCode==1){
				//location.href="/admin/main.jsp";
			}else if(result.resultCode	==0){
				alert("올바르지 않은 정보입니다");
			}
		},
		error:function(result){
			
		}
	});  */
	$("form").attr({
		method:"get",
		action:"/admin/login"		
	});
	$("form").submit();
	
}
</script>
</head>
<body>
	<form>
		<div class="container">
			<h1>관리자 로그인</h1>
			<hr>
			<input type="text" placeholder="Enter Email" name="id" required>
			<input type="password" placeholder="Enter Password" name="pass" required>		
		</div>
		<div class="container signin">
			<p>
				Already have an account? <a href="#">Sign in</a>.
			</p>
		</div>
	</form>
	<button class="registerbtn">Login</button>
</body>
</html>
