<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>복용관리 - 등록 폼</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
		
			<!-- TOP -->
			<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
	
			<!--  복용 관리 - 등록 폼  -->
			<section>
		        <h1>복용 관리 - 등록</h1>
		        <hr>
		        
		        <form methond="post" action="<c:url value='/doseInsert'/>">
			        입력X<br>
			        약 복용 번호 -> 자동 증가<br>
			        가족 번호 (외래키) - 데이터 등록 테스트 위해서 임의 값 고정 <input type="number" id="famNo" name="famNo" value="2" readonly><br>
			        <br><br>
			        
			        <hr>
			        입력받기 : 약 복용 타이틀, 약 복용 시작/종료 날짜, 약 복용 주기(일 단위), 약 복용 시간대(다수), 약 일회 복용 개수<br>
			        복용 체크 우선 보류<br>
		          <table>
		            <tr><th>약 복용 타이틀</th><td><input type="text" id="ddTitle" name="ddTitle" ></td></tr>
		            <tr><th>약 이름 입력받아서 -> 일치하는 약 선택 -> 해당 약 번호 넘기도록 (test용 -> 우선 약번호 입력)</th><td><input type="number" id="drugInfoNo" name="drugInfoNo" /></td>
		            <tr><th>복용 시작 날짜</th><td><input type="date" id="ddStartDate" name="ddStartDate"></td></tr>
		            <tr><th>복용 종료 날짜</th><td><input type="date" id="ddEndDate" name="ddEndDate"></td></tr>
		            <tr><th>복용 주기 (일 단위)</th><td><input type="number" min="1" id="ddCycle" name="ddCycle"></td></tr>
		            <tr>
		            	<th>복용 시간대 (여러 개 선택 가능)</th> <!-- 여러 개 선택 시 , 로 구분되어 문자열로 삽입됨 -->
		            	<td>
		            		<input type="checkbox" name="ddTimeSlot" value="기상직후">기상직후
		            		<input type="checkbox" name="ddTimeSlot" value="아침식전">아침식전
		            		<input type="checkbox" name="ddTimeSlot" value="아침식후">아침식후
		            		<input type="checkbox" name="ddTimeSlot" value="점심식전">점심식전
		            		<input type="checkbox" name="ddTimeSlot" value="점심식후">점심식후
		            		<input type="checkbox" name="ddTimeSlot" value="저녁식전">저녁식전
		            		<input type="checkbox" name="ddTimeSlot" value="저녁식후">저녁식후
		            		<input type="checkbox" name="ddTimeSlot" value="취침전">취침전
		                </td>
		            </tr>
		            <tr><th>약 일회 복용 개수</th><td><input type="number" min="1" id="ddAmount" name="ddAmount"></td></tr>
		            <tr>
		            	<td colspan="2">
		            		<input type="submit" id="drugDoseSubmitBtn" value="등록">
		                    <input type="reset" id="drugDoseResetBtn" value="취소">
		                </td>
		            </tr>          
		           </table>
		        </form>
	        </section>
	        
			<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
		</div> <!-- wrap -->
	</body>
</html>