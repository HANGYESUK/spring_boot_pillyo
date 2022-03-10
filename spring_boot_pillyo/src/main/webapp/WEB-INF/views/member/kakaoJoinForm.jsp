<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>title</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="https://kit.fontawesome.com/2d323a629b.js"crossorigin="anonymous"></script>
		<script>
			window.onload = function(){
				// 카카오 회원 정보 받아오기
				var k_userInfo = JSON.parse(localStorage.getItem("k_userInfo"));
				
				document.getElementById("k_name").value=(k_userInfo.k_name);
                document.getElementById("k_bday").value=(k_userInfo.k_bday);
                document.getElementById("k_email").value=(k_userInfo.k_email);
                document.getElementById("k_gender").value=(k_userInfo.k_gender);
                document.getElementById("k_id").value=(k_userInfo.k_id);
			}
			
		</script>
	</head>
	<body>
		<div id="wrap">
			
			<!-- TOP -->
			<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
			<div id="navMargin"></div>
			
			<section id="section">
				<form name="kakaoJoinForm" id="kakaoJoinForm" method="post" action="<c:url value='/kakaoJoin'/>">
					<input type="hidden" id="k_name" name="k_name"><br><!-- 이름 -->
					<input type="hidden" id="k_email" name="k_email"><br><!-- 이메일 -->
					<input type="hidden" id="k_bday" name="k_bday"><br><!-- 생일 -->
					<input type="hidden" id="k_gender" name="k_gender"><br><!-- 성별 -->
					<input type="hidden" id="k_id" name="k_id"><br><!-- 추출한 아이디로부터 변환한 카카오 회원용 아이디 -->
					
					Pill-Yo 서비스 이용을 위해 필요한 추가 정보를 입력해주세요.<br>
					핸드폰 번호<input type="text" name="k_hp1" id="k_hp1" size="3" maxlength="3">
							- <input type="text" name="k_hp2" id="k_hp2" size="4" maxlength="4">
							- <input type="text" name="k_hp3" id="k_hp3" size="4" maxlength="4"><br>
					DB에 저장할 합친 폰번호 : hidden으로 숨기기<input type="text" id="k_hp" name="k_hp"><br>
					우편번호<input type="text" id="k_zipcode" name="k_zipcode" readonly>
						  <input type="button" class="searchZipBtn" id="searchZip" name="searchZip" value="우편번호찾기" readonly><br>
					주소<input type="text" id="k_address1" name="k_address1" size="40"><br>
					상세주소<input type="text" id="k_address2" name="k_address2" size="40" placeholder="상세 주소 입력"><br>
					<hr>
					전체 input form으로 묶고 -> 상단 input들은 hidden으로 숨기기 -> sumbit 시 회원가입
					(아이디 검사를 이 페이지 넘어오면서 할지 / 이 페이지에서 다음으로 넘어갈 때 할지)
					<div class="create">
						<button type="submit" id="joinBtn" >회원가입</button>
						<button type="submit" id="cancelBtn" onclick="">취소</button>
					</div>
				</form>
			</section>
	        
			<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
	<script>
		$(document).ready(function(){
			// ---------------- 데이터 변경 이벤트 ----------------
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
						var k_hp1 = $('#userHp1').val();
						var k_hp2 = $('#userHp2').val();
						var k_hp3 = $(this).val();
						$('#k_hp').val(k_hp1 + '-' + k_hp2 + '-' + k_hp3);
			});
			
			
			// ---------------- 주소 검색 ----------------
			$('#searchZip').on('click', function(){	
				new daum.Postcode({
					oncomplete:function(data){
						// 팝업 창에서 검색 결과 클릭했을 때 
						var k_address1 = '';
						//법정명과 건물명 : (~동, ~건물) (~동, ~아파트)
						//var dong_building='';
						
						//도로명 주소인 경우
						if(data.userSelectedType == 'R'){
							k_address1 = data.roadAddress + "(" + data.bname + data.buildingName + ")";
						}else { //지번 주소인 경우
							k_address1 = data.jibunAddress;
						}
						
						// 우편번호와 주소1 출력
						document.getElementById('k_zipcode').value = data.zonecode;
						document.getElementById('k_address1').value = k_address1;
						
						// 상세주소 입력하도록 입력되어 있는 값 삭제하고 포커스
						var k_address2 = document.getElementById('k_address2');
						k_address2.value = "";
						k_address2.focus();
						
					}
				}).open();		
			});
			
			
			$('#kakaoJoinForm').on('submit', function(){		
				event.preventDefault();
				// ---------------- 유효성검사 ----------------
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
				
				// DB에 회원 정보 추가
				$.ajax({
					type:"post",
					url:"kakaoDBInsert",
					data: { "k_id": $('#k_id').val(),
							"k_name": $('#k_name').val(),
							"k_email": $('#k_email').val(),
							"k_bday": $('#k_bday').val(),
							"k_gender": $('#k_gender').val(),
							"k_hp": $('#k_hp').val(),
							"k_zipcode": $('#k_zipcode').val(),
							"k_address1": $('#k_address1').val(),
							"k_address2": $('#k_address2').val()
						},
					dataType:'text',
					success:function(result){
						alert("Pill-Yo 회원이 되신 것을 환영합니다. :)");
						$(location).attr('href', '/');
					},
					error:function(data, textStatus){
						alert("전송 실패");
					}
				});
			});
		});
	</script>
</html>