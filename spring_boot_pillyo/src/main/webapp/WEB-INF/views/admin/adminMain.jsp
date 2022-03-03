<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 메인</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<link rel="stylesheet" href="<c:url value='/css/admin/adminMain.css'/>">
	</head>
	<body>
		<div id="wrap">
			
			<!-- TOP -->
			<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
			<div id="navMargin"></div>
			
			<section id="section">
			
				<div id="adminContainer">
					<div id="adminBox">
						<div id="adminItemMenu">
							<div class="adminItemTitle">관리자 메뉴</div>
							<div class="adminItem"><a href="">관리자 권한</a></div> 
							<div class="adminItem"><a href="">약 관리</a></div>
							<div class="adminItem"><a href="">알림 관리</a></div>
							<div class="adminItem"><a href="">게시판 관리</a></div>
						</div>
						
						
						<div id="adminUserMenu">
							<div class="adminItemTitle">유저 메뉴</div>
							<div class="adminItem"><a href="/listAllUser">회원 관리</a></div>
							<div class="adminItem"><a href="">건강 관리</a></div>
							<div class="adminItem"><a href="">복용 관리</a></div>
							<div class="adminItem"><a href="">건강 관리</a></div>
						</div>
					</div>
				
					<div id="adminArticle">
							
					</div>					
				
				</div> <!-- adminContainer -->
			</section>
	        
			<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>