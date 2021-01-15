<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Tactile by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
	<head>
		<title>Untitled</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body class="is-preload">

		   <!-- Header -->
            
         <header id="header">	
            <h1><a href="index.jsp">#Plan</a></h1>
            <!-- 로그인 하지 않았을 때 -->
         	<c:if test="${session_id eq null}">
            <a href="${pageContext.request.contextPath}/user/UserLogin.us">Login</a>
            <a href="${pageContext.request.contextPath}/user/SignUp.us">Sign Up</a>
            <!-- 로그인 했을 때 -->
			</c:if>
			<c:if test="${session_id ne null}">
			<a href="${pageContext.request.contextPath}/user/UserUpdate.us">${session_id}</a>님 환영합니다			
			<a href="${pageContext.request.contextPath}/user/UserLogOut.us">Logout</a>
			</c:if>
            <a href="#menu">Menu</a>
         </header>
      

      <!-- Menu -->
         <nav id="menu">
            <ul class="links">
               <li><a href="index.jsp">Home</a></li>
            <li><a href="ask.jsp">ask</a></li>
            <li><a href="${pageContext.request.contextPath}/askboard/AskBoardList.as">professional ask</a></li>
               <li><a href="${pageContext.request.contextPath}/gallery/GalleryView.ga">interior guide</a></li>
               <li><a href="interior_layout.jsp">interior layout</a></li>
               <li><a href="${pageContext.request.contextPath}/community/CommunityList.ct">Community</a></li>
               <li><a href="${pageContext.request.contextPath}/askhelp/AskhelpList.he">HELP</a></li>
               
            </ul>
         </nav>


		<!-- Main -->
			<article id="main">
			<p></p>
				<section class="wrapper"style="text-align:center">
					<div class="inner" >
					<h2>FIND ID / PW</h2>
					<hr></hr>
					</div>
				</section>	
				
			   <c:if test="${not empty param.find_id}">
                 <c:if test="${not param.find_id}">
                 	<script>alert("이름 또는 핸드폰번호를 다시 확인해주세요.")</script>
                 </c:if>
                </c:if> 
                
					<H4 style="text-align: center;">아이디 찾기</H4>
					
				 <form name="findIdForm" action="${pageContext.request.contextPath}/user/UserFindOk.us" method="post">   	
			
					<p style="margin-left:36%; margin-bottom:10px;">NAME</p>
					<div class="row gtr-uniform"style="display:contents;">
					<div class="col-4 col-12-small" style="margin:auto;     padding-top:0px;">
					<input type="text" name="user_name"  id="user_name" value=""/>
					</div>
					</div>
				
					<p></p>
					
					<p style="margin-left:36%; margin-bottom:10px;">USER PHONE</p>
					<div class="row gtr-uniform" style="display:contents;">
					<div class="col-4 col-12-small" style="margin:auto; padding-top:0px">
					<input type="text" name="user_phone_number"  id="user_phone_number" value="" placeholder="-없이입력" />
					<a href="javascript:findIdForm.submit()"  class="button primary fit"  id="btnFindUid" style="margin-top:10px" value="" />아이디찾기</a>
					</div>
					</div>
					
					<p></p>
					<br>
					
					<H4 style="text-align: center;">비밀번호 찾기</H4>
			
				
					<p></p>
					
					 <p style="margin-left:36%; margin-bottom:10px;">NAME</p>
					<div class="row gtr-uniform"style="display:contents;">
					<div class="col-4 col-12-small" style="margin:auto;     padding-top:0px;">
					<input type="text" name="user_name" value=""/>
					</div>
					</div>
				
					<p></p>
					
					<p style="margin-left:36%; margin-bottom:10px;">USER ID</p>
					<div class="row gtr-uniform" style="display:contents;">
					<div class="col-4 col-12-small" style="margin:auto; padding-top:0px">
					<input type="text" name="user_id" value="" placeholder="ID입력" />
					<!--<input type="button" onclick="javascript:checkId()"  class="button primary fit"  style="margin-top:10px" value="중복확인" />  -->
					</div>
					</div>
					
					<p></p>
						
					<p style="margin-left:36%; margin-bottom:10px;">USER PHONE</p>
					<div class="row gtr-uniform" style="display:contents;">
					<div class="col-4 col-12-small" style="margin:auto; padding-top:0px">
					<input type="text" name="user_phone_number" value="" placeholder="핸드폰번호입력" />
					<input type="button" onclick="javascript:checkId()"  class="button primary fit"  style="margin-top:10px" value="인증하기" />
					</div>
					</div>
					</form>
					<p></p>
					
					
					
				<section class="wrapper"style="text-align:center">
					<div class="inner" >
					<hr></hr>
					
					<H3 style="text-align: center;">Login</H3>
					</div>
				</section>
					
						
				 <c:if test="${not empty param.login}">
                 <c:if test="${not param.login}">
                 <script>alert("아이디 또는 비밀번호를 다시 확인해주세요.")</script>
                 </c:if>
                 </c:if> 
                 
                 <form name="loginForm" action="${pageContext.request.contextPath}/user/UserLoginOk.us" method="post">   
					
					<div class="row gtr-uniform">
                  
                     <div class="col-6 col-12-xsmall" style="margin:0 auto"> 
                     <lable style="text-algin:left;">ID</lable>
                     <br>
                     <input type="text" name="user_id" id="user_id" value="" />
                     <p></p>
                     <lable>PASSWORD</lable>
                     <br>
                     <input type="password" name="user_pw" id="user_pw" value=""  />
                     
                     <a href="#top" style="text-decoration:none"><h6 style="padding-top:10px;">아이디 / 비밀번호 찾기</h6></a>
                     <p></p>
                     <br>
                     <ul class="actions">
                     <li style="margin:0 auto"><a href="javascript:loginForm.submit()" class="button primary">Login</a></li>
                     <li style="margin:0 auto"><a href="${pageContext.request.contextPath}/user/UserJoin.us"  class="button primary">Join Us</a></li>
                     </ul>
                     </div>
                  </div>
			
				</form>	
		
			
		<!-- Footer -->
			<footer id="footer">
				<div class="inner">
				</div>
			</footer>
		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/app/user/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/app/user/assets/js/jquery.scrolly.min.js"></script>
			<script src="${pageContext.request.contextPath}/app/user/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/app/user/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/app/user/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/app/user/assets/js/main.js"></script>
			<!--  --><script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
			<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
			<script>var contextPath = "${pageContext.request.contextPath}";</script>
			<script src="${pageContext.request.contextPath}/app/user/join.js"></script>
			<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
	</body>
</html>