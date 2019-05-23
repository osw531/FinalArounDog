<%@page import="com.aroundog.model.domain.FreeComment"%>
<%@page import="com.aroundog.commons.Pager"%>
<%@page import="com.aroundog.model.domain.FreeBoard"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<FreeBoard> freeBoardList=(List)request.getAttribute("freeBoardList");
	List<FreeComment> fcList=(List)request.getAttribute("fcList");
	Pager pager=(Pager)request.getAttribute("pager");	
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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<!--
	CSS
	============================================= -->
	<link rel="stylesheet" href="/css/linearicons.css">
	<link rel="stylesheet" href="/css/font-awesome.min.css">
	<link rel="stylesheet" href="/css/bootstrap.css">
	<link rel="stylesheet" href="/css/magnific-popup.css">
	<link rel="stylesheet" href="/css/nice-select.css">							
	<link rel="stylesheet" href="/css/animate.min.css">
	<link rel="stylesheet" href="/css/owl.carousel.css">
	<link rel="stylesheet" href="/css/freeboard.css">
	
<style>
#lockIcon{
	margin-left:6px;
}
#category-name{
	display:inline;
	color:#d94013;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<script>

function wordsearch(){

	
	if($("input[type='text']").val()==""){
		alert("검색어를 입력하세요!");
		return;
	}
	
	if($("select[name='category']").val()=="title"){
		$("form[name='form-search']").attr({
			action:"/user/freeboard/searchTitle",
			method:"GET"
		});
		$("form[name='form-search']").submit();
	}else{
		$("form[name='form-search']").attr({
			action:"/user/freeboard/searchWriter",
			method:"GET"
		});
		$("form[name='form-search']").submit();
	}
}
</script>
<body>
<%@include file="/WEB-INF/user/inc/header.jsp" %>
	  
	<!-- start banner Area -->
	<section class="banner-area relative" id="home">	
		<div class="overlay overlay-bg"></div>
		<div class="container">				
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">
						Bulletin Board	
					</h1>	
					<p class="text-white link-nav">유저들과 의사소통할 수 있는 공간입니다.</p>
				</div>	
			</div>
		</div>
	</section>
	<!-- End banner Area -->	

	

	<!-- Start Align Area -->
	<!-- 제일 상단 이미지 -->

	<div class="whole-wrap">
		<div class="container">
		
			<!-- 실제 테이블 -->
			<div class="section-top-border">
					<!-- 검색 바 -->
				<div class="widget-wrap">		
					<div class="single-sidebar-widget search-widget">
						<!-- 셀렉 -->
						
											
						<form class="search-form" name="form-search">
							<div class="default-select" id="default-select"">
								<select name="category">
									<option value="title">제목</option>
									<option value="writer">작성자</option>
								</select>
		                    <input placeholder="검색어 입력" name="searchword" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search Posts'" >
		                    <button  type="button" onClick="wordsearch()"><i class="fa fa-search"></i></button>
							</div>
		                </form>
					</div>
				</div>
				
				<div class="progress-table-wrap">
					<div class="progress-table">
						<div class="table-head">
							<div class="freeboard_id">#</div>
							<div class="writer">작성자</div>
							<div class="title">제목</div>
							<div class="regdate">글등록일</div>
							<div class="hit">조회수</div>
						</div>
						<form name="form-member">
						<%int cnt=0; %>
						<%int num=pager.getNum(); %>
						<%int curPos=pager.getCurPos(); %>
						<%for(int i=0;i<pager.getPageSize();i++){ %>
						<%if(num<1)break; %>
						<%FreeBoard freeBoard=freeBoardList.get(curPos++); %>
						<div class="table-row">
							<input type="hidden" name="member_id" value="<%=freeBoard.getMember().getMember_id()%>">
							<div class="freeboard_id"><%=num-- %></div>
							<div class="writer"><%=freeBoard.getMember().getName()%></div>
							<%if(member==null){ %>
								<%if(freeBoard.getSecret().equals("true")){ %>
									<div class="title" ><div id="category-name">[<%=freeBoard.getCategory() %>]</div>  
									<a href="javascript:alert('비공개글 입니다.');" id="aTag"><%=freeBoard.getTitle() %></a>
								<%}else{ %>
									<div class="title" ><div id="category-name">[<%=freeBoard.getCategory() %>]</div>  <a href="/user/freeboard/detail/<%=freeBoard.getFreeboard_id() %>" id="aTag"><%=freeBoard.getTitle() %></a>							
								<%} %>
							<%}else{ %>
								<%if(freeBoard.getSecret().equals("true")){ %>
									<%if(freeBoard.getMember().getMember_id()==member.getMember_id() || member.getId().equals("admin")){ %>
										<div class="title" ><div id="category-name">[<%=freeBoard.getCategory() %>]</div>  
										<a href="/user/freeboard/detail/<%=freeBoard.getFreeboard_id() %>" id="aTag"><%=freeBoard.getTitle() %></a>
									<%}else{ %>
										<div class="title" ><div id="category-name">[<%=freeBoard.getCategory() %>]</div>  
										<a href="javascript:alert('비공개글 입니다.');" id="aTag"><%=freeBoard.getTitle() %></a>
									<%} %>
	 							<%}else{ %>
									<div class="title" ><div id="category-name">[<%=freeBoard.getCategory() %>]</div>  <a href="/user/freeboard/detail/<%=freeBoard.getFreeboard_id() %>" id="aTag"><%=freeBoard.getTitle() %></a>				 
								<%} %>
 							<%} %>
							<%for(int j=0;j<fcList.size();j++){ %>
							<%FreeComment freeComment=fcList.get(j); %>
							<%if(freeComment.getFreeboard_id()==freeBoard.getFreeboard_id() && freeComment.getDepth()==1){ 
									cnt++;
							  } %>
							<%} %>
							<%if(cnt !=0) {%>
									( <%=cnt %> )
									<%cnt=0; %>
							<%}else{ %>
							<%} %>
							<%if(freeBoard.getSecret().equals("true")) {%>
							<i class="material-icons" style="font-size:14px" id="lockIcon">lock_outline</i>							
							<%} %>						
							</div>
							</form>
							<div class="regdate"><%=freeBoard.getRegdate() %></div>
							<div class="hit"><%=freeBoard.getHit() %></div>
						</div>
						<%} %>
						
						<!-- 글 등록 버튼 -->
						<div class="table-row">
						</div>
						<!-- 페이져 -->
						<nav class="blog-pagination justify-content-center d-flex">
	                        <ul class="pagination">
	                            <li class="page-item">
	                            	<%if(pager.getFirstPage()-1>0){ %>
		                                <a href="/user/freeboards?currentPage=<%=pager.getFirstPage()-1%>" class="page-link" aria-label="Previous">
		                                    <span aria-hidden="true">
		                                        <span class="lnr lnr-chevron-left"></span>
		                                    </span>
		                                </a>
	                                <%}else{ %>
		                                <a href="javascript:alert('첫 페이지입니다')" class="page-link" aria-label="Previous">
		                                    <span aria-hidden="true">
		                                        <span class="lnr lnr-chevron-left"></span>
		                                    </span>
		                                </a>
	                                <%} %>
	                            </li>
	                            
	                            <%for(int i=pager.getFirstPage();i<pager.getLastPage();i++){%>
								<%if(i>pager.getTotalPage())break; %>
	                            <li class="page-item"><a href="/user/freeboards?currentPage=<%=i %>" class="page-link"><%=i %></a></li>	                            
	                            <%} %>
	                            
	                            <li class="page-item">
	                            	<%if(pager.getLastPage()+1<pager.getTotalPage()){ %>
		                                <a href="/user/freeboards?currentPage=<%=pager.getLastPage()+1%>" class="page-link" aria-label="Next">
		                                    <span aria-hidden="true">
		                                        <span class="lnr lnr-chevron-right"></span>
		                                    </span>
		                                </a>
	                                <%}else{ %>
		                                <a href="javascript:alert('마지막 페이지입니다')" class="page-link" aria-label="Next">
		                                    <span aria-hidden="true">
		                                        <span class="lnr lnr-chevron-right"></span>
		                                    </span>
		                                </a>
	                                <%} %>
	                            </li>
	                        </ul>
	                    </nav>
						
						

						
						
						
						
						<div class="button-group-area mr-50" align="right">
	
					
							<a href="/freeboard/insert" class="genric-btn success-border circle arrow">글 등록<span class="lnr lnr-arrow-right"></span></a>	
		
						</div>
					</div>			
				</div>			
			</div>
		
		
			<div class="section-top-border">
				<div class="row gallery-item">
					<div class="col-md-4">
						<a href="/img/aroundog/9.jpg" class="img-pop-up"><div class="single-gallery-image" style="background: url(/img/aroundog/9.jpg);"></div></a>
					</div>
					<div class="col-md-4">
						<a href="/img/aroundog/10.jpg" class="img-pop-up"><div class="single-gallery-image" style="background: url(/img/aroundog/10.jpg);"></div></a>
					</div>
					<div class="col-md-4">
						<a href="/img/aroundog/11.jpg" class="img-pop-up"><div class="single-gallery-image" style="background: url(/img/aroundog/11.jpg);"></div></a>
					</div>
					<div class="col-md-6">
						<a href="/img/aroundog/12.jpg" class="img-pop-up"><div class="single-gallery-image" style="background: url(/img/aroundog/12.jpg);"></div></a>
					</div>
					<div class="col-md-6">
						<a href="/img/aroundog/13.jpg" class="img-pop-up"><div class="single-gallery-image" style="background: url(/img/aroundog/13.jpg);"></div></a>
					</div>
					<div class="col-md-4">
						<a href="/img/aroundog/bot6.jpg" class="img-pop-up"><div class="single-gallery-image" style="background: url(/img/aroundog/bot6.jpg);"></div></a>
					</div>
					<div class="col-md-4">
						<a href="/img/aroundog/bot4.jpg" class="img-pop-up"><div class="single-gallery-image" style="background: url(/img/aroundog/bot4.jpg);"></div></a>
					</div>
					<div class="col-md-4">
						<a href="/img/aroundog/bot5.jpg" class="img-pop-up"><div class="single-gallery-image" style="background: url(/img/aroundog/bot5.jpg);"></div></a>
					</div>
				</div>
			</div>		
			
		</div>

	<!-- End Align Area -->

<!-- 여기가 제일 밑에 검은 about나오는 곳 -->
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