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
			<form id="kakaoLoginForm" name="kakaoLoginForm" methond="post" action="<c:url value='/kakaoJoin'/>">
				이름<input type="text" id="k_name" name="k_name"><br>
				이메일<input type="text" id="k_email" name="k_email"><br>
				생일<input type="text" id="k_bday" name="k_bday"><br>
				성별<input type="text" id="k_gender" name="k_gender"><br>
			</form>
        </section>
        
		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
		    <script>
		    	// var result = "fail";
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
		                            document.getElementById("k_email").value=(kakao_account.birthday);
		                            document.getElementById("k_bday").value=(kakao_account.email);
		                            document.getElementById("k_gender").value=(kakao_account.gender);
		                        }
		                    });
		                    alert("카카오 로그인 성공!");
/* 		                    result = "success";
		                    
		                    if (result=="success") {
		    		        	// form 자동 submit
		                        document.kakaoLoginForm.submit();
		                        alert("회원가입이 완료되었습니다.");
		    		        } */
		                    // window.location.href='/'
		                },
		                fail: function(error) {
		                    console.log(error);
		                }
		            });
		        }
		        
		        document.getElementById('kakaoLoginForm').onsubmit = function() {
		    		
		    	};
		    </script>
		    <script>
		    $(document).ready(function(){
		    	$('#kakaoLoginForm').on('submit', function(){
		    		event.preventDefault();
		    		
		    		$.ajax({
		    			type:"post",
		    			url:"/kakaoSocial",
		    			data:{"k_name": $('#k_name').val(),
	    						"k_email":  $('#k_email').val(),
	    						"k_bday":  $('#k_bday').val(),
	    						"k_gender":  $('#k_gender').val()
		   						}, /* 컨트롤러에서 받음 */
		    			dataType:'text',
		    			success:function(result){
		    				alert("kakao success");
		    			},
		    			error:function(data, textStatus){
		    /*				let id = $('#id').val()
		    				let pw = $('#pw').val()
		    				console.log(id)
		    				console.log(pw)*/
		    				alert("전송 실패");
		    			}
		    		});
		    	});	
		    });
		    </script>
</html>