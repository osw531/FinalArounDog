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
%>
<!DOCTYPE html>

<html lang="zxx" class="no-js">
<head>
<!-- Site Title -->
<title>Animal Shelter</title>
<%@ include file="/user/inc/head.jsp"%>
<script>
$(function(){
   $("input[name='write']").click(function(){
      location.href="/user/lostboard/write";
   });
});

</script>
</head>
<body>
   <header id="header" id="home">
      <div class="container main-menu">
         <div class="row align-items-center justify-content-between d-flex">
            <div id="logo">
               <a href="index.html"><img src="/user/img/logo.png" alt="" title="" /></a>
            </div>
            <nav id="nav-menu-container">
               <ul class="nav-menu">
                  <li class="menu-active"><a href="index.html">Home</a></li>
                  <li><a href="about.html">About Us</a></li>
                  <li><a href="cats.html">Cats</a></li>
                  <li><a href="dogs.html">Dogs</a></li>
                  <li><a href="volunteer.html">Volunteer</a></li>
                  <li class="menu-has-children"><a href="">Blog</a>
                     <ul>
                        <li><a href="blog-home.html">Blog Home</a></li>
                        <li><a href="blog-single.html">Blog Single</a></li>
                     </ul></li>
                  <li><a href="contact.html">Contact</a></li>
                  <li class="menu-has-children"><a href="">Dropdown</a>
                     <ul>
                        <li><a href="elements.html">Elements</a></li>
                        <li><a href="#">Item</a></li>
                        <li class="menu-has-children"><a href="">Level 2</a>
                           <ul>
                              <li><a href="#">Item 1</a></li>
                              <li><a href="#">Item 2</a></li>
                           </ul></li>
                     </ul></li>
               </ul>
            </nav>
            <!-- #nav-menu-container -->
         </div>
      </div>
   </header>
   <!-- #header -->

   <!-- start banner Area -->
   <section class="banner-area relative" id="home">
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
                     <a href="/user/lostboard/lostboardlist/${lostBoard.lostboard_id}">${lostBoard.title}</a>
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
            <input type="button" name="write" value="글 작성"   class="primary-btn float-right" />
            </div>
         </div>
      </div>
   </div>
   <!-- start footer Area -->
   <footer class="footer-area">
      <div class="container">
         <div class="row pt-120 pb-80">
            <div class="col-lg-4 col-md-6">
               <div class="single-footer-widget">
                  <h6>About Us</h6>
                  <p>Few would argue that, despite the advanc ements off eminism
                     over the past three decades, women still face a double standard
                     when it comes to their behavior. While men’s
                     borderline-inappropriate behavior. Lorem ipsum dolor sit amet,
                     consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
                     labore et dolore magna aliqua.</p>
               </div>
            </div>
            <div class="col-lg-4 col-md-6">
               <div class="single-footer-widget">
                  <h6>Useful Links</h6>
                  <div class="row">
                     <ul class="col footer-nav">
                        <li><a href="#">Home</a></li>
                        <li><a href="#">Service</a></li>
                        <li><a href="#">About</a></li>
                        <li><a href="#">Case Study</a></li>
                     </ul>
                     <ul class="col footer-nav">
                        <li><a href="#">Pricing</a></li>
                        <li><a href="#">Team</a></li>
                        <li><a href="#">Blog</a></li>
                     </ul>
                  </div>
               </div>
            </div>
            <div class="col-lg-4  col-md-6">
               <div class="single-footer-widget mail-chimp">
                  <h6 class="mb-20">Contact Us</h6>
                  <ul class="list-contact">
                     <li class="flex-row d-flex">
                        <div class="icon">
                           <span class="lnr lnr-home"></span>
                        </div>
                        <div class="detail">
                           <h4>Binghamton, New York</h4>
                           <p>4343 Hinkle Deegan Lake Road</p>
                        </div>
                     </li>
                     <li class="flex-row d-flex">
                        <div class="icon">
                           <span class="lnr lnr-phone-handset"></span>
                        </div>
                        <div class="detail">
                           <h4>00 (953) 9865 562</h4>
                           <p>Mon to Fri 9am to 6 pm</p>
                        </div>
                     </li>
                     <li class="flex-row d-flex">
                        <div class="icon">
                           <span class="lnr lnr-envelope"></span>
                        </div>
                        <div class="detail">
                           <h4>support@colorlib.com</h4>
                           <p>Send us your query anytime!</p>
                        </div>
                     </li>
                  </ul>
               </div>
            </div>
         </div>
      </div>
      <div class="copyright-text">
         <div class="container">
            <div class="row footer-bottom d-flex justify-content-between">
               <p class="col-lg-8 col-sm-6 footer-text m-0 text-white">
                  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                  Copyright &copy;
                  <script>
                     document.write(new Date().getFullYear());
                  </script>
                  All rights reserved | This template is made with <i
                     class="fa fa-heart-o" aria-hidden="true"></i> by <a
                     href="https://colorlib.com" target="_blank">Colorlib</a>
                  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
               </p>
               <div class="col-lg-4 col-sm-6 footer-social">
                  <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
                     class="fa fa-twitter"></i></a> <a href="#"><i
                     class="fa fa-dribbble"></i></a> <a href="#"><i
                     class="fa fa-behance"></i></a>
               </div>
            </div>
         </div>
      </div>
   </footer>
   <!-- End footer Area -->   
   <%@include file="/user/inc/tail.jsp"%>
</body>
</html>