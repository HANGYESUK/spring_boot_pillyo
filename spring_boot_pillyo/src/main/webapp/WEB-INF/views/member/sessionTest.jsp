<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>세션 테스트</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
			
			<!-- TOP -->
			<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
			<div id="navMargin"></div>
			
			<section id="section">
			
				<h3>테스트</h3>
				
				<input type="button" name="" id="ctg"  value="1"/>
				<input type="button" name="" id="ctg"  value="2"/>
				
				<script type="text/javascript">
				$(function(){
					
					$('#ctg').on('click', function(){
						var ctgNo = $('#ctg').val();
						
						
						alert(ctgNo);
						$('#urlString').attr("src", url);
					})
				});
				</script>
				
				<img src="" id="urlString">

			</section>
	        
			<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>