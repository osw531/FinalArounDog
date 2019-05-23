<%@page import="java.util.List"%>
<%@page import="com.aroundog.model.domain.Adoptdog"%>
<%@page import="com.aroundog.model.domain.Adoptboard"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   Adoptboard board=(Adoptboard)request.getAttribute("adoptboard");
   Adoptdog dog=board.getAdoptdog();
   //이전글, 다음글...
   List<Adoptboard> boardList=(List)request.getAttribute("adoptboardList");

   int neutCode= dog.getNeut_id();
   int vaccinCode= dog.getVaccin_id();
   String neut=null;
   String vaccin=null;
   
   if(neutCode==1){
      neut="완료";
   }else{
      neut="미완료";
   }
   if(vaccinCode==1){
      vaccin="완료";
   }else{
      vaccin="미완료";
   }
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
			
			<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<style >
#mainImg{
	width:600px;
	height:375px;
	box-shadow: -9px 9px #17a2b8;
}
#wrapper{
	text-align:center;
}
.min{
	padding:50px 0px;
}
#navi-min{
	width:100%;
}
#rowrow{
	width:100%;
}
.navigation-area-min{
	margin:auto;
	text-align:center;
	padding:
}

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

</style>
<!-- 자바스크립트 부분 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
function goRegist(adoptboard_id){
	location.href="/user/adopt/page/"+adoptboard_id;
} 
function goDelete(adoptboard_id){
	location.href="/admin/adopt/delete?adoptboard_id="+adoptboard_id;
} 

</script>
			
</head>
<body class="blog-page">	
	<%@include file="/WEB-INF/user/inc/header.jsp" %>

	<!-- start banner Area -->
	<section class="banner-area-min relative" id="home">	
		<div class="overlay overlay-bg"></div>
		<div class="container">				
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">
					상세페이지			
					</h1>	
					
				</div>	
			</div>
		</div>
	</section>
	<!-- End banner Area -->					  
			
			<!-- start post-edit Area -->
<section class="post-content-area single-post-area" id="wrapper">
	<div class="container" id="wrapper">
		<div class="row" id="rowrow">
			<div class="col-lg-12 posts-list">
				<div class="row align-items-center" id="min-row">
					<div class="col-lg-6 home-about-left no-padding">
						<img src="/data/dogs/<%=dog.getImg()%>" alt=""  id="mainImg">
					</div>


					<div class="col-lg-6 home-about-right no-padding">
						<h1><%=dog.getType().getInfo() %></h1>
						<h5><%=board.getTitle() %></h5>
					
						<div class="single-post row">
							<div class="col-lg-12  col-md-3 meta-details">
								<div class="user-details row">
									<p class="user-name col-lg-12 col-md-12 col-6"><a ><%=dog.getGender() %> </a> <span class="fas fa-venus-double"></span></p>
									<p class="comments col-lg-12 col-md-12 col-6"><a ><%=dog.getAge() %> 세</a> <span class="fas fa-baby"></span></p>						
									<p class="date col-lg-12 col-md-12 col-6"><a ><%=board.getRegdate() %></a> <span class="far fa-calendar-alt"></span></p>
									<p class="view col-lg-12 col-md-12 col-6"><a >중성화 <%=neut %></a> <span class="fas fa-ban"></span></p>
									<p class="view col-lg-12 col-md-12 col-6"><a >접종 <%=vaccin %></a> <span class="fas fa-crutch"></span></p>
								</div>
							</div>
						</div>
						<%if(member!=null) {%>
							<input type="button" class="primary-btn text-uppercase col-lg-12" value="입양 신청" onClick='goRegist(<%=board.getAdoptboard_id()%>)'> 
						<%} %>
					</div>
				</div>
			</div>
		</div>
	</div>	
			
	

	<div class="container" id="wrapper">
		<div class="row" id="rowrow">
			
				<div class="navigation-area-min">
					<div>
						<div class="col-lg-12 posts-list" id="min">
							<div class="navigation-area"  >
							</div>
						</div>
						<%=board.getContent()%>
					</div>
				</div>					
			
		</div>
		</div>
			
					
</section>
			
			<!-- end post-edit Area -->
			
