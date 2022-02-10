<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인 폼</title>
	</head>
<body>
	<div id="wrap">	
		<!-- TOP  -->
		
		<!-- Section -->
		<section>
				<div id = "loginBox">
					<h3>로그인</h3> <br><br>
					<hr> <br><br>
					
					<table> <!-- 양 옆으로 만들기 위해 -->
						<tr> <!--1행  -->
							<td> <h3> 회원 로그인</h3></td> <th rowspan="3" ><img src = "image/line.png" ></th> <td><h3> 회원가입</h3></td> </tr>
			
						<tr> <!-- 2행 -->
							<td> <!-- 로그인 안내 메세지 --> 
									<p>가입하신 아이디와 비밀번호를 입력해주세요. <br>
									비밀번호는 대소문자를 구분합니다 </p><br><br>  </td>
							<td> <!-- 회원가입 안내 메세지 --> 
									<p>아직 회원이 아니신가요? <br>
									회원가입을 하시면 다양한 혜택을 편리하게 이용하실 수 있습니다 </p><br>
									<!-- 회원가입 하러가기 --> 
									<a href="<c:url value='/joinForm'/>"> <img src = "<c:url value='/image/join-us.png'/>"  width="80%"></a></td> </tr>
					
						<tr> <!-- 3행 -->
							<td id="idPwdTd"> <!-- 회원 로그인 ID/PW --> 
								<div id = "login">
									<form id = "loginForm" name="loginForm" > 
										<!-- 아이디 -->
										<input type ="text" id ="id" name = "id" size = "40"
													placeholder = "MEMBER ID" autofocus> <br>
										<!-- 비밀번호 -->
										<input type ="password" id ="pwd" name = "pwd" size = "40"
													placeholder = "PASSWORD" autofocus> <br><br>
										<!--자바스크립트 else부분 <long_info.innerHTML = "로그인 실패";> 이 뜰수 있게 해주는 부분-->
										<span id="loginInfo"></span><br><br>
										<!-- 로그인 정보 전송 버튼 -->
										<input type="submit" id='submitBtn' value="LOG - IN" class="btn_submit"><br><br>
										<!-- 보안 접속 -->
										<p><label> <input type = "checkbox" name = "securityAccess" value = "securityAccess" checked>보안접속 </label></p>
								</form>
								</div></td> 
							<td>
									<!--아이디/비번 찾기 --> 
									<p> 아이디 혹은 비밀번호를 잊으셨나요? <br>
									간단한 정보를 입력 후 잃어버린 정보를 찾으실 수 있습니다. </p> <br>
									<a href="#"><img src = "<c:url value='/image/IdPassword.png'/>"  width="80%"  ></a></td></tr>
					</table>
				</div> <!-- loginBox -->
				
				<!-- BOTTOM  -->
			</section>
		</div>
	</body>
</html>
