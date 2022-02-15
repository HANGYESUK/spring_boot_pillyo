<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>title</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
			
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />

		<section>
			<h3>가족 정보 수정</h3><br><br>
				<form method="post" action="<c:url value='/famUpdate'/>">
					<table>
						<tr><td>가족번호</td><td><input type="hidden" name="famNo" value="${famVo.famNo}"></td></tr>
						<tr><td>이름</td><td><input type="text" name="famMember" value="${famVo.famMember}"></td></tr>
						<tr><td>생년월일</td><td><input type="date" name="famBirth" value="${famVo.famBirth}"></td></tr>
						<tr><td>성별</td><td><input type="text" name="famGender" value="${famVo.famGender}"></td></tr>
						<tr><td colspan="2"><input type="submit" value="수정"><input type="reset" value="취소"></td></tr>
					</table>
				</form>
        </section>
        
		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>