<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
   Tactile by Pixelarity
   pixelarity.com | hello@pixelarity.com
   License: pixelarity.com/license
-->
<html>
<head>
<title>ID/PW찾기</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=1" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/app/user/assets/css/main.css" />
</head>
<body class="is-preload">

	<!-- Header -->
	<header id="header">
	<h1>
		<a href="index.jsp">#Plan</a>
	</h1>
	<a href="${pageContext.request.contextPath}/app/expert/exloginForm.jsp">Expert Login</a> 
	<a href="${pageContext.request.contextPath}/user/SignUp.us">Sign Up</a>
	 <a
		href="#menu">Menu</a> </header>


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
	<section class="wrapper" style="text-align:center">
	<div class="inner">
		<h2>EXPERT FIND ID / PW</h2>
		<hr></hr>
	</div>
	</section>

	<H4 style="text-align: center;">관리자 아이디 찾기</H4>


	<form name="exfindIdForm"
		action="${pageContext.request.contextPath}/expert/ExpertFindIdOk.ex"
		method="post">

		<p style="margin-left: 36%; margin-bottom: 10px;">EXPERT NAME</p>
		<div class="row gtr-uniform" style="display: contents;">
			<div class="col-4 col-12-small"
				style="margin: auto; padding-top: 0px;">
				<input type="text" name="ex_name" id="ex_name" class="sendId"
					value="" />
			</div>
		</div>

		<p></p>

		<p style="margin-left: 36%; margin-bottom: 10px;">EXPERT PHONE</p>
		<div class="row gtr-uniform" style="display: contents;">
			<div class="col-4 col-12-small"
				style="margin: auto; padding-top: 0px">
				<input type="text" name="ex_phone_num" id="ex_phone_num" class="sendId"
					value="" placeholder="-없이입력" /> 
					
					<a class="button primary fit sendId" style="margin-top: 10px" value=""/ >관리자 아이디찾기</a>
			</div>
		</div>
	</form>

	<p></p>


	<section class="wrapper" style="text-align:center">
	<div class="inner">
		<hr></hr>
		<br>
		<H4 style="text-align: center;">관리자 비밀번호 찾기</H4>

	</div>
	</section>

	<form name="ExfindPwForm"
		action="${pageContext.request.contextPath}/expert/ExpertFindPwOk.ex"
		method="post">

		<p style="margin-left: 36%; margin-bottom: 10px;">EXPERT ID</p>
		<div class="row gtr-uniform" style="display: contents;">
			<div class="col-4 col-12-small"
				style="margin: auto; padding-top: 0px">
				<input type="text" name="ex_id" value="" placeholder="ID입력" />
			
			</div>
		</div>

		<p></p>

		<p style="margin-left: 36%; margin-bottom: 10px;">EXPERT PHONE</p>
		<div class="row gtr-uniform" style="display: contents;">
			<div class="col-4 col-12-small"
				style="margin: auto; padding-top: 0px">
				<input type="text" name="ex_phone_num" value="" placeholder="핸드폰번호입력" />
				 <a class="button primary fit sendPw" style="margin-top: 10px" value="" />관리자 임시 PW 받기</a>
				
			</div>
		</div>
	</form>

	<p></p>

<section class="wrapper"style="text-align:center">
               <div class="inner" >
               <h2>EXPERT LOGIN</h2>
               <hr></hr>
               </div>
            </section>   
                <c:if test="${not empty param.login}">
                 <c:if test="${not param.login}">
                  <script>alert("아이디 또는 비밀번호를 다시 확인해주세요.")</script>
                  </c:if>
                  </c:if>    
                  <form name="exloginForm" action="${pageContext.request.contextPath}/expert/ExpertLoginOk.ex" method="post"  >   
               
                  <div class="row gtr-uniform">
                  
                     <div class="col-6 col-12-xsmall" style="margin:0 auto"> 
                     <lable style="text-algin:left;">ID</lable>
                     <br>
                     <input type="text" name="ex_id" id="ex_id" value="" />
                     <p></p>
                     <lable>PASSWORD</lable>
                     <br>
                     <input type="password" name="ex_pw" id="ex_pw" value=""  />
                     
                     <a href="${pageContext.request.contextPath}/app/expert/exfindIdPw.jsp" style="text-decoration:none"><h6 style="padding-top:10px;">아이디 / 비밀번호 찾기</h6></a>
                     <p></p>
                     <br>
                     <ul class="actions">
                     <li style="margin:0 auto"><a href="javascript:exloginForm.submit()" class="button primary">Expert Login</a></li>
                     <li style="margin:0 auto"><a href="${pageContext.request.contextPath}/expert/ExpertJoin.ex"  class="button primary">Expert Join us</a></li>
                     </ul>
                     </div>
                  </div>
               </form>  
               

	<br>
	<!-- Footer --> <footer id="footer" style="margin:auto;">
	<div class="inner">
		<section class="contact-info" style="margin:auto;">
		<h4 class="major">Connect</h4>
		<ul class="contact">
			<li class="icon solid fa-phone">(010) 7126-6849</li>
			<li class="icon solid fa-envelope"><a href="#">buj6842@naver.com</a></li>
		</ul>
		<ul class="contact">
			<li class="icon solid fa-home">Seoul<br />gangnamGu<br />Teheran-ro
				26-gil<br />12
			</li>
		</ul>
		</section>
	</div>
	<div class="copyright">
		<p>&copy; Untitled Corp. All rights reserved.</p>
	</div>
	</footer> <!-- Scripts --> <script
		src="${pageContext.request.contextPath}/app/user/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/app/user/assets/js/jquery.scrolly.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/app/user/assets/js/browser.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/app/user/assets/js/breakpoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/app/user/assets/js/util.js"></script>
	<script
		src="${pageContext.request.contextPath}/app/user/assets/js/main.js"></script>
	<script src="//code.jquery.com/jquery-3.5.1.min.js"></script> <script
		src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script> <script>
			var contextPath = "${pageContext.request.contextPath}";
		</script> <script src="${pageContext.request.contextPath}/app/user/join.js"></script>
	<script>
		$(function() {
			$("#postcodify_search_button").postcodifyPopUp();
		});
	</script> <script>
		$("a.sendId").on("click", function(e) {
			e.preventDefault();

			if (exfindIdForm.ex_name.value == "") {
				alert("이름을 입력해주세요.");
				return false;
			}

			if (exfindIdForm.ex_phone_num.value == "") {
				alert("핸드폰 번호를 입력해주세요.");
				return false;
			}

			exfindIdForm.submit();
		})
	</script>
	 <script>
				$("a.sendPw").on("click", function(e) {
					e.preventDefault();

					if (ExfindPwForm.ex_id.value == "") {
						alert("아이디를 입력해주세요.");
						return false;
					}

					if (ExfindPwForm.ex_phone_num.value == "") {
						alert("핸드폰 번호를 입력해주세요.");
						return false;
					}

					ExfindPwForm.submit();
				})
			</script>
</body>
</html>