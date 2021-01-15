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

    -ms-transition: 0.5s;	/*인터넷 익스플로러*/

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
   	<c:set var="galleryBean" value="${requestScope.galleryBean}"/>
	<c:set var="galleryFilesBeanList" value="${requestScope.galleryFilesBeanList}"/>
	<c:set var="list" value="${requestScope.galleryList}"/>
	<c:set var="nowPage" value="${requestScope.nowPage}"/>
	<c:set var="startPage" value="${requestScope.startPage}"/>
	<c:set var="endPage" value="${requestScope.endPage}"/>
	<c:set var="totalCnt" value="${requestScope.totalCnt}"/>
	<c:set var="realEndPage" value="${requestScope.realEndPage}"/>
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
               <div class="inner">
               <div class="building">
               <div class="building_filter_title">
               
               <form action="" method="post" name="frm">
               <h4 class="building_filter_title_text">
             	 건물유형
               </h4>
               </div>
               <div>
               <ul class="building_filter">
                  <li class="a_pointer">
                     <div class="checkbox-filter-item">
                        <input type="radio" id="apart" name="gal_buildingtype" value="apart">
                        <label for="apart">아파트</label>
                        <input type="radio"  id="villa"name="gal_buildingtype" value="Housing">
                        <label for="villa">빌라</label>
                        <input type="radio" id="house" name="gal_buildingtype" value="OneRoom">
                        <label for="house">주택</label>
                     </div>
                    </li>
               </ul>
               </div>	
               </div>
               
               <div class="building">
               <div class="building_filter_title">
               
               <h4 class="building_filter_title_text">
             	방 유형
               </h4>
               </div>
               <div>
               <ul class="building_filter">
                  <li class="a_pointer">
                     <div class="checkbox-filter-item">
                        <input type="radio" id="livingroom" name="gal_roomtype" value="livingroom">
                        <label for="livingroom">거실</label>
                        <input type="radio"  id="room" name="gal_roomtype" value="room">
                        <label for="room">침실</label>
                        <input type="radio" id="kitchen" name="gal_roomtype" value="kitchen">
                        <label for="kitchen">주방</label>
                        <input type="radio" id="bathroom" name="gal_roomtype" value="bathroom">
                        <label for="bathroom">욕실</label>
                        <input type="radio" id="toilet" name="gal_roomtype" value="toilet">
                        <label for="toilet">화장실</label>
                     </div>
                     </li>
               </ul>
               </div>
               </div>
            <!-- 색상선택 -->
            <div class="color">
               <div class="color_select">
                  <h4 class="color_line">색상 계열</h4>
               </div>
               <div>
                  <ul class="color_style_filter">
                  <!-- 붉은색 계열 -->
                     <li class="a_pointer">
                        <div class="checks">
                           <input type="radio" id="styleled" name="gal_colortype" value="red">
                           <label for="styleled">
                           <span class="color_style_line_filter">붉은색</span>
                           </label>
                     <!-- 노란색 계열  -->
                           <input type="radio" id="styleyellow" name="gal_colortype" value="white">
                           <label for="styleyellow">
                           <span class="color_style_line_filter">하얀색</span>
                           </label>
                     <!-- 초록색 계열  -->
                           <input type="radio" id="stylegreen" name="gal_colortype" value="blue">
                           <label for="stylegreen">
                           <span class="color_style_line_filter">파란색</span>
                           </label>
                     <!-- 푸른색 계열  -->
                           <input type="radio" id="styleblue" name="gal_colortype" value="purple">
                           <label for="styleblue">
                           <span class="color_style_line_filter">보라색</span>
                           </label>
                     <!-- 보라색 계열  -->
                           <input type="radio" id="stylepurple" name="gal_colortype" value="lightgreen">
                           <label for="stylepurple">
                           <span class="color_style_line_filter">연두색</span>
                           </label>
                     <!-- 무채색 -->
                           <input type="radio" id="styleblack" name="gal_colortype" value="lightbrown">
                           <label for="styleblack">
                           <span class="color_style_line_filter">연갈색</span>
                           </label>
                          
                           
                           
                           
            <!-- 버튼 -->
               <input type="button" style="width:10%" id="search" value="검색" class="button" onclick="findresult()">   
               </form>
                         
                              
                        </div>
                     </li>
                  </ul>
               </div>
            </div>   
            <hr>
               <!-- 검색 결과 -->
               <h4 style="text-align:center;">검색 결과</h4>
               <hr>

            
			
			<div id="cardlist">
            <c:choose>
           <c:when test = "${list != null and fn:length(list) > 0}"> 
        	<c:forEach var= "g_bean" items="${list}">
        <div class='card' id='card'>
		<!-- 카드 헤더 -->
		<div class="card-header" style="background-image:url(${g_bean.getGal_filepath()})"></div>
		<!--  카드 바디 -->
		<div class="card-body">
			<!--  카드 바디 헤더 -->
			<div class="card-body-header">
				<h1>
				#${g_bean.getGal_buildingtype()} #${g_bean.getGal_roomtype()} #${g_bean.getGal_colortype()}
				</h1>
				<p class="card-body-hashtag">${g_bean.getGal_date()}	</p>
				 <p class = "card-body-nickname">작성자:${g_bean.getGal_id()}<br>No.${g_bean.getGal_num()}</p>
			</div>
			<!--  카드 바디 본문 -->
			<!--  카드 바디 푸터 -->
			<div class="card-body-footer">
				<hr style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">
			</div>
		</div>
		</div>
		</c:forEach>
		</c:when>
		</c:choose>
		</div>
		

		<div style="margin: 0 auto;">
		<input type="button" style="width:100%" id="moreview" value="더보기" class="button" onclick="moreview()">
		<a href="${pageContext.request.contextPath}/gallery/GalleryWirte.ga" class="button">글쓰기</a>
		</div>
