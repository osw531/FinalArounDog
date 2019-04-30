<%@page import="com.aroundog.model.domain.LostBoard"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	LostBoard lostboard = (LostBoard)request.getAttribute("lostboard");
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}

ul {
  list-style-type: none;
  padding: 0;
  margin: 0;
}

ul li {
  border: 1px solid #ddd;
  margin-top: -1px; /* Prevent double borders */
  background-color: #f6f6f6;
  padding: 12px;
}

/* 댓글 작성자 이름 나오는 파란 아이콘*/
.label {
  color: white;
  padding: 8px;
  font-family: Arial;
}
.info {background-color: #2196F3;} /* Blue */

/* 댓글 내용 나오는 부분*/
textarea {
  width: 100%;
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
window.onload=function(){
	//alert("작동!!!");
}
</script>
<body>

<h2>ID : <%=lostboard.getMember().getId() %></h2>

<label for="subject">내용</label>
<textarea id="subject" name="subject" style="height:200px" readonly><%=lostboard.getContent()%></textarea>

<ul>
  <span class="label info">댓글작성자</span>
  <li>Adele</li>
</ul>

</body>
</html>
