<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>

</head>
<body>
	<section>
			<h3>전체 체형 관리 목록</h3>
			
			   <c:forEach items="${bodyList }" var="body">
		   			체형관리 번호 ${body.bodyNo}<br>
		   			키 ${body.height}<br>
		   			몸무게 ${body.weight}<br>
		   			BMI ${body.bmi}<br>
		   			기록날짜 ${body.bodyRecordDate}<br>
		   			가족 번호 ${body.famNo}<br>
		
			   	<br>
			   	<a href="<c:url value='/updateBodyForm/${body.bodyNo}'/>">체형 관리 정보 수정</a>
			   	<a href="javascript:deleteCheck();">체형 관리 정보 삭제</a><br>
			   	
			   	<script type="text/javascript">
					function deleteCheck(){
						var answer = confirm("선택한 체형 정보를 삭제하시겠습니까?");
						if(answer == true){
							location.href="<c:url value='/deleteBody/${body.bodyNo}' />";
						}
					}
				</script>
 		
 		<br>
			   </c:forEach>
			   
	</section>
			
</body>
</html>