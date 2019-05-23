<%@page import="com.aroundog.model.domain.LostComment"%>
<%@page import="com.aroundog.model.domain.LostBoardImg"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.aroundog.model.domain.LostBoard"%>

<%
   LostBoard lostBoard = (LostBoard) request.getAttribute("lostBoard");
   List imgList = (List) request.getAttribute("imgList");
   List lcList = (List) request.getAttribute("lcList");
%>

<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<style>
.comments-area {
   width: 900px;
   margin: auto;
}

.comment-form {
   width: 900px;
   margin: auto;
}

#listbt {
   margin-left: 992px;
   display: inline-block:
}

.comment-form2 {
   display: none;
}

#img1 {
   width: 70px;
   backround-color: red;
}

#img2 {
   width: 70px;
   backround-color: red;
}

.reply-btn {
   width: 100%;
}
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
<%@include file="/WEB-INF/user/inc/head.jsp"%>
<script>

/* 댓글 시작 */
function insertComment(){
   $("form[name='form-main']").attr({
      action:"/user/lostboardcomment/write",
      method:"POST"
   });
   $("form[name='form-main']").submit();
}
function addComment(num){
   var str="form"+num;
   $("form[name='"+str+"']").attr({
      action:"/user/lostcomment/add",
      method:"POST"
   });
   $("form[name='"+str+"']").submit();
}
function viewArea(id){
   var str="hiddenComment"+id;
   var commentArea=document.getElementById(str);
   if(commentArea.style.display=="none"){
      commentArea.style.display="block";
   }else{
      commentArea.style.display="none";
   }
}

function commentDelByTeam(team){
   if(!confirm("댓글을 삭제하시겠습니까?")){
      return;
   }
   $("form[name='form-team']").attr({
      action:"/user/lostcomment/del/"+team,
      method:"GET"
   });
   $("form[name='form-team']").submit();
}

function commentDelBycommentId(lostcomment_id){
   if(!confirm("댓글을 삭제하시겠습니까?")){
      return;
   }
   $("form[name='form-commentId']").attr({
      action:"/user/lostcommentreply/del/"+lostcomment_id,
      method:"GET"
   });
   $("form[name='form-commentId']").submit();
}
/* 댓글 끝 */
 
 /*목록으로 */
$(function() {
   $("input[name='backList']").click(function() {
      location.href = "/user/lostboard/lostboardlist";
   });
});
/*목록으로 끝 */
 

/* 수정 삭제 시작 */
   function edit(lostboard_id) {
      if (!confirm("수정하시겠어요?")) {
         return;
      }
      $("form[name='form-edit']").attr({
         method : "get",
         action : "/user/lostboard/lostboarddetail/update/"+lostboard_id
      });
      $("form[name='form-edit']").submit();
   }
   //게시물 삭제
   function boardDel(lostboard_id){
      if(!confirm("삭제하시겠습니까?")){
         return;
      }
      $("form[name='form-edit']").attr({
         action:"/user/lostboard/lostboarddetail/delete/"+lostboard_id,
         method:"GET"
      });
      $("form[name='form-edit']").submit();
   }
/* 수정 삭제 끝*/
 
/*구글 지도 시작 */
   function myMap() {
      var latLng = new google.maps.LatLng(<%=lostBoard.getLati()%>,<%=lostBoard.getLongi()%>);
      var mapProp = {
         center : latLng,
         zoom : 16
      };
      map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
      var marker = new google.maps.Marker({
         position : latLng,
         animation : google.maps.Animation.BOUNCE,
         icon : "/img/find_marker.png"
      });
      marker.setMap(map);
   }

   /*구글지도 끝*/
