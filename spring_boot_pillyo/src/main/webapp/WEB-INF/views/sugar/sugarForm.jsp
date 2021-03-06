<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>혈당 등록 폼</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='sugarForm.js'/>"></script>
		<link rel="stylesheet" href="/css/dashboard/dashboard.css" />
		
	</head>
	<body>
		<div id="wrap">
			
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />

		<div id="navMargin"></div>
			
			<section id="section3">
			
			<h3 class="formName">혈당등록</h3>
			<form id="sugarForm" method="post" action="<c:url value='/insertSugar'/>">
				<div>
					<h3>상황</h3><input type="text" id="situation" name="situation" placeholder="ex>아침"/>
				</div>
				<div>
					<h3>투약</h3><input type="text" id="sugarMedication" name="sugarMedication" placeholder="ex> 인슐린 지속형 10단위"/>
				</div>
				<div>
					<h3>식전<input type="radio" id="ac" name="acpc" value="식전"/>식후<input type="radio" id="pc" name="acpc" value="식후"/></h3>
				</div>
				<div>
					<h3>혈당수치</h3><input type="text" id="sugarLevel" name="sugarLevel" placeholder="mg/dl"/>
				</div>
				<div>
					<h3>메모</h3><input type="text" id="acpcMemo" name="acpcMemo" />
				</div>
				<div>
					<h3>기록날짜</h3><input type="date" id="sugarRecordDate" name="sugarRecordDate" />
				</div>
				<div>
					<h3>기록시간</h3><input type="time" id="sugarRecordTime" name="sugarRecordTime" />
				</div>
				<input type="hidden" name="famNo" value="${famNo}" />
				
			<input type="submit"  value="등록"/>
				
			</form>
		
		</section>

		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>