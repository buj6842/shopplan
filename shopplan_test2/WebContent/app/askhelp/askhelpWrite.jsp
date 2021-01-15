<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
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


	<!-- Main -->
	<article id="main">
		<section class="wrapper">
			<div class="inner" style="text-align: center">
				<h2>Help</h2>
				<span>질문과 답변 게시판입니다.</span> <br> <br>
				<div class="table-wrapper">
					<%--<form method="post" action="helpWriteAction.jsp">--%>
					<form action="${pageContext.request.contextPath}/askhelp/AskhelpWriteOk.he" method="post" enctype="multipart/form-data" name="askhelpform">
						<table>
							<thead>
								<tr>
									<th colspan="1">사이트 문의글쓰기</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" class="form-control"
										placeholder="글 제목" name="askhelp_title" maxlength="50"></td>
								</tr>
								<tr>
									<td><input type="text" class="form-control"
										placeholder="글쓴이" name="askhelp_id" maxlength="50" value="${session_id}"></td>
								</tr>
								<tr>
									<td><textarea class="form-control" placeholder="글 내용"
											name="askhelp_content" maxlength="3000" style="height: 350px;"></textarea></td>
								</tr>
						<table border="0" cellpadding="0" cellspacing="0" width="900px">
							<tr align="right" valign="middle">
						<td>
							<a href="javascript:addboard()"> <input type="submit" value="저장"> </a>
							<a href="${pageContext.request.contextPath}/askhelp/AskhelpList.he"> <input type="submit" value="목록으로"> </a>
						</td>
							</tr>
						</table>
							</tbody>
						</table>
						
					</form>

					<s_paging>
					<div class="paging">
						<a href="#" class="[##_no_more_prev_##]">
						<span>◀ </span></a> 
						<span class="numbox"> 
							<s_paging_rep> 
								<a href="#" class="num"> 1</a> 
								<a href="#" class="num"> 2</a> 
								<a href="#" class="num"> 3</a> 
								<a href="#" class="num"> 4</a> 
								<a href="#" class="num"> 5</a> 
							</s_paging_rep>
						</span> 
						<a href="#" class="[##_no_more_next_##]">
						<span> ▶</span></a>
					</div>
					</s_paging>
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
	function addboard(){
		boardform.submit();
	}
</script>
</html>