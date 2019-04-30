<%@page import="com.aroundog.model.domain.Member"%>
<%@page import="java.util.List"%>
<%@page import="com.aroundog.model.domain.Admin"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Admin admin=(Admin)request.getSession().getAttribute("admin");
	List<Member> memberList=(List)request.getAttribute("memberList"); 
%>
<!DOCTYPE html>
<html>
<head>
<title>게시판 관리</title>
<meta name="viewport" content="width=device-width, initial-scale=1">


<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script><%@ include file="/admin/inc/pagechange.jsp" %></script>

<style>
<%@ include file="/admin/inc/maincss.jsp" %>
#User {background-color: red;}
</style>
<!-- 버튼 css -->
<style>
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
</style>

<!-- 버튼 클릭시, 해당 기능 활성화 -->
<script>
function goEdit(member_id){
	location.href="/admin/member/detail?member_id="+member_id;
}

function goDel(member_id){
	if(!confirm("삭제하시겠어요?")){
		return;
	}
	location.href="/admin/member/delete?member_id="+member_id;
}
</script>
</head>
<body>

<form>
<div class="loginName" style="text-align:right"><%=admin.getId() %>님 로그인중</div>
<button class="tablink" type="button"><i class="fas fa-user-friends" style="font-size:20px"></i>  회원관리</button> 
<button class="tablink" type="button"><i class="fas fa-bullhorn" style="font-size:20px"></i>  제보관리</button>
<button class="tablink" type="button"><i class="far fa-edit" style="font-size:20px"></i>  입양신청관리</button>
<button class="tablink" type="button"><i class="far fa-comment-alt" 	style="font-size:20px"></i>  게시판관리</button>
<button class="tablink" type="button"><i class="fas fa-dog" style="font-size:20px"></i>  입양게시물관리</button>
<button class="tablink" type="button"><i class="fas fa-dog" style="font-size:20px"></i>  임보게시판관리</button>
</form>

<div id="User" class="tabcontent">
  <!-- 테이블 태그  -->
	  <table class="table table-dark table-striped">
	    <tr >
	    	<th colspan="7">총 등록 회원 수 : <%=memberList.size() %>명</th>
	    </tr>
	      <tr >
	        <th>NO</th>
		    <th>아이디</th>
		    <th>비밀번호</th>
			<th>이름</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>관리</th>
	      </tr>
	      
	  <%for(int i=0;i<memberList.size();i++){ %>
	  <%	  Member member=memberList.get(i); %>
	  <tr>
	    <th><%=i+1%></th>
	    <th><%=member.getId() %></th>
	    <th><%=member.getPass() %></th>
		<th><%=member.getName() %></th>
		<th><%=member.getEmail() %></th>
		<th><%=member.getPhone() %></th>
		<th>
			<input type="button" value="수정" onClick="goEdit(<%=member.getMember_id()%>)"/>
			<input type="button" value="삭제" onClick="goDel(<%=member.getMember_id()%>)"/>
		</th>
	  <%} %>
	  </tr>
	</table>
</div>
</body>
</html> 
