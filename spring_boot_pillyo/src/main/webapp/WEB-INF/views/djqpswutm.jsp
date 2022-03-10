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
			<div id="navMargin"></div>
			
			<section id="section">
				<a href="<c:url value = '/loginForm'/>">로그인</a>
				<a href="<c:url value = '/join'/>">회원가입</a>
				<a href="<c:url value = '/famInsertForm'/>">가족 등록 폼</a>
				<a href="<c:url value = '/famListView'/>">가족 목록 리스트</a>
				
				<br><br><br><br><br><br>
				<a href="<c:url value = '/feelManageForm'/>">기분관리</a>
				<a href="<c:url value = '/hmForm'/>">우리집 약관리</a>	
				<a href="<c:url value = '/clovaOCRForm'/>">OCR테스트</a>	
				
				<br><br><br><br><br><br>
				혈당관리
				<a href="<c:url value = '/sugarForm'/>">혈당등록</a>
				<a href="<c:url value = '/listAllSugar'/>">혈당리스트</a>
				
				<br><br><br><br><br><br>
				혈압관리
				<a href="<c:url value = '/pressureForm'/>">혈압등록</a>
				<a href="<c:url value = '/listAllPressure'/>">혈압리스트</a>
				
				<br><br>
				<a href="<c:url value = '/join'/>">회원가입</a>
	
				<a href="<c:url value = '/bodyForm'/>">체형관리정보 등록 </a>
				<a href="<c:url value = '/listAllBody'/>">체형 관리 정보 리스트</a>
				
				<br><br><br><br>
				<a href="<c:url value = '/dashboard'/>">대쉬보드</a><br>
				<a href="<c:url value = '/dashboard2'/>">대쉬보드 연습중...</a>
				<a href="<c:url value = '/dashboardtest'/>">대쉬보드 연습중...2</a>
				<a href="<c:url value = '/dashboardtest'/>">대쉬보드 연습중...2</a>

				<a href="<c:url value = '/boardList'/>">페이징 연습중</a>
				
				<br><br><br><br>
				<a href="<c:url value = '/listAllComment'/>">댓글 연습중</a>
				
				<br><br>
				<a href="<c:url value = '/pharmacy'/>">약국지도</a><br>
				<a href="<c:url value = '/pharmacySearch'/>">지역검색API</a><br>
				<a href="<c:url value = '/insertDrugList'/>">API 약 정보 db 저장</a><br>
				<a href="<c:url value = '/drugShape'/>"> 약 낱알정보 API 테스트</a><br>
				<a href="<c:url value = '/drugShapeSearchForm'/>"> 약 낱알정보 검색폼</a><br>
				<br><br><br><br>
				
				<a href="<c:url value = '/doseInsertForm'/>">복용 관리 - 등록 폼</a>
				<a href="<c:url value = '/doseListView'/>">복용 목록 조회</a>
			</div>
			</section>
	        
			<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>