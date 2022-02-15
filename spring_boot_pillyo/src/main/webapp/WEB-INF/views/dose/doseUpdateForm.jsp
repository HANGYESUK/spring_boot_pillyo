<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>복용 수정 폼</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
			
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />

		<section>
			<h3>복용 정보 수정</h3><br><br>
				<form method="post" action="<c:url value='/doseUpdate'/>">
					<table>
						<tr><th>약 복용 번호(수정불가)</th><td><input type="number" id="ddNo" name="ddNo" value="${doseVo.ddNo }" readonly></td></tr>
						<tr><th>가족 번호(수정불가)</th><td><input type="number" id="famNo" name="famNo" value="${doseVo.famNo }" readonly></td></tr>
						<tr><th>약 복용 타이틀</th><td><input type="text" id="ddTitle" name="ddTitle" value="${doseVo.ddTitle }"></td></tr>
        				<tr><th>약 이름 입력받아서 -> 일치하는 약 선택 -> 해당 약 번호 넘기도록 (우선 약번호로 test)</th><td><input type="number" id="drugInfoNo" name="drugInfoNo" value="${doseVo.drugInfoNo }"></td></tr>
				        <tr><th>복용 시작 날짜</th><td><input type="date" id="ddStartDate" name="ddStartDate" value="${doseVo.ddStartDate }"></td></tr>
				        <tr><th>복용 종료 날짜</th><td><input type="date" id="ddEndDate" name="ddEndDate" value="${doseVo.ddEndDate }"></td></tr>
				        <tr><th>복용 주기 (일 단위)</th><td><input type="number" min="1" id="ddCycle" name="ddCycle" value="${doseVo.ddCycle }"></td></tr>
				        <tr>
				        	<th>복용 시간대 (여러 개 선택 가능)</th>
				        	<td>
				        		우선 텍스트로 입력받기<input type="text" id="ddTimeSlot" name="ddTimeSlot" value="${doseVo.ddTimeSlot }"></td>
				        		<!-- <input type="checkbox" name="ddTimeSlot" value="기상 직후">기상 직후
				        		<input type="checkbox" name="ddTimeSlot" value="아침 식전">아침 식전
				        		<input type="checkbox" name="ddTimeSlot" value="아침 식후">아침 식후
				        		<input type="checkbox" name="ddTimeSlot" value="점심 식전">점심 식전
				        		<input type="checkbox" name="ddTimeSlot" value="점심 식후">점심 식후
				        		<input type="checkbox" name="ddTimeSlot" value="저녁 식전">저녁 식전
				        		<input type="checkbox" name="ddTimeSlot" value="저녁 식후">저녁 식후
				        		<input type="checkbox" name="ddTimeSlot" value="취침 전">취침 전 -->
				            </td>
				        </tr>
        				<tr><th>약 일회 복용 개수</th><td><input type="number" min="1" id="ddAmount" name="ddAmount" value="${doseVo.ddAmount }"></td></tr>
        				<td colspan="2">
        					<input type="submit" id="drugDoseSubmitBtn" value="등록">
        					<input type="reset" id="drugDoseResetBtn" value="취소">
       					</td>
					</table>
				</form>
        </section>
        
		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>