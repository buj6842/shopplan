<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=1" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/app/user/assets/css/main.css" />
<title>Insert title here</title>
</head>
<body>
 <body class="is-preload">
 	<c:set var="communityBean" value="${requestScope.communityBean}"/>
	<c:set var="replyBeanList" value="${requestScope.replyBeanList}"/>
	<c:set var="communityFilesBeanList" value="${requestScope.communityFilesBeanList}"/>
         <header id="header">
            <h1><a href="index.jsp">#Plan</a></h1>
            <!-- 로그인 하지 않았을 때 -->
         	<c:if test="${session_id eq null}">
            <a href="${pageContext.request.contextPath}/user/UserLogin.us">Login</a>
            <a href="${pageContext.request.contextPath}/user/SignUp.us">Sign Up</a>
            <script>alert('로그인 후 이용가능합니다.')
        	location.href="${pageContext.request.contextPath}/user/UserLogin.us"
            </script>
            <!-- 로그인 했을 때 -->
			</c:if>
			<c:if test="${session_id ne null}">
			<a href="${pageContext.request.contextPath}/user/UserUpdate.us">${session_id}</a>님 환영합니다			
			<a href="${pageContext.request.contextPath}/user/UserLogOut.us">Logout</a>
			
			
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
					<h2>사이트 커뮤니티 게시판입니다</h2>
                  <br>
                  <br>
                  <div class="table-wrapper">
				<table width="900px" border="1" cellpadding="0" cellspacing="0">
				<tr height="30px">
					<td align="center" width="150px">제 목</td>
					<td style="padding-left:10px;">${communityBean.getCommunity_title()}</td>
				</tr>
				
				<tr height="30px">
					<td  align="center" width="150px">아이디</td>
					<td style="padding-left:10px;">${communityBean.getCommunity_id()}</td>
				</tr>
				
				<tr height="200px">
					<td align="center" width="150px">내 용</td>
					<td valign="top" style="padding-top:10px; padding-left:10px;">${communityBean.getCommunity_content()}</td>
				</tr>
				
				<tr height="30px">
					<td align="center">첨부파일</td>
					<c:if test="${communityFilesBeanList != null}">
						<td>
							<c:forEach var="file" items="${communityFilesBeanList}">
								<a href="${pageContext.request.contextPath}/community/CommunityFileDownload.ct?file_name=${file.getCommunity_file_name()}">${file.getCommunity_file_name()}</a>
							</c:forEach>
						</td>
					</c:if>

				</tr>
			</table>
			
			<table width="900px" border="0" cellpadding="0" cellspacing="0">
				<tr align="right" valign="middle">
					<td>
						<c:if test="${communityBean.getCommunity_id() eq session_id}">
							<a href="${pageContext.request.contextPath}/community/CommunityModify.ct?seq=${communityBean.getCommunity_num()}">[수정]</a>&nbsp;&nbsp;
							<a href="javascript:deleteCommunity()">[삭제]</a>&nbsp;&nbsp;
						</c:if>
						<a href="${pageContext.request.contextPath}/community/CommunityList.ct">[목록]</a>&nbsp;&nbsp;
					</td>
				</tr>
			</table>
 			<form action="${pageContext.request.contextPath}/community/CommunityDeleteOk.ct" method="post" name="communityForm">
 				<input type="hidden" name="seq" value="${communityBean.getCommunity_num()}"/>
 			</form>
 			
 			<!-- 댓글 -->
 			<form action="${pageContext.request.contextPath}/community/CommunityReplyOk.ct" method="post" name="boardReply">
 				<input type="hidden" name="seq" value="${communityBean.getCommunity_num()}">
 				<table>
 					<tr>
 						<td align="center" width="80px">
 							<div align="center">댓 글</div>
 						</td>
 						<td>
 							<textarea name="content" style="width:750px; height:85px; resize:none" ></textarea>
 							<a href="javascript:comment()">[등록]</a>
 						</td>
 					</tr>
 					<c:choose>
 						<%-- 댓글이 한 개라도 있을 때 --%>
	 					<c:when test="${replyBeanList != null and fn:length(replyBeanList) > 0 }">
	 						<c:set var="i" value="${0}"/>
		 					<c:forEach var="reply" items="${replyBeanList}">
			 					<%-- 매 반복마다 i를 1씩 증가시키고, i가 각 댓글의 구분점이 되도록 구현한다. --%>
		 						<c:set var="i" value="${i+1}"/>
			 					<tr>
			 						<%-- 작성자 --%>
			 						<td align="center" width="150px">${reply.getUser_id()}</td>
			 						
			 						<%-- 댓글 내용 --%>
			 						<td>
			 							<%-- 
			 								id는 readonly속성 삭제 및 복구 구현을 위해 사용하고,
			 								name은 컨트롤러에서 파라미터로 접근하기 위해 사용한다.
			 							--%>
			 							<textarea id="${i}" name="reply_content${i}" class="re" style="width:750px; height:85px; resize:none" readonly>${reply.getCommunity_reply_content()}</textarea>
			 							<c:if test="${session_id eq reply.getUser_id()}">
				 							<%-- 수정 버튼 클릭 시 수정 완료버튼이 나타나고, 수정중인 댓글이 있을 때에는 다른 댓글은 수정할 수 없도록 구현 --%>
				 							<a id="ready${i}" style="display:inline" href="javascript:updateReply(${i})">[수정]</a>
				 							<a id="ok${i}" style="display:none;" href="javascript:updateOkReply(${reply.getCommunity_reply_num()}, ${i})">[수정 완료]</a>
				 							<a href="${pageContext.request.contextPath}/community/CommunityReplyDeleteOk.ct?reply_num=${reply.getCommunity_reply_num()}&seq=${communityBean.getCommunity_num()}">[삭제]</a>
				 						</c:if>
			 						</td>
			 					</tr>
		 					</c:forEach>
	 					</c:when>
	 					<c:otherwise>
	 						<tr align="center">
	 							<td align="center" width="150px" colspan="2">댓글이 없습니다.</td>
	 						</tr>
	 					</c:otherwise>
 					</c:choose>
 				</table>
 			</form>
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
			</c:if>
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
		function deleteCommunity(){
			communityForm.submit();
		}
	</script>
	<script>
		var check = false;
		function cancleFile(fileTagName){
			if($.browser.msie){	//ie일 때 초기화
				$("input[name='"+ fileTagName +"']").replaceWith($("input[name='"+ fileTagName +"']").clone(true));
			}else{ //그 외 브라우저일 때 초기화
				$("input[name='"+ fileTagName +"']").val("");
			}
		}	
		//댓글 추가
		function comment(){
			var textarea = $("textarea[name='content']").val();
			
			if(textarea == ""){
				alert("댓글을 작성해주세요.")
				return false;
			}
			
			boardReply.submit();
		}
		
		//수정
		function updateReply(num){
			//textarea 객체(readonly 삭제)
			//수정 버튼(숨기기)
			//수정 완료 버튼(나타내기)
			
			var textarea = $("textarea#" + num);
			var modify_ready_a = $("a#ready" + num);
			var modify_ok_a = $("a#ok" + num);
			
			if(!check){
				textarea.removeAttr("readonly");
				modify_ready_a.hide();
				modify_ok_a.show();
				check = true;
			}else{
				alert("수정중인 댓글이 있습니다.");
			}
		}
		
		//수정 완료
		function updateOkReply(reply_num, num){
			//댓글 번호, 게시글 번호, 댓글 식별자를 외부에서 전달받는다.
			
			//댓글 요소들이 모여있는 form태그의 action 속성 값을 변경한 후 submit 해준다.
			//$("form[name='boardReply']").attr("method", "get");
			$("form[name='boardReply']").attr("action", "${pageContext.request.contextPath}/community/CommunityReplyModifyOk.ct?reply_num="+reply_num+"&num="+num);
			
			boardReply.submit();
		}
	</script>
</html>