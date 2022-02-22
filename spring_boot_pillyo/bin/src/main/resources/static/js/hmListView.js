/**
 * hmListView.js
 */
 
 $(document).ready(function(){
	$('#hmCtg_ListView').on('submit', function(this){
		
		var formData = this.value;
		console.log(formData)
		// serialize() : 폼에 입력한 값을 쿼리 스트링 방식의 데이터로 변환
		//type=prdName&keyword=노트북
		
		console.log("hmCtg_ListView");
		
		$.ajax({
			type:"post",
			url:"/householde_medicine/hmListView",
			data:formData = formData,  
			success:function(result){   // 컨트롤러에서 반환한 prdList를 result가 받음	
			
				$('#hmCtg_ListView').html(result);			
			},
			error:function(data, textStatus){
				alert("전송 실패");
			}
		});
	});	
});










