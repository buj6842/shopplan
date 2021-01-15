<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML>
<!--
   Tactile by Pixelarity
   pixelarity.com | hello@pixelarity.com
   License: pixelarity.com/license
-->
<html>
   <head>
      <title>마이페이지</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=1" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/app/user/assets/css/main.css" />
   </head>
   <body class="is-preload">

                <!-- Header -->
         <header id="header">
            <h1><a href="${pageContext.request.contextPath}/app/user/index.jsp">#Plan</a></h1>
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
            <section class="wrapper">
               <div class="inner" style="text-align:center">
                  <div class="box">
                  <h3 >My Page</h3>
                  <div style="border:1">
                  

                  
				<c:if test="${session_id ne null}">
				${session_id}님 환영합니다!			
				
				
                  <br><br>
                  <form id="updateform" method="post" action="${pageContext.request.contextPath}/user/UserUpdateOk.us">
                  <p>
                 	 비밀번호 변경 
                  <br>
                  <input type="password" value="${userBean.getUser_pw()}" name = "user_pw" style="width:40%;margin:0 auto" >
                  </p>
                  
                 <!--  <p>
            	     비밀번호 확인
                  <br>
                  <input type="password" value="password" name="user_pw_check" style="width:40%;margin:0 auto" >
                  </p> -->
                  <p>
            	     이메일
                  <br>
                  <input type="text" value="${userBean.getUser_email()}" name="user_email" style="width:40%;margin:0 auto" >
                  </p>
                  <p>
            	   핸드폰번호
                  <br>
                  <input type="text" value="${userBean.getUser_phone_number()}" name="user_phone_number"style="width:40%;margin:0 auto" >
                  </p>
                  <p>
               		   우편번호
                   <input type="text" name="user_zipcode" class="postcodify_postcode5" value="${userBean.getUser_zipcode()}"style="width:40%;margin:0 auto" readonly/>
                  </p>
                  <p>
                 		 주소  <input type="text" name="user_address" class="postcodify_address" value="${userBean.getUser_address()}" style="width:40%;margin:0 auto" readonly/>
                  </p>
                  <p>
                  	상세 주소  <input type="text" name="user_address_detail" class="postcodify_details" value="${userBean.getUser_address_detail()}" style="width:40%;margin:0 auto" />
                  </p>
                  <p>
                  		참고 항목  <input type="text" name="user_address_etc" class="postcodify_extra_info" value="역${userBean.getUser_address_etc()}" style="width:40%;margin:0 auto" readonly/>
                  </p>
                  <p>
                  <input type="button" id="postcodify_search_button" value="주소재검색   ">
                  </p>
                  <br>
                  <p>
            	  LivingRoom color
                  <br>
                  <input type="text" value="${userBean.getUser_livingroom_c()}" name="user_livingroom_c"style="width:40%;margin:0 auto" >
                  </p>
                  <br>    
                  <p>
            	  Kitchen color
                  <br>
                  <input type="text" value="${userBean.getUser_kitchen_c()}" name="user_kitchen_c"style="width:40%;margin:0 auto" >
                  </p>
                  <br>   
                  <p>
            	  Room color
                  <br>
                  <input type="text" value="${userBean.getUser_room_c()}" name="user_room_c"style="width:40%;margin:0 auto" >
                  </p>
                  <br>                 
                  <p>
                  <a href ="javascript:updateform.submit();" class="button primary fit" style="width:30%">정보수정하기</a>
                  </p>
                  </form>
                  </c:if>
                  </div>
                  </div>
                  </div>
            </section>
         </article>

      <!-- Footer -->
         <footer id="footer">
            <div class="inner">
               <section class="contact-info">
                  <h4 class="major">Contact</h4>
                  <ul class="contact">
                     <li class="icon solid fa-phone">(000) 000-0000</li>
                     <li class="icon solid fa-envelope"><a href="#">buj6842@naver.com</a></li>
                     <li class="icon brands fa-facebook-f"><a href="#">facebook.com/untitled</a></li>
                  </ul>
                  <ul class="contact">
                     <li class="icon solid fa-home">13rd<br />12<br /> Teheran-ro 26-gil<br />Gangnam-gu<br />Seoul<br />Republic of Korea</li>
                  </ul>
               </section>
            </div>
            <div class="copyright">
               <p>&copy; Untitled Corp. All rights reserved.</p>
            </div>
         </footer>

      <!-- Scripts -->
         <script src="${pageContext.request.contextPath}/app/user/assets/js/jquery.min.js"></script>
         <script src="${pageContext.request.contextPath}/app/user/assets/js/jquery.scrolly.min.js"></script>
         <script src="${pageContext.request.contextPath}/app/user/assets/js/browser.min.js"></script>
         <script src="${pageContext.request.contextPath}/app/user/assets/js/breakpoints.min.js"></script>
         <script src="${pageContext.request.contextPath}/app/user/assets/js/util.js"></script>
         <script src="${pageContext.request.contextPath}/app/user/assets/js/main.js"></script>

   </body>
   <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
   <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
   <script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
   <script>
   function updateon(){
	   
   }
   </script>
</html>