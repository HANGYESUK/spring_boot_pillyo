<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 메인</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		
	</head>
	<body>
		<div id="wrap">
			
			<!-- TOP -->
			<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
			<div id="navMargin"></div>
			
			<section id="section">
			
				<div id="adminContainer">
			
				<jsp:include page="/WEB-INF/views/admin/adminMainMenu.jsp" flush='true' />
			
					<div id="adminArticle">
						
						<div class="adminInfoBox">
							<div id="userCnt">
							 	<p>  회원수
								${userCnt}</p>
							</div>
						</div>
						
						<div class="adminInfoBox">
						
						</div>
						
						<div class="adminInfoBox">
						
						</div>	
							
							
							
							
					</div>					
				
				</div> <!-- adminContainer -->
			</section>
	        
			<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>