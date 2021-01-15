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
   <link rel="icon" type="image/png" href="http://example.com/myicon.png">

   <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
   
      <title>인테리어 가이드</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=1" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/app/user/assets/css/main.css" />
<!--       <link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
   </head>
   #main{
   font-family: 'Nanum Myeongjo', serif;
   }-->
   <style>
   /* 이미지 크기 지정해놓음  */
      img {width:500px; height:400px;}
      
   /* 이미지 클래스 적용 */
      .image_left { /* text-align:0 auto;  */
                /* float:left; */  
               /* position:relative;     */      
               /* display : flex; */ 
               /* flex-direction: row; */
               /* flex-wrap: wrap;
               align-items: stretch; */
                   width: 100px;
                    margin: 10px;
                    text-align: center;
                    line-height: 75px;
         }
         /* 리스트 점 없애기 */
      ul{
       list-style:none;
      }
   /* main.css 건들지 않고 여기서 css적용  */
      /* .wrapper {
      padding: 0 0 3em 0 ;
      position: relative;
         } */
      /* .wrapper > .inner {
         margin: 5em;
         max-width: 75em;
         width: 100%;
         } */
         
         
         table {
  width: 100%;
  table-layout: fixed;
}

.card {

   height: 400px;

   width: 350px;

   border-radius: 15px;

   display: inline-block;

   margin-top: 30px;

   margin-left: 30px;

   margin-bottom: 30px;

   position: relative;

   box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);

   overflow: hidden;

}



.card-header {

   -webkit-transition: 0.5s; /*사파리 & 크롬*/

    -moz-transition: 0.5s;  /*파이어폭스*/

    -ms-transition: 0.5s;   /*인터넷 익스플로러*/

    -o-transition: 0.5s;  /*오페라*/

    transition: 0.5s;

   width: 100%;

   height: 270px;

   border-radius: 15px 15px 0 0;
   
   background-size: 100% 280px;

   background-repeat: no-repeat;   

}



.card:hover .card-header  {

   opacity: 0.8;

   height: 100px;

}



.card-header-is_closed{

    background-color: #EF5A31 ;

    color: #FFF ;

    font-weight: bold ;

    text-align: center ;

    float: right;

    margin: 15px 15px 0 0;

    border-radius: 50%;

    font-weight: bold;

    padding: 10px 10px;

    line-height: 20px;

}



h1 {

    font-size: 22px;

    font-weight: bold;

}



.card-body {

}



.card-body-header{

   line-height: 25px;

   margin: 10px 20px 0px 20px;

}



.card-body-description  {

    opacity: 0;

    color: #757B82;

    line-height: 25px;

    -webkit-transition: .2s ease-in-out; /*사파리&크롬*/

    -moz-transition: .2s ease-in-out; /*파이어폭스*/

    -ms-transition: .2s ease-in-out; /*익스플로러*/

    -o-transition: .2s ease-in-out; /*오페라*/

    transition : .2s ease-in-out;

    overflow: hidden;

   height: 180px;

   margin: 5px 20px;

}



.card:hover .card-body-description {

    opacity: 1;

    -webkit-transition: .5s ease-in-out;

    -moz-transition: .5s ease-in-out;

    -ms-transition: .5s ease-in-out;

    -o-transition: .5s ease-in-out;

    transition : .5s ease-in-out;

    overflow: scroll;

}



.card-body-hashtag {

   color: #2478FF;

   font-style: italic;

}



.card-body-footer {

     position: absolute; 

     margin-top: 15px;

     margin-bottom: 6px;

    bottom: 0; 

    width: 314px;

    font-size: 14px;

    color: #9FA5A8;

    padding: 0 15px;

}



.icon {

    display: inline-block;

    vertical-align: middle;

    margin-right: 2px;

}



.icon-view_count {

    width: 25px;

    height: 17px;

   background: url("images/eye.jpg") no-repeat;

}



.icon-comments_count {

   margin-left: 5px;

   width: 25px;

    height: 17px;

   background: url("images/comment.jpg") no-repeat;   

}



