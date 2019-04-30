<%@page import="com.aroundog.model.domain.Member"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Member member=(Member)request.getSession().getAttribute("member");
%>
<header id="header" id="home">
   <div class="container main-menu">
   	<div class="row align-items-center justify-content-between d-flex">
      <div id="logo">
        <a href="/user/index.jsp"><img src="/user/img/logo/aroundog_02.png" alt="" title=""  style="width:100px"/></a>
      </div>
      <nav id="nav-menu-container">
        <ul class="nav-menu">
          <li class="menu-active"><a href="/user/index.jsp">Home</a></li>
          <li><a href="about.html">About Us</a></li>
          <li><a href="/user/notices">Notice</a></li>
          <li><a href="dogs.html">Adoption</a></li>        
          
          <li class="menu-has-children"><a href="">Board</a>
            <ul>
            	<li><a href="/user/freeboards">Free board</a></li>
            	<li><a href="">Lost board</a></li>

            </ul>
          </li>
          
          
          <li class="menu-has-children"><a href="">Members</a>
            <ul>
			<%if(member==null){ %>	
            	<li><a href="/user/login/login.jsp">Login</a></li>
            <%}else{ %>
            	<li><a href="/user/member/logout">Logout</a></li>
            	<li><a href="">Report</a></li>
            <%} %>
            	<li><a href="/user/member/regist.jsp">Join us</a></li>
            </ul>
          </li>
          <%if(member==null){ %>		          
	          <li><a href="contact.html">Contact</a></li>
	          <li class="menu-has-children"><a href="">Dropdown</a>
	            <ul>
	              <li><a href="elements.html">Elements</a></li>	
	              <li><a href="#">Item</a></li>
	              <li class="menu-has-children"><a href="">Level 2</a>
		            <ul>
		              <li><a href="#">Item 1</a></li>
		              <li><a href="#">Item 2</a></li>
		            </ul>
		          </li>	
	            </ul>
	          </li>
          <%}else{ %>	
	          <li style="color:white;"><a><%=member.getName() %></a></li>
	          <li class="menu-has-children"><a href="">[ Logout ]</a>
	            <ul>
	              <li><a href="elements.html">Elements</a></li>	
	              <li><a href="#">Item</a></li>
	              <li class="menu-has-children"><a href="">Level 2</a>
		            <ul>
		              <li><a href="#">Item 1</a></li>
		              <li><a href="#">Item 2</a></li>
		            </ul>
		          </li>	
	            </ul>
	          </li>
          <%} %>	
          				              
        </ul>
      </nav><!-- #nav-menu-container -->		    		
   	</div>
   </div>
 </header><!-- #header -->