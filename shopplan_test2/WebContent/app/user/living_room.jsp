<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가상공간</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/app/user/living_room.css" />
</head>
<body style="padding-left: 15%;">
<!--  <form action="">-->
	<div class="preview">
	<!--<fieldset style="width:60% margin: 0 auto; border:1 solid #336699; >
	background:url(images/i8.PNG)">
	<legend>원하는 색상을 눌러주세요</legend>-->
	<form>
  <input class='plum' id='plum' name='color' type='radio' />
  <input class='chocolate' id='chocolate' name='color' type='radio' />
  <input class='turquoise' id=turquoise' name='color' type='radio' />
  <input class='darksalmon' id='darksalmon' name='color' type='radio' />
  <input class='limegreen' id='limegreen' name='color' type='radio' />
  <input class='slategray' id='slategray' name='color' type='radio' />
  <input class='cornflowerblue' id='cornflowerblue' name='color' type='radio' />
  <input class='thistle' id='thistle' name='color' type='radio' />
  <input class='hotpink' id='hotpink' name='color' type='radio' />
  <input class='mediumslateblue' id='mediumslateblue' name='color' type='radio' />
  <input class='darkturquoise' id='darkturquoise' name='color' type='radio' />
  <input class='lightcoral' id='lightcoral' name='color' type='radio' />
  <input class='goldenrod' id='goldenrod' name='color' type='radio' />
  <input class='yellowgreen' id='yellowgreen' name='color' type='radio' />
  <input class='darkkhaki' id='darkkhaki' name='color' type='radio' />
  <input class='red' id='red' name='color' type='radio' />
  <input class='salmon' id='salmon' name='color' type='radio' />
  <input class='yellow' id='yellow'name='color' type='radio' />
  <input class='green' id='green' name='color' type='radio' />
  <input class='pink' id='pink' name='color' type='radio' />
  <input class='purple' id='purple' name='color' type='radio' />
  <input class='steelblue' id='steelblue' name='color' type='radio' />
  <input class='mediumblue' id='mediumblue' name='color' type='radio' />
  <input class='mediumpurple' id='mediumpurple' name='color' type='radio' />
  <input class='darkslategray' id='darkslategray' name='color' type='radio' />
  <input class='teal' id='teal' name='color' type='radio' />
  <img src="${pageContext.request.contextPath}/app/user/images/living_room.png" /> 
  
      <input type="text" name="living_color" id="living_color" value=""
      	style="margin-left:33%"/>

      <input type="button" value="저장!" onclick="setLivingroom()">
	</form>
	</div>

</body>
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
   $("input[name='color']").click(function(){
      $("input[name='living_color']").val($(this).attr("id"));
   })
      console.log($("input[name='living_color]").val());
   
   function setLivingroom(){
	opener.document.getElementById("user_livingroom_c").value = document.getElementById("living_color").value;
	window.close();
}

   
</script>
</html>