</table>
</div>
</section>
</article>
           
               
 <!-- Footer -->
         <footer id="footer">
            <div class="inner">
               <section class="contact-info">
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
         <script>var contextPath = "${pageContext.request.contextPath}";</script>
		<script>
		var cardCnt = 9;
		var clickCnt = 1;
		var cards = 9;
		var pageNum = cardCnt+clickCnt;
		console.log(cardCnt);
		
		
		var check = false;

		function findresult(){
		var checkbuilding =	$("input:radio[name='gal_buildingtype']").is(':checked');
		var checkroomtype =	$("input:radio[name='gal_roomtype']").is(':checked');
		var checkcolortype = $("input:radio[name='gal_colortype']").is(':checked');
		var gal_buildingtype = $("input[name='gal_buildingtype']:checked").val();
		var gal_roomtype = $("input[name='gal_roomtype']:checked").val();
		var gal_colortype = $("input[name='gal_colortype']:checked").val();
			if(!checkbuilding){
				alert('건물유형을 체크해주세요');
				return false;
			}
			if(!checkroomtype){
				alert('방 유형을 체크해주세요');
				return false;
			}
			if(!checkcolortype){
				alert('색 유형을 체크해주세요');
				return false;
			}		
			$.ajax({
		         url: contextPath + "/gallery/GallerySearch.ga?gal_buildingtype="+gal_buildingtype+"&gal_roomtype="+gal_roomtype+"&gal_colortype="+gal_colortype,
		         type:"get",
		         dataType:"json",
		         success: showResults
		      })
		}
		
		function showResults(results){
			
			var temp = "";
			
			if(results != null && results.length != 0){
				$.each(results, function(index, result){
					temp += "<div class='card' id='card'>";
					temp += "<div class='card-header' style='background-image:url("+result.gal_filepath+")'></div>"
					temp += "<div class='card-body'>"
					temp += "<h1># "+result.gal_buildingtype+"# "+result.gal_roomtype+"# "+result.gal_colortype+"</h1>"
					temp += "<p class='card-body-hashtag'>"+result.gal_date+"</p>"
					temp += "<p class = 'card-body-nickname'>작성자:"+result.gal_id+"<br>No."+result.gal_num+"</p>"
					temp += "</div><div class='card-body-footer'><hr style='margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31'>"
					temp += "</div></div></div>"
					
				})
			$('#cardlist').empty();
			$('#cardlist').append(temp);
			}else{
				alert('검색조건에 해당하는 값이 없습니다!');
				return false;
			}
			
		}
		
		
		function moreview(){
			$.ajax({
		         url: contextPath + "/gallery/GalleryMorview.ga?pageNum="+pageNum,
		         type:"get",
		         dataType:"json",
		         success: showMoreview
		      })
			}
		function showMoreview(moreviews){
			
			var text = "";
			
			if(moreviews != null && moreviews.length != 0){
				$.each(moreviews, function(index, moreview){
					text += "<div class='card' id='card'>";
					text += "<div class='card-header' style='background-image:url("+moreview.gal_filepath+")'></div>"
					text += "<div class='card-body'>"
					text += "<h1># "+moreview.gal_buildingtype+"# "+moreview.gal_roomtype+"# "+moreview.gal_colortype+"</h1>"
					text += "<p class='card-body-hashtag'>"+moreview.gal_date+"</p>"
					text += "<p class = 'card-body-nickname'>작성자:"+moreview.gal_id+"<br>No."+moreview.gal_num+"</p>"
					text += "</div><div class='card-body-footer'><hr style='margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31'>"
					text += "</div></div></div>"
					
					cardCnt++;
				})
			}else{
				alert('더이상 게시글이 없습니다');
				return;
			}
			
			$('#cardlist').append(text);
			pageNum = cardCnt+clickCnt;
		}
		
		
		</script>
</body>
</html>