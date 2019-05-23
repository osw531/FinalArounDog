<%@page import="com.aroundog.commons.Pager"%>
<%@page import="java.util.Collections"%>
<%@page import="com.aroundog.model.domain.LostBoard"%>
<%@page import="com.aroundog.model.domain.FreeBoard"%>
<%@page import="java.util.List"%>
<%@page import="com.aroundog.model.domain.Admin"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
   Admin admin=(Admin)request.getSession().getAttribute("admin");
   List<LostBoard> lostboardList = (List)request.getAttribute("lostboardList");
   LostBoard lostboardSearch = (LostBoard)request.getAttribute("lostboardSearch");
   Pager pager=(Pager)request.getAttribute("pager");
   if(lostboardList!=null){Collections.reverse(lostboardList);} // 리스트 배열의 순서를 거꾸로 바꿔준다
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
<%@ include file="/WEB-INF/admin/inc/maincss.jsp" %>
#AdoptManager {background-color: white;}
</style>
</head>
<script>
<%@ include file="/WEB-INF/admin/inc/pagechange.jsp" %>

function lostboardSearch(){
    var lostboard_id=$("input[name='lostboard_id']").val();
    //alert(lostboard_id);
    $.ajax({
       url:"/admin/lostboard/search",
       type:"get",
       success:function(result){
          var objList= JSON.parse(result);
          
          var i=0;
          while(i<=objList.idList.length){
             if(i<objList.idList.length){
                var obj= objList.idList[i];
                if(lostboard_id==obj.lostboard_id){
                   location.href="/admin/lostboardSearch?lostboard_id="+lostboard_id;
                   break;
                }
             }else if(i=objList.idList.length){
                alert("찾는 게시글이 없습니다");
             }
             i++;
          }

       }
    });
    
}   
function goDetail(lostboard_id){
   window.open("/admin/lostboard?lostboard_id="+lostboard_id,"detail","width=450, height=600, scrollbars=1, menubar=0, top=100, left=400, location=0, resizable=no")
}
function getList(){
   location.href="/admin/lostboardList";
}
</script>
<body>
<form>
<%@include file="/WEB-INF/admin/inc/tablink.jsp" %>
<div class="loginName" style="text-align:right"><%=admin.getId() %>님 로그인중</div>
</form>

<div id="AdoptManager" class="tabcontent">
 
<div class="container">
  <h2 style="color:gray">임시보호 게시글 관리</h2>
  <br>

  <label class="mb-2 mr-sm-2" style="color:black">게시글 검색:</label>
  <input type="text" class="form-control mb-2 mr-sm-2" width="30%" placeholder="게시글 번호를 입력해주세요" name="lostboard_id"/>
  <button class="btn btn-primary mb-2" onClick="lostboardSearch()" type="button">검색</button>
  <button class="btn btn-primary mb-2" onClick="getList()" type="button">전체보기</button>
  
  <table class="table table-striped">
    <thead>
      <tr>
        <th>게시글 번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>전화번호</th>
        <th>관리하기</th>
      </tr>
    </thead>
    
    <form name="detail-form">
    <tbody>
    
    <%if(lostboardSearch!=null){ %>
       <tr>
           <td><%= lostboardSearch.getLostboard_id()%></td>
           <td><%= lostboardSearch.getTitle()%></td>
           <td><%= lostboardSearch.getMember().getName()%></td>
           <td><%= lostboardSearch.getRegdate().substring(0,10)%></td>
           <td><%= lostboardSearch.getMember().getPhone()%></td>
           <td><button class="btn btn-light" onClick="goDetail(<%=lostboardSearch.getLostboard_id() %>)" type="button">상세보기</button></td>
         </tr>
    <%}else{ %>
      <%int num=pager.getNum(); %>
      <%int curPos=pager.getCurPos(); %>
        <%for(int i=0;i<pager.getPageSize();i++){ %>
        <%if(num<1)break; %>
        <%LostBoard lostboard = lostboardList.get(i); %> 
         <tr>
            <%=num-- %>
           <td><%= lostboard.getLostboard_id()%></td>
           <td><%= lostboard.getTitle()%></td>
           <td><%= lostboard.getMember().getName()%></td>
           <td><%= lostboard.getRegdate().substring(0,10)%></td>
           <td><%= lostboard.getMember().getPhone()%></td>
           <td><button class="btn btn-light" onClick="goDetail(<%=lostboard.getLostboard_id() %>)" type="button">상세보기</button></td>
         </tr>
         <%} %>
         <tr>
            <td colspan="6" align="center">
            <%if(pager.getFirstPage()-1>0){ %>
                  <a href="/admin/lostboardList?currentPage=<%=pager.getFirstPage()-1%>">◀</a>
               <%}else{ %>
                  <a href="javascript:alert('첫번째 페이지입니다');">◀</a>
               <%} %>
                         
            <%for(int i=pager.getFirstPage();i<pager.getLastPage();i++){%>
            <%if(i>pager.getTotalPage())break; %>
            <a href="/admin/lostboardList?currentPage=<%=i %>">[<%=i %>]</a>                 
            <%} %>
               
            <%if(pager.getLastPage()+1<pager.getTotalPage()){ %>
                  <a href="/admin/lostboardList?currentPage=<%=pager.getLastPage()+1%>">▶</a>
               <%}else{ %>
                  <a href="javascript:alert('마지막 페이지입니다!');">▶</a>
               <%} %>
            </td>
         </tr>
      <%} %>
    </tbody>
    </form> 
    
  </table>
</div>
      

</div>
   
   
</body>
</html> 