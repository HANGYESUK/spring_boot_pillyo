<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>복용 정보 수정 폼</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<link rel="stylesheet" href="/css/dose/doseUpdate.css" />
		<link rel="stylesheet" href="/css/dose/doseAutoSearch.css" />
	</head>
	<body>
		<div id="wrap">
			
			<!-- TOP -->
			<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
			<div id="navMargin"></div>
			
			<section id="section">
				<div id="doseUpdateBox">
					<div id="doseUpdateFormBox">
						<h3>복용 정보 수정</h3>
						<form method="post" id="doseUpdateForm" action="<c:url value='/doseUpdate'/>">
							<table>
								<input type="hidden" id="ddNo" name="ddNo" value="${doseVo.ddNo }" readonly><!-- 약 복용 번호(수정불가) -->
								<input type="hidden" id="drugInfoNo" name="drugInfoNo" value="${doseVo.drugInfoNo }"><!-- 약 번호 (자동완성 결과) -->
								<input type="hidden" id="famNo" name="famNo" value="${doseVo.famNo }" readonly>
								
								<tr><th>복용 타이틀</th><td><input type="text" id="ddTitle" name="ddTitle" value="${doseVo.ddTitle }"></td></tr>
		        				<tr><th>약 이름</th><td><input type="text" id="searchInput" name="searchInput"></td></tr>
						        
						        <tr><th>복용 시작 날짜</th><td><input type="date" id="ddStartDate" name="ddStartDate" value="${doseVo.ddStartDate }"></td></tr>
						        <tr><th>복용 종료 날짜</th><td><input type="date" id="ddEndDate" name="ddEndDate" value="${doseVo.ddEndDate }"></td></tr>
						        <tr><th>복용 주기</th><td><input type="number" min="1" id="ddCycle" name="ddCycle" value="${doseVo.ddCycle }">일</td></tr>
						        <tr>
						        	<th>복용 시기</th>
						        	<td id="timeSlotTd">
						        		<label for="afterGetUp">기상직후</label><input type="radio" id="afterGetUp" name="ddTimeSlot" value="기상직후">
						        		<label for="beforeB">아침식전</label><input type="radio" id="beforeB" name="ddTimeSlot" value="아침식전">
						        		<label for="afterB">아침식후</label><input type="radio" id="afterB" name="ddTimeSlot" value="아침식후">
						        		<label for="beforeL">점심식전</label><input type="radio" id="beforeL" name="ddTimeSlot" value="점심식전">
						        		<label for="afterL">점심식후</label><input type="radio" id="afterL" name="ddTimeSlot" value="점심식후">
						        		<label for="beforeD">저녁식전</label><input type="radio" id="beforeD" name="ddTimeSlot" value="저녁식전">
						        		<label for="afterD">저녁식후</label><input type="radio" id="afterD" name="ddTimeSlot" value="저녁식후">
						        		<label for="beforeBed">취침전</label><input type="radio" id="beforeBed" name="ddTimeSlot" value="취침전">
						            </td>
						        </tr>
						        <tr><th>복용 상세 시간</th><td><input type="time" id="ddTime" name="ddTime" value="${doseVo.ddTime }"></td></tr>
		        				<tr><th>1회 복용량</th><td><input type="number" min="1" id="ddAmount" name="ddAmount" value="${doseVo.ddAmount }"></td></tr>
		        				<td colspan="2" id="doseUpdateBtnTd">
		        					<input type="submit" class="doseUpdateBtn" value="수정">
		        					<input type="reset" class="doseUpdateBtn" value="취소">
		       					</td>
							</table>
						</form>
					</div>
					<div id="autoResultBox">
						<h3>자동완성 결과</h3><span id="autoMsg">등록을 원하는 약물 이름을 클릭하세요.</span>
						<div id="autoResultScroll"><!-- 자동완성 : 유사 데이터 표출 영역 -->
							<ul id='autoResult'></ul>
						</div>
					</div>
				</div>
				
				<script type="text/javascript">
					$('input[type="radio"]').change(function(){
						$('input[type="radio"]').prev('label').css('background-color', '#d0deea');
						
						if($(this).is(':checked')){
							$(this).prev('label').css('background-color', '#b7cee2');
						}
					    else{
							$(this).prev('label').css('background-color', '#d0deea');
						}
					});
				</script>
				<script>
			       	document.addEventListener('DOMContentLoaded', function() {
				        /* 약 전체 목록 data */
				    	var drugArr = new Array();
				    	<c:forEach items="${drugList}" var="drug">
				    		drugArr.push({
				    			key:"${drug.drugInfoNo}",
				    			name:"${drug.itemName}"
				    		});
						</c:forEach>
						//console.log(drugArr);
						
						var isComplete = false;  //autoResult 자식이 선택 되었는지 여부
						$('#searchInput').keyup(function(){
						    var txt = $(this).val();
						    if(txt != ''){  //빈줄이 들어오면
						        $('#autoResult').children().remove();
				
						        drugArr.forEach(function(arg){
						            if(arg.name.indexOf(txt) > -1 ){
						                $('#autoResult').append(
						                    $('<li class="autoResultItem">').text(arg.name).attr({'key':arg.key})
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
			       	});
				</script>
			</section>
	        
			<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>