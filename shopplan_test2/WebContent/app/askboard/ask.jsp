<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
      <head>
      <title>전문가의 조언</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=1" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/app/user/assets/css/main.css"  />
   </head>
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
      <c:set var="list" value="${requestScope.askboardList }"/>
      <c:set var="nowPage" value="${requestScope.nowPage }"/>
      <c:set var="startPage" value="${requestScope.startPage }"/>
      <c:set var="endPage" value="${requestScope.endPage }"/>
      <c:set var="totalCnt" value="${requestScope.totalCnt}"/>
      <c:set var="realEndPage" value="${requestScope.realEndPage }"/>
      
       <!-- Main -->
         <article id="main">
            <section class="wrapper">
               <div class="inner" style="text-align:center">
                  <h2>전문가의 조언 게시판입니다</h2>
                  <span>자세한 정보를 얻을 수 있습니다.</span>
                  <br>
                  <br>
                  <div class="table-wrapper">            
         <table border="1" cellpadding="0" cellspacing="0" width="900px" >
            <tr align="center" valign="middle">
               <td width="8%" height="26">
                  <div align="center">번호</div>
               </td>
               <td width="50%">
                  <div align="center">제목</div>
               </td>
               <td width="14%">
                  <div align="center">작성자</div>
               </td>
               <td width="17%">
                  <div align="center">날짜</div>
               </td>
               <td width="11%">
                  <div align="center">조회수</div>
               </td>
            </tr>
            <c:choose>
            <c:when test="${list != null and fn:length(list) > 0}">
               <c:forEach var="b_bean" items="${list}">
                  <tr align="center" valign="middle" onmouseover="this.style.backgroundColor='F8F8F8'" onmouseout="this.style.backgroundColor=''">
                     <td height="23" style="font-family:Tahoma;font-size:10pt;">
                        ${b_bean.getAskboard_num()}
                     </td>
                     
                     <td style="font-family:Tahoma;font-size:10pt;">
                        <div align="left">
                        <a href="${pageContext.request.contextPath}/askboard/AskBoardView.as?seq=${b_bean.getAskboard_num()}">${b_bean.getAskboard_title()}</a>
                        </div>
                     </td>
                     <td>
                        <div align="center">${b_bean.getAskboard_id()}</div>
                     </td>
                     <td>
                        <div align="center">${b_bean.getAskboard_date()}</div>
                     </td>   
                     <td>
                        <div align="center">${b_bean.getReadCount()}</div>
                     </td>
                  </tr>
               </c:forEach>
            </c:when>
            <c:otherwise>
            <tr height="50px">
               <td colspan="5" align="center">등록된 게시물이 없습니다.</td>
            </tr>
            </c:otherwise>
         </c:choose>
         </table>
         
         <br/>
         <table border="0" cellpadding="0" cellspacing="0" width="900px">
            <tr align="center" valign="middle">
               <td>
               <c:choose>
                  <c:when test=" ${nowPage} > 1">
                     <a href="${pageContext.request.contextPath}/askboard/AskBoardList.as?page=${nowPage-1}">[이전]</a>&nbsp;
                  </c:when>
               </c:choose>
               <c:forEach var="i" begin="${startPage}" end="${endPage}">
                  <c:choose>
                     <c:when test="${i eq nowPage}">
                        [${i}]&nbsp;
                     </c:when>
                     <c:otherwise>
                        <a href="${pageContext.request.contextPath}/askboard/AskBoardList.as?page=${i}">${i}&nbsp;</a>
                     </c:otherwise>
                  </c:choose>
               </c:forEach>
               <c:choose>
                  <c:when test="${nowPage!= realEndPage}">
                     <a href="${pageContext.request.contextPath}/askboard/AskBoardList.as?page=${nowPage+1}">[다음]</a>&nbsp;
                  </c:when>
               </c:choose>
               </td>
            </tr>
         </table>
         
         <table border="0" cellpadding="0" cellspacing="0" width="900px">
            <tr align="right" valign="middle">
               <td><a href="${pageContext.request.contextPath}/askboard/AskBoardWrite.as" class="button">글쓰기</a></td>
            </tr>
         </table>
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
        
   </body>
   <script>
	function move(url){
		location.href=url;
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
   <script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
</html>