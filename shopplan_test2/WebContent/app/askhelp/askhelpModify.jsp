<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
<title>문의</title>
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
		<a href="login.jsp">Login</a> <a href="join.jsp">Sign Up</a> <a
			href="#menu">Menu</a>
	</header>


	<!-- Menu -->
	<nav id="menu">
		<ul class="links">
			<li><a href="index.jsp">Home</a></li>
			<li><a href="ask.jsp">ask</a></li>
			<li><a href="help.jsp">help</a></li>
			<li><a href="professional_ask.jsp">professional ask</a></li>
			<li><a href="interior_guide.jsp">interior guide</a></li>
			<li><a href="interior_layout.jsp">interior layout</a></li>
			<li><a href="community.jsp">Community</a></li>
			<li><a href="review.jsp">review</a></li>
			<li><a href="mypage.jsp">Mypage</a></li>
		</ul>
	</nav>

		<c:set var="askhelpBean" value="${requestScope.askhelpBean}"/>
		<center>
	<%--		<c:if test="${session_id eq null}">
				<script>
					alert("로그인 후 이용해주세요");
					location.replace("${pageContext.request.contextPath}/member/MemberLogin.me");
				</script>
			</c:if>
			<table border="0" cellpadding="0" cellspacing="0" width="900px" >
				<tr align="right" valign="middle">
					<td>
						${session_id} 님 환영합니다.
						<a href="${pageContext.request.contextPath}/user/UserLogOut.us">로그아웃</a>
					</td>
				</tr>
			</table>
			<br /> --%>
			<br />
			
			<!-- 게시판 수정 -->
			<form action="${pageContext.request.contextPath}/askhelp/AskhelpModifyOk.he" method="post" name="modifyForm" enctype="multipart/form-data">
				<input type="hidden" name="seq" value="${askhelpBean.getAskhelp_num()}">
				<table width="900px" border="0" cellpadding="0" cellspacing="0">
					<tr align="center" valign="middle">
						<td><h3>수정 게시판</h3></td>
					</tr>
				</table>
				
				<table class="table table-striped" style="text-align: enter; border: 1px solid #dddddd;">
					<tr height="30px">
						<td align="center" width="150px">
							<div align="center">제 목</div>
						</td>
						<td style="padding-left:10px;">
							<input name="askhelp_title" type="text" size="50" maxlength="100" value="${askhelpBean.getAskhelp_title()}" />
						</td>
					</tr>
					<tr height="30px">
						<td align="center" width="150px">
							<div align="center">글쓴이</div>
						</td>
						<td style="padding-left:10px;">
							<input name="askhelp_id" type="text" size="10" maxlength="10" value="${session_id}" readonly/>
						</td>
					</tr>
					<tr height="200px">
						<td align="center" width="150px">
							<div align="center">내 용</div>
						</td>
						<td style="padding-left:10px;">
							<textarea name="askhelp_content" style="width:1200px; height:185px; resize:none;">${askhelpBean.getAskhelp_content()}</textarea>
						</td>
					</tr>
				
				</table>
				
				<table border="0" cellpadding="0" cellspacing="0" width="900px">
					<tr align="right" valign="middle">
						<td>
							<a href="javascript:modifyBoard()">[수정]</a>&nbsp;&nbsp;
							<a href="${pageContext.request.contextPath}/askhelp/AskhelpList.he">[목록]</a>&nbsp;&nbsp;
						</td>
					</tr>
				</table>
			</form>
			<!-- 게시판 수정 -->
		</center>
	</body>
	<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="//code.jquery.com/jquery-migrate-1.2.1.js"></script>
	<script>
		function modifyBoard(){
			modifyForm.submit();
		}
	</script>
</html>