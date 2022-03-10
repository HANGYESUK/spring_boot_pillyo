/**
 * 
 */
 //코멘트 등록 ajax
  //function writeBoard(commentData){
$(document).ready(function(){	
	$('#commentInsert').on('submit', function(){
		event.preventDefault();
		
		var commentData = $("#commentInsert").serialize();
		// serialize() : 폼에 입력한 값을 쿼리 스트링 방식의 데이터로 변환
		
    	$.ajax({
	        type:'post',
	        url : "/insertreply",
	        data: commentData,
	        dataType:'text',
	        success : function(result){
	            if(result=="success")
	            {
				document.location.reload();
				alert("등록완료")
				window.href.location='http://';
	            }
	        },
	        error:function(data, textStatus){
				alert("전송 실패! 로그인 상태 확인 바랍니다.");
				
				
	       }
	        
	    });
    });
});

