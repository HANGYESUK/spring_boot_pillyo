<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>복용 목록 조회</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
			
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />

		<section>
			<h3>복용 목록 조회</h3><br>
			<table>
				<tr><th>약 복용 번호</th><th>가족 번호</th><th>약 복용 타이틀</th><th>약 번호</th><th>약 복용 시작 날짜</th><th>약 복용 종료 날짜</th><th>복용 주기 (일 단위)</th><th>복용 시간대(다중선택 가능)</th><th>복용 상세 시간</th><th>약 일회 복용 개수</th></tr>
			   <c:forEach items="${doseList }" var="dose">
			   	<tr><td><a href="<c:url value='/doseDetailView/${dose.ddNo}'/>">${dose.ddNo }</a></td>
		   			<td>${dose.famNo }</td>
		   			<td>${dose.ddTitle }</td>
		   			<td>${dose.drugInfoNo }</td>
		   			<td>${dose.ddStartDate }</td>
		   			<td>${dose.ddEndDate }</td>
		   			<td>${dose.ddCycle }</td>
		   			<td>${dose.ddTimeSlot }</td>
		   			<td>${dose.ddTime }</td>
		   			<td>${dose.ddAmount }</td>
			   	</tr>
			   </c:forEach>
			</table>
        </section>
        
		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>