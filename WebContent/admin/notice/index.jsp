<%@page import="com.aroundog.model.domain.Notice"%>
<%@page import="com.aroundog.commons.Pager"%>
<%@page import="java.util.List"%>
<%@page import="com.aroundog.model.domain.Admin"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	Admin admin=(Admin)request.getSession().getAttribute("admin");
	List<Notice> noticeList=(List)request.getAttribute("noticeList");
 	Pager pager=(Pager)request.getAttribute("pager");				
%>
<!DOCTYPE html>
<html>
<head>
<title>공지사항 관리</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
<%@ include file="/admin/inc/maincss.jsp" %>
body{background-color: orange;}
/* #User {background-color: red;}
#Report {background-color: green;}
#Adopt {background-color: blue;} */
#Board {background-color: orange;}
/* #AdoptManager {background-color: pink;} */
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
</head>
<script>
<%@ include file="/admin/inc/pagechange.jsp" %>
function goRegist(){ //페이지 이동
	location.href="/admin/notice/registpage"; 
}
//공지 1건 삭제
function del(id){
	//alert(board_id); 실행됨
	$.ajax({
		url:"/admin/notice/del/"+id,
		type:"DELETE",
		data:{
			notice_id:id
		},
		success:function(result){
			location.href="/admin/notice";			
		}	
	});
}
</script>
<body>
<form>
<div class="loginName" style="text-align:right"><%=admin.getName() %>님 로그인중</div>
<button class="tablink" type="button"><i class="fas fa-user-friends" style="font-size:20px"></i>  회원관리</button> 
<button class="tablink" type="button"><i class="fas fa-bullhorn" style="font-size:20px"></i>  제보관리</button>
<button class="tablink" type="button"><i class="far fa-edit" style="font-size:20px"></i>  입양신청관리</button>
<button class="tablink" type="button"><i class="far fa-comment-alt" 	style="font-size:20px"></i>  게시판관리</button>
<button class="tablink" type="button"><i class="fas fa-dog" style="font-size:20px"></i>  입양게시물관리</button>
<button class="tablink" type="button"><i class="fas fa-dog" style="font-size:20px"></i>  임보게시판관리</button>
<button class="tablink" type="button" onclick="openPage('Notice', this, 'light-gray')"><i class="fas fa-dog" style="font-size:20px"></i>  공지사항관리</button>
</form>

<div id="Board" class="tabcontent">
  <h3>자유게시판</h3>
  <p>관리자모드</p>
  <form>
  <div class="table-responsive">
	<table class="table table-bordered">
		<thead>
			<tr>
				<th width="2%">#</th>
				<th width="2%">Notice_id</th>
				<th width="10%">Title</th>
				<th width="25%">Content</th>
				<th width="10%">Regdate</th>
				<th width="2%">Hit</th>	
				<th width="2%">삭제</th>			
			</tr>
		</thead>
		<tbody>
		<%int num=pager.getNum(); %>
		<%int curPos=pager.getCurPos(); %>
		<%for(int i=0;i<pager.getPageSize();i++){ %>
		<%if(num<1)break; %>
		<%Notice notice=noticeList.get(curPos++); %>
			<tr>
				<td><%=num-- %></td>
				<td><%=notice.getNotice_id() %></td>
				<td><%=notice.getTitle() %></td>
				<td><a href="/admin/freeboard/detail/<%=notice.getNotice_id() %>"><%=notice.getContent() %></a></td>
				<td><%=notice.getRegdate() %></td>
				<td><%=notice.getHit() %></td>
				<td><input type="button" value="삭제" onClick="del(<%=notice.getNotice_id()%>)"/></td>
			</tr>
		<%} %>
			<tr>
			<td colspan="12" align="center">
			<%if(pager.getFirstPage()-1>0){ %>
               <a href="/admin/notice?currentPage=<%=pager.getFirstPage()-1%>">◀</a>
            <%}else{ %>
               <a href="javascript:alert('첫번째 페이지입니다');">◀</a>
            <%} %>
            			 
			<%for(int i=pager.getFirstPage();i<pager.getLastPage();i++){%>
			<%if(i>pager.getTotalPage())break; %>
			<a href="/admin/notice?currentPage=<%=i %>">[<%=i %>]</a>			        
			<%} %>
				
			<%if(pager.getLastPage()+1<pager.getTotalPage()){ %>
               <a href="/admin/notice?currentPage=<%=pager.getLastPage()+1%>">▶</a>
            <%}else{ %>
               <a href="javascript:alert('마지막 페이지입니다!');">▶</a>
            <%} %>
			</td>
		</tr>
		<tr>
	    <td colspan="7" align="right"><input type="button" value="글 쓰기" onClick="goRegist()"/></td>
	 	</tr>
		</tbody>
	</table>
	</div>
	</form>
</div>

   
</body>
</html> 
