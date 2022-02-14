/**
 * userEmailCheck.js
 */
 
 $(document).ready(function(){
	$('#emailCheck').on('click', function(){		
		event.preventDefault();
	
		let email = $('#userEmailId').val() + $('#userEmail').val()
	
		$.ajax({
			type:"post",
			url:"userEmailCheck",
			data:{"userEmailId": $('#userEmailId').val(), "userEmail": $('#userEmail').val()},  
			dataType:'text',
			success:function(result){
				if(result == "no_use"){
					alert("사용할 수 없는 이메일입니다.");
				}else{
				    alert("사용 가능한 이메일입니다.");
			 }
			},
			error:function(data, textStatus){
				alert("전송 실패");
			}
		});
	});
});