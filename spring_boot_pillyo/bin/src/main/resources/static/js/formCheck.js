/**
 * formCheck.js
 */


function formCheck(frm) {
		  		alert('회원가입이 완료되었습니다.');
		  		/*alert(form.userId.value+'('+form.userName.value +") 님의 \n 회원가입이 완료되었습니다.");*/
				location.href="/";
		    return true; 
		  } 

window.onload = function() {
	// 이메일 select
	$('input[name=userEmailText]').change(function() {
				var mailId = $('#userEmailId').val();
				var text = $('#userEmailText').val();
				$('#userEmail').val(mailId+ '@' + text);
				//$('#userEmail').val(mailId + '@' + text);
	});
	
	$('select[name=selectEmail]').change(function() {
			if($(this).val()=="self"){
  				emailText.val("");
				$("#userEmailText").attr("readonly", false);
			} else {
				$('#userEmailText').val($(this).val());
				$("#userEmailText").attr("readonly", true);
				var mailId = $('#userEmailId').val();
				var text = $(this).val();
				$('#userEmail').val(mailId + '@' + text);
			}
	});
	
	$('input[name=userEmailText]').change(function() {
		console.log($('#userEmailText').val())
		});
	
	// 핸드폰 번호
	$('input[name=userHp1]').change(function() {
				var userHp1 = $(this).val();
				var userHp2 = $('#userHp2').val();
				var userHp3 = $('#userHp3').val();
				$('#userHp').val(userHp1 + '-' + userHp2 + '-' + userHp3);
	});
	
	$('input[name=userHp2]').change(function() {
				var userHp1 = $('#userHp1').val();
				var userHp2 = $(this).val();
				var userHp3 = $('#userHp3').val();
				$('#userHp').val(userHp1 + '-' + userHp2 + '-' + userHp3);
	});
	
	$('input[name=userHp3]').change(function() {
				var userHp1 = $('#userHp1').val();
				var userHp2 = $('#userHp2').val();
				var userHp3 = $(this).val();
				$('#userHp').val(userHp1 + '-' + userHp2 + '-' + userHp3);
	});
	
	document.getElementById('joinForm').onsubmit = function() {
		// name
		var errMsgName = document.getElementById('nameError');
		var name = document.getElementById('name');
		if(name.value == ""){
			alert("성명을 입력하세요.");
			errMsgName.innerText = "성명을 입력하세요."
			errMsgName.style.visibility = 'visible';
			name.focus();
			document.location.href='#name';
			return false;
		}

		// id
		var errMsgId = document.getElementById('idError');
		var idToken = false
		const idReg = /^[a-z0-9]{4,20}$/;
		const id = document.getElementById('idCheck');

		if(id.value == "") {
			alert("아이디를 입력하세요.");
			errMsgId.innerText = "아이디를 입력하세요."
			errMsgId.style.visibility = 'visible';
			id.focus();
			document.location.href='#id';
			return false;	
		}

		if(id.value.length < 4 || id.value.length > 11) {
			alert("아이디는 영 소문자, 숫자 4 ~ 10자리로 입력해주세요.");
			id.value = "";
			errMsgId.innerText = "아이디는 영 소문자, 숫자 4 ~ 10자리로 입력해주세요."
			errMsgId.style.visibility = 'visible';
			id.focus();
			return false;	
		} else{
	      const idError = document.getElementById('idError')
	      idError.innerText = '올바른 아이디입니다.'
	      idError.style.color = 'green'
				idToken = true;
		}
		
		if(name.value != ""){
			errMsgName.style.visibility = 'hidden';
		}

		// 비밀번호
		var errMsgPw = document.getElementById('pwError');
		var password = document.getElementById('password');
		var passwordCheck = document.getElementById('passwordCheck');
		if(password.value == "") {
			alert("비밀번호를 입력하세요.");
			password.focus();
			document.location.href='#password';
			return false;
		}
		if(passwordCheck.value == "") {
			alert("비밀번호 확인을 입력하세요.");
			passwordCheck.focus();
			document.location.href='#passwordCheck';
			return false
		}
		
		if(password.value != passwordCheck.value){
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다");
			password.value = "";
			passwordCheck.value = "";
			password.focus();
			document.location.href='#password';
			return false;	  		
		}

		if(password.value.length < 10 || password.value.length > 17) {
			alert("비밀번호는 문자, 숫자, 특수문자(~!@#$%^&*)의 조합 10 ~ 16자리로 입력하세요.");
			password.value = "";
			passwordCheck.value = "";
			errMsgPw.innerText = "비밀번호는 문자, 숫자, 특수문자(~!@#$%^&*)의 조합 10 ~ 16자리로 입력하세요."
			errMsgPw.style.visibility = 'visible';
			password.focus();
			document.location.href='#password';
			return false;	
		}
		
		if(password.value != ""){
			errMsgPw.style.visibility = 'hidden';
		}

		// 이메일 수신 여부
		var mailChk = false; 
		for(var i=0; i<joinForm.emailRcv.length; i++){
			if(joinForm.emailRcv[i].checked == true)
				mailChk = true; 
		} 
		
		if(mailChk == false) {
			alert("이메일 수신 여부를 선택하세요");
			return false;
		}
		
		// 핸드폰
		var hp1= document.getElementById('hp1');
		var hp2 = document.getElementById('hp2');
		var hp3 = document.getElementById('hp3');
		
		if(hp1.value.length==0) {
			alert("핸드폰 번호를 입력하세요");
			document.location.href='#hp1';
			return false;
		}
		if(hp2.value.length==0) {
			alert("핸드폰 번호를 입력하세요");
			document.location.href='#hp2';
			return false;
		}
		if(hp3.value.length==0) {
			alert("핸드폰 번호를 입력하세요");
			document.location.href='#hp3';
			return false;
		}
		
		var agreement1 = document.getElementById("agreement1");
		var agreement2 = document.getElementById("agreement2");
		
		if (agreement1.checked == false || agreement2.checked == false) {
			alert("동의 여부를 체크하지 않았습니다.\n모든 약관에 동의하셔야 끼리끼리 서비스 이용이 가능합니다.");
			document.location.href='#agreement1';
			return false;
		}
		
		
	};
};