<!-- ---------------------------------------------------------------------------------------------------------------------------------- -->			
			
			
			
			
			<!-- start post-content Area -->
         <section class="post-content-area single-post-area">
            <div class="container">
               <div class="row">
                     
                     <div class="col-lg-12 posts-list">
                     <div class="navigation-area">
                        <div class="row">
                     <%for(int i=0;i<boardList.size();i++){ %>
                     <% Adoptboard currBoard=boardList.get(i);%>
                     <%if(currBoard.getAdoptboard_id()==board.getAdoptboard_id()){ %>
                        <%if(i==0){ %>
                 		<%if(boardList.size()>1){ %>
                        <%Adoptboard nextBoard=boardList.get(i+1); %>
                           <div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
                                    <div class="thumb">
                                    </div>
                                    <div class="arrow">
                                    </div>
                                    <div class="detials">
                                    </div>
                              </div>
                           <div class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
                              <div class="detials">
                                 <p>다음글</p>
                                    <a href="/user/adopt/adoptboardDetail?adoptboard_id=<%=nextBoard.getAdoptboard_id() %>"><h4><%=nextBoard.getAdoptdog().getType().getInfo() %></h4></a>
                                       
                              </div>
                              <div class="arrow">
                                    <a href="/user/adopt/adoptboardDetail?adoptboard_id=<%=nextBoard.getAdoptboard_id() %>"><span class="lnr text-white lnr-arrow-right"></span></a>
                              </div>
                              <div class="thumb">
                                 <a href="/user/adopt/adoptboardDetail?adoptboard_id=<%=nextBoard.getAdoptboard_id() %>"><img class="img-fluid" src="/data/dogs/<%=nextBoard.getAdoptdog().getImg()%>" alt="" style='width:60px; height:60px'></a>
                              </div>   
                        <%} %> 
                        <%} %> 
                        
                                
                        <%if(i>0 && i<boardList.size()-1){ %>
                              <%Adoptboard preBoard=boardList.get(i-1); %>
                              <%Adoptboard nextBoard=boardList.get(i+1); %>
                              <div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
                                    <div class="thumb">
                                       <a href="/user/adopt/adoptboardDetail?adoptboard_id=<%=preBoard.getAdoptboard_id() %>"><img class="img-fluid" src="/data/dogs/<%=preBoard.getAdoptdog().getImg()%>" alt="" style='width:60px; height:60px'></a>
                                    </div>
                                    <div class="arrow">
                                       <a href="/user/adopt/adoptboardDetail?adoptboard_id=<%=preBoard.getAdoptboard_id() %>"><span class="lnr text-white lnr-arrow-left"></span></a>
                                    </div>
                                    <div class="detials">
                                       <p>이전 글</p>
                                       <a href="/user/adopt/adoptboardDetail?adoptboard_id=<%=preBoard.getAdoptboard_id() %>"><h4><%=preBoard.getAdoptdog().getType().getInfo() %></h4></a>
                                    </div>
                              </div>
                              <div class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
                              <div class="detials">
                                 <p>다음글</p>
                                 <a href="/user/adopt/adoptboardDetail?adoptboard_id=<%=nextBoard.getAdoptboard_id() %>"><h4><%=nextBoard.getAdoptdog().getType().getInfo() %></h4></a>
                                       
                              </div>
                              <div class="arrow">
                                 <a href="/user/adopt/adoptboardDetail?adoptboard_id=<%=nextBoard.getAdoptboard_id() %>"><span class="lnr text-white lnr-arrow-right"></span></a>
                              </div>
                              <div class="thumb">
                                 <a href="/user/adopt/adoptboardDetail?adoptboard_id=<%=nextBoard.getAdoptboard_id() %>"><img class="img-fluid" src="/data/dogs/<%=nextBoard.getAdoptdog().getImg()%>" alt="" style='width:60px; height:60px'></a>
                              </div>   
                              
                        <%} %>
                        <%if(i==boardList.size()-1){ %>
                        		<%if(boardList.size()>1){%>
                              <%Adoptboard preBoard=boardList.get(i-1); %>
                              <div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
                                    <div class="thumb">
                                       <a href="/user/adopt/adoptboardDetail?adoptboard_id=<%=preBoard.getAdoptboard_id() %>"><img class="img-fluid" src="/data/dogs/<%=preBoard.getAdoptdog().getImg()%>" alt="" style='width:60px; height:60px'></a>
                                    </div>
                                    <div class="arrow">
                                       <a href="/user/adopt/adoptboardDetail?adoptboard_id=<%=preBoard.getAdoptboard_id() %>"><span class="lnr text-white lnr-arrow-left"></span></a>
                                    </div>
                                    <div class="detials">
                                       <p>이전 글</p>
                                       <a href="/user/adopt/adoptboardDetail?adoptboard_id=<%=preBoard.getAdoptboard_id() %>"><h4><%=preBoard.getAdoptdog().getType().getInfo() %></h4></a>
                                    </div>
                              </div>
                              <%} %>
                        <%} %>
                     <%} %>
                     <%} %>
                              
                           </div>                           
                        </div>
                     </div>
               </div>
            </div>   
         </section>
			<!-- End post-content Area -->
			

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



