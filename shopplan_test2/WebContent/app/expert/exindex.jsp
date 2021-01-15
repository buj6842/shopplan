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
<!-- main css에서 3343줄 왜 적용이 안되는지 모르겠음 -->
<html>
   <head>
      <title>메인페이지</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=1" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/app/user/assets/css/main.css" />
   </head>
   <body class="is-preload">
	
    
            <!-- Header -->
            
         <header id="header">
            <h1><a href="index.jsp">#Plan</a></h1>
            <!-- 로그인 하지 않았을 때 -->
         	<c:if test="${session_id eq null}">
            <a href="${pageContext.request.contextPath}app/expert/ExpertLogin.ex">EX-Login</a>
            <a href="${pageContext.request.contextPath}app/user/SignUp.us">Sign Up</a>
            <!-- 로그인 했을 때 -->
			</c:if>
			<c:if test="${session_id ne null}">	
			<a href="${pageContext.request.contextPath}app/expert/ExpertUpdate.ex">${session_id}</a>님 환영합니다!			
			<a href="${pageContext.request.contextPath}app/expert/ExpertLogout.ex">EX-Logout</a>
			</c:if>
            <a href="#menu">Menu</a>
         </header>
      

      <!-- Menu -->
         <nav id="menu">
            <ul class="links">
               <li><a href="index.jsp">Home</a></li>
            <li><a href="ask.jsp">ask</a></li>
            <li><a href="professional_ask.jsp">professional ask</a></li>
               <li><a href="interior_guide.jsp">interior guide</a></li>
               <li><a href="interior_layout.jsp">interior layout</a></li>
               <li><a href="community.jsp">Community</a></li>
               <li><a href="review.jsp">review</a></li>
               <li><a href="${pageContext.request.contextPath}/expert/ExpertUpdate.ex">Expage</a></li>
            </ul>
         </nav>

      <!-- Banner -->
         <section id="banner" >
         <div class="image"  data-position="center right" >
         <!-- 배경주소  -->
   <!--          <img src="images/bde.png"  id="bg" alt=""> -->
         </div>
            <div class="inner">
               <!-- <h2 class="major special">#plan</h2> -->
               <h2>#plan</h2>
               <p>Hello, I'm #plan.</p>
               <h4>Interior Design-Oriented Site</h4>
               <ul class="actions special stacked">
                  <!-- <li><a href="#" class="button primary large">Get started</a></li> -->
                  <li><a href="#one" class="button large scrolly">Learn more</a></li>
               </ul>
            </div>
         </section>


<!-- Two -->
         <section id="two" class="wrapper alt">
            <section class="spotlight">
               <div class="image"><img src="images/main1.gif" alt="" /></div>
               <div class="content">
                  <h3 class="major"> Interior virtual layout</h3>
                  <p>여기는 뭐가 들어가야 좋을지 모르겠어요 ㅠㅠ 원래있던 윗부분과 아랫부분은 뭔가개연성이 중복되는거같아서 빼봤습니다</p>
                  </div>
            </section>
                 <section class="spotlight">
               <div class="image"><img src="images/plan.gif" alt="" /></div>
<!--                <div class="image"><img src="images/i_8.jpeg" alt="" /></div> -->
               <div class="content">
                  <h3 class="major">Interior Gallery</h3>
                  <p>전문가들이 직접 작업한 인테리어, 각각의 카테고리들을 통해 필요한 옵션의 인테리어들을 구경해보세요!</p>
                  <a href="interior_guide.jsp" class="button">Details</a>
                </div>
            </section> 
            <section class="spotlight">
               <div class="image"><img src="images/i_5-1.jpeg" alt="" /></div>
               <div class="content">
                  <h3 class="major">professional Ask</h3>
                  <p>평소 인테리어에 관한 많은고민들, 간단하거나 심오한 고민들 부담없이 적어주세요! 전문가들이 상세히 답변해드릴거에요 :)</p>
                  <a href="ask.jsp" class="button">Details</a>
               </div>
            </section>
            <section class="spotlight">
               <div class="image"><img src="images/i_7.jpg" alt="" /></div>
               <div class="content">
                  <h3 class="major">무엇을</h3>
                  <p>넣으면 좋을 까 요 ???</p>
                  </div>
            </section>
               <section class="spotlight">
               <div class="image"><img src="images/i_3.jpeg" alt="" /></div>
               <div class="content">
                  <h3 class="major">Community</h3>
                  <p>커뮤니티입니다. 자유로운주제, 혹은 자기집 자랑을 하셔도 됩니다!</p>
                  <a href="community.jsp" class="button">Details</a>
               </div>
            </section>
         </section>
         <hr>


       <!-- Three -->
         <!-- <section id="three" class="wrapper style1 special">
            <div class="inner narrow">
               <h3 class="major special">Thank you</h3>
               <p>This is the website introduction. </p>
               <p>Please use #plan </p>
               <ul class="actions special">
                  <li><a href="#" class="button primary large">Page up</a></li>
               </ul>
            </div> -->
      <!--    </section> -->
         

       <!-- Footer -->
      <!--    <footer id="footer">
            <div class="inner">
               <section class="about">
                  <h4 class="major">Magna Aliquam Feugiat</h4>
                  <p>Etiam finibus pharetra purus, imperdiet sagittis mauris hendrerit vitae. In feugiat ante elementum nulla arcu. Maecenas vulputate faucibus, convallis ligula ipsum dolor feugiat tempus adipiscing.</p>
                  <ul class="actions">
                     <li><a class="button">Learn more</a></li>
                  </ul>
               </section>
               <section class="contact-info">
                  <h4 class="major">Get in Touch</h4>
                  <ul class="contact">
                     <li class="icon solid fa-phone">(000) 000-0000</li>
                     <li class="icon solid fa-envelope"><a href="#">information@untitled.tld</a></li>
                     <li class="icon brands fa-twitter"><a href="#">@untitled-tld</a></li>
                     <li class="icon brands fa-facebook-f"><a href="#">facebook.com/untitled</a></li>
                  </ul>
                  <ul class="contact">
                     <li class="icon solid fa-home">Untitled Corp<br />1234 Fictional Road<br />Suite 5432<br />Nashville, TN 00000<br />USA</li>
                  </ul>
               </section>
            </div>
            <div class="copyright">
               <p>&copy; Untitled Corp. All rights reserved.</p>
            </div> -->
      <!-- </footer> --> 
      
      
         <!-- Footer -->
         <footer id="footer">
            <div class="inner">
               <section class="contact-info">
                  <h4 class="major">Connect</h4>
                  <ul class="contact">
                     <li class="icon solid fa-phone">(010) 7126-6849</li>
                     <li class="icon solid fa-envelope"><a href="#">buj6842@naver.com</a></li>
                  </ul>
                  <ul class="contact">
                     <li class="icon solid fa-home">Seoul<br/>gangnamGu<br />Teheran-ro 26-gil<br />12</li>
                  </ul>
               </section>
            </div>
            <div class="copyright">
               <p>&copy; Untitled Corp. All rights reserved.</p>
            </div>
         </footer>
                  
   </section>
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
</html>