/**
 * famInsert.js
 */
 
 $(document).ready(function(){
	$('#famInsertForm').on('submit', function(){
		event.preventDefault();
		
		$.ajax({
			type:"post",
			url:"/famInsert",
			data:{"": $('#').val()},  /* 컨트롤러에서 받을 때 : ""로 받음*/
			dataType:'text',
			success:function(result){
				alert("성공")
				/*if(result == "success"){
					alert("login ok");
					location.href="/";
				}else{
				    alert("login fail");
			 }*/
			},
			error:function(data, textStatus){
				alert("전송 실패");
			}
		});
	});	
});