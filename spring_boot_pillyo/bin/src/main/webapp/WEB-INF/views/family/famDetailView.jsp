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

		<section>
			가족번호 : ${famVo.famNo }<br>
			아이디 : ${famVo.userId }<br>
			이름 : ${famVo.famMember }<br>
			생년월일 : ${famVo.famBirth }<br>
			성별 : ${famVo.famGender }<br>
			
			<br><br><br>
			
			<a href="<c:url value='/famUpdateForm/${famVo.famNo}'/>">가족 정보 수정</a><br>
			<a href="javascript:deleteCheck();">가족 정보 삭제</a><br>
			
			<script type="text/javascript">
				function deleteCheck(){
					var answer = confirm("해당 가족 구성원을 목록에서 삭제하시겠습니까?");
					if(answer == true){
						location.href="/famDelete/${famVo.famNo}";
					}
				}
			</script>
        </section>
        
		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>