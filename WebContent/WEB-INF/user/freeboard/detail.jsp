<%@page import="com.aroundog.model.domain.FreeComment"%>
<%@page import="java.util.List"%>
<%@page import="com.aroundog.model.domain.FreeBoard"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	FreeBoard freeboard=(FreeBoard)request.getAttribute("freeboard");
	List fcList=(List)request.getAttribute("fcList");
	List freeboardList=(List)request.getAttribute("freeboardList");

%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="/user/img/fav.png">
<!-- Author Meta -->
<meta name="author" content="codepixer">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>Animal Shelter</title>

<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<!--
	CSS
	============================================= -->
<link rel="stylesheet" href="/css/linearicons.css">
<link rel="stylesheet" href="/css/font-awesome.min.css">
<link rel="stylesheet" href="/css/free_bootstrap.css">
<link rel="stylesheet" href="/css/magnific-popup.css">
<link rel="stylesheet" href="/css/nice-select.css">							
<link rel="stylesheet" href="/css/animate.min.css">
<link rel="stylesheet" href="/css/owl.carousel.css">
<link rel="stylesheet" href="/css/freeboard.css">
<style>
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
</head>
<script>
function createArea(){
	var com=document.getElementById("free-com");
	alert(com);

	var str="";

	str+="<div class='comment-form'>";
	str+="<h4>Leave a Comment</h4>";
		str+="<form>";
			str+="<input type='hidden' name='member_id' value='1'/>";
				str+="<input type='hidden' name='freeboard_id' value='<%=freeboard.getFreeboard_id()%>'/>";
					str+="<div class='form-group'>";
						str+="<textarea class='form-control mb-10' rows='5' name='content' placeholder='Messege' onfocus='this.placeholder = ' onblur='this.placeholder = 'Messege' required=''></textarea>";
					str+="</div>";
			str+="<a href='#' class='primary-btn text-uppercase'>Post Comment</a>";
		str+="</form>";
	str+="</div>";

	com.innerHTML(str);
	
}
function insertComment(){
	$("form[name='form-main']").attr({
		action:"/user/freecomment/regist",
		method:"POST"
	});
	$("form[name='form-main']").submit();
}
function addComment(num){
	var str="form"+num;
	$("form[name='"+str+"']").attr({
		action:"/user/freecomment/add",
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
//상세보기 수정하기
function boardEdit(freeboard_id){
	
	$("form[name='form-edit']").attr({
		action:"/user/freeboard/edit/"+freeboard_id,
		method:"GET"
	});
	$("form[name='form-edit']").submit();
}

//게시물 삭제
function boardDel(freeboard_id){
	if(!confirm("게시물을 삭제하시겠습니까?")){
		return;
	}
	$("form[name='form-edit']").attr({
		action:"/user/freeboard/del/"+freeboard_id,
		method:"GET"
	});
	$("form[name='form-edit']").submit();
}

//댓글 삭제 밑에 대댓글도 함께 삭제
function commentDelByTeam(team){
	if(!confirm("댓글을 삭제하시겠습니까?")){
		return;
	}
	$("form[name='form-team']").attr({
		action:"/user/freecomment/del/"+team,
		method:"GET"
	});
	$("form[name='form-team']").submit();
}
//대 댓글 삭제
function commentDelBycommentId(freecomment_id){
	if(!confirm("댓글을 삭제하시겠습니까?")){
		return;
	}
	$("form[name='form-commentId']").attr({
		action:"/user/freecommentreply/del/"+freecomment_id,
		method:"GET"
	});
	$("form[name='form-commentId']").submit();
}
function goList(){
	location.href="/user/freeboards";
}
function otherDetail(freeboard_id){
	location.href="/user/freeboard/detail/"+freeboard_id;
}
</script>
<body class="blog-page">	
<%@include file="/WEB-INF/user/inc/header.jsp" %>
	<%int cnt=0; %>	
	<%for(int i=0;i<fcList.size();i++){ %>
	<%FreeComment freeComment=(FreeComment)fcList.get(i); %>
    <%if(freeComment.getDepth()==1){ %>
    <%cnt++; %>
    <%} %>					
    <%} %>
	<!-- start banner Area -->
	<section class="banner-area relative" id="home">	
		<div class="overlay overlay-bg"></div>
		<div class="container">				
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">
						Details Page				
					</h1>	
					
				</div>	
			</div>
		</div>
	</section>
	<!-- End banner Area -->					  
	
	<!-- Start post-content Area -->
	<section class="post-content-area single-post-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 posts-list">
					<div class="single-post row">
						<div class="col-lg-12">
							<div class="feature-img" style="text-align:center">
								<img class="detail-top" src="/img/aroundog/topmain.jpg" alt="">
							</div>									
						</div>
						<div class="col-lg-3  col-md-3 meta-details">
							
							<div class="user-details row">
								<p class="user-name col-lg-12 col-md-12 col-6"><a href="#"><%=freeboard.getMember().getName() %></a> <span class="lnr lnr-user"></span></p>
								<p class="date col-lg-12 col-md-12 col-6"><a href="#"><%=freeboard.getRegdate() %></a> <span class="lnr lnr-calendar-full"></span></p>
								<p class="view col-lg-12 col-md-12 col-6"><a href="#"><%=freeboard.getHit() %> Views</a> <span class="lnr lnr-eye"></span></p>
								<p class="comments col-lg-12 col-md-12 col-6"><a href="#"><%=cnt %> Comments</a> <span class="lnr lnr-bubble"></span></p>
								<ul class="social-links col-lg-12 col-md-12 col-6">

								</ul>																				
							</div>
						</div>
						<div class="col-lg-9 col-md-9">
							<a class="posts-title" href="#"><h3><%=freeboard.getTitle() %></h3></a>
							<p class="excert">
								<%=freeboard.getContent().replace("\r\n","<br>") %>
							</p>							
						</div>
						
					</div>
					<div class="navigation-area">
						<div class="row">
						<%for(int i=0;i<freeboardList.size();i++){ %>
                  		<% FreeBoard freeBoard2=(FreeBoard)freeboardList.get(i);%>
                  		<%if(freeboard.getFreeboard_id()==freeBoard2.getFreeboard_id()){ %>
                  			<%if(i==0){ %>
                  			<%if(freeboardList.size()>1){ %>
                        	<%FreeBoard nextBoard=(FreeBoard)freeboardList.get(i+1); %>
                        		<%if(member==null){ %>
                               		<%if(nextBoard.getSecret().equals("true")){ %>
										<div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
										</div>
										<div class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
											<div class="detials">
												<p>다음글</p>									
												<a href="javascript:alert('비공개글 입니다.');" ><h4><%=nextBoard.getTitle() %></h4></a>
											</div>
											<div class="arrow">
												<a href="javascript:alert('비공개글 입니다.');" ><span class="lnr text-white lnr-arrow-right" style='font-size:36px'></span></a>
											</div>
											<div class="thumb">
												<a href="javascript:alert('비공개글 입니다.');" ><img class="img-fluid" src="/img/aroundog/dogright.jpg" alt=""></a>
											</div>										
										</div>
									<%}else{%>
										<div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
										</div>
										<div class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
											<div class="detials">
												<p>다음글</p>									
												<a href="#" onClick="otherDetail(<%=nextBoard.getFreeboard_id()%>)"><h4><%=nextBoard.getTitle() %></h4></a>
											</div>
											<div class="arrow">
												<a href="#" onClick="otherDetail(<%=nextBoard.getFreeboard_id()%>)"><span class="lnr text-white lnr-arrow-right" style='font-size:36px'></span></a>
											</div>
											<div class="thumb">
												<a href="#" onClick="otherDetail(<%=nextBoard.getFreeboard_id()%>)"><img class="img-fluid" src="/img/aroundog/dogright.jpg" alt=""></a>
											</div>										
										</div>
									<%} %>  
								<%}else{ %>  
									<%if(nextBoard.getSecret().equals("true")){ %>
										<%if(nextBoard.getMember().getMember_id()==member.getMember_id() || member.getId().equals("admin") ){ %>
												<div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
												</div>
												<div class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
													<div class="detials">
														<p>다음글</p>									
														<a href="#" onClick="otherDetail(<%=nextBoard.getFreeboard_id()%>)"><h4><%=nextBoard.getTitle() %></h4></a>
													</div>
													<div class="arrow">
														<a href="#" onClick="otherDetail(<%=nextBoard.getFreeboard_id()%>)"><span class="lnr text-white lnr-arrow-right" style='font-size:36px'></span></a>
													</div>
													<div class="thumb">
														<a href="#" onClick="otherDetail(<%=nextBoard.getFreeboard_id()%>)"><img class="img-fluid" src="/img/aroundog/dogright.jpg" alt=""></a>
													</div>										
												</div>
										<%}else{ %>
											<div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
											</div>
											<div class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
												<div class="detials">
													<p>다음글</p>									
													<a href="javascript:alert('비공개글 입니다.');" ><h4><%=nextBoard.getTitle() %></h4></a>
												</div>
												<div class="arrow">
													<a href="javascript:alert('비공개글 입니다.');" ><span class="lnr text-white lnr-arrow-right" style='font-size:36px'></span></a>
												</div>
												<div class="thumb">
													<a href="javascript:alert('비공개글 입니다.');" ><img class="img-fluid" src="/img/aroundog/dogright.jpg" alt=""></a>
												</div>										
											</div>
										<%} %>
									<%}else{ %>
										<div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
										</div>
										<div class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
											<div class="detials">
												<p>다음글</p>									
												<a href="#" onClick="otherDetail(<%=nextBoard.getFreeboard_id()%>)"><h4><%=nextBoard.getTitle() %></h4></a>
											</div>
											<div class="arrow">
												<a href="#" onClick="otherDetail(<%=nextBoard.getFreeboard_id()%>)"><span class="lnr text-white lnr-arrow-right" style='font-size:36px'></span></a>
											</div>
											<div class="thumb">
												<a href="#" onClick="otherDetail(<%=nextBoard.getFreeboard_id()%>)"><img class="img-fluid" src="/img/aroundog/dogright.jpg" alt=""></a>
											</div>										
										</div>
									<%} %>
								<%} %>
							<%} %> 
							<%} %>    
							
							      
                        	<%if(i>0 && i<freeboardList.size()-1){ %>
								<%FreeBoard preBoard=(FreeBoard)freeboardList.get(i-1); %>
                                <%FreeBoard nextBoard=(FreeBoard)freeboardList.get(i+1); %>
                                	<%if(member==null){ %>
	                               		<%if(preBoard.getSecret().equals("true")){ %>
											<div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
												<div class="thumb">
													<a href="javascript:alert('비공개글 입니다.');" ><img class="img-fluid" src="/img/aroundog/dogleft.jpg" alt=""></a>
												</div>
												<div class="arrow">
													<a href="javascript:alert('비공개글 입니다.');" ><span class="lnr text-white lnr-arrow-left" style='font-size:36px'></span></a>
												</div>
												<div class="detials">
													<p>이전글</p>									
													<a href="javascript:alert('비공개글 입니다.');" ><h4><%=preBoard.getTitle() %></h4></a>
												</div>
											</div> 
										<%}else{%>
											<div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
												<div class="thumb">
													<a href="#" onClick="otherDetail(<%=preBoard.getFreeboard_id()%>)"><img class="img-fluid" src="/img/aroundog/dogleft.jpg" alt=""></a>
												</div>
												<div class="arrow">
													<a href="#" onClick="otherDetail(<%=preBoard.getFreeboard_id()%>)"><span class="lnr text-white lnr-arrow-left" style='font-size:36px'></span></a>
												</div>
												<div class="detials">
													<p>이전글</p>									
													<a href="" onClick="otherDetail(<%=preBoard.getFreeboard_id()%>)"><h4><%=preBoard.getTitle() %></h4></a>
												</div>
											</div> 
										<%} %>  
																			
										
										<%if(nextBoard.getSecret().equals("true")){ %>
											<div class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
												<div class="detials">
													<p>다음글</p>									
													<a href="javascript:alert('비공개글 입니다.');" ><h4><%=nextBoard.getTitle() %></h4></a>
												</div>
												<div class="arrow">
													<a href="javascript:alert('비공개글 입니다.');" ><span class="lnr text-white lnr-arrow-right" style='font-size:36px'></span></a>
												</div>
												<div class="thumb">
													<a href="javascript:alert('비공개글 입니다.');" ><img class="img-fluid" src="/img/aroundog/dogright.jpg" alt=""></a>
												</div>										
											</div>
										<%}else{%>
											<div class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
												<div class="detials">
													<p>다음글</p>									
													<a href="#" onClick="otherDetail(<%=nextBoard.getFreeboard_id()%>)"><h4><%=nextBoard.getTitle() %></h4></a>
												</div>
												<div class="arrow">
													<a href="#" onClick="otherDetail(<%=nextBoard.getFreeboard_id()%>)"><span class="lnr text-white lnr-arrow-right" style='font-size:36px'></span></a>
												</div>
												<div class="thumb">
													<a href="#" onClick="otherDetail(<%=nextBoard.getFreeboard_id()%>)"><img class="img-fluid" src="/img/aroundog/dogright.jpg" alt=""></a>
												</div>										
											</div>
										<%} %> 
									
									
									
									
									
									
								<%}else{ %>  <!-- member is not null -->
								
									<%if(preBoard.getSecret().equals("true")){ %>
										<%if(preBoard.getMember().getMember_id()==member.getMember_id() || member.getId().equals("admin")){ %>
												<div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
													<div class="thumb">
														<a href="#" onClick="otherDetail(<%=preBoard.getFreeboard_id()%>)"><img class="img-fluid" src="/img/aroundog/dogleft.jpg" alt=""></a>
													</div>
													<div class="arrow">
														<a href="#" onClick="otherDetail(<%=preBoard.getFreeboard_id()%>)"><span class="lnr text-white lnr-arrow-left" style='font-size:36px'></span></a>
													</div>
													<div class="detials">
														<p>이전글</p>									
														<a href="" onClick="otherDetail(<%=preBoard.getFreeboard_id()%>)"><h4><%=preBoard.getTitle() %></h4></a>
													</div>
												</div> 
										<%}else{ %>
											<div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
												<div class="thumb">
													<a href="javascript:alert('비공개글 입니다.');" ><img class="img-fluid" src="/img/aroundog/dogleft.jpg" alt=""></a>
												</div>
												<div class="arrow">
													<a href="javascript:alert('비공개글 입니다.');" ><span class="lnr text-white lnr-arrow-left" style='font-size:36px'></span></a>
												</div>
												<div class="detials">
													<p>이전글</p>									
													<a href="javascript:alert('비공개글 입니다.');" ><h4><%=preBoard.getTitle() %></h4></a>
												</div>
											</div> 
										<%} %>
									<%}else{ %>
										<div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
											<div class="thumb">
												<a href="#" onClick="otherDetail(<%=preBoard.getFreeboard_id()%>)"><img class="img-fluid" src="/img/aroundog/dogleft.jpg" alt=""></a>
											</div>
											<div class="arrow">
												<a href="#" onClick="otherDetail(<%=preBoard.getFreeboard_id()%>)"><span class="lnr text-white lnr-arrow-left" style='font-size:36px'></span></a>
											</div>
											<div class="detials">
												<p>이전글</p>									
												<a href="" onClick="otherDetail(<%=preBoard.getFreeboard_id()%>)"><h4><%=preBoard.getTitle() %></h4></a>
											</div>
										</div> 
									<%} %>
									
									
									
									<%if(nextBoard.getSecret().equals("true")){ %>
										<%if(nextBoard.getMember().getMember_id()==member.getMember_id() || member.getId().equals("admin")){ %>
												<div class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
													<div class="detials">
														<p>다음글</p>									
														<a href="#" onClick="otherDetail(<%=nextBoard.getFreeboard_id()%>)"><h4><%=nextBoard.getTitle() %></h4></a>
													</div>
													<div class="arrow">
														<a href="#" onClick="otherDetail(<%=nextBoard.getFreeboard_id()%>)"><span class="lnr text-white lnr-arrow-right" style='font-size:36px'></span></a>
													</div>
													<div class="thumb">
														<a href="#" onClick="otherDetail(<%=nextBoard.getFreeboard_id()%>)"><img class="img-fluid" src="/img/aroundog/dogright.jpg" alt=""></a>
													</div>										
												</div>
										<%}else{ %>
											<div class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
												<div class="detials">
													<p>다음글</p>									
													<a href="javascript:alert('비공개글 입니다.');" ><h4><%=nextBoard.getTitle() %></h4></a>
												</div>
												<div class="arrow">
													<a href="javascript:alert('비공개글 입니다.');" ><span class="lnr text-white lnr-arrow-right" style='font-size:36px'></span></a>
												</div>
												<div class="thumb">
													<a href="javascript:alert('비공개글 입니다.');" ><img class="img-fluid" src="/img/aroundog/dogright.jpg" alt=""></a>
												</div>										
											</div>
										<%} %>
									<%}else{ %>
										<div class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
											<div class="detials">
												<p>다음글</p>									
												<a href="#" onClick="otherDetail(<%=nextBoard.getFreeboard_id()%>)"><h4><%=nextBoard.getTitle() %></h4></a>
											</div>
											<div class="arrow">
												<a href="#" onClick="otherDetail(<%=nextBoard.getFreeboard_id()%>)"><span class="lnr text-white lnr-arrow-right" style='font-size:36px'></span></a>
											</div>
											<div class="thumb">
												<a href="#" onClick="otherDetail(<%=nextBoard.getFreeboard_id()%>)"><img class="img-fluid" src="/img/aroundog/dogright.jpg" alt=""></a>
											</div>										
										</div>
									<%} %>
									
									
									
									
									
									
								<%} %>
                                
                                
<%--  	                        	<%if(member==null){ %>
                               		 
								<%}else{ %>  
									
								<%} %> --%>
								
							
                              
                                
							<%} %>
							
							
                        	<%if(i==freeboardList.size()-1){ %>   
                        		<%if(freeboardList.size()>1){ %>
                                <%FreeBoard preBoard=(FreeBoard)freeboardList.get(i-1); %>
									<%if(member==null){ %>
                               		<%if(preBoard.getSecret().equals("true")){ %>
										<div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
											<div class="thumb">
												<a href="javascript:alert('비공개글 입니다.');" ><img class="img-fluid" src="/img/aroundog/dogleft.jpg" alt=""></a>
											</div>
											<div class="arrow">
												<a href="javascript:alert('비공개글 입니다.');" ><span class="lnr text-white lnr-arrow-left" style='font-size:36px'></span></a>
											</div>
											<div class="detials">
												<p>이전글</p>									
												<a href="javascript:alert('비공개글 입니다.');" ><h4><%=preBoard.getTitle() %></h4></a>
											</div>
										</div> 
									<%}else{%>
										<div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
											<div class="thumb">
												<a href="#" onClick="otherDetail(<%=preBoard.getFreeboard_id()%>)"><img class="img-fluid" src="/img/aroundog/dogleft.jpg" alt=""></a>
											</div>
											<div class="arrow">
												<a href="#" onClick="otherDetail(<%=preBoard.getFreeboard_id()%>)"><span class="lnr text-white lnr-arrow-left" style='font-size:36px'></span></a>
											</div>
											<div class="detials">
												<p>이전글</p>									
												<a href="" onClick="otherDetail(<%=preBoard.getFreeboard_id()%>)"><h4><%=preBoard.getTitle() %></h4></a>
											</div>
										</div> 
									<%} %>  
								<%}else{ %>  
									<%if(preBoard.getSecret().equals("true")){ %>
										<%if(preBoard.getMember().getMember_id()==member.getMember_id() || member.getId().equals("admin")){ %>
												<div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
													<div class="thumb">
														<a href="#" onClick="otherDetail(<%=preBoard.getFreeboard_id()%>)"><img class="img-fluid" src="/img/aroundog/dogleft.jpg" alt=""></a>
													</div>
													<div class="arrow">
														<a href="#" onClick="otherDetail(<%=preBoard.getFreeboard_id()%>)"><span class="lnr text-white lnr-arrow-left" style='font-size:36px'></span></a>
													</div>
													<div class="detials">
														<p>이전글</p>									
														<a href="" onClick="otherDetail(<%=preBoard.getFreeboard_id()%>)"><h4><%=preBoard.getTitle() %></h4></a>
													</div>
												</div> 
										<%}else{ %>
											<div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
												<div class="thumb">
													<a href="javascript:alert('비공개글 입니다.');" ><img class="img-fluid" src="/img/aroundog/dogleft.jpg" alt=""></a>
												</div>
												<div class="arrow">
													<a href="javascript:alert('비공개글 입니다.');" ><span class="lnr text-white lnr-arrow-left" style='font-size:36px'></span></a>
												</div>
												<div class="detials">
													<p>이전글</p>									
													<a href="javascript:alert('비공개글 입니다.');" ><h4><%=preBoard.getTitle() %></h4></a>
												</div>
											</div> 
										<%} %>
									<%}else{ %>
										<div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
											<div class="thumb">
												<a href="#" onClick="otherDetail(<%=preBoard.getFreeboard_id()%>)"><img class="img-fluid" src="/img/aroundog/dogleft.jpg" alt=""></a>
											</div>
											<div class="arrow">
												<a href="#" onClick="otherDetail(<%=preBoard.getFreeboard_id()%>)"><span class="lnr text-white lnr-arrow-left" style='font-size:36px'></span></a>
											</div>
											<div class="detials">
												<p>이전글</p>									
												<a href="" onClick="otherDetail(<%=preBoard.getFreeboard_id()%>)"><h4><%=preBoard.getTitle() %></h4></a>
											</div>
										</div> 
									<%} %>
								<%} %>
                                
                            <%} %>
                            <%} %>
                            
                            
                            
						<%} %>
                   		<%} %>									
						</div>
					</div>
					
					<!--  댓글 관련 반복문 필요!!~!~!~!~!~!~!~minho -->
					<div class="comments-area">
					<!-- 여긴 프리커맨트 사이즈 넣어야함 -->
											
						<h4><%=cnt %> Comments</h4>
						
						<!--  for문 써서 댓글 여러개 쓰게끔 -->
						
							
	                    <!-- for문 끝 -->
	                    <%if(fcList!=null){ %>
	                    <%for(int i=0;i<fcList.size();i++){ %>
	                    <%FreeComment freeComment=(FreeComment)fcList.get(i); %>
	                    <%if(freeComment.getDepth()==1){ %>
						<div class="comment-list">
	                        <div class="single-comment justify-content-between d-flex" id="free-com">
	                            <div class="user justify-content-between d-flex">
	                                <div class="thumb">
	                                    <img src="/img/logo/6.png" alt="" id="img1">
	                                </div>
	                                <div class="desc">
	                                    <h5><a href="#"><%=freeComment.getMember().getName() %></a></h5>
	                                    <p class="date"><%=freeComment.getRegdate() %> </p>
	                                    <p class="comment">
	                                        	<%=freeComment.getContent() %>
	                                    </p>
	                                </div>
	                            </div>
	                            <form name="form-team">
	                            	<input type="hidden" name="freeboard_id" value="<%=freeboard.getFreeboard_id()%>">
		                            <div class="reply-btn">
	                                	<a class="btn-reply text-uppercase" onClick="viewArea(<%=i%>)">reply</a>
	                                </div>
	                                <div class="reply-btn">
	                                	<%if(member!=null){ %>
										<%if(member.getMember_id()==freeComment.getMember().getMember_id()){ %>
											<%-- <input type="hidden" name="freeboard_id" value="<%=freeboard.getFreeboard_id()%>"> --%>
											<%-- <input type="hidden" name="team" value="<%=freeComment.getTeam()%>"> --%>
	                                		<a class="btn-reply text-uppercase" onClick="commentDelByTeam(<%=freeComment.getTeam()%>)"> d e l</a>									
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
									<input type="hidden" name="freeboard_id" value="<%=freeboard.getFreeboard_id()%>"/>
									<input type="hidden" name="depth" value="2"/>
									<input type="hidden" name="team" value="<%=freeComment.getTeam()%>"/>
									<div class="form-group">
										<textarea class="form-control mb-10" rows="5" name="content" placeholder="Messege" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Messege'" required=""></textarea>
									</div>
									<a class="primary-btn text-uppercase" onClick="addComment(<%=i%>)">Post Reply</a>	
								</form>
							</div>
	                        
                        
                        	
	                    </div>	
	                    <%} %>
	                    <!-- 댓글의 댓글 시작 -->
	                    <%if(freeComment.getDepth()==2){ %>
							<div class="comment-list left-padding">
								<div class="single-comment justify-content-between d-flex">
								    <div class="user justify-content-between d-flex">
								        <div class="thumb">
								        	<i class="fa fa-reply fa-rotate-180" style="font-size:24px"></i>
								            <img src="/img/logo/5.png" alt="" id="img2">
								        </div>
								        <div class="desc">
								            <h5><a href="#"><%=freeComment.getMember().getName() %></a></h5>
								            <p class="date"><%=freeComment.getRegdate() %> </p>
								            <p class="comment">
								                		<%=freeComment.getContent() %>
								                </p>
							            </div>
							        </div>
							        <%if(member!=null){ %>
									<%if(member.getMember_id()==freeComment.getMember().getMember_id()){ %> 
										<form name="form-commentId">                            
										<input type="hidden" name="freeboard_id" value="<%=freeboard.getFreeboard_id()%>">							     	
									    <div class="reply-btn">	

	                                		<a class="btn-reply text-uppercase" onClick="commentDelBycommentId(<%=freeComment.getFreeComment_id()%>)">d e l</a>
		                                </div>
		                                </form>
	                                 <%} %>
	                                 <%} %>
							    </div>
							</div>                              
                        <%} %>   
							
							
						<%}%>
	                    <%}%>                                             				
					</div>
					<!-- 댓글 달기 폼 -->
						<div class="comment-form">
							<h4>Leave a Comment</h4>
							<form name="form-main">
								<%if(member!=null){ %>
								<input type="hidden" name="member_id" value="<%=member.getMember_id() %>"/>
								<%} %>
								<input type="hidden" name="freeboard_id" value="<%=freeboard.getFreeboard_id()%>"/>
								<input type="hidden" name="depth" value="1"/>
								<div class="form-group">
									<textarea class="form-control mb-10" rows="5" name="content" placeholder="Messege" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Messege'" required=""></textarea>
								</div>
								<a class="primary-btn text-uppercase" onClick="insertComment()">Post Comment</a>	
							</form>
						</div>
						<form name="form-edit">
							<div>
								<input type="button" class="primary-btn float-right" value="목록으로" onClick="goList()"></button>
							<%if(member!=null){ %>
							<%if(member.getMember_id()==freeboard.getMember().getMember_id()){ %>
								<input type="button" class="primary-btn float-right mr-5" value="삭제" onClick="boardDel(<%=freeboard.getFreeboard_id()%>)"></button>	
								<input type="button" class="primary-btn float-right mr-5" value="수정" onClick="boardEdit(<%=freeboard.getFreeboard_id()%>)"></button>
							<%} %>
							<%} %>
							</div>
							
						</form>
				</div>
				
				
				
				
			</div>
		</div>	
	</section>
	<!-- 끝 컨텐트 -->
	

	<!-- start footer Area -->		
	<%@include file="/WEB-INF/user/inc/footer.jsp" %>
	<!-- End footer Area -->	

<script src="/js/vendor/jquery-2.2.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="/js/vendor/bootstrap.min.js"></script>			
<!-- <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script> -->
<script src="/js/easing.min.js"></script>			
<script src="/js/hoverIntent.js"></script>
<script src="/js/superfish.min.js"></script>	
<script src="/js/jquery.ajaxchimp.min.js"></script>
<script src="/js/jquery.magnific-popup.min.js"></script>	
<script src="/js/owl.carousel.min.js"></script>						
<script src="/js/jquery.nice-select.min.js"></script>							
<script src="/js/mail-script.js"></script>	
<script src="/js/main.js"></script>	
</body>
</html>



