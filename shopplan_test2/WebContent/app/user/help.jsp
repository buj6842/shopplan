<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ page import="help.HelpDAO"%>
<%@ page import="help.Help"%>
<%@ page import="java.util.ArrayList"%> --%>
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
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<style type="text/css">
	a, a:hover{
	color : #000000;
	text-decoration: none;
	}
</style>
<body class="is-preload">
	<%-- <%
	int pageNumber = 1;
	%> --%>
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
				<h2>
					HELP
					</h3>
					<span>문의 게시판입니다.</span> 
					<div class="table-wrapper">
						<table>
							<thead>
								<tr>
									<th>ID</th>
									<th>Title</th>
									<th>views</th>
									<th>Date</th>
									<th>Like</th>
								</tr>
							</thead>
							<%-- <tbody>
                                       <tr>
                                          <td>abd1234</td>
                                          <td><a href="helpView.jsp">이용문의 문의드려요.</td>
                                          <td>35</td>
                                          <td>2020-12-01</td>
                                          <td>5</td>
                                       </tr>
                            </tbody> --%>
							<tbody>
							<%-- 	<%
								HelpDAO helpDAO = new HelpDAO();
								ArrayList<Help> list = helpDAO.getList(pageNumber);

								for (int i = 0; i < list.size(); i++) {
								%>
								<tr>
									<td><%=list.get(i).getHelpID()%></td>
									<td><a href="helpView.jsp?helpID=<%=list.get(i).getHelpID()%>"><%=list.get(i).getHelpTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
		.replaceAll("\n", "<br>")%></a></td>
									<td> 0 </td>
									<td><%=list.get(i).getHelpDate().substring(0, 11) + list.get(i).getHelpDate().substring(11, 13) + " 시 "
		+ list.get(i).getHelpDate().substring(14, 16) + " 분"%></td>
									<td> 0 </td>
								</tr>
								<%
								}
								%> --%>
							</tbody>
						</table>
						<a href="${pageContext.request.contextPath}/askhelp/AskHelpWrite.hp" class="button">글쓰기  </a>
						<s_paging>
						<div class="paging">
							<a href="#" class="[##_no_more_prev_##]"><span>◀ </span></a> <span
								class="numbox"> <s_paging_rep> <a href="#"
									class="num"> 1</a> <a href="#" class="num"> 2</a> <a href="#"
									class="num"> 3</a> <a href="#" class="num"> 4</a> <a href="#"
									class="num"> 5</a> </s_paging_rep>
							</span> <a href="#" class="[##_no_more_next_##]"><span> ▶</span></a>
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
	$(function() {
		$("#postcodify_search_button").postcodifyPopUp();
	});
</script>
</html>