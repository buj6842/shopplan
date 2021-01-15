<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
   Tactile by Pixelarity
   pixelarity.com | hello@pixelarity.com
   License: pixelarity.com/license
-->
<html>
<head>
<title>질문과 답변</title>

<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=1" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/app/user/assets/css/main.css" />
</head>
<body class="is-preload">
	<!-- Header -->
	<header id="header">
		<h1>
			<a href="index.jsp">#Plan</a>
		</h1>
		<a href="login.jsp">Login</a> <a href="join.jsp">Sign Up</a> 
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
			<li><a href="mypage.jsp">Mypage</a></li>
		</ul>
	</nav>
	<c:set var="askhelpbean" value="${requestScope.askhelpbean}"/>
	<c:set var="replyBeanList" value="${requestScope.replyBeanList}"/>
		<center>
  		<c:choose>
			<c:when test="${session_id eq null}">
			<script>
				alert("로그인 후 이용해주세요");
				location.replace("${pageContext.request.contextPath}/user/UserLogin.us");
			</script>
			</c:when>
			<c:otherwise>
			<table border="0" cellpadding="0" cellspacing="0" width="900px" >
				<tr align="right" valign="middle">
					<td>
						${session_id} 님 환영합니다.
						<a href="${pageContext.request.contextPath}/user/UserLogOut.us">로그아웃</a>
					</td>
				</tr>
			</table>
			</c:otherwise>
		</c:choose> 

	<!-- Main -->
	<article id="main">
		<section class="wrapper">
			<div class="inner" style="text-align: center">
				<h2>HELP</h2>
				<span>질문과 답변 게시판입니다.</span> 
				<div class="table-wrapper">
					<table class="table table-striped" style="text-align: enter; border: 1px solid #dddddd;">
						<thead>
							<tr>
								<th style="background-color: #eeeeee; text-align: center;"></th>
							</tr>
						</thead>
						<tbody>
							<tr height="30px">
								<td align="center" width="150px">제 목</td>
								<td style="padding-left:10px;">${askhelpbean.getAskhelp_title()}</td>
							</tr>
							<tr height="30px">
								<td  align="center" width="150px">작성자</td>
								<td style="padding-left:10px;">${askhelpbean.getAskhelp_id()}</td>
							</tr>
							<tr>
								<td>작성일자</td>
								<td colspan="2">${askhelpbean.getAskhelp_date()}</td>
							</tr>
							<tr height="200px">
								<td align="center" width="150px">내 용</td>
								<td valign="top" style="padding-top:10px; padding-left:10px;">${askhelpbean.getAskhelp_content()}</td>
							</tr>
						</tbody>
					</table>
					<table width="900px" border="0" cellpadding="0" cellspacing="0">
						<tr align="right" valign="middle">
							<td>
								<c:if test="${askhelpbean.getAskhelp_id() eq session_id}">
									<a href="${pageContext.request.contextPath}/askhelp/AskhelpModify.he?seq=${askhelpbean.getAskhelp_num()}" class ="button">수정</a>&nbsp;&nbsp;
									<a href="javascript:deleteBoard()" class = "button">삭제</a>&nbsp;&nbsp;
								</c:if>
								<a href="${pageContext.request.contextPath}/askhelp/AskhelpList.he" class = "button">목록</a>&nbsp;&nbsp;
							</td>
						</tr>
					</table>
 			<form action="${pageContext.request.contextPath}/askhelp/AskhelpDeleteOk.he" method="post" name="boardForm">
 				<input type="hidden" name="seq" value="${askhelpbean.getAskhelp_num()}"/>
 			</form>
					<%-- <a href="ask2List.jsp"><input type="submit" value="목록"></a> --%>
					<%--
					//	if (userID != null && userID.equals(help.getUserID())) {
						
					<a href="helpUpdate.jsp?helpID=<%=helpID%>"> <input type="submit" value="수정"> </a> --%>
					
			<!-- 댓글 -->
 			<form action="${pageContext.request.contextPath}/askhelp/AskhelpReplyOk.he" method="post" name="boardReply">
 				<input type="hidden" name="seq" value="${askhelpbean.getAskhelp_num()}">
 				<table>
 					<tr>
 						<td align="center" width="150px">
 							<div align="center">댓글</div>
 						</td>
 						<td>
 							<textarea name="content" style="width:1100px; height:85px; resize:none" ></textarea>
 							<a href="javascript:comment()"><input align="right" type="submit" value="등록"></a>
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
			 							<textarea id="${i}" name="reply_content${i}" class="re" style="width:750px; height:85px; resize:none" readonly>${reply.getReply_content()}</textarea>
			 							<c:if test="${session_id eq reply.getUser_id()}">
				 							<%-- 수정 버튼 클릭 시 수정 완료버튼이 나타나고, 수정중인 댓글이 있을 때에는 다른 댓글은 수정할 수 없도록 구현 --%>
				 							<a id="ready${i}" style="display:inline" href="javascript:updateReply(${i})">[수정]</a>
				 							<a id="ok${i}" style="display:none;" href="javascript:updateOkReply(${reply.getHelpreply_num()}, ${i})">[수정 완료]</a>
				 							<a href="${pageContext.request.contextPath}/askhelp/AskhelpReplyDeleteOk.he?reply_num=${reply.getHelpreply_num()}&seq=${askhelpbean.getAskhelp_num()}">[삭제]</a>
				 						</c:if>
			 						</td>
			 					</tr>
		 					</c:forEach>
	 					</c:when>
	 					<c:otherwise>
	 						<%--<tr align="center">
	 							<td align="center" width="150px" colspan="2">댓글이 없습니다.</td>
	 						</tr>--%>
	 					</c:otherwise>
 					</c:choose>
 					<tr align="right" valign="middle">
					
 				</table>
 				<s_paging>
					<div class="paging">
						<a href="#" class="[##_no_more_prev_##]"><span>◀ </span></a> 
						<span class="numbox"> 
							<s_paging_rep> 
								<a href="#" class="num"> 1</a> 
								<a href="#" class="num"> 2</a> 
								<a href="#" class="num"> 3</a> 
								<a href="#" class="num"> 4</a> 
								<a href="#" class="num"> 5</a> 
							</s_paging_rep>
						</span> 
						<a href="#" class="[##_no_more_next_##]"><span> ▶</span></a>
					</div>
				</s_paging>
 			</form>
		</center>
	</body>
		<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
		<script>
			var check = false;
		
			autosize($("textarea.re"));
		
			function deleteBoard(){
				boardForm.submit();
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
				$("form[name='boardReply']").attr("action", "${pageContext.request.contextPath}/askhelp/AskhelpReplyModifyOk.he?reply_num="+reply_num+"&num="+num);
				
				boardReply.submit();
			}
			
		</script>
					<%-- <a onclick="return confirm('정말로 삭제하시겠습니까?');"
						href="helpDeleteAction.jsp?helpID=<%=helpID%>"> <input type="submit" value="삭제"> </a> --%>
					<%
					//	}
						%>
					
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
					<li class="icon solid fa-home">13rd<br />12<br /> Teheran-ro
						26-gil<br />Gangnam-gu<br />Seoul<br />Republic of Korea
					</li>
				</ul>
			</section>
		</div>
		<div class="copyright">
			<p>&copy; Untitled Corp. All rights reserved.</p>
		</div>
	</footer>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script>
	$(function() {
		$("#postcodify_search_button").postcodifyPopUp();
	});
</script>
</html>