</script>
</head>
<body class="blog-page">
   <%@include file="/WEB-INF/user/inc/header.jsp"%>
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

   <!-- Start Volunteer-form Area -->
   <section class="Volunteer-form-area section-gap">
      <div class="container">
         <div class="row d-flex justify-content-center">
            <div class="menu-content pb-60 col-lg-9">
               <div class="title text-center">
                  <h1 class="mb-20"><%=lostBoard.getTitle()%></h1>
               </div>
            </div>
         </div>
         <div class="row justify-content-center">
            <form class="col-lg-9" enctype="multipart/form-data">
               <input type="hidden" name="lostboard_id"
                  value="<%=lostBoard.getLostboard_id()%>" />
               <div class="form-group">
                  <label for="first-name">보호기간</label> <input type="text"
                     class="form-control" name="startdate"
                     value="<%=lostBoard.getStartdate()%>" readonly> <br>
                  ~ <br> <br> <input type="text" class="form-control"
                     name="enddate" value="<%=lostBoard.getEnddate()%>" readonly>
               </div>
               <div class="form-group" style="width: 100%">
                  <div contentEditable="false">
                     <%
                        for (int i = 0; i < imgList.size(); i++) {
                     %>
                     <%
                        LostBoardImg lbi = (LostBoardImg) imgList.get(i);
                     %>
                     <img src="/data/<%=lbi.getImg()%> " style="width: 30%" />
                     <%
                        }
                     %>
                     <hr>
                     <div class="form-row" style="display: block">
                        <label for="City">발견위치</label>
                        <hr>
                     </div>
                     <!-- Google Map 관련 -->
                     <div class="select-option" id="service-select">
                        <div id="googleMap" style="width: 100%; height: 500px;"></div>
                     </div>
                     <hr>
                     <div class="form-group" style="width: 100%">
                        <textarea class="form-control" name="content" rows="5" readonly
                           placeholder="보호하고 있는 동물에 대해서 상세한 내용을 적어주세요" id="content"><%=lostBoard.getContent()%></textarea>
                        <hr>
                     </div>
                  </div>
               </div>
            </form>
         </div>
      </div>
      <!-- 게시글 부분 끝 -->

      <!-- 댓글 시작 -->
      <div class="comments-area">
         <%
            if (lcList != null) {
         %>
         <%
            for (int i = 0; i < lcList.size(); i++) {
         %>
         <%
            LostComment lostComment = (LostComment) lcList.get(i);
         %>
         <%
            if (lostComment.getDepth() == 1) {
         %>
         <div class="comment-list">
            <div class="single-comment justify-content-between d-flex"
               id="free-com">
               <div class="user justify-content-between d-flex">
                  <div class="thumb">
                     <img src="/img/logo/6.png" alt="" id="img1">
                  </div>
                  <div class="desc">
                     <h5><%=lostComment.getMember().getName()%></h5>
                     <p class="date"><%=lostComment.getRegdate()%>
                     </p>
                     <p class="comment"><%=lostComment.getContent()%></p>
                  </div>
               </div>
               <form name="form-team">
              	  <input type="hidden" name="team" 			 value="<%=lostComment.getTeam()%>"/>
              	  <input type="hidden" name="lostboard_id"    value="<%=lostBoard.getLostboard_id()%>"> 
                  <div class="reply-btn">
                     <a class="btn-reply text-uppercase" onClick="viewArea(<%=i%>)">reply</a>
                  </div>
                  <div class="reply-btn">
                     <%
                        if (member != null) {
                     %>
                     <%
                        if (member.getMember_id() == lostComment.getMember().getMember_id()) {
                     %>
                    <%--  <input type="hidden" name="team" 			 value="<%=lostComment.getTeam()%>"/> --%>
                     <%-- <input type="hidden" name="lostboard_id"    value="<%=lostBoard.getLostboard_id()%>"> --%> 
                     <a class="btn-reply text-uppercase"
                        onClick="commentDelByTeam(<%=lostComment.getTeam()%>)"> d e
                        l</a>
                     <%
                        }
                     %>
                     <%
                        }
                     %>
                  </div>
               </form>
            </div>
            <div class="comment-form2" id="hiddenComment<%=i%>">
               <h4>Reply</h4>
               <form name="form<%=i%>" style="align-items: center">
                  <%
                     if (member != null) {
                  %>
                  <input type="hidden" name="member_id"
                     value="<%=member.getMember_id()%>" />
                  <%
                     }
                  %>
                  <input type="hidden" name="lostboard_id"
                     value="<%=lostBoard.getLostboard_id()%>" /> <input type="hidden"
                     name="depth" value="2" /> <input type="hidden" name="team"
                     value="<%=lostComment.getTeam()%>" />
                  <div class="form-group">
                     <textarea class="form-control mb-10" rows="5" name="content"
                        placeholder="Messege" onfocus="this.placeholder = ''"
                        onblur="this.placeholder = 'Messege'" required=""></textarea>
                  </div>
                  <a class="primary-btn text-uppercase" onClick="addComment(<%=i%>)">Post
                     Reply</a>
               </form>
            </div>
         </div>
         <%
            }
         %>

         <!-- 댓글의 댓글 시작 -->
         <%
            if (lostComment.getDepth() == 2) {
         %>
         <div class="comment-list left-padding">
            <div class="single-comment justify-content-between d-flex">
               <div class="user justify-content-between d-flex">
                  <div class="thumb">
                     <i class="fa fa-reply fa-rotate-180" style="font-size: 24px"></i>
                     <img src="/img/logo/5.png" alt="" id="img2">
                  </div>
                  <div class="desc">
                     <h5>
                        <a href="#"><%=lostComment.getMember().getName()%></a>
                     </h5>
                     <p class="date"><%=lostComment.getRegdate()%>
                     </p>
                     <p class="comment"><%=lostComment.getContent()%></p>
                  </div>
               </div>
               <%
                  if (member != null) {
               %>
               <%
                  if (member.getMember_id() == lostComment.getMember().getMember_id()) {
               %>
               <form name="form-commentId">
                  <div class="reply-btn">
                     <input type="hidden" name="lostboard_id"
                        value="<%=lostComment.getLostboard_id()%>"> <a
                        class="btn-reply text-uppercase"
                        onClick="commentDelBycommentId(<%=lostComment.getLostcomment_id()%>)">d
                        e l</a>
                  </div>
               </form>
               <%
                  }
               %>
               <%
                  }
               %>
            </div>
         </div>
         <%
            }
         %>
         <%
            }
         %>
         <%
            }
         %>
      </div>
      
      <!-- 댓글 폼 -->
      <div class="comment-form">
         <h4>Leave a Comment</h4>
         <form name="form-main">
            <%
               if (member != null) {
            %>
            <input type="hidden" name="member_id"
               value="<%=member.getMember_id()%>" />
            <%
               }
            %>
            <input type="hidden" name="lostboard_id"
               value="<%=lostBoard.getLostboard_id()%>" /> <input type="hidden"
               name="depth" value="1" />
            <div class="form-group">
               <textarea class="form-control mb-10" rows="5" name="content"
                  placeholder="Messege" onfocus="this.placeholder = ''"
                  onblur="this.placeholder = 'Messege'" required=""></textarea>
            </div>
            <a class="primary-btn text-uppercase" onClick="insertComment()">Post
               Comment</a>
         </form>
      </div>
      <form name="form-edit">
         <div>
            <%
               if (member != null) {
            %>
            <%
               if (member.getMember_id() == lostBoard.getMember().getMember_id()) {
            %>
            <input type="button" class="primary-btn float-right mr-5" value="삭제"
               onClick="boardDel(<%=lostBoard.getLostboard_id()%>)"/>
            <input type="button" value="수정" class="primary-btn float-right"
               onClick="edit(<%=lostBoard.getLostboard_id()%>)" />
            <%
               }
            %>
            <%
               }
            %>
         </div>
      </form>
       <input type="button" value="목록으로"  name="backList" class="primary-btn float-right" />
   </section>
   <!-- End Volunteer-form Area -->
   <!-- 공통 부분 -->
   <!-- start footer Area -->
   <%@include file="/WEB-INF/user/inc/footer.jsp"%>
   <%@include file="/WEB-INF/user/inc/tail.jsp"%>
   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC7s3c6u5G3n7koVQkGfBn_qLQarZjjHlc&callback=myMap" />
</body>
</html>