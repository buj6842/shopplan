<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
	Tactile by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->

<html>
	<head>
		<title>회원가입</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=1" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/app/user/assets/css/main.css" />
	</head>
	<body class="is-preload">

		 
         <!-- Header -->
         <header id="header">
             <h1><a href="${pageContext.request.contextPath}/app/user/index.jsp">#Plan</a></h1>
            <a href="${pageContext.request.contextPath}/user/UserLogin.us">Login</a>
            <a href="${pageContext.request.contextPath}/expert/ExpertLogin.ex">EXLogin</a>
            <a href="${pageContext.request.contextPath}/user/SignUp.us">Sign Up</a>
            <a href="#menu">Menu</a>
         </header>
      

      <!-- Menu -->
         <nav id="menu">
            <ul class="links">
               <li><a href="${pageContext.request.contextPath}/app/user/index.jsp">Home</a></li>
               <li><a href="${pageContext.request.contextPath}/app/user/ask.jsp">ask</a></li>
               <li><a href="${pageContext.request.contextPath}/app/user/professional_ask.jsp">professional ask</a></li>
               <li><a href="${pageContext.request.contextPath}/app/user/interior_guide.jsp">interior guide</a></li>
               <li><a href="${pageContext.request.contextPath}/app/user/interior_layout.jsp">interior layout</a></li>
               <li><a href="${pageContext.request.contextPath}/app/user/community.jsp">Community</a></li>
               <li><a href="${pageContext.request.contextPath}/app/user/review.jsp">review</a></li>
               <li><a href="${pageContext.request.contextPath}/app/user/mypage.jsp">Mypage</a></li>
               <li><a href="${pageContext.request.contextPath}/app/expert/expageForm.jsp">Expage</a></li>
            </ul>
         </nav>


		<!-- Main -->
			<article id="main">
			<p></p>
				<section class="wrapper"style="text-align:center">
					<div class="inner" >
					<h2>회원가입하기 !</h2>
					<hr></hr>
					<h2>일반회원 가입하기</h2>
					<p>가상인테리어를 이용하여 전문가들에게 질문을 할 수 있고, 회원들과 정보를 공유할 수 있습니다!<br>누구나 가입가능!</p>
					<a href="${pageContext.request.contextPath}/user/UserJoin.us" class="button primary" id="user_Go">회원가입 Go!</a>
					<hr></hr>
					<h2>전문가회원 가입하기</h2>
					<p>회원들이 질문한 글에 답변을 할 수 있고 직접 인테리어한 환경들을 갤러리에 등록할 수 있습니다! 일반회원들에게 도움이 되어주세요!
					<br>전문가는 <span style="color:red;">추가인증(사업자등록증,명함,등등..)</span>을 필요로하고 심사후 가입이 승인됩니다!</p>
					<a href="${pageContext.request.contextPath}/expert/ExpertJoin.ex" class="button primary" id="ex_Go">회원가입 Go!</a>
					</div>
				</section>	
			
						
		<!-- Footer
			<footer id="footer">
				<div class="inner">
				</div>
			</footer> -->
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