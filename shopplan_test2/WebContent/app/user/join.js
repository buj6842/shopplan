function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}

function checkId(){
   check = false;
   
   var id = $("input[name='user_id']").val();
   
   if(id == ""){
      alert('아이디를 작성해주세요');
   }else{
      $.ajax({
         url:contextPath + "/user/UserCheckIdOk.us?id="+id,
         type:"get",
         dataType:"text",
         success:function(result){
            if(result.trim() == "ok"){
               check = true;
               alert("사용할 수 있는 아이디 입니다.");
            }else{
               alert("중복된 아이디 입니다.");
            }
         },
         error:function(){
            console.log("오류");
         }
      });
   }
}
function formSubmit(){
	var form = document.joinForm;

	//아이디 검사
	if(form.user_id.value == "" || !check){
		alert("아이디를 확인해주세요.");
		form.user_id.focus();
		return false;
	}
	
	form.submit();
}

var openWin;
function goLivingroom() {
	//부모 
	window.name = contextPath + "/user/UserJoin.us";
	
	openWin =window.open(contextPath +"/user/UserLivingroom.us", "livingroom_color_form", "width=1200, height=900, left=100, top=50"); 
	
	}


function goKitchen() {
	window.name = contextPath + "/user/UserJoin.us";
	window.open(contextPath +"/user/UserKitchen.us", "kitchen", "width=1200, height=900, left=100, top=50"); 
	}


function goRoom() {
	window.name = contextPath + "/user/UserJoin.us";
	window.open(contextPath +"/user/UserRoom.us", "room", "width=1200, height=900, left=100, top=50"); 
	}