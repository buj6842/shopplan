<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<title>전문가 회원가입</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=1" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/app/user/assets/css/main.css"  />
	</head>
	<body class="is-preload">

		            <!-- Header -->
         <header id="header">
            <h1><a href="index.jsp">#Plan</a></h1>
            <a href="expert/exlogin.jsp">Login</a>
            <a href="expert/exjoin.jsp">Sign Up</a>
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
			<p></p>
				<section class="wrapper"style="text-align:center">
					<div class="inner" >
					<h2>UPLOAE FILE </h2>
					<hr></hr>
					</div>
				
			<c:set var="exBean" value="${requestScope.exBean}"/>
            <c:set var="filesBeanExList " value="${requestScope.filesBeanExList }"/> 
            <!--<input type="hidden" value="${requestScope.exBean}" name="test"> -->
            
         
         <c:if test="${session_ex_id ne null}">
            ${session_ex_id}님  
            
            
				<form action="${pageContext.request.contextPath}/expert/ExpertModifyOk.ex"  name="modifyForm"  method="post"  enctype="multipart/form-data">
				<input type="hidden" name="ex_num" value="${exBean.getEx_num()}">
				
				<p style="text-align: center;">수정할 파일을 업로드 해주세요.</p>
				<div class="box" style="width: 40%; height: auto; margin:0 auto;">
				
				<table>
					<p style="text-align: center; margin-bottom:10px;">사업자등록증</p>
					<tr>
					<div class="row gtr-uniform"style="display:contents;">
					<div class="col-4 col-12-small" style="margin:auto;     padding-top:0px;">
				
					<td><input type="file"  name="ex_tbl_expert"  style="margin:auto; width:100%;"/></td>
					
					<td><input type="button" onclick="cancleFile('ex_tbl_expert')" value="첨부 삭제"></td>
					</div>
					</div>
					</tr>
				</table>
						
					<p></p>	
				
				<table>
						<p style="text-align: center; margin-bottom:10px;">명함 및 업체 홍보 파일</p>
						<tr>
						<div class="row gtr-uniform"style="display:contents;">
						<div class="col-4 col-12-small" style="margin:auto;     padding-top:0px;">
						<td><input type="file"  name="ex_tbl_expert_files"  style="margin:auto; width:100%;"/></td>
						<td><input type="button" onclick="cancleFile('ex_tbl_expert_files')" value="첨부 삭제"></td>
						</div>
						</div>
						</tr>
				</table>	
				
						
			</div>	
			<br>
						<div class="col-3 col-12-small" style="margin: 0 auto; padding-bottom:30px">
						<ul class="actions stacked" >
						<a href ="javascript:modifyEx();" class="button primary fit" style="margin:auto; width:40%;">파일 수정하기</a>
						</ul>
						</div>
			
				</c:if>		
				
			</form>
			</section>				
						
		<!-- Footer
			<footer id="footer">
				<div class="inner">
				</div>
			</footer> -->
		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/app/user/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/app/user/assets/js/jquery.scrolly.min.js"></script>
			<script src="${pageContext.request.contextPath}/app/user/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/app/user/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/app/user/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/app/user/assets/js/main.js"></script>
			<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
			<script src="//code.jquery.com/jquery-migrate-1.2.1.js"></script>
			
			<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
			<script>var contextPath = "${pageContext.request.contextPath}";</script>
			<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
			
			<script src="${pageContext.request.contextPath}/app/expert/exjoin.js"></script>
	
			<script> function modifyEx(){modifyForm.submit(); }  	</script>
			<script>
						function cancleFile(fileTagName){
							if($.browser.msie){	//ie일 때 초기화
							$("input[name='"+ fileTagName +"']").replaceWith($("input[name='"+ fileTagName +"']").clone(true));
								}else{ //그 외 브라우저일 때 초기화
							$("input[name='"+ fileTagName +"']").val("");
								}
							}	
			</script>
			
			
	</body>
</html>