/**
 * socialFormCheck.js
 */
 
 // 핸드폰 번호
$('input[name=k_hp1]').change(function() {
			var k_hp1 = $(this).val();
			var k_hp2 = $('#k_hp2').val();
			var k_hp3 = $('#k_hp3').val();
			$('#k_hp').val(k_hp1 + '-' + k_hp2 + '-' + k_hp3);
});

$('input[name=k_hp2]').change(function() {
			var k_hp1 = $('#k_hp1').val();
			var k_hp2 = $(this).val();
			var k_hp3 = $('#k_hp3').val();
			$('#k_hp').val(k_hp1 + '-' + k_hp2 + '-' + k_hp3);
});

$('input[name=k_hp3]').change(function() {
			var k_hp1 = $('#k_hp1').val();
			var k_hp2 = $('#k_hp2').val();
			var k_hp3 = $(this).val();
			$('#k_hp').val(k_hp1 + '-' + k_hp2 + '-' + k_hp3);
});

document.getElementById('kakaoJoinForm').onsubmit = function() {
	var hp1= document.getElementById('k_hp1');
	var hp2 = document.getElementById('k_hp2');
	var hp3 = document.getElementById('k_hp3');
	
	if(hp1.value.length==0) {
		alert("핸드폰 번호를 입력하세요");
		document.location.href='#k_hp1';
		return false;
	}
	if(hp2.value.length==0) {
		alert("핸드폰 번호를 입력하세요");
		document.location.href='#k_hp2';
		return false;
	}
	if(hp3.value.length==0) {
		alert("핸드폰 번호를 입력하세요");
		document.location.href='#k_hp3';
		return false;
	}
	
	//주소
	var postcode = document.getElementById('k_zipcode');
	var address = document.getElementById('k_address2');
	
	if(postcode.value == ""){
		alert("주소를 입력하세요");
		postcode.focus();
		document.location.href='#k_zipcode';
		return false;
	}
	
	//상세주소
	if(address.value == ""){
		alert("상세 주소를 입력하세요");
		postcode.focus();
		document.location.href='#k_address2';
		return false;
	}
	
	alert("카카오 회원가입이 완료되었습니다.");
};