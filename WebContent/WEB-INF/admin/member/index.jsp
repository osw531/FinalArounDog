<%@page import="com.aroundog.commons.Pager"%>
<%@page import="com.aroundog.model.domain.Member"%>
<%@page import="java.util.List"%>
<%@page import="com.aroundog.model.domain.Admin"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   Admin admin=(Admin)request.getSession().getAttribute("admin");
   List<Member> memberList=(List)request.getAttribute("memberList");
   Pager pager=(Pager)request.getAttribute("pager");   
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
<script><%@ include file="/WEB-INF/admin/inc/pagechange.jsp" %></script>

<style>
<%@ include file="/WEB-INF/admin/inc/maincss.jsp" %>

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
<%@include file="/WEB-INF/admin/inc/tablink.jsp" %>
<div class="loginName" style="text-align:right"><%=admin.getId() %>님 로그인중</div>
</form>

<div id="User" class="tabcontent">
	<h3 style="color:black">회원 관리</h3>
    <p style="color:black">관리자모드</p>
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
         
    <%int num=pager.getNum(); %>
      <%int curPos=pager.getCurPos(); %>
      <%for(int i=0;i<pager.getPageSize();i++){ %>
      <%if(num<1)break; %>
     <%     Member member=memberList.get(curPos++); %>
     <tr>
       <th><%=num-- %></th>
       <th><%=member.getId() %></th>
       <th><%=member.getPass() %></th>
      <th><%=member.getName() %></th>
      <th><%=member.getEmail() %></th>
      <th><%=member.getPhone() %></th>
      <th>
         <input type="button" value="수정" onClick="goEdit(<%=member.getMember_id()%>)"/>
         <input type="button" value="삭제" onClick="goDel(<%=member.getMember_id()%>)"/>
      </th>
     </tr>
     <%} %>
     <tr>
      <td colspan="7" align="center">
      <%if(pager.getFirstPage()-1>0){ %>
              <a href="/admin/memberList?currentPage=<%=pager.getFirstPage()-1%>">◀</a>
           <%}else{ %>
              <a href="javascript:alert('첫번째 페이지입니다');">◀</a>
           <%} %>
                     
      <%for(int i=pager.getFirstPage();i<pager.getLastPage();i++){%>
      <%if(i>pager.getTotalPage())break; %>
      <a href="/admin/memberList?currentPage=<%=i %>">[<%=i %>]</a>                 
      <%} %>
         
      <%if(pager.getLastPage()+1<pager.getTotalPage()){ %>
              <a href="/admin/memberList?currentPage=<%=pager.getLastPage()+1%>">▶</a>
           <%}else{ %>
              <a href="javascript:alert('마지막 페이지입니다!');">▶</a>
           <%} %>
      </td>
   </tr>
   </table>
</div>
</body>
</html> 