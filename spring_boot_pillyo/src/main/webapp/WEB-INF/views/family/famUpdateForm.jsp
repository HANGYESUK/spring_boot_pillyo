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
						<h4>가족번호</h4><input type="hidden" name="famNo" value="${famVo.famNo}"><br>
						<h4>이름</h4><input type="text" name="famMember" value="${famVo.famMember}"><br>
						<h4>생년월일</h4><input type="date" name="famBirth" value="${famVo.famBirth}"><br>
						<h4>성별</h4><input type="text" name="famGender" value="${famVo.famGender}"><br>
						<input type="submit" value="수정"><input type="reset" value="취소"><br>
				</form>
        </section>
        
		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>