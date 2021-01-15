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
<title>FIND ID</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=1" />
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/app/user/assets/css/main.css" />
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
      <section class="wrapper" style="text-align: center">
         <div class="inner">
            <h2>FIND ID</h2>
            <br>
            <h3 style="color:#c81b1b;"> 고객님께서 찾으시는 아이디는
            <br>
           ${session_name} 입니다! </h3>
           <br>
			<p>아래 로그인 서비스에서  바로 로그인 할 수있습니다.</p>
         </div>
      </section>
      
      
      <section class="wrapper"style="text-align:center">
               <div class="inner" >
               <h2>LOGIN</h2>
               <hr></hr>
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
                     
                     <a href="${pageContext.request.contextPath}/app/user/find_id.jsp" style="text-decoration:none"><h6 style="padding-top:10px;">아이디 / 비밀번호 찾기</h6></a>
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
   
</body>
</html>