.reg_date {

   float: right;

}

   </style>
   <body class="is-preload">
      
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
			</c:if>
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
        <article id="main" style="padding: 3% 10% 5% 10%;">
               <header style="display: contents;">
               <span class="image fit" style="margin: 0 auto; width:100%; height=400px;">
                  <img src="${pageContext.request.contextPath}/app/user/images/guidebanner.jpg" width="1200px"  height="400px"       alt="" />
                  </span>
               <!-- <h2 class="major special">Generic Page</h2>
               <p>Aliquam ut ex ut interdum donec imperdiet </p> -->
            </header>
            <section class="wrapper">
           
              
            <form action="${pageContext.request.contextPath}/gallery/GalleryWriteOk.ga" method="post" enctype="multipart/form-data" name="galleryform">
        			<table  border="1" cellpadding="0" cellspacing="0" width="900px" >
					<tr height="30px">
						<td align="left"width="20%" >
						주거공간
						</td>
						<td align="right" width="80%" >
							<select name="gal_buildingtype" id="category" width="100%">
     						 <option value="apart">아파트</option>
     						 <option value="Housing">주택</option>
     						 <option value="OneRoom">원룸</option>
   							 </select>
						</td>
					</tr>
					<tr height="30px">
						<td align="left"width="20%" >
						방 유형
						</td>
						<td align="right" width="80%" >
						
							<select name="gal_roomtype" id="category" width="100%">
     						 <option value="livingroom">거실</option>
     						 <option value="kitchen">주방</option>
     						 <option value="toilet">화장실</option>
     						 <option value="room">침실</option>
     						 <option value="bathroom">욕실</option>
   							 </select>
						</tr>
					<tr height="30px">
						<td align="left"width="20%" >
						인테리어 색감
						</td>
						<td align="right" width="80%" >
						
							<select name="gal_colortype" id="category" width="100%">
     						 <option value="red">빨간색</option>
     						 <option value="white">하얀색</option>
     						 <option value="blue">파란색</option>
     						 <option value="purple">보라색</option>
     						 <option value="lightgreen">연두색</option>
     						 <option value="lightbrown">연갈색</option>
     						 
   							 </select>
						</tr>
					<tr height="30px">
						<td align="left"width="20%" >
						글쓴이
						</td>
						<td align="right" width="80%" >
							<input name="gal_id" type="text" size="10" maxlength="10" value="${session_id}" style="width:100%" readonly />
						</td>
					</tr>
					
					<tr height="30px">
						<td align="left"width="20%" >
						이미지 첨부
						</td>
						<td align="right" width="80%" >
							<input name="gallery_file" type="file"/ id="file">
							<input type="button" onclick="fileCheck()" value="첨부 삭제">
						</td>
					</tr>
				</table>
				<div style="margin: 0 auto;">
					<input type="hidden" name="gal_filepath" value="" id="gal_filepath">
     				 <input type="button" onclick="post()" value="등록하기">
     			 </div>
      		</form>
      
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
         <script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
         <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
         <script>var contextPath = "${pageContext.request.contextPath}";</script>
         
         <script src="${pageContext.request.contextPath}/app/user/join.js"></script>
         <script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
		<script>var maxSize = 2048;
		 var galpath = "${pageContext.request.contextPath}/app/galleryupload/"
		
		
		function post(){
			var file = document.getElementById('file');
			//파일 경로.
			var filePath = file.value;
			//전체경로를 \ 나눔.
			var filePathSplit = filePath.split('\\'); 
			//전체경로를 \로 나눈 길이.
			var filePathLength = filePathSplit.length;
			//마지막 경로를 .으로 나눔.
			var fileNameSplit = filePathSplit[filePathLength-1].split('.');
			//파일명 : .으로 나눈 앞부분
			var fileName = fileNameSplit[0];
			//파일 확장자 : .으로 나눈 뒷부분
			var fileExt = fileNameSplit[1];
			//파일 크기
			var fileSize = file.files[0].size;
			var filefullname = fileName+"."+fileExt;
			var fileCK = $("#file").val();
			if(!fileCK){
			   alert("이미지를 첨부해주세요!");
			  
			    return;
			}else{
				document.getElementById('gal_filepath').value = galpath + filefullname;
				galleryform.submit();
			}
		}
		</script>
</body>
</html>