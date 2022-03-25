<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>title</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<link rel="stylesheet" href="<c:url value='/css/admin/adminMain.css'/>">
		
		
	</head>
	<body>

		<div id="adminBox">
					<!-- 		<div id="adminItemMenu">
							<div class="adminItemTitle">관리자 메뉴</div>
							<div class="adminItem"><a href="">관리자 권한</a></div> 
							<div class="adminItem"><a href="/listAllDrug">*약 정보 관리</a></div>
							<div class="adminItem"><a href="/listAllDrugShpae">*약 모양 관리</a></div>
							<div class="adminItem"><a href="">알림 관리</a></div>
							<div class="adminItem"><a href="">게시판 관리</a></div>
						</div>
						
						
						<div id="adminUserMenu">
							<div class="adminItemTitle">유저 메뉴</div>
							<div class="adminItem"><a href="/listAllUser">*회원 관리</a></div>
							<div class="adminItem"><a href="">건강 관리</a></div>
							<div class="adminItem"><a href="">복용 관리</a></div>
							<div class="adminItem"><a href="">건강 관리</a></div>
						</div>
					</div> -->
			<div id="adminItemMenu">
				<h2> 관리자 메뉴</h2>
				<ul class="adminItem-big">
					<li><a href="">메뉴 관리 </a>
					<ul class="adminItem">
						<li ><a href="/listAllDrug">약 정보 관리</a></li>
						<li><a href="/listAllDrugShpae">약 모양 관리</a></li>
						<li><a href="">알림 관리</a></li>
						<li><a href="">게시판 관리</a></li>
					</ul>
					</li>
				</ul>
				<ul class="adminItem-big">
					<li ><a href="">유저 관리 </a>
					<ul class="adminItem">
						<li><a href="/listAllUser">회원 관리</a></li>
						<li><a href="">건강 관리</a></li>
						<li><a href="">복용 관리</a></li>
					</ul>
					</li>
				</ul>
			</div>
			</div>
	</body>
</html>