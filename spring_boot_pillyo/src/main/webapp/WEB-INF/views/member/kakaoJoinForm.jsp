<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>title</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/user/socialSearchZip.js'/>"></script>
		<script src="<c:url value='/js/user/socialFormCheck.js'/>"></script>
		<script>
			window.onload = function(){
				// 카카오 회원 정보 받아오기
				var k_userInfo = JSON.parse(localStorage.getItem("k_userInfo"));
				
				document.getElementById("k_name").value=(k_userInfo.k_name);
                document.getElementById("k_bday").value=(k_userInfo.k_bday);
                document.getElementById("k_email").value=(k_userInfo.k_email);
                document.getElementById("k_gender").value=(k_userInfo.k_gender);
                document.getElementById("k_id").value=(k_userInfo.k_id);
                
                emailCheckFnc();
			}
			
			emailCheckFnc = null;
	    	
	    	$(function() {
	        	function kEmailCheck() {
	        		// 중복회원인지 이메일 체크
	        		$.ajax({
	        			type:"post",
	        			url:"kakaoEmailCheck",
	        			data:{"k_email": $('#k_email').val()},  
	        			dataType:'text',
	        			success:function(result){
	        				if(result == "no_use"){
	        					alert("같은 이메일로 가입된 계정이 존재합니다.\n기존 계정으로 로그인 해주세요.");
	        					$(location).attr('href', '/loginForm')
	        				} else {
	        					alert("가입 가능");
	        				}
	        			},
	        			error:function(data, textStatus){
	        				alert("전송 실패");
	        			}
	        		});
	        	}
	        	
	        	emailCheckFnc = kEmailCheck;
	        })
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
					DB에 저장할 합친 폰번호<input type="text" id="k_hp" name="k_hp"><br>
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
</html>