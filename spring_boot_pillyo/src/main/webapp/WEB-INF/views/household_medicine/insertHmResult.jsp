<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>우리집 상비약 등록 완료</title>
		<style type="text/css">
		#hmImg{
		 width: 50px;
		}
		</style>
		
	</head>
	<body>
		<div id="wrap">
		
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
		
		<div id="navMargin"></div>
		<section id="section">
			<h3>약관리 뷰페이지</h3>
			
			<c:if test="${not empty sessionScope.sid}">
				<h3 id="UserName">${sessionScope.sid}님</h3>
			</c:if>
			
			<!-- 등록 폼에서 등록버튼 누르면 방금 입력했던 폼이 나오는 것 -->
			<c:forEach items="${hmList}" var="hm">
					약품명 : ${hm.hmName} <br>
					카테고리 : ${hm.hmCtgNo}<br> 
					사용기한 : ${hm.hmUseByDate}<br> 
					메모 : ${hm.hmMemo}<br>
					사진 : <img src="<c:url value='/images/${hm.hmImg}'/>" id = "hmImg"><br>
					
					<a href="<c:url value='/updateHmForm/${hm.hmNo}'/>">등록 약 정보 수정</a>
		 			<a href="javascript:deleteCheck();">등록 약 정보 삭제</a><br><br>
		 			
		 			<script type="text/javascript">
						function deleteCheck(){
							var answer = confirm("선택한 상비약 정보를 삭제하시겠습니까?");
							if(answer == true){
								location.href="<c:url value='/deleteHm/${hm.hmNo}' />";
							}
						}
					</script>
		 		
			</c:forEach>
		</section>

		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
		</div><!-- wrap -->
	</body>
</html>
