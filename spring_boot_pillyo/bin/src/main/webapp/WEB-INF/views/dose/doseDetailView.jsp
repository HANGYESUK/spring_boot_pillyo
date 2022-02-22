<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>복용 상세 정보 조회</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
			
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />

		<section>
			약 복용 번호 : ${doseVo.ddNo }<br>
			가족 번호 : ${doseVo.famNo }<br>
			약 복용 타이틀 : ${doseVo.ddTitle }<br>
			약 번호 : ${doseVo.drugInfoNo }<br>
			약 복용 시작 날짜 : ${doseVo.ddStartDate }<br>
			약 복용 종료 날짜 : ${doseVo.ddEndDate }<br>
			복용 주기 (일 단위) : ${doseVo.ddCycle }<br>
			복용 시간대(다중선택 가능) : ${doseVo.ddTimeSlot }<br>
			복용 상세 시간 : ${doseVo.ddTime }<br>
			약 일회 복용 개수 : ${doseVo.ddAmount }<br>
			<br><br><br>
			
			<a href="<c:url value='/doseUpdateForm/${doseVo.ddNo}'/>">복용 정보 수정</a><br>
			<a href="javascript:deleteCheck();">복용 정보 삭제</a><br>
			
			<script type="text/javascript">
				function deleteCheck(){
					var answer = confirm("해당 복용 정보를 목록에서 삭제하시겠습니까?");
					if(answer == true){
						location.href="/doseDelete/${doseVo.ddNo}";
					}
				}
			</script>
        </section>
        
		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>