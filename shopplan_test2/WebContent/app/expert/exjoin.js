function formSubmit(){
	var form = document.exjoinForm;

	//아이디 검사
	if(form.ex_id.value == "" || !check){
		alert("아이디를 확인해주세요.");
		form.ex_id.focus();
		return false;
	}
	
	form.submit();
}


function checkExId(){
	check = false;
	
	var id = $("input[name='ex_id']").val();
	
	if(id == ""){
		alert('아이디를 작성해주세요');
	}else{
		$.ajax({
			url:contextPath + "/expert/ExpertCheckIdOk.ex?id="+id,
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

/*function deleteExFile(){
	$('.delete_btn').click(function(){
		if(confirm("삭제시 복구할수없습니다.\n 삭제하시겠습니까?")== true){
			var saveFolder = "C:\\Users\\^^\\Desktop\\Web_1530_lsh\\jsp2\\workspace\\shopplan_test\\WebContent\\app\\upload_ex";
			$.ajax({
				url:contextPath + "/expert/ExpertDeleteOkAction",
				type:"post",
				dataType:"json",
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
}*/

















