/**
 *  findUserIdPw.js
 */
 
 $(document).ready(function(){
	$('#findUserIdPw').on('submit', function(){
		event.preventDefault();
		
		$.ajax({
			type:"post",
			url:"/findUerIdPw",
			date:{"findName" : $('#findName').val(),
				  "findEmail": $('#findEmail').val()},
			dateType:'text',
			success:function(result){
				if(result == "success"){
					alert("아이디는"+ UserId + "입니다.");
					location.href="/";
				}else{
				    alert("일치하는 회원정보가 없습니다.");
			 }
			},
			error:function(data, textStatus){
				alert("정보를 입력해주세요");
			}
		});
		
	});
	
});