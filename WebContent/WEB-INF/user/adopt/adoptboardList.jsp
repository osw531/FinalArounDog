<%@page import="com.aroundog.commons.AdoptBoardPager"%>
<%@page import="com.aroundog.commons.Pager"%>
<%@page import="com.aroundog.model.domain.Adoptboard"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<Adoptboard> adoptboardList= (List)request.getAttribute("adoptboardList");
	AdoptBoardPager pager=(AdoptBoardPager)request.getAttribute("pager");
%>
	<!DOCTYPE html>
	<html lang="zxx" class="no-js">
	<head>
		<!-- Mobile Specific Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Favicon-->
		<link rel="shortcut icon" href="/img/fav.png">
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
			<!--
			CSS
			============================================= -->
			<link rel="stylesheet" href="/css/linearicons.css">
			<link rel="stylesheet" href="/css/font-awesome.min.css">
			<link rel="stylesheet" href="/css/bootstrap2.css">
			<link rel="stylesheet" href="/css/magnific-popup.css">
			<link rel="stylesheet" href="/css/nice-select.css">							
			<link rel="stylesheet" href="/css/animate.min.css">
			<link rel="stylesheet" href="/css/owl.carousel.css">
			<link rel="stylesheet" href="/css/adopt.css">
			<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' 
			integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
			
<!-- 자바스크립트 부분 -->
<style>
.banner-area-min {
  background: url(/img/aroundog/17.jpg) center;
  background-size: cover;
}

.banner-area-min .primary-btn {
  padding-left: 30px;
  padding-right: 30px;
}

.banner-area-min .overlay-bg {
  background-color: rgba(0, 0, 0, 0.4);
}
.text-table{
	margin-top:100px;
}
.icon{
	width:15%;
	display:inline-block;
}
.ffont{
	display:inline-block;
}
.ffont0{
	display:inline-block;
	color:blue;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
function goDetail(adoptboard_id){
	location.href="/user/adopt/adoptboardDetail?adoptboard_id="+adoptboard_id;
} 
</script>
			
		</head>
		<body>
			<%@include file="/WEB-INF/user/inc/header.jsp" %>

			<!-- start banner Area -->
			<section class="banner-area-min relative" id="home">	
				<div class="overlay overlay-bg"></div>
				<div class="container">				
					<div class="row d-flex align-items-center justify-content-center">
						<div class="about-content col-lg-12">
							<h1 class="text-white">
								사랑스러운 아이들이 보호자님을 기다리고 있어요			
							</h1>	
							
						</div>	
					</div>
				</div>
			</section>
			<!-- End banner Area -->	
			
			<div class="text-table "><div><p style="text-align: center;"><strong><span style="color: rgb(64, 64, 64); font-size: 30px;">Aroundog 보호동물</span></strong></p></div></div>	
			<div class="line_box holder" style="width:40%; text-align:center; margin-left:30%">
				<hr style="border-top-width:3px; border-color:#000000;" />	</div>


			
				
			<!-- Start cat-list Area -->
			<section class="cat-list-area section-gap">
				<div class="container">
					<div class="row">
					<%int cnt=0; %>
                  <%int num=pager.getNum(); %>
                  <%int curPos=pager.getCurPos(); %>
                  <%for(int i=0;i<pager.getPageSize();i++){ %>
                  <%if(num<1)break; %>
                  <%Adoptboard board=adoptboardList.get(curPos++); %>
                  <%num--; %>

	
						<div class="col-lg-3 col-md-6">
							<div class="single-cat-list"  onClick='goDetail(<%=board.getAdoptboard_id() %>)'>
							  <img src="/data/dogs/<%=board.getAdoptdog().getImg() %>" alt="" class="img-fluid">
							  <div class="overlay">
							    <div class="text"><%=board.getAdoptdog().getType().getInfo() %></div>
							  </div>
							</div>
								<div>
									<div class="icon"><i class='fas fa-home' style='font-size:24px; margin-right:20px;'></i></div>
									<div class="ffont0">[센터보호]</div>
								</div>
								<div>
									<div class="icon"><i class='fas fa-dog' style='font-size:24px; margin-right:20px;'></i></div>
									<div class="ffont"><%=board.getAdoptdog().getAge()%>살</div>
								</div>	
								<div>
									<div class="icon"><i class='fas fa-transgender' style='font-size:24px; margin-right:20px;'></i></div>
									<div class="ffont"><%=board.getAdoptdog().getGender()%></div>
								</div>	
								<div>
									<div class="icon"><i class='far fa-calendar-alt' style='font-size:24px; margin-right:20px;'></i></div>
									<div class="ffont"><%=board.getRegdate().substring(0,10)%></div>
								</div>		
						</div>
					<%} %>
					</div>
				</div>	
			</section>
			<!-- End cat-list Area -->
					<!-- start 페이져 Area -->
                  <nav class="blog-pagination justify-content-center d-flex">
                           <ul class="pagination">
                               <li class="page-item">
                                  <%if(pager.getFirstPage()-1>0){ %>
                                      <a href="/user/adopt/adoptboardList?currentPage=<%=pager.getFirstPage()-1%>" class="page-link" aria-label="Previous">
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
                               <li class="page-item"><a href="/user/adopt/adoptboardList?currentPage=<%=i %>" class="page-link"><%=i %></a></li>                               
                               <%} %>
                               
                               <li class="page-item">
                                  <%if(pager.getLastPage()+1<pager.getTotalPage()){ %>
                                      <a href="/user/adopt/adoptboardList?currentPage=<%=pager.getLastPage()+1%>" class="page-link" aria-label="Next">
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
         <!-- End 페이져 Area -->

														
				
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