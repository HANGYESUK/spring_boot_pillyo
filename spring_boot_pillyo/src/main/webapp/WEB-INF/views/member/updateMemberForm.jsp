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
	    padding-left: 9px;
		height: 17px;
    margin-top: 11px;
/*     background: white;
 */    border-color: white;
/*     border-radius: 2px;
 */    color: black;
    
        border: 0;
    background: whitesmoke;
    height: 30px;
    border-radius: 8px;
    font-weight: 400;
    }
    
    #emailCheck, #searchZip{
        color: #242424;
    background: white;
    border-radius: 5px;
    border-color: white;
    height: 28px;
    width: 130px;}
    
    #emailCheck:hover, #searchZip:hover{
	font-size:15px;
}    
    #memberEdit{
    text-align: center;
    padding-left: 5px;
    margin-left: 301px;
    margin-top: 27px;
    height: 34px;
    font-size: 14.5px;
    width: 105px;
    color: #484848;
    background: white;
    border-radius: 24px;
    border: 1px solid white;
    box-shadow: 1px 1px 0px #c9c9c9;
    }
    
    #memberEdit:hover {
	top:-2px;
	border: 3px solid white;
    box-shadow: 1px 1px 4px #ababab;
}
    #memberEdit2{
       text-align: center;
    padding-left: 5px;
    margin-left: 10px;
    margin-top: 27px;
    height: 34px;
    font-size: 14.5px;
    width: 105px;
    color: #484848;
    background: white;
    border-radius: 24px;
   
   border: 1px solid white;
   box-shadow: 1px 1px 0px #c9c9c9;
    }
    
    
    #memberEdit2:hover {
	top:-2px;
	border: 3px solid white;
    box-shadow: 1px 1px 4px #ababab;
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
		
			<!-- 마이 페이지 메뉴 -->
			<jsp:include page="/WEB-INF/views/member/myPageMenu.jsp" flush='true' />
		
				<div id="updateUserBox">
					<h2 align="center" style="font-weight: 500;">회원 정보수정</h2>
					<br><br>
					<!-- <hr "styl> -->
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
										<td class="col2"><input type="text" name="userId" maxlength="10" id="userId" value="${user.userId}" placeholder="아이디">
											<p id="idError" class="errMsg" value=""></p>
										</td>
									</tr>
									<tr>
										<td class="col1">비밀번호</td>
										<td class="col2"><input type="password" name="userPw" maxlength="16" id="userPw" value="${user.userPw}" placeholder="비밀번호">
											<p id="pwError" class="errMsg">
												※ 비밀번호는 <span class="num">문자, 숫자, 특수문자(~!@#$%^&*)의 조합
													10 ~ 16자리</span>로 입력하세요.
											</p>
										</td>
									</tr>
									<tr>
										<td class="col1">비밀번호 확인</td>
										<td class="col2"><input type="password" name="pwCheck" maxlength="16" id="pwCheck" value="${user.userPw}" placeholder="비밀번호 확인"></td>
									</tr>
									<tr>
										<td class="col1">이메일</td>
										<td class="col2"><input type="text" name="userEmailId" id="userEmailId" value="${emailId}">
											<span class="a">@</span> <input type="text" name="userEmailText" id="userEmailText" value="${email}">
											<select id=selectEmail name="selectEmail" style="    border: 0; font-weight: 400;">
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
										<td class="col1">복용 알림 수신 여부</td>
										<td class="col2">
											<input type="radio" name="notification" value="1" style="margin-left:10px; color:red;" checked>수신&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="radio" name="notification" value="0">비수신
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
		<br><br><br><br><br><br>
		
		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
    	</div> <!-- wrap -->
	</body>
</html>