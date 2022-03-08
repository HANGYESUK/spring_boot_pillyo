<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>카카오 소셜 로그인</title> 
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
			
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
		<div id="navMargin"></div>
		
		<section id="section">
			<a href="javascript:kakaoLogin();"><img src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222" alt="카카오 로그인"/></a><br>
			<form id="kakaoLoginForm" name="kakaoLoginForm" method="post" action="<c:url value='kakaoJoinForm'/>">
				이름<input type="text" id="k_name" name="k_name"><br>
				이메일<input type="text" id="k_email" name="k_email"><br>
				생일<input type="text" id="k_bday" name="k_bday"><br>
				성별<input type="text" id="k_gender" name="k_gender"><br>
				<hr>
				이메일로부터 아이디 추출<input type="text" id="k_idFromEmail" name="k_idFromEmail"><br>
				추출한 아이디를 카카오회원 구분용 아이디로 변환<input type="text" id="k_id" name="k_id"><br>
			</form>
        </section>
        
		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        window.Kakao.init('b3bc39226c10ad1e0663733a444b7b1d');
        function kakaoLogin() {
            window.Kakao.Auth.login({
                scope: 'profile_nickname, account_email, gender, birthday', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
                success: function(response) {
                    console.log(response) // 로그인 성공하면 받아오는 데이터 (토큰, 계정정보 등)
                    window.Kakao.API.request({ // 사용자 정보 가져오기 
                        url: '/v2/user/me',
                        success: (res) => {
                            const kakao_account = res.kakao_account;
                            console.log(kakao_account); // 계정 정보
                            
                            console.log(kakao_account.profile.nickname);
                            console.log(kakao_account.birthday);
                            console.log(kakao_account.email);
                            console.log(kakao_account.gender);
                            document.getElementById("k_name").value=(kakao_account.profile.nickname);
                            document.getElementById("k_bday").value=(kakao_account.birthday);
                            document.getElementById("k_email").value=(kakao_account.email);
                            document.getElementById("k_gender").value=(kakao_account.gender);
                            
                            var k_name = document.getElementById("k_name").value;
                            var k_bday = document.getElementById("k_bday").value;
                            var k_email = document.getElementById("k_email").value;
                            var k_gender = document.getElementById("k_gender").value;
                            
                            // 이메일로부터 아이디 추출
                        	var k_idFromEmail = k_email.split("@", 1);
                        	document.getElementById("k_idFromEmail").value=(k_idFromEmail);
                        	console.log("아이디 추출 : " + k_idFromEmail);
                        	
                        	// 추출한 아이디를 user 테이블에 넣기 위한 카카오회원용 아이디로 가공
                        	var k_id = k_idFromEmail + "_K"
                        	document.getElementById("k_id").value=(k_id);
                        	
                        	// 카카오 회원가입 폼으로 값 넘기기
                        	var k_userInfo = {
                       			"k_name" : k_name,
                       			"k_bday" : k_bday,
                       			"k_email" : k_email,
                       			"k_gender" : k_gender,
                       			"k_id" : k_id
                        	};
                        	
                        	localStorage.setItem('k_userInfo', JSON.stringify(k_userInfo));
                        }
                    });
                    alert("카카오 로그인 성공!");
                    
                    var form = document.getElementById("kakaoLoginForm");
                    kakaoLoginForm.submit();
                    
                },
                fail: function(error) {
                    console.log(error);
                }
            });
        }
    </script>
</html>