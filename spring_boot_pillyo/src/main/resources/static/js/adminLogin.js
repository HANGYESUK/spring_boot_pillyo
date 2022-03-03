/**
 *  adminLogin.js
 */
 
 $(document).ready(function(){
	$('#adminloginForm').on('submit', function(){
		event.preventDefault();
		
		$.ajax({
			type:"post",
			url:"/adminLogin",
			data:{"id": $('#id').val(),
				  "pw":  $('#pw').val()},  
			dataType:'text',
			success:function(result){
				if(result == "success"){
					alert("login ok");
					location.href="/";
				}else{
				    alert("login fail");
			 }
			},
			error:function(data, textStatus){
				alert("전송 실패");
			}
		});
	});	
});