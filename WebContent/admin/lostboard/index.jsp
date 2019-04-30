<%@page import="com.aroundog.model.domain.LostBoard"%>
<%@page import="com.aroundog.model.domain.FreeBoard"%>
<%@page import="java.util.List"%>
<%@page import="com.aroundog.model.domain.Admin"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	Admin admin=(Admin)request.getSession().getAttribute("admin");
	List<LostBoard> lostboardList = (List)request.getAttribute("lostboardList");
%>  

<!DOCTYPE html>
<html>
<head>
<title>게시판 관리</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

<!-- 테이블&버튼 관련한 스타일 시트 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


<style>
<%@ include file="/admin/inc/maincss.jsp" %>
#AdoptManager {background-color: white;}
</style>
</head>
<script>
<%@ include file="/admin/inc/pagechange.jsp" %>

function search(){
   var lostboard_id=$("input[name='lostboard_id']").val();
   alert(lostboard_id);
   
	$.ajax({
		url:"/admin/lostboardSearchId",
		type:"get",
		data:{
			"lostboard_id":lostboard_id
		},
		success:function(result){
			var json = JSON.parse(result);
			alert("성공 데이터는"+json);
		},
		error:function(result){
			alert("실패<br>"+result);
		}
	});
}
function goDetail(){
	alert();
}
</script>
<body>
<form>
<div class="loginName" style="text-align:right"><%=admin.getId() %>님 로그인중</div>
<button class="tablink" type="button"><i class="fas fa-user-friends" style="font-size:20px"></i>  회원관리</button> 
<button class="tablink" type="button"><i class="fas fa-bullhorn" style="font-size:20px"></i>  제보관리</button>
<button class="tablink" type="button"><i class="far fa-edit" style="font-size:20px"></i>  입양신청관리</button>
<button class="tablink" type="button"><i class="far fa-comment-alt"    style="font-size:20px"></i>  게시판관리</button>
<button class="tablink" type="button"><i class="fas fa-dog" style="font-size:20px"></i>  입양게시물관리</button>
<button class="tablink" type="button"><i class="fas fa-dog" style="font-size:20px"></i>  임보게시판관리</button>
</form>

<div id="AdoptManager" class="tabcontent">
 
<div class="container">
  <h2 style="color:gray">임시보호 게시글 관리</h2>
  <br>
  <form class="form-inline" name="search-form">
  <label class="mb-2 mr-sm-2" style="color:black">게시글 검색:</label>
  <input type="text" class="form-control mb-2 mr-sm-2" width="30%" placeholder="게시글 번호를 입력해주세요" name="lostboard_id"/>
  <button class="btn btn-primary mb-2" onClick="search()">검색</button>
  </form>
  
  <table class="table table-striped">
    <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>전화번호</th>
        <th>관리하기</th>
      </tr>
    </thead>
    
    <form name="detail-form">
    <tbody>
    <%for(int i=0;i<lostboardList.size();i++){ %>
    <%LostBoard lostboard = lostboardList.get(i); %> 
      <tr>
        <td><%= lostboard.getLostboard_id()%></td>
        <td><%= lostboard.getTitle()%></td>
        <td><%= lostboard.getMember().getName()%></td>
        <td><%= lostboard.getRegdate().substring(0,10)%></td>
        <td><%= lostboard.getMember().getPhone()%></td>
        <td><button class="btn btn-light" onClick="goDetail()">상세보기</button></td>
      </tr>
      <%} %>
      
    </tbody>
    </form> 
    
  </table>
</div>
      

</div>
   
</body>
</html> 