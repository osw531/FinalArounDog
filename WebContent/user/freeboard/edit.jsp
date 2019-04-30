<%@page import="com.aroundog.model.domain.FreeBoard"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	FreeBoard freeboard=(FreeBoard)request.getAttribute("freeboard");
	out.print(freeboard.getCategory());
%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="img/fav.png">
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
	<link rel="stylesheet" href="/user/css/linearicons.css">
	<link rel="stylesheet" href="/user/css/font-awesome.min.css">
	<link rel="stylesheet" href="/user/css/free_bootstrap.css">
	<link rel="stylesheet" href="/user/css/magnific-popup.css">
	<link rel="stylesheet" href="/user/css/nice-select.css">							
	<link rel="stylesheet" href="/user/css/animate.min.css">
	<link rel="stylesheet" href="/user/css/owl.carousel.css">
	<link rel="stylesheet" href="/user/css/freeboard.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
	$($("input[type='button']")[1]).click(function(){
		edit();
	});
	$($("input[type='button']")[0]).click(function(){
		location.href="/user/freeboard/detail/<%=freeboard.getFreeboard_id()%>";
	});
});

function edit(){
	if(!confirm("게시물을 수정하시겠습니까?")){
		return;
	}
	setCheck();
	$("form").attr({
		action:"/user/freeboard/edit",
		method:"POST"
	});
	$("form").submit();
}


function setCheck(){
	if($("input[type='checkbox']").is(':checked')){
		$("input[name='secret']").val("true");
	}else if(!$("input[type='checkbox']").is(':checked')){
		$("input[name='secret']").val("false");
	}
}
</script>
</head>
<body>
<%@include file="/user/inc/header.jsp" %>

	<!-- start banner Area -->
	<section class="banner-area relative" id="home">	
		<div class="overlay overlay-bg"></div>
		<div class="container">				
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
				
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
						<h1 class="mb-20">자유게시판 수정하기</h1>
						<p>깨끗한 인터넷 문화를 위하여 에티켓을 지키며 이쁜말 고운말을 씁시다!!</p>
					</div>
				</div>
			</div>						
			<div class="row justify-content-center">
				<form class="col-lg-9">
					<input type="hidden" name ="freeboard_id" value="<%=freeboard.getFreeboard_id() %>">
					<input type="hidden" name ="member_id" value="<%=freeboard.getMember().getMember_id() %>">
					<div class="form-group">
						<div class="form-row">
					  	<div class="col-6 mb-0-i">
					  		<label for="City">카테고리</label>
					   		<div class="select-option" id="service-select"">
								<select name="category">
									<%if(freeboard.getCategory().equals("일반")){ %>		
										<option value="일반" selected>일반</option>
										<option value="입양질문">입양질문</option>
										<option value="제보">제보</option>									
									<%} %>			
									<%if(freeboard.getCategory().equals("입양질문")){ %>		
										<option value="일반">일반</option>
										<option value="입양질문" selected>입양질문</option>
										<option value="제보">제보</option>									
									<%} %>			
									<%if(freeboard.getCategory().equals("제보")){ %>		
										<option value="일반">일반</option>
										<option value="입양질문">입양질문</option>
										<option value="제보" selected>제보</option>									
									<%} %>			
								</select>
							</div>	
					  	</div>
				  	</div>
					</div>
				  <div class="form-group">
				    <label for="first-name">제목</label>
				    <input type="text" class="form-control" placeholder="제목 입력" name="title" value="<%=freeboard.getTitle()%>">
				  </div>
				  						  
				  <div class="form-group">
				    <label for="Address">내용</label>
				    <input type="textarea" class="form-control mb-20"  style=height:300px name="content" value="<%=freeboard.getContent()%>">
				    
				  </div>						  

				  <fieldset class="form-group">
					<label for="day">비공개 글을 원하시면 체크해 주세요</label>
                          <div class="form-group ">
                              <div class="form-check form-check-inline">
                                  <label class="form-check-label">
                                  	  <%if(freeboard.getSecret().equals("true")){ %>
                                      	<input class="form-check-input" type="checkbox" id="inlineRadio1" checked="on"> 비공개
                                  	  <%}else{ %>
                                      	<input class="form-check-input" type="checkbox" id="inlineRadio1"> 비공개
                                  	  <%} %>
                                      <input class="form-check-input" type="hidden" name="secret" id="inlineRadio1">
                                  </label>
                              </div>                                                   
                          </div>
				  </fieldset>
				  <div class="table-row">
				  </div>				  						  
				  <input type="button" class="primary-btn float-right" value="취소"></button>
				  <input type="button" class="primary-btn float-right mr-5" value="수정"></button>		  
				</form>
			</div>
		</div>	
	</section>
	<!-- End Volunteer-form Area -->
																					
	<!-- start footer Area -->		
	<footer class="footer-area">
		<div class="container">
			<div class="row pt-120 pb-80">
				<div class="col-lg-4 col-md-6">
					<div class="single-footer-widget">
						<h6>About Us</h6>
						<p>
							Few would argue that, despite the advanc ements off eminism over the past three decades, women still face a double standard when it comes to their behavior. While men’s borderline-inappropriate behavior. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						</p>
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
									<p>
										4343 Hinkle Deegan Lake Road
									</p>
								</div>	
							</li>
							<li class="flex-row d-flex">
								<div class="icon">
									<span class="lnr lnr-phone-handset"></span>
								</div>
								<div class="detail">
									<h4>00 (953) 9865 562</h4>
									<p>
										Mon to Fri 9am to 6 pm
									</p>
								</div>	
							</li>
							<li class="flex-row d-flex">
								<div class="icon">
									<span class="lnr lnr-envelope"></span>
								</div>
								<div class="detail">
									<h4>support@colorlib.com</h4>
									<p>
										Send us your query anytime!
									</p>
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
					<p class="col-lg-8 col-sm-6 footer-text m-0 text-white"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
					<div class="col-lg-4 col-sm-6 footer-social">
						<a href="#"><i class="fa fa-facebook"></i></a>
						<a href="#"><i class="fa fa-twitter"></i></a>
						<a href="#"><i class="fa fa-dribbble"></i></a>
						<a href="#"><i class="fa fa-behance"></i></a>
					</div>
				</div>						
			</div>
		</div>
	</footer>
	<!-- End footer Area -->	

<script src="/user/js/vendor/jquery-2.2.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="/user/js/vendor/bootstrap.min.js"></script>			
<!-- 	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script> -->
<script src="/user/js/easing.min.js"></script>			
<script src="/user/js/hoverIntent.js"></script>
<script src="/user/js/superfish.min.js"></script>	
<script src="/user/js/jquery.ajaxchimp.min.js"></script>
<script src="/user/js/jquery.magnific-popup.min.js"></script>	
<script src="/user/js/owl.carousel.min.js"></script>						
<script src="/user/js/jquery.nice-select.min.js"></script>							
<script src="/user/js/mail-script.js"></script>	
<script src="/user/js/main.js"></script>	
</body>
</html>