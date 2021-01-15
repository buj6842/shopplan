<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
	  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <!-- <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=1" /> -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/app/user/assets/css/main.css" />
	  <title>Insert title here</title>
	</head>

<body class="is-preload">
            <!-- Header -->
         <header id="header">
            <h1><a href="index.jsp">#Plan</a></h1>
            <a href="login.jsp">Login</a>
            <a href="join.jsp">Sign Up</a>
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
        <c:if test="${session_id eq null}">
         <script>
            alert("로그인 후 이용해주세요");
            location.replace("${pageContext.request.contextPath}/user/UserLogin.us");
         </script>
      	</c:if> 
      <c:set var="list" value="${requestScope.askhelpList }"/>
      <c:set var="nowPage" value="${requestScope.nowPage }"/>
      <c:set var="startPage" value="${requestScope.startPage }"/>
      <c:set var="endPage" value="${requestScope.endPage }"/>
      <c:set var="totalCnt" value="${requestScope.totalCnt}"/>
      <c:set var="realEndPage" value="${requestScope.realEndPage }"/>
      <%-- <center> --%>
		<table border="0" cellpadding="0" cellspacing="0" width="900px" >
            <tr align="right" valign="middle">
               <td>
                  ${session_id} 님 환영합니다.
                  <a href="${pageContext.request.contextPath}/user/UserLogOut.us">로그아웃</a>
               </td>
            </tr>
         </table>
         <br />
         <br /> 
         <article id="main">
            <section class="wrapper">
               <div class="inner" style="text-align:center">
                  <h2>HELP</h2>
                  <span>사이트 이용문의 게시판입니다.</span>
                  <br>
                  <br>
                  <div class="table-wrapper"> 

	   <!--  <div class="container">
	    	<div class="row">
	    		<table class="table table-striped" width="900px" style="text-align: center; border: 1px solid #ddddd" id="askhelpBoard">
	    			<thead>
	    				<tr>
	    					<th style="background-color: #eeeeee; text-align:center;">번호</th>
	    					<th style="background-color: #eeeeee; text-align:center;">제목</th>
	    					<th style="background-color: #eeeeee; text-align:center;">작성자</th>
	    					<th style="background-color: #eeeeee; text-align:center;">작성일</th>
	    					<th style="background-color: #eeeeee; text-align:center;">조회수</th>
	    				</tr>
	    			</thead>
	    	
	    			<c:choose>
					<c:when test="${list != null and fn:length(list) > 0}">
						<c:forEach var="ask" items="${list}">
							<tr align="center" valign="middle" onmouseover="this.style.backgroundColor='F8F8F8'" onmouseout="this.style.backgroundColor=''">
								<td height="30" style="font-family:Tahoma;font-size:10pt;">
									${ask.getAskhelp_num()}
								</td>
								
								<td style="font-family:Tahoma;font-size:10pt;">
									<div align="center">
										<a href="${pageContext.request.contextPath}/askhelp/AskhelpView.he?seq=${ask.getAskhelp_num()}">${ask.getAskhelp_title()}</a>
									</div>
								</td>
								<td>
									<div align="center">${ask.getAskhelp_id()}</div>
								</td>
								<td>
									<div align="center">${ask.getAskhelp_date()}</div>
								</td>	
								<td>
									<div align="center">${ask.getReadCount()}</div>
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
				</table> -->
			<table border="1" cellpadding="0" cellspacing="0" width="900px" id="askhelpBoard" >
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
               <c:forEach var="askhelpbean" items="${list}">
                  <tr align="center" valign="middle" onmouseover="this.style.backgroundColor='F8F8F8'" onmouseout="this.style.backgroundColor=''">
                     <td height="23" style="font-family:Tahoma;font-size:10pt;">
                        ${askhelpbean.getAskhelp_num()}
                     </td>
                     
                     <td style="font-family:Tahoma;font-size:10pt;">
                        <div align="left">
                        <a href="${pageContext.request.contextPath}/askhelp/AskHelpView.he?seq=${askhelpbean.getAskhelp_num()}">${askhelpbean.getAskhelp_title()}</a>
                        </div>
                     </td>
                     <td>
                        <div align="center">${askhelpbean.getAskhelp_id()}</div>
                     </td>
                     <td>
                        <div align="center">${askhelpbean.getAskhelp_date()}</div>
                     </td>   
                     <td>
                        <div align="center">${askhelpbean.getReadCount()}</div>
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
						<c:when test="${nowPage > 1}">
							<a href="${pageContext.request.contextPath}/askhelp/AskhelpList.he?page=${nowPage - 1}">이전</a>&nbsp;
						</c:when>
					</c:choose>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:choose>
							<c:when test="${i eq nowPage}">
								[${i}]&nbsp;
							</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath}/askhelp/AskhelpList.he?page=${i}">${i}&nbsp;</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${nowPage != realEndPage}">
							<a href="${pageContext.request.contextPath}/askhelp/AskhelpList.he?page=${nowPage + 1}">[다음]</a>&nbsp;
						</c:when>
					</c:choose>
					</td>
				</tr>
			</table>
	    	<table border="0" cellpadding="0" cellspacing="0" width="900px">
				<tr align="right" valign="middle">
					<td><a href="${pageContext.request.contextPath}/askhelp/AskhelpWrite.he" class="button">글쓰기</a></td>
				</tr>
			</table>
			
			<table border="0" cellpadding="0" cellspacing="0" width="900px">
         		<tr>
                	<td width="16%" height="26">
                          <select name='category' style="width:100%"> 
	                          <option value='askhelp_title'>제목</option>
	                          <option value='askhelp_id'>아이디</option>
	                          <option value='askhelp_content'>내용</option>
                          </select>
                   </td>
                   <td colspan="3">
            			<input type="text" name="keyword" id="searchWord" value="" style="width:100%"/>
                   </td>
                   <td>
                   		<input type="button" value="검색" onclick="check()"/>
                   </td> 
                               
              </tr>
         </table> 
      
			
	    		
	    	</div>
	    </div> 
	    
	    

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
   		var contextPath = "${pageContext.request.contextPath}";
   	   function test(){
   		   alert("test");
   	   }
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
	            url: contextPath + "/askhelp/AskhelpSearch.he?category="+category+"&keyword="+keyword,
	            type:"get",
	            dataType:"json",
	            success: showResults
	      })
		  alert('실행');
	      
	   }
	   function showResults(results){
	      alert('show result실행');
	      var temp = "";
	      
	      if(results != null && results.length != 0){
	      	alert('show result 실행2');
	         $.each(results, function(index, result){
	            temp += "<tr align='center' valign ='middle'>";
	            temp += "<td height='23'>"+result.askhelp_num+"</td>"
	            temp += "<td width='50%'><div align='center'>"
	            temp += "<a href='${pageContext.request.contextPath}/askhelp/AskhelpView.he?seq="+result.askhelp_num+"'>"
	            temp += result.askhelp_title+"</a></div></td>"
	            temp += "<td width= 14%>"
	            temp += "<div align='center'>"+result.askhelp_id+"</div></td>"
	            temp += "<td width= 17%>"
	            temp += "<div align='center'>"+result.askhelp_date+"</div></td>"
	            temp += "<td width= 11%>"
	            temp += "<div align='center'>"+result.askhelp_readcount+"</div></td></tr>"
	         })
	      $('#askhelpBoard').empty();
	      $('#askhelpBoard').append(temp);
	      //$('#askhelpBoard').show();
	      console.log(temp);
	      alert('show result 실행3');
	     }
	     
	     else{
	         alert('검색조건에 해당하는 값이 없습니다!');
	         return false;
	     }   
	  }
   </script> 
   
</html>