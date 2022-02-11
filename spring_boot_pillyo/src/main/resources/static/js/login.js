/**
 * login.js
 */
 
 $(document).ready(function(){
	$('#loginForm').on('submit', function(){
		event.preventDefault();
		
		$.ajax({
			type:"post",
			url:"/login",
			data:{"id": $('#id').val(),
				  "pw":  $('#pw').val()},  /* 컨트롤러에서 받을 때 : id, pw로 받음*/
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
/*				let id = $('#id').val()
				let pw = $('#pw').val()
				console.log(id)
				console.log(pw)*/
				alert("전송 실패");
			}
		});
	});	
});