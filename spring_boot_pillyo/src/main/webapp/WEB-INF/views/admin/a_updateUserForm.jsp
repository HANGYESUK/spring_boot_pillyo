<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 정보 수정 폼</title>
		<!-- <link rel="stylesheet" href="/css/dashboard/dashboardContent.css" />
		<link rel="stylesheet" href="/css/dashboard/dashboard.css" /> -->	
		
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/formCheck.js'/>"></script>
		<script src="<c:url value='/js/userIdCheck.js'/>"></script>
		<script src="<c:url value='/js/userEmailCheck.js'/>"></script>
		<script src="<c:url value='/js/searchZip.js'/>"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="https://kit.fontawesome.com/2d323a629b.js"crossorigin="anonymous"></script>
	</head>
	
	<style>
	.col2 > input {
		height: 17px;
    margin-top: 11px;
    background: white;
    border-color: white;
    border-radius: 2px;
    color: black;
    }
    
    #emailCheck, #searchZip{
        color: #0033a7;
    background: white;
    border-radius: 5px;
    border-color: white;
    height: 28px;
    width: 100px;}
    
    #memberEdit{
        text-align: center;
    padding-left: 5px;
    margin-left: 301px;
    margin-top: 27px;
   height: 34px;
    font-size: 14.5px;
    width: 105px;
     color: #0033a7;
    background: white;
    border-radius: 24px;
   
    border: 3px solid white;
    box-shadow: 2px 2px 5px #0d3bb1;
    
    }
    
    #memberEdit:hover {
	top:-2px;
	border: 3px solid white;
 	box-shadow: 4px 4px 7px #0d3bb1;
}
    #memberEdit2{
       text-align: center;
    padding-left: 5px;
    margin-left: 10px;
    margin-top: 27px;
    height: 34px;
    font-size: 14.5px;
    width: 105px;
    color: #0033a7;
    background: white;
    border-radius: 24px;
   
    border: 3px solid white;
    box-shadow: 2px 2px 5px #0d3bb1;
    }
    
    #memberEdit2:hover {
	top:-2px;
	border: 3px solid white;
 	box-shadow: 4px 4px 7px #0d3bb1;
}

.insert{
    padding-left: 112px;
}
	</style>
	
	<body>
		<div id="wrap">
			
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
			
			<div id="navMargin"></div>
			
			<section id="section">
		
			
				<div id="updateUserBox">
					<h2 align="center">회원 정보수정</h2>
					<br>
					<hr>
					<form name="updateUserForm" id="updateUserForm" method="post" action="<c:url value='/updateUser'/>">
						<div class="container">
							<div class="insert">
								<table>
									<tr>
										<td class="col1">성명</td>
										<td class="col2">
											<input type="text" name="userName"  maxlength="5" id="userName" value="${user.userName}">
											<p id="nameError" class="errMsg" value=""></p>
										</td>
									</tr>
									<tr>
										<td class="col1">아이디</td>
										<td class="col2"><input type="text" name="userId" maxlength="10" id="userId" value="${user.userId}" >
											<p id="idError" class="errMsg" value=""></p>
										</td>
									</tr>
									<tr>
										<td class="col1">비밀번호</td>
										<td class="col2"><input type="text" name="userPw" maxlength="16" id="userPw" value="${user.userPw}">
											<p id="pwError" class="errMsg">
												※ 비밀번호는 <span class="num">문자, 숫자, 특수문자(~!@#$%^&*)의 조합
													10 ~ 16자리</span>로 입력하세요.
											</p>
										</td>
									</tr>
									<tr>
										<td class="col1">비밀번호 확인</td>
										<td class="col2"><input type="password" name="pwCheck" maxlength="16" id="pwCheck" value="${user.userPw}"></td>
									</tr>
									<tr>
										<td class="col1">이메일</td>
										<td class="col2"><input type="text" name="userEmailId" id="userEmailId" value="${emailId}">
											<span class="a">@</span> <input type="text" name="userEmailText" id="userEmailText" value="${email}">
											<select id=selectEmail name="selectEmail">
												<option value="self" selected>직접입력</option>
												<option value="naver.com">naver.com</option>
												<option value="gmail.com">gmail.com</option>
												<option value="daum.com">daum.com</option>
												<option value="yahoo.com">yahoo.com</option>
										</select> <input class='btn2' id="emailCheck" type="button" value="이메일 중복확인" >
										<input type="hidden" name="userEmail" id="userEmail" />
										</td>
									</tr>
									<tr>
										<td class="col1">이메일 수신 여부</td>
										<td class="col2">
											<input type="radio" name="emailRcv" value="yes" style="margin-left:10px;" checked>예&nbsp;&nbsp;
											<input type="radio" name="emailRcv" value="no">아니오
										</td>
									</tr>
									<tr>
										<td class="col1">휴대폰번호</td>
									<td class="col2">
									<input type="text" name="userHp1" id="userHp1" size="3" value="${userHp1}" maxlength="3">
											- <input type="text" name="userHp2" id="userHp2" size="4" value="${userHp2}" maxlength="4">
											- <input type="text" name="userHp3" id="userHp3" size="4" value="${userHp3}" maxlength="4">
											<input type="hidden" name="userHp" id="userHp" />
									</td>
									</tr>
								<tr>
									<td class="col1">주소 </td>
									<td class="col2"><input type="text" name="userZipcode" id="userZipcode" value="${user.userZipcode}"readonly> 
									<input type="button" class="btn2" id="searchZip" name="searchZip" value="우편번호찾기" readonly><br>
									<input type="text" name="userAddress1" id="userAddress1" size="40"  value="${user.userAddress1}" readonly><br>
									<input type="text" name="userAddress2" id="userAddress2" size="40" value="${user.userAddress2}" placeholder="상세 주소 입력">
									</td>
								</tr>
								
								</table>
							</div>
	
							<div class="create">
								<input class="btn4" id="memberEdit" type="submit" value="회원 정보 수정" >
								<input class="btn4" id="memberEdit2" type="reset" value="취소" >
							</div>
						</div>
					</form>
				</div>
			</section>
		<br><br><br>
		
		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
    	</div> <!-- wrap -->
	</body>
</html>