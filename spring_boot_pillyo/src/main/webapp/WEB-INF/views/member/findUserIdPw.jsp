<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Pill-Yo 아이디/비밀번호 찾기</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/findUserIdPw.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
		
			<form id="findUserIdBox" name="findUserIdBox">
				<h2> 아이디 찾기</h2>
				<table>
				<tr>
					<th>이름</th>
					<td><input type="text" id="findName" name="findName" placeholder="이름"></td></tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" id="findEmail" name="findEmail" placeholder="이메일"></td></tr>
				</table>
				<button type="submit" id="findUserId">아이디 찾아보기</button>
			</form>
			
			<div id="findUserPwBox">
				<h2> 비밀번호 찾기</h2>
				<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" id="findId" name="findId" placeholder="아이디"></td></tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" id="findEmail" name="findEmail" placeholder="이메일"></td></tr>
				</table>
				<button type="submit" id="findUserPw">비밀번호 찾아보기</button>
			</div>
		</div>      
	</body>
</html>
