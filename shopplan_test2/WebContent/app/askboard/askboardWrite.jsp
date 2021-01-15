<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
      <title>전문가 게시판</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=1" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/app/user/assets/css/main.css" />
   </head>
   <body>
 <body class="is-preload">
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
 <article id="main">
            <section class="wrapper">
               <div class="inner" style="text-align:center">
   


         
         <!-- 게시판 등록 -->
         <!--include 써보기  -->
         <form action="${pageContext.request.contextPath}/askboard/AskBoardWriteOk.as" method="post" enctype="multipart/form-data" name="askboardform">
            <table width="900px" border="0" cellpadding="0" cellspacing="0">
               <tr align="center" valign="middle">
                  <td><h3>전문가 조언 게시판</h3></td>
               </tr>
            </table>
         
            <table  border="1" cellpadding="0" cellspacing="0" width="900px" >
               <tr height="30px">
                  <td align="center" width="150px">
                     <div align="center">제 목</div>
                  </td>
                  <td style="padding-left:10px;">
                     <input name="askboard_title" type="text" size="50" maxlength="100" value=""/>
                  </td>
               </tr>
               <tr height="30px">
                  <td align="center" width="150px">
                     <div align="center">글쓴이</div>
                  </td>
                  <td style="padding-left:10px;">
                     <input name="askboard_id" type="text" size="10" maxlength="10" value="${session_id}" readonly />
                  </td>
               </tr>
               <tr height="200px">
                  <td align="center" width="150px">
                     <div align="center">내 용</div>
                  </td>
                  <td style="padding-left:10px;">
                     <textarea name="askboard_content" style="width:700px; height:185px"></textarea>
                  </td>
               </tr>
               <tr height="30px">
                  <td align="center" width="150px">
                     <div align="center">파일 첨부</div>
                  </td>
                  <td style="padding-left:10px;">
                     <input name="askboard_file1" type="file"/>
                     <input type="button" onclick="cancleFile('askboard_file1')" value="첨부 삭제">
                  </td>
               </tr>
               <tr height="30px">
                  <td align="center" width="150px">
                     <div align="center">파일 첨부</div>
                  </td>
                  <td style="padding-left:10px;">
                     <input name="askboard_file2" type="file"/>
                     <input type="button" onclick="cancleFile('askboard_file2')" value="첨부 삭제">
                  </td>
               </tr>
               <tr height="30px">
                  <td align="center" width="150px">
                     <div align="center">파일 첨부</div>
                  </td>
                  <td style="padding-left:10px;">
                     <input name="askboard_file3" type="file"/>
                     <input type="button" onclick="cancleFile('askboard_file3')" value="첨부 삭제">
                  </td>
               </tr>
            </table>
            
            <table border="0" cellpadding="0" cellspacing="0" width="900px">
               <tr align="right" valign="middle">
                  <td>
                     <a href="javascript:addboard()" class="button">등록</a>&nbsp;&nbsp;
                     <a href="${pageContext.request.contextPath}/askboard/AskBoardList.as" class="button">목록</a>&nbsp;&nbsp;
                  </td>
               </tr>
            </table>
         </form>
         </div>
         </section>
         </article>
         
         <!-- 게시판 등록 -->

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
      
   </body>
   <!--
      migrate 1.2.1 버전 사용 시 반드시 jquery 3.5.1버전 적용 후 사용해야 한다.
   -->
   <script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
   <script src="//code.jquery.com/jquery-migrate-1.2.1.js"></script>
   <script>
      function addboard(){
         askboardform.submit();
      }
   </script>
   <script>
      function cancleFile(fileTagName){
         if($.browser.msie){   //ie일 때 초기화
            $("input[name='"+ fileTagName +"']").replaceWith($("input[name='"+ fileTagName +"']").clone(true));
         }else{ //그 외 브라우저일 때 초기화
            $("input[name='"+ fileTagName +"']").val("");
         }
      }   
   </script>
   <!-- Scripts -->
         <script src="assets/js/jquery.min.js"></script>
         <script src="assets/js/jquery.scrolly.min.js"></script>
         <script src="assets/js/browser.min.js"></script>
         <script src="assets/js/breakpoints.min.js"></script>
         <script src="assets/js/util.js"></script>
         <script src="assets/js/main.js"></script>
   <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
   <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
</html>