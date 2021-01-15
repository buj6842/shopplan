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
      <title>전문가 마이페이지</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=1" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/app/user/assets/css/main.css" />
   </head>
   <body class="is-preload">
         
            
                <!-- Header -->
         <header id="header">
            <h1><a href="${pageContext.request.contextPath}/app/user/index.jsp">#Plan</a></h1>
            <a href="#menu">Menu</a>
            <p></p>
            <c:if test="${session_ex_id eq null}">
            <p style="text-align:center;">로그인 후 확인 가능합니다. 로그인 해주세요.</p>
            </c:if>
            <br>
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
            <section class="wrapper">
               <div class="inner" style="text-align:center">
                  <div class="box">
                  <h3 >Expert Page</h3>
                  <div style="border:1">
                  
            <c:set var="exBean" value="${requestScope.exBean}"/>
            <c:set var="filesBeanExList " value="${requestScope.filesBeanExList }"/> 
            <!--<input type="hidden" value="${requestScope.exBean}" name="test">-->
            
         
         <c:if test="${session_ex_id ne null}">
            ${session_ex_id}님 환영합니다!   
         
                  <br><br>
                          
                 
                  <form id="updateExform" method="post" action="${pageContext.request.contextPath}/expert/ExpertUpdateOk.ex">
                  <p>
                     비밀번호 변경 
                  <br>
                  <!--<input type="password" name = "ex_pw" style="width:40%;margin:0 auto" >  -->
                   <input type="password" value="${exBean.getEx_pw()}" name = "ex_pw" style="width:40%;margin:0 auto" >
                  </p>
                  
                   <p>
                     관리자 이름 변경 
                  <br>
                  <input type="text" value="${exBean.getEx_expert_name()}" name = "ex_expert_name" style="width:40%;margin:0 auto" >
                  </p>
              
                  <p>
                    이메일
                  <br>
                  <input type="text" value="${exBean.getEx_email()}" name="ex_email" style="width:40%;margin:0 auto" >
                  </p>
                  <p>
                  핸드폰번호
                  <br>
                  <input type="text" value="${exBean.getEx_phone_num()}" name="ex_phone_num"style="width:40%;margin:0 auto" >
                  </p>
                <p></p>
            <br>

            
            
            <table style="width:40%; margin:auto;">
               <p style="text-align: center;">첨부파일</p>
            <tr>
          		<c:if test ="${filesBeanExList != null }">
              	<td>
                  <c:forEach var="file" items="${filesBeanExList}">
                     <a href="${pageContext.request.contextPath}/expert/FileDownload.ex?file_name=${file.getFile_name_ex()}">${file.getFile_name_ex()}</a>
                  </c:forEach>
				 </td>
				</c:if>
					
				</tr>
		
				<tr>
               <td>
               <c:if test="${exBean.getEx_id() eq session_ex_id }">
             	  <a href="${pageContext.request.contextPath}/expert/ExpertModify.ex?ex_num=${exBean.getEx_num()}">[수정]</a>&nbsp;&nbsp;
             	  <!--  <a href="${pageContext.request.contextPath}/expert/ExpertDeleteOk.ex?ex_num=${exBean.getEx_num()}">[삭제]</a>&nbsp;&nbsp;-->
			  	  <a href="javascript:deleteEx()">[삭제]</a>
               </c:if>
               </td>
               </tr>
                <!--<input type="button" onclick="javascript:deleteExFile()"  class="button primary fit"  style="margin-top:10px" value="삭제" />
             
              <c:if test ="${filesBeanExList != null }">
              	<td>
                  	<c:forEach var="file" items="${filesBeanExList}">
              			<a href="${pageContext.request.contextPath}/expert/ExpertDeleteOk.ex?file_name=${file.getFile_name_ex()}">[삭제]</a>
               		 </c:forEach>
				 </td>
				</c:if>-->
				
              </table>
           	
         		<p></p>
                  <p>
                        우편번호
                   <input type="text" name="ex_zipcode" class="postcodify_postcode5" value="${exBean.getEx_zipcode()}"style="width:40%;margin:0 auto" readonly/>
                  </p>
                  <p>
                        주소  <input type="text" name="ex_address" class="postcodify_address" value="${exBean.getEx_address()}" style="width:40%;margin:0 auto" readonly/>
                  </p>
                  <p>
                     상세 주소  <input type="text" name="ex_address_detail" class="postcodify_details" value="${exBean.getEx_address_detail()}" style="width:40%;margin:0 auto" />
                  </p>
                  <p>
                        참고 항목  <input type="text" name="ex_address_etc" class="postcodify_extra_info" value="${exBean.getEx_address_etc()}" style="width:40%;margin:0 auto" readonly/>
                  </p>
                  <p>
                  <input type="button" id="postcodify_search_button" value="주소재검색 " style="width:40%;">
                  </p>
                  <br>
                  <p>
               
                  <a href ="javascript:updateEx();" class="button primary fit" style="width:40%;">정보수정하기</a>
                  </p>
                  </form>
                  </c:if>
                  </div>
                </div>
                </div>
                 
          		
              <form action="${pageContext.request.contextPath}/expert/ExpertDeleteOk.ex"  method="post" name="deleteExForm">
                  	   		<input type="hidden" name="ex_num" value="${exBean.getEx_num()}" />
          		</form>
			  
          <!--  <form action="${pageContext.request.contextPath}/expert/ExpertDeleteOk.ex" method="post" name="deleteExForm" enctype="multipart/form-data">
                 		<input type="hidden" name="file"  value="${file.getFile_name_ex()}" />
           </form> -->
                 	
            </section>
         </article>
         

      <!-- Footer -->
			   <footer id="footer" style="margin:auto;">
            <div class="inner" >
               <section class="contact-info"  style="margin:auto;">
                  <h4 class="major">Connect</h4>
                  <ul class="contact">
                     <li class="icon solid fa-phone">(010) 7126-6849</li>
                     <li class="icon solid fa-envelope"><a href="#">buj6842@naver.com</a></li>
                  </ul>
                  <ul class="contact">
                     <li class="icon solid fa-home">Seoul<br/>gangnamGu<br />Teheran-ro 26-gil<br />12</li>
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
   <script>
   function updateEx(){
      updateExform.submit();
   }
   </script>
   <script>
   function deleteEx(){
	   deleteExForm.submit();
   }
   </script>
</html>