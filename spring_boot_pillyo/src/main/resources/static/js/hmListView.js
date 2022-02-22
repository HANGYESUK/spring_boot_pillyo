/**
 * hmListView.js
 */
 
 $(document).ready(function(){
	
/*	    function go() {
          	console.log("hello")
        }*/
	
	
	$('#hmCtg_ListView').on('submit', function(event){
		event.preventDefault();
		//var formData = $('#hmCtgInput').serialize() ;
		
		//alert(formData);
		
		// serialize() : 폼에 입력한 값을 쿼리 스트링 방식의 데이터로 변환
		//type=prdName&keyword=노트북
		
		//console.log("hmCtg_ListView");
		
		$.ajax({
			type:"post",
			url:"/listCtgHm/"+"{hmCtgNo.value}",
			// url:"/listCtgHm/{hmCtgNo}",
			//data:formData,  
			success:function(hmCtgList){ 	
			alert("전송");
				$('#hmCtg_ListView').html(hmCtgList);			
			},
			error:function(data, textStatus){
				alert("전송 실패");
			}
		});
	});	
});
