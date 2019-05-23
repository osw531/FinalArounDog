<%@page import="com.aroundog.model.domain.LostComment"%>
<%@page import="java.util.Collections"%>
<%@page import="com.aroundog.model.domain.LostBoardImg"%>
<%@page import="com.aroundog.commons.Pager"%>
<%@page import="com.aroundog.model.domain.LostBoard"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
   if(request.getAttribute("lostBoardList")!=null){
      List<LostBoard> lostBoardList = (List) request.getAttribute("lostBoardList");
      Collections.reverse(lostBoardList);
   }
   if(request.getAttribute("thumbList")!=null){
      List<LostBoardImg> thumbList = (List)request.getAttribute("thumbList");
   }
   if(request.getAttribute("lcList")!=null){
      List<LostComment> lcList = (List)request.getAttribute("lcList");
   }
%>
<!DOCTYPE html>

<html lang="zxx" class="no-js">
<head>
<!-- Site Title -->
<title>Animal Shelter</title>
<%@ include file="/WEB-INF/user/inc/head.jsp"%>
<style> 
.banner-areawon {
  background: url(/img/dog2.jpg) center;
  background-size: cover;
}

.banner-areawon .primary-btn {
  padding-left: 30px;
  padding-right: 30px;
}

.banner-areawon .overlay-bg {
  background-color: rgba(0, 0, 0, 0.4);
}
</style>
<script>
$(function(){
   $("input[name='write']").click(function(){
      location.href="/user/lostboard/write";
   });
});

</script>
</head>
<body>
<%@include file="/WEB-INF/user/inc/header.jsp" %>

   <!-- start banner Area -->
   <section class="banner-areawon relative" id="home">
      <div class="overlay overlay-bg"></div>
      <div class="container">
         <div class="row d-flex align-items-center justify-content-center">
            <div class="about-content col-lg-12">
               <h1 class="text-white">임시보호 게시판</h1>
            </div>
         </div>
      </div>
   </section>
   <!-- End banner Area -->

   <!-- Start Button -->
   <div class="section-top-border">
      <!-- <h3 class="mb-30"></h3> 소제목-->
      <div class="progress-table-wrap">
         <div class="progress-table">
            <div class="table-head">
               <div class="serial" style="width:100px">No</div>
               <div class="country">제목</div>
               <div class="visit">견종</div>
               <div class="visit">게시일</div>
               <div class="visit">조회수</div>
            </div>
            <c:set var="cnt" value="0"/>
            <c:set var="curPos" value="${pager.curPos }"/>
             <c:set var="num" value="${pager.num}"/>
             <c:if test="${lostBoardList != null }">
             <c:forEach var="lostBoard" items="${lostBoardList}" begin="${curPos}" end="${pager.curPos+pager.pageSize-1}">            
               <div class="table-row">
                  <div class="serial" style="width:100px">${num}</div>
                  <div class="country">      
                     <c:set var="thumbName" value=""/>
                     <c:forEach var="thumb" items="${thumbList}" >
                        <c:set var="lbi" value="${thumb}"/>
                        <c:if test="${lbi.lostboard_id == lostBoard.lostboard_id}">
                           <c:set var="thumbName" value="${lbi.img}"/>
                        </c:if>
                     </c:forEach>                
                     <img src="/data/${thumbName}" alt="flag" width="150" height="90">
                     <a href="/user/lostboard/lostboarddetail/${lostBoard.lostboard_id}">${lostBoard.title}</a>
                     
                     <!-- 댓글개수 -->
                     <c:forEach var="lcList" items="${lcList}">
                        <c:if test="${lcList.lostboard_id ==lostBoard.lostboard_id && lcList.depth==1}">
                           <c:set var="cnt" value="${cnt+1}"/>
                        </c:if>
                     </c:forEach>
                     <c:if test="${cnt!=0}">
                        (${cnt})
                        <c:set var="cnt" value="0"/>
                     </c:if>
                     <c:if test="">
                     </c:if>
                  </div>
                  <div class="visit">${lostBoard.type.info}</div>
                  <div class="visit">${lostBoard.regdate}</div>
                  <div class="visit">${lostBoard.hit}</div>
               </div>
               <c:set var="num" value="${num-1}"/>   
            </c:forEach>
            </c:if>
            <div class="table-row" style="text-align:center"></div>
            <div class="dsd" style="text-align:center">
            <c:if test="${pager.firstPage-1>0}">
                <a href="/user/lostboard/lostboardlist?currentPage=${pager.firstPage-1}">◀</a>
             </c:if>
             <c:if test="${pager.firstPage-1<=0}">
                <a href="javascript:alert('첫번째 페이지입니다!');">◀</a>
             </c:if>
             <c:forEach var="i" begin="${pager.firstPage}" end="${pager.lastPage}">
                <c:if test="${i<=pager.totalPage }">
                   <a href="/user/lostboard/lostboardlist?currentPage=${i}">[${i}]</a>
                </c:if>         
             </c:forEach>
            <c:if test="${pager.lastPage+1<pager.totalPage}">
                   <a href="//user/lostboard/lostboardlist?currentPage=${pager.lastPage+1 }">▶</a>
                </c:if>
                <c:if test="${pager.lastPage+1>pager.totalPage }">
                   <a href="javascript:alert('마지막 페이지입니다!');">▶</a>
                </c:if>
             <%if(member!=null){ %>
            <input type="button" name="write" value="글 작성"   class="primary-btn float-right" />
            <%} %>
            </div>
         </div>
      </div>
   </div>
   <!-- start footer Area -->
   <%@include file="/WEB-INF/user/inc/footer.jsp" %>
   <!-- End footer Area -->   
   
   <%@include file="/WEB-INF/user/inc/tail.jsp"%>
</body>
</html>