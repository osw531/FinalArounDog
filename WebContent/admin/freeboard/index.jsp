<%@page import="com.aroundog.commons.Pager"%>
<%@page import="com.aroundog.model.domain.FreeBoard"%>
<%@page import="java.util.List"%>
<%@page import="com.aroundog.model.domain.Admin"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	Admin admin=(Admin)request.getSession().getAttribute("admin");
	List<FreeBoard> freeBoardList=(List)request.getAttribute("freeBoardList");
 	Pager pager=(Pager)request.getAttribute("pager");				
%>
<!DOCTYPE html>
<html>
<head>
<title>게시판 관리</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
<%@ include file="/admin/inc/maincss.jsp" %>
/* #User {background-color: red;}
#Report {background-color: green;}
#Adopt {background-color: blue;} */
#Board {background-color: orange;}
/* #AdoptManager {background-color: pink;} */
</style>
</head>
<script>
<%@ include file="/admin/inc/pagechange.jsp" %>
//자유게시판 1건 삭제
function del(board_id){
	//alert(board_id); 실행됨
	$.ajax({
		url:"/admin/freeboard/del/"+board_id,
		type:"DELETE",
		data:{
			freeboard_id:board_id
		},
		success:function(result){
			location.href="/admin/freeboard";			
		}	
	});
}

function changePage(Page){
	$.ajax({
		url:"/admin/freeboard/page",
		type:"GET",
		data:{
			currentPage:Page
		},
		success:function(result){
			alert(result);
		}	
	});
}
function paging(freeboardList, pager){
	var wrapper=document.getElementsByClassName("table-responsive");
	wrapper.innerHTML="";
	var str="";
	str+="<table class='table table-bordered'>";
	str+="<thead>";
		str+="<tr>";
			str+="<th width='2%'>#</th>";
			str+="<th width='2%'>Board_id</th>";
			str+="<th width='2%'>Member_id</th>";
			str+="<th width='10%'>Title</th>";
			str+="<th width='25%'>Content</th>";
			str+="<th width='10%'>Regdate</th>";
			str+="<th width='2%'>Hit</th>";
			str+="<th width='2%'>Secret</th>";
			str+="<th width='2%'>Team</th>";
			str+="<th width='2%'>Rank</th>";
			str+="<th width='2%'>Depth</th>	";		
			str+="<th width='2%'>삭제</th>";			
		str+="</tr>";
	str+="</thead>";
	str+="<tbody>";
	for(var i=0;i<pager.getPageSize();i++){

	}
	str+="<tbody>";

	wrapper.innerHTML=str;
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
				<th width="2%">Board_id</th>
				<th width="2%">Member_id</th>
				<th width="10%">Title</th>
				<th width="25%">Content</th>
				<th width="10%">Regdate</th>
				<th width="2%">Hit</th>
				<th width="2%">Secret</th>		
				<th width="2%">삭제</th>			
			</tr>
		</thead>
		<tbody>
		<%int num=pager.getNum(); %>
		<%int curPos=pager.getCurPos(); %>
		<%for(int i=0;i<pager.getPageSize();i++){ %>
		<%if(num<1)break; %>
		<%FreeBoard freeBoard=freeBoardList.get(curPos++); %>
			<tr>
				<td><%=num-- %></td>
				<td><%=freeBoard.getFreeboard_id() %></td>
				<td><%=freeBoard.getMember()%></td>
				<td><%=freeBoard.getTitle() %></td>
				<td><a href="/admin/freeboard/detail/<%=freeBoard.getFreeboard_id() %>"><%=freeBoard.getContent() %></a></td>
				<td><%=freeBoard.getRegdate() %></td>
				<td><%=freeBoard.getHit() %></td>
				<td><%=freeBoard.getSecret() %></td>
				<td><input type="button" value="삭제" onClick="del(<%=freeBoard.getFreeboard_id()%>)"/></td>
			</tr>
		<%} %>
			<tr>
			<td colspan="12" align="center">
			<%if(pager.getFirstPage()-1>0){ %>
               <a href="/admin/freeboard?currentPage=<%=pager.getFirstPage()-1%>">◀</a>
            <%}else{ %>
               <a href="javascript:alert('첫번째 페이지입니다');">◀</a>
            <%} %>
            			 
			<%for(int i=pager.getFirstPage();i<pager.getLastPage();i++){%>
			<%if(i>pager.getTotalPage())break; %>
			<a href="/admin/freeboard?currentPage=<%=i %>">[<%=i %>]</a>			        
			<%} %>
				
			<%if(pager.getLastPage()+1<pager.getTotalPage()){ %>
               <a href="/admin/freeboard?currentPage=<%=pager.getLastPage()+1%>">▶</a>
            <%}else{ %>
               <a href="javascript:alert('마지막 페이지입니다!');">▶</a>
            <%} %>
			</td>
		</tr>
		</tbody>
	</table>
	</div>
	</form>
</div>

  





   
</body>
</html> 
