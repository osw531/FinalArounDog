<%@page import="com.aroundog.model.domain.LostComment"%>
<%@page import="com.aroundog.model.domain.LostBoardImg"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.aroundog.model.domain.LostBoard"%>

<%
	LostBoard lostBoard = (LostBoard) request.getAttribute("lostBoard");
	List imgList = (List) request.getAttribute("imgList");
	List lcList = (List)request.getAttribute("lcList");
%>

<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<style>

.comments-area{
	width:900px;
	margin:auto;
}

.comment-form{
	width:900px;
	margin:auto;
}
#listbt{
	margin-left:992px;
	display:inline-block:
}
.comment-form2{
	display:none;
}
#img1{
	width:70px;
	backround-color:red;
}
#img2{
	width:70px;
	backround-color:red;
}
.reply-btn{
	width:100%;
}
</style>
<%@include file="/user/inc/head.jsp"%>
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
	$($("input[type='button']")[2]).click(function() {
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
			icon : "/user/img/find_marker.png"
		});
		marker.setMap(map);
	}

	/*구글지도 끝*/
</script>
</head>
<body class="blog-page">
<%@include file="/user/inc/header.jsp" %>
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
						value="<%=lostBoard.getLostboard_id()%>" /> <input type="hidden"
						name="member_id" value="1" />
						<div class="form-group">
							<label for="first-name">보호기간</label> <input type="text"
								class="form-control" name="startdate"
								value="<%=lostBoard.getStartdate()%>" readonly> <br>
							~ <br> <br> <input type="text" class="form-control"
								name="enddate" value="<%=lostBoard.getEnddate()%>" readonly>
						</div>	
					<div class="form-group" style="width: 100%">
						<div contentEditable="false">
							<%for (int i = 0; i < imgList.size(); i++) {%>
							<%
								LostBoardImg lbi = (LostBoardImg) imgList.get(i);
							%>
							<img src="/data/<%=lbi.getImg()%> " style="width: 30%" />
							<%}%>
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
		<%if(lcList!=null){ %>
		<%for(int i=0;i<lcList.size();i++){ %>
		<%LostComment lostComment=(LostComment)lcList.get(i); %>
		<%if(lostComment.getDepth()==1){ %>
			<div class="comment-list">
	          <div class="single-comment justify-content-between d-flex" id="free-com">
	            <div class="user justify-content-between d-flex">
	              <div class="thumb">
	                  <img src="/user/img/logo/6.png" alt="" id="img1">
	               </div>
	               <div class="desc">
	               	  <h5><a href="#"><%=lostComment.getMember().getName() %></a></h5>
	               	  <p class="date"><%=lostComment.getRegdate() %> </p>
	               	  <p class="comment"><%=lostComment.getContent() %></p>
	                </div>
	               </div>
	                <form name="form-team">
		                <div class="reply-btn">
	                       <a class="btn-reply text-uppercase" onClick="viewArea(<%=i%>)">reply</a>
	                    </div>
	                 <div class="reply-btn">
	                 <%if(member!=null){ %>
						<%if(member.getMember_id()==lostComment.getMember().getMember_id()){ %>
							<input type="hidden" name=lostboard_id value="<%=lostBoard.getLostboard_id()%>">
	                        <a class="btn-reply text-uppercase" onClick="commentDelByTeam(<%=lostComment.getTeam()%>)"> d e l</a>									
	                     <%}%>
	                    <%}%>
	                    </div>
                       </form>                               
	                  </div>
	                  <div class="comment-form2" id="hiddenComment<%=i%>">
						<h4>Reply</h4>
						 <form name="form<%=i%>" style="align-items: center">
							<%if(member!=null){ %>
								<input type="hidden" name="member_id" value="<%=member.getMember_id()%>"/>
							<%} %>
							<input type="hidden" name="lostboard_id" value="<%=lostBoard.getLostboard_id()%>"/>
							<input type="hidden" name="depth" value="2"/>
							<input type="hidden" name="team" value="<%=lostComment.getTeam()%>"/>
							<div class="form-group">
								<textarea class="form-control mb-10" rows="5" name="content" placeholder="Messege" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Messege'" required=""></textarea>
							</div>
							<a class="primary-btn text-uppercase" onClick="addComment(<%=i%>)">Post Reply</a>	
						</form>
					</div>	
	              </div>	
	           <%} %>
	           
	            <!-- 댓글의 댓글 시작 -->
	            <%if(lostComment.getDepth()==2){ %>
					<div class="comment-list left-padding">
						<div class="single-comment justify-content-between d-flex">
							 <div class="user justify-content-between d-flex">
								 <div class="thumb">
								      <i class="fa fa-reply fa-rotate-180" style="font-size:24px"></i>
								        <img src="/user/img/logo/5.png" alt="" id="img2">
								  </div>
							 <div class="desc">
								 <h5><a href="#"><%=lostComment.getMember().getName() %></a></h5>
							 	<p class="date"><%=lostComment.getRegdate() %> </p>
								 <p class="comment"><%=lostComment.getContent()%></p>
							 </div>
							</div>
							<%if(member!=null){ %>
							<%if(member.getMember_id()==lostComment.getMember().getMember_id()){ %> 
								<form name="form-commentId">                            
									<div class="reply-btn">	
										<input type="hidden" name="lostboard_id" value="<%=lostComment.getLostboard_id()%>">							     	
	                                	<a class="btn-reply text-uppercase" onClick="commentDelBycommentId(<%=lostComment.getLostcomment_id()%>)">d e l</a>
		                             </div>
		                           </form>
	                             <%} %>
	                           <%} %>
							 </div>
						</div>    
					<%} %>                          
                <%} %>   	                   	                    
	        <%} %>
	    </div>
		<!-- 댓글 폼 -->
		<div class="comment-form">
			<h4>Leave a Comment</h4>
			<form name="form-main">
				 <%if(member!=null){ %>
					<input type="hidden" name="member_id" value="<%=member.getMember_id() %>"/>
					<%} %> 
				<input type="hidden" name="lostboard_id" value="<%=lostBoard.getLostboard_id()%>" /> 
				<input type="hidden" name="depth" value="1" />
				<div class="form-group"> 
				<textarea class="form-control mb-10" rows="5" name="content"
						placeholder="Messege" onfocus="this.placeholder = ''"
						onblur="this.placeholder = 'Messege'" required=""></textarea>
				</div>
				<a class="primary-btn text-uppercase" onClick="insertComment()">Post Comment</a>
			</form>			
		</div>
		<form name="form-edit">
		<div>
				<%if(member!=null){ %>
					<%if(member.getMember_id()==lostBoard.getMember_id()){ %>
						<input type="button" class="primary-btn float-right mr-5" value="삭제" onClick="boardDel(<%=lostBoard.getLostboard_id()%>)"></button>	
						<input type="button" value="수정"		class="primary-btn float-right"  onClick="edit(<%=lostBoard.getLostboard_id()%>)"/>
					<%} %>
				<%} %>
				<input type="button" value="목록으로"	class="primary-btn float-right" />
			</div>
		</form>
	</section>
	<!-- End Volunteer-form Area -->
	<!-- 공통 부분 -->
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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC7s3c6u5G3n7koVQkGfBn_qLQarZjjHlc&callback=myMap" />
	<%@include file="/user/inc/tail.jsp"%>
</body>
</html>