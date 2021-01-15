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
      <title>전문가 조언</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=1" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/app/user/assets/css/main.css" />
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
		<c:set var="list" value="${requestScope.communityList}"/>
		<c:set var="nowPage" value="${requestScope.nowPage}"/>
		<c:set var="startPage" value="${requestScope.startPage}"/>
		<c:set var="endPage" value="${requestScope.endPage}"/>
		<c:set var="totalCnt" value="${requestScope.totalCnt}"/>
		<c:set var="realEndPage" value="${requestScope.realEndPage}"/>
      <!-- Main -->
         <article id="main">
            <section class="wrapper">
               <div class="inner" style="text-align:center">
                  <h2>사이트 커뮤니티 게시판입니다!</h2>
                  <span>간단한 집사진, 회원들과 많은 의견을 나눠보세요!</span>
                  <br>
                  <br>
                  <div class="table-wrapper">
                                 <table border="1" cellpadding = "0" cellspacing = "0" width="900px">
                                       <tr align="center" valign="middle">
                                          <td width="8%" height="26">
                                          	<div align="center">번호</div>
                                          </td>
                                          <td width="50%">
                                          <div align="center">제목</div>
                                          </td>
                                          <td width="14%">
                                          <div align="center">글쓴이ID</div>
                                          </td>
                                          <td width="17%">
                                          <div align="center">날짜</div>
                                          </td>
                                          <td width="11%">
                                          <div align="center">조회수</div>
                                          </td>
                                       </tr>
                                  </table>
                                  <table border="1" cellpadding = "0" cellspacing = "0" width="900px" id="communityBoard">
                                    <c:choose>
                                    <c:when test = "${list != null and fn:length(list) > 0}">
                                     <c:forEach var= "c_bean" items="${list}">
                                      <tr align="center" valign ="middle" class="communitylist">
                                      <td height="23">
                                      ${c_bean.getCommunity_num()}
                                      </td>
                                      <td width="50%">
                                      <div align="center">
                                      <a href="${pageContext.request.contextPath}/community/CommunityView.ct?seq=${c_bean.getCommunity_num()}">${c_bean.getCommunity_title()}</a>
                                      </div>
                                      </td>
                                      <td width="14%">
                                      <div align="center">${c_bean.getCommunity_id()}</div>
                                      </td>
                                      <td width="17%">
                                      <div align="center">${c_bean.getCommunity_date()}</div>
                                      </td>
                                      <td width="11%">
                                      <div align="center">${c_bean.getReadcount()}</div>
                                      </td>
                                      </tr>
                                      </c:forEach>
                                      </c:when>
                                      <c:otherwise>
                                      <tr height="50px">
                                      <td colspan="5" align ="center">등록된 게시물이 없습니다</td>
                                      </tr>
                                      </c:otherwise>
                                      </c:choose>
                                    </table>
                                 
                                 <br/>
			<table border="0" cellpadding="0" cellspacing="0" width="900px">
				<tr align="center" valign="middle">
					<td>
					<c:choose>
						<c:when test="${nowPage > 1}">
							<a href="${pageContext.request.contextPath}/community/CommunityList.ct?page=${nowPage - 1}">[이전]</a>&nbsp;
						</c:when>
					</c:choose>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:choose>
							<c:when test="${i eq nowPage}">
								[${i}]&nbsp;
							</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath}/community/CommunityList.ct?page=${i}">${i}&nbsp;</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${nowPage != realEndPage}">
							<a href="${pageContext.request.contextPath}/community/CommunityList.ct?page=${nowPage + 1}">[다음]</a>&nbsp;
						</c:when>
					</c:choose> 
					</td>
				</tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="900px">
			<tr>
                        <td width="16%" height="26">
                           <select name='category' style="width:100%"> <!-- 검색 컬럼 -->
       						 <option value='COMMUNITY_TITLE'>제목</option>
       		 				 <option value='COMMUNITY_ID'>아이디</option>
       						 <option value='COMMUNITY_CONTENT'>내용</option>
     		 				</select>
     		 							 </td>
     		 							 <td colspan="3">
            <input type="text" name="keyword" id="searchWord" value="" style="width:100%"/>
                          </td>
                                      	<td>
                    <input type="button" value="검색" onclick="check()">
                                      	</td>
                                      	
              </tr>
			</table>
		
		
			<a href="${pageContext.request.contextPath}/community/CommunityWrite.ct" class="button" style="float:right;">글쓰기</a>
		
	              
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
    <script>var contextPath = "${pageContext.request.contextPath}";</script>
   <script>
   function check(){

	   var keyword = document.getElementById('searchWord');
	   if( keyword.value == '' || keyword.value == null ){
	       alert( '검색어를 입력해주세요' );
	       return false;
	   }
	   var blank_pattern = /^\s+|\s+$/g;
	   if( keyword.value.replace( blank_pattern, '' ) == "" ){
	       alert(' 공백만 입력되었습니다 ');
	       return false;
	   }
	   //공백 금지
	   //var blank_pattern = /^\s+|\s+$/g;(/\s/g
	   var blank_pattern = /[\s]/g;
	   if( blank_pattern.test( keyword.value) == true){
	       alert(' 공백은 사용할 수 없습니다. ');
	       return false;
	   }
	   var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
	   if( special_pattern.test(keyword.value) == true ){
	       alert('특수문자는 사용할 수 없습니다.');
	       return false;
	   }
	   var category = $("select[name='category']").val();
	   var keyword = $("input[name='keyword']").val();
	   $.ajax({
	         url: contextPath + "/community/CommunitySearch.ct?category="+category+"&keyword="+keyword,
	         type:"get",
	         dataType:"json",
	         success: showResults
	      })
	   
	   }
   function showResults(results){
	   
	   var temp = "";
		
		if(results != null && results.length != 0){
			$.each(results, function(index, result){
				temp += "<tr align='center' valign ='middle'>";
				temp += "<td height='23'>"+result.community_num+"</td>"
				temp += "<td width='50%'><div align='center'>"
				temp += "<a href='${pageContext.request.contextPath}/community/CommunityView.ct?seq="+result.community_num+"'>"
				temp += result.community_title+"</a></div></td>"
				temp += "<td width= 14%>"
				temp += "<div align='center'>"+result.community_id+"</div></td>"
				temp += "<td width= 17%>"
				temp += "<div align='center'>"+result.community_date+"</div></td>"
				temp += "<td width= 11%>"
				temp += "<div align='center'>"+result.readcount+"</div></td></tr>"
			})
		$('#communityBoard').empty();
		$('#communityBoard').append(temp);
		}else{
			alert('검색조건에 해당하는 값이 없습니다!');
			return false;
		}   
   }
   </script>
</html>