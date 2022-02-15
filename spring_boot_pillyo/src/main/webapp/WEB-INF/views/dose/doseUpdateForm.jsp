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
						<tr><th>약 복용 타이틀<br><br></th><td><input type="text" id="ddTitle" name="ddTitle" value="${doseVo.ddTitle }"></td></tr>
        				
        				<tr><th>약 이름 입력받아서 -> 일치하는 약 선택 -> 해당 약 번호 넘기도록<br>약 이름 사용자 입력<br><br></th><td><input type="text" id="searchInput" name="searchInput"></td></tr>
        				<tr><th>약 번호 (자동완성 결과)<br><br></th><td><input type="number" id="drugInfoNo" name="drugInfoNo" value="${doseVo.drugInfoNo }"></td></tr>
				        
				        <tr><th>복용 시작 날짜</th><td><input type="date" id="ddStartDate" name="ddStartDate" value="${doseVo.ddStartDate }"></td></tr>
				        <tr><th>복용 종료 날짜</th><td><input type="date" id="ddEndDate" name="ddEndDate" value="${doseVo.ddEndDate }"></td></tr>
				        <tr><th>복용 주기 (일 단위)</th><td><input type="number" min="1" id="ddCycle" name="ddCycle" value="${doseVo.ddCycle }"></td></tr>
				        <tr>
				        	<th>복용 시간대 (여러 개 선택 가능)</th>
				        	<td>
				        		<input type="checkbox" id="afterGetUp" name="ddTimeSlot" value="기상직후">기상직후
				        		<input type="checkbox" id="beforeB" name="ddTimeSlot" value="아침식전">아침식전
				        		<input type="checkbox" id="afterB" name="ddTimeSlot" value="아침식후">아침식후
				        		<input type="checkbox" id="beforeL" name="ddTimeSlot" value="점심식전">점심식전
				        		<input type="checkbox" id="afterL" name="ddTimeSlot" value="점심식후">점심식후
				        		<input type="checkbox" id="beforeD" name="ddTimeSlot" value="저녁식전">저녁식전
				        		<input type="checkbox" id="afterD" name="ddTimeSlot" value="저녁식후">저녁식후
				        		<input type="checkbox" id="beforeBed" name="ddTimeSlot" value="취침전">취침전
				            </td>
				        </tr>
        				<tr><th>약 일회 복용 개수</th><td><input type="number" min="1" id="ddAmount" name="ddAmount" value="${doseVo.ddAmount }"></td></tr>
        				<td colspan="2">
        					<input type="submit" id="drugDoseSubmitBtn" value="등록">
        					<input type="reset" id="drugDoseResetBtn" value="취소">
       					</td>
					</table>
					
					<br><br><br><br><br><br>
					<div id='autoResult'></div> <!-- 자동완성 - 유사 데이터 표출 영역 -->
				</form>
				
				<script type="text/javascript">
					window.onload = function timeSlotCheck(){
						var timeSlotTxt = "${doseVo.ddTimeSlot}";
						var timeSlotArr = timeSlotTxt.split(",");
						var timeSlotChk = document.getElementsByName("ddTimeSlot");
	
						for (var i=0; i<timeSlotArr.length; i++) {
							for (var j=0; j<timeSlotChk.length; j++) {
				                if (timeSlotChk[j].value == timeSlotArr[i]) {
				                	timeSlotChk[j].checked = true;
				                }
				            }
						}
					}
				</script>
				<script>
					var drugArr = [
					    {key:1, name:'활명수'},
					    {key:2, name:'신신티눈고(살리실산반창고)(수출명:SINSINCORNPLASTER)'},
					    {key:3, name:'아네모정'},
					    {key:4, name:'타치온정50밀리그램(글루타티온(환원형))'},
					];
					
					var isComplete = false;  //autoResult 자식이 선택 되었는지 여부
					$('#searchInput').keyup(function(){
					    var txt = $(this).val();
					    if(txt != ''){  //빈줄이 들어오면
					        $('#autoResult').children().remove();

					        drugArr.forEach(function(arg){
					            if(arg.name.indexOf(txt) > -1 ){
					                $('#autoResult').append(
					                    $('<div>').text(arg.name).attr({'key':arg.key})
					                );		
					            }
					        });
					        $('#autoResult').children().each(function(){
					            $(this).click(function(){
					                $('#searchInput').val($(this).text());
					                $('#drugInfoNo').val($(this).attr('key'));
					                $('#autoResult').children().remove();	
					                isComplete = true;
					            });
					        });			
					    } else {
					        $('#autoResult').children().remove();
					    }  
					});
					$('#searchInput').keydown(function(event){
					    if(isComplete) {  //autoMaker 자식이 선택 되었으면 초기화
					        $('#drugInfoNo').val('')	
					    }
					})
				</script>
        </section>
        
		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>