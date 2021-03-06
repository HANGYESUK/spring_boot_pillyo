<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>기분 정보 수정 폼</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<link rel="stylesheet" href="/css/dashboard/dashboard.css" />
		<link rel="stylesheet" href="/css/dashboard/family/familyView.css" />
	</head>
	<body>
		<div id="wrap">
		
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />


		<!-- Section -- 기분관리 : 기분척도, 메모, 기록날짜, 기록시간, 가족번호 -->
		<div id="navMargin"></div>
			
	<section id="section3">
			<div class="main-Content-Body low">
					<div class="basket-Item-Container colunm">
							<h1 class="formName">기분관리 수정</h1>
							<br><br>
					<form id="updateFeelForm" method="post" action="<c:url value='/updateFeel'/>">
					  	<input type="hidden" id="feelNo" name="feelNo" value="${feel.feelNo}"/>
					  	<input type="hidden" id="famNo" name="famNo" value="${feel.famNo}"/>
					  	<div>
							<h3>기분관리번호 </h3><input type="text" id="feelNo" name="feelNo" value="${feel.feelNo}"/>
						</div>
						<div>
							<h3>기분척도 </h3><input type="text" id="feelScale" name="feelScale" value="${feel.feelScale}"/>
						</div>
						<div>
							<h3>기분일기</h3><input type="text" id="feelMemo" name="feelMemo" value="${feel.feelMemo}"/>
                         </div>
                         <div>
							<h3>기록날짜</h3><input type="text" id="feelRecordDate" name="feelRecordDate" value="${feel.feelRecordDate}"/>
                         </div>
						 <div>
							<input type="submit" id="send_btn" value="수정하기">
						 </div>
						 <div>
							<input type="reset" id="reset_btn" value="취소하기">
						 </div>
					  </form> 
					</div>
			</div>	
			
		</section>
		
		
		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
		</div> <!-- wrap -->
	
	</body>
</html>
