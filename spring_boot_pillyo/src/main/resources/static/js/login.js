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
					alert("환영합니다! Pill-Yo입니다 :)");
					location.href="/";
				} else if (result == "kakao") {
					alert("카카오 게정으로 가입된 아이디입니다.\n카카오로그인을 통해 로그인 해주세요.")
				} else{
				    alert("로그인에 실패하였습니다.");
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