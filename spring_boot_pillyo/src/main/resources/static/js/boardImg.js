/**
 * boardImg.js
 */
 $(function(){
   $('#OCRForm').on('submit', function(event){
      event.preventDefault();
       var formData = new FormData($('#OCRForm')[0]);
       
       // 업로드된 파일명 알아오기
       var fileName = $('#uploadFile').val().split("\\").pop();
       //alert(fileName);
       
      $.ajax({
         url:"clovaOCR",
         enctype:'multipart/form-data',
         type:"post",
         data:formData,
         processData: false,  // 필수
         contentType: false,  // 필수
         success:function(result){
			//alert(result);
            // 이미지 출력 : div에 append 시킴
            $('#image').empty();
            $('#image').append('<img src="/images/'+fileName+'" width="604px;"/>');
            
            $('#ocrResult').remove()
            $('#check').remove()
         
            // $('#OCRForm').append('<div id="ocrResult">'+ result +'</div>'); // 이미지 출력완
            
            $('input[name=boardImg]').attr("value", fileName); // 파일 이름이 들어가게 설정한 것
            						// 속성변경

         },
         error:function(){
            alert("오류가 발생했습니다.")
            console.log("오류");
         }
      });
      
   });      
});
