/**
 *insertHmForm2_check.js
 */
 
 function insertHmForm2_check(){
	checkForm=document.hmForm;
	
	if(checkForm.hmName.value=="" ||
	   checkForm.hmCtgNo.value=="" ||
	   checkForm.hmUseByDate.value=="" ||
	   checkForm.hmMemo.value=="" ||
	   checkForm.hmImg.value=="" ){
		
		if(checkForm.hmName.value==""){
			alert("약품명이 비어있습니다. 입력해주세요")
			checkForm.hmName.focus();
			
		}else if(checkForm.hmCtgNo.value==""){
			alert("카테고리를 선택해주세요.")
			checkForm.hmCtgNo.focus();
			
		}else if(checkForm.hmUseByDate.value==""){
			alert("사용기한을 선택해주세요.")
			checkForm.hmUseByDate.focus();
			
		}else if(checkForm.hmMemo.value==""){
			alert("메모를 입력해주세요. (예시. 보관장소, 구매약국 등)")
			checkForm.hmMemo.focus();
			
		}else{
			alert("등록하실 이미지를 올려주세요.")
			checkForm.hmImg.focus();
		}
	}
	else{
		alert("필수 입력란을 모두 입력하셨습니다.");
	}
}