<%@page import="com.aroundog.model.domain.FreeComment"%>
<%@page import="com.aroundog.commons.Pager"%>
<%@page import="com.aroundog.model.domain.FreeBoard"%>
<%@page import="java.util.List"%>
<%@page import="com.aroundog.model.domain.Admin"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Admin admin=(Admin)request.getSession().getAttribute("admin");
	FreeBoard freeBoard=(FreeBoard)request.getAttribute("freeboard");
	List fcList=(List)request.getAttribute("fcList");
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
<%@ include file="/WEB-INF/admin/inc/maincss.jsp" %>



input[type=text], select {
  width: 40%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

.detailbutton {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  text-align:center;
}

.detailbutton:hover {
  background-color: #45a049;
}
.freelabel{
  color: black;
  width:8%;
  text-align:center;
}
.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
.rowrow{
	width:100%;
	text-align:right;
}
.freecontent{
  width: 100%;
  height:400px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}
* {
  box-sizing: border-box;
}

/* Add a gray background color with some padding */


/* Header/Blog Title */
.header {
  padding: 30px;
  font-size: 40px;
  text-align: center;

}

/* Create two unequal columns that floats next to each other */
/* Left column */
.leftcolumn {   
  margin:auto;
  width: 70%;
}

/* Right column */
.rightcolumn {
  float: left;
  width: 25%;
  padding-left: 20px;
}

/* Fake image */
.fakeimg {
  background-color: #aaa;
  width: 100%;
  padding: 20px;
}

/* Add a card effect for articles */
.card {
   background-color: white;
   padding: 20px;
   margin-top: 20px;
}
.mybt{
	text-align:right;
}
/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Footer */
.footer {
  padding: 20px;
  text-align: center;
  background: #ddd;
  margin-top: 20px;
}
.hpp{
	color:black;
	text-align:center;
} 
/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 800px) {
  .leftcolumn, .rightcolumn {   
    width: 100%;
    padding: 0;
  }
}
</style>
</head>
<script>
<%@ include file="/WEB-INF/admin/inc/pagechange.jsp" %>

function goList(){
	location.href="/admin/freeboard";
}
function delByteam(team){
	$("form[name='form-team']").attr({
		action:"/admin/freecomment/del/"+team,
		method:"GET"
	});
	$("form[name='form-team']").submit();
}

function delBycommentid(freecomment_id){
	$("form[name='form-id']").attr({
		action:"/admin/freecommentreply/del/"+freecomment_id,
		method:"GET"
	});
	$("form[name='form-id']").submit();
}
</script>
<body>
<form>
<%@include file="/WEB-INF/admin/inc/tablink.jsp" %>
</form>
<div class="loginName" style="text-align:right"><%=admin.getId() %>님 로그인중</div>

<div id="Board" class="tabcontent">
  <h3 class="hpp">자유게시판</h3>
  <p class="hpp">관리자모드</p>
	<div class="container">

	  <form action="/action_page.php">
	  <div class="rowrow">
		    <label for="fname" class="freelabel">#</label>
		    <input type="text" id="fname" name="firstname" value="<%=freeBoard.getFreeboard_id() %>" >
		    <label for="lname" class="freelabel">Member_id</label>
		    <input type="text" id="lname" name="lastname" value="<%=freeBoard.getMember().getName() %>">
	   </div>
	   <div class="rowrow">
		    <label for="lname" class="freelabel">Title</label>
		    <input type="text" id="lname" name="lastname" value="<%=freeBoard.getTitle() %>">
		    <label for="lname" class="freelabel">Regdate</label>
		    <input type="text" id="lname" name="lastname" value="<%=freeBoard.getRegdate() %>">
	    </div>
		    <div class="rowrow">
		    <label for="subject" class="freelabel">Content</label>
		    <textarea id="subject" class="freecontent"><%=freeBoard.getContent() %></textarea>
		</div>	    
		<div class="rowrow">
		    <input type="button" value="목록으로" class="detailbutton" onClick="goList()" >
	    </div>
	  </form>
	</div>
  
</div>

<div class="header">
  <h4>댓글</h4>
</div>

<div class="row" >
  <div class="leftcolumn">
  	<%if(fcList!=null){ %>
	    <%for(int i=0;i<fcList.size();i++){ %>
	    <%FreeComment freeComment=(FreeComment)fcList.get(i); %>
		    <%if(freeComment.getDepth()==1){ %>
		    <div class="card">
		    <form name="form-team">
		      <p><%=freeComment.getMember().getName() %>, <%=freeComment.getRegdate() %>  </p>
		      <p>team : <%=freeComment.getTeam() %>, depth : <%=freeComment.getDepth() %></p>
		      <div class="fakeimg" style="height:100px;"><%=freeComment.getContent() %></div>
		      <input type="hidden" name="freeboard_id" value="<%=freeBoard.getFreeboard_id() %>">
		      <input type="hidden" name="team" value="<%=freeComment.getTeam()%>">
		      <div class="mybt">
		      	<input type="button" value="삭제" class="detailbutton" onClick="delByteam(<%=freeComment.getTeam()%>)" >
		      </div>
		    </form>
		    </div>  
		    <%} %>
		    <%if(freeComment.getDepth()==2){ %>
		    <div class="card">
		    <form name="form-id">
		      <p><%=freeComment.getMember().getName() %>, <%=freeComment.getRegdate() %>  </p>
		      <p>team : <%=freeComment.getTeam() %>, depth : <%=freeComment.getDepth() %>, REPLY</p>
		      <div class="fakeimg" style="height:100px;"><%=freeComment.getContent() %></div>
		      <input type="hidden" name="freeboard_id" value="<%=freeBoard.getFreeboard_id() %>">
		      <div class="mybt">
		      	<input type="button" value="삭제" class="detailbutton" onClick="delBycommentid(<%=freeComment.getFreeComment_id()%>)">
		      </div>
		    </form>
		    </div>		      		    
		    <%} %>
	    <%} %>
    <%} %>
  </div>
 </div>



  





   
</body>
</html> 
