<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Pill-Yo - 로그인</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/login.js'/>"></script>
		<link rel="stylesheet" href="<c:url value='/css/member/loginForm.css'/>">
	</head>
	
	<style>
		hr{
		background-color: #fff2f2;
    height: 1px
		}
		#adminLogin a{
		color: white;
		}
	</style>
	<body>
		<div id="wrap">
		<div id="adminLogin"><a href="/adminloginForm">관리자 로그인</a></div>
			<div id="section2">
				<div id="navMargin"></div>
				<section id="section3">
		
					<!--  로그인 폼  -->
					<div id="loginContainer">
					<br>
				        <h1 id="title">로그인</h1>
				        <br>
				        
			        <div id="loginTopBox">
				        <div id="loginBox">
					        <form id="loginForm" name="loginForm">
					        
					          
					          <div id="idBox"> <input type="text" id="id" name="id" placeholder="아이디"></div>
					           <div id="pwBox"> <input type="password" id="pw" name="pw" placeholder="비밀번호"></div>
					                  <button type="submit" id="login_btn">로그인</button>
				        	</form>	
			       		</div><br>
			       		<div class="forgetMsg">
			       		 	<a href="#">아이디/비밀번호 찾기</a>  &nbsp;&nbsp;|&nbsp;&nbsp;   <a href="<c:url value='/join'/>">회원가입</a>
			       		</div><br><br>
			       	</div>
			       		
			       	<div id="loginBottomBox">	
				     		 <div class="box">
			                   	<div class="socialLoginBox">
			                   		<h1>소셜 로그인</h1>
			                        <ul class="socialLoginList">
			                            <li><button class="kakaoLoginButton"><span><a href="javascript:kakaoLogin();">KakaoTalk ID 로그인</a></span></button></li>
			                            <li><button class="googleLoginButton"><span>Google ID 로그인</span></button></li>  
			                            <li><button class="naverLoginButton"><span>Naver ID 로그인</span></button></li>  
			                        </ul>
			                   	</div>
			                 </div>
			               </div>
			         </div>
			         
					<hr>카카오 로그인 기능구현용 : 후에 hidden으로 수정 예정   |  위에 a 태그 css도 수정<hr>
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
       		</div>		
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
                        	var emailArr = k_email.split("@");
                        	var emailInitial = (emailArr[1].charAt(0)).toUpperCase();
                        	var k_id = k_idFromEmail + "_kakao" + emailInitial;
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
                        	
                        	// alert("카카오 데이터 가져와 넘기기 성공!");
                        	
                        	// 카카오 회원가입 여부 체크
                            // kakaoJoinCheck 결과(이메일)가 참이면 -> idpw 체크 -> idpw 체크 결과 참이면 세션부여 / 거짓이면 로그인 실패
                            // kakaoJoinCheck 결과(이메일)가 거짓이면 -> 카카오 회원가입으로 이동
                            $.ajax({
        						type:"post",
        						url:"kakaoJoinCheck",
        						data: { "k_email": $('#k_email').val() },
        						dataType:'text',
        						success:function(result){
        							if(result == "in"){
        								// 로그인 유효성 검사로 이동
        								alert("111");
        								$(location).attr('href', '/kakaoLoginCheck');
        							}else{
        								// 카카오 회원가입이 처음인 회원이므로 : 카카오 회원가입으로 이동
        								$(location).attr('href', '/kakaoJoinForm');
        								alert("222");
        						 	}
        						},
        						error:function(data, textStatus){
        							alert("전송 실패");
        						}
        					});                        
                        }
                    });

                    // kakaoLoginForm : submit
                    var form = document.getElementById("kakaoLoginForm");
                    kakaoLoginForm.submit();
                    
                    
                 	// 로그인 유효성 검사
                    $.ajax({
                			type:"post",
                			url:"kakaoLoginCheck",
                			data: { "k_email": $('#k_email').val() },
                			dataType:'text',
                			success:function(result){
                				alert("로그인체크ajax : success");
                				alert("ㅁㅁㅁ" + result);
                			},
                			error:function(data, textStatus){
                				alert("전송 실패");
                			}
                		});
                    
                },
                fail: function(error) {
                    console.log(error);
                }
            });
        }
    </script>
</html>
