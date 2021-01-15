<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<!--
   Tactile by Pixelarity
   pixelarity.com | hello@pixelarity.com
   License: pixelarity.com/license
-->
<html>
<head>
<title>Change Password</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=1" />
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/app/user/assets/css/main.css" />
</head>
<body class="is-preload">

   <!-- Header -->
   <header id="header">
      
       <h1><a href="${pageContext.request.contextPath}/app/user/index.jsp">#Plan</a></h1>
       <a href="${pageContext.request.contextPath}/expert/ExpertLogin.ex">EXLogin</a>
       <a href="${pageContext.request.contextPath}/user/SignUp.us">Sign Up</a>
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
      <section class="wrapper" style="text-align: center">
         <div class="inner">
            <h2>Expert Change Password</h2>
            <h1 style="color:#c81b1b;">전송 받은 문자메세지의 임시비밀번호를 입력하시고 <br>새 비밀번호로 변경하신 후  로그인 해 주세요.</h1>
            <hr></hr>
         </div>
      </section>
      
      
     <form name="reFindPwExForm"
		action="${pageContext.request.contextPath}/expert/ExpertChangePwOk.ex"
		method="post">

		<p style="margin-left: 36%; margin-bottom: 10px;">EXPERT ID</p>
		<div class="row gtr-uniform" style="display: contents;">
			<div class="col-4 col-12-small"
				style="margin: auto; padding-top: 0px">
				<input type="text" name="ex_id" value="" placeholder="EXPERT ID입력" />
				
			</div>
		</div>
		<p></p>                                                            
		
		<p style="margin-left: 36%; margin-bottom: 10px;">TEMPORARY PASSWORD</p>
		<div class="row gtr-uniform" style="display: contents;">
			<div class="col-4 col-12-small"
				style="margin: auto; padding-top: 0px">
				<input type="text" name="temp_pw" value="" placeholder="전송받은 임시 비밀번호를 입력해 주세요." />
			
			</div>
		</div>

		<p></p>

		<p style="margin-left: 36%; margin-bottom: 10px;">CHANGE PASSWORD</p>
		<div class="row gtr-uniform" style="display: contents;">
			<div class="col-4 col-12-small"
				style="margin: auto; padding-top: 0px">
			
				<input type="password" name="new_pw" value=""
					placeholder="변경하실 비밀번호를 입력해 주세요." /> 
					
						
		<p></p>	
					<a
					class="button primary fit sendPw" style="margin-top: 10px" value="" />
							PW CHANGE</a>
				
			</div>
		</div>
	</form>

<p></p>
<br>

      <!-- Footer -->
      <footer id="footer" style="margin: auto;">
         <div class="inner">
            <section class="contact-info" style="margin: auto;">
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
      </footer>


      <!-- Scripts -->
      <script
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
      <script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
      <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
      <script>
         var contextPath = "${pageContext.request.contextPath}";
      </script>
      <script src="${pageContext.request.contextPath}/app/user/join.js"></script>
      <script>
         $(function() {
            $("#postcodify_search_button").postcodifyPopUp();
         });
      </script>
      
    <script>
				$("a.sendPw").on("click", function(e) {
					e.preventDefault();

					if (reFindPwExForm.ex_id.value == "") {
						alert("아이디를 입력해주세요.");
						return false;
					}
					if (reFindPwExForm.temp_pw.value == "") {
						alert("전송받은 임시번호를 입력해주세요.");
						return false;
					}

					if (reFindPwExForm.new_pw.value == "") {
						alert("앞으로 사용하실 비밀번호를 입력해 주세요.");
						return false;
					}else{var reg = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
					if(!reg.test(reFindPwExForm.new_pw.value)){
						alert("비밀번호는 8자리 이상이어야 하며, 소문자/숫자/특수문자 모두 포함해야 합니다.");
						reFindPwExForm.new_pw.focus();
						return false; }}

					reFindPwExForm.submit();
				})
			</script>
</body>
</html>