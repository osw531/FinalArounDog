<%@page import="com.aroundog.model.domain.Type"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<Type> typeList=(List)request.getAttribute("typeList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
<script src="//cdn.ckeditor.com/4.11.3/standard/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
	CKEDITOR.replace('content');
	
	$($("input[type='button']")[0]).click(function(){
		regist();
	});
	$($("input[type='button']")[1]).click(function(){
		location.href="/admin/adoptboardList";
	});
});

function regist(){
	$("form").attr({
		method:"post",
		action:"/admin/adoptmanager/regist"
	});
	$("form").submit();
}

</script>
</head>
<body>

<h3>입양 강아지 등록하기</h3>

<div class="container">
  <form enctype="multipart/form-data">
		<div style="width:25%" >
			<input type="file" name="adoptdog.myFile" />
		</div>
		
		<div style="width:75%">
		  <select name="adoptdog.type.type_id" style="width:60%">
		      <option value="0">===종류 선택===</option>
		      <%for(int i=0;i<typeList.size();i++){ %>
			  <%Type type=typeList.get(i); %>
		      <option value="<%=type.getType_id()%>"><%=type.getInfo()%></option>
		      <%} %>
		  </select>
		  <select name="adoptdog.gender" style="width:60%">
		      <option value="0">===성별 선택===</option>
		      <option value="남아">남</option>
		      <option value="여아">여</option>
		  </select>
		  <select name="adoptdog.vaccin_id" style="width:60%">
		      <option value="0">===백신 유무 선택===</option>
		      <option value="1">유</option>
		      <option value="2">무</option>
		  </select>
		  <select name="adoptdog.neut_id" style="width:60%">
		      <option value="0">===중성화  유무선택===</option>
		      <option value="1">유</option>
		      <option value="2">무</option>
		  </select>
	    <input type="text" name="adoptdog.age" placeholder="나이" style="width:60%">
		</div>

		<div>
		    <input type="text" name="title" placeholder="제목">
		    <textarea id="subject" name="adoptdog.feature" placeholder="특이사항" style="height:100px"></textarea>
		    <textarea id="subject" name="content" placeholder="상세페이지" style="height:600px"></textarea>
		</div>
		<br/>
		<div>
		    <input type="button" value="등록">
	    	<input type="button" value="목록">
		</div>
  </form>
</div>

</body>
</html>
