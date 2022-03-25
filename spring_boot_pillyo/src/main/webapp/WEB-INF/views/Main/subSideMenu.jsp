<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>title</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<link rel="stylesheet" href="/css/main/subSideMenu.css" />
	</head>
	<body>

		<div class="sub-side-menu">
					<div id="subSideMenuItem">
						<h2> 건강 관리</h2>
							<ul class="subMenuItem">
								<li><a href="/famListView">가족관리</a></li>
								<li><a href="/healthManageView">건강 관리</a></li>
								<li><a href="/calendarView">복용 관리</a></li>
								<li><a href="/hmForm">우리집 약 관리</a></li>
							</ul>
						
					</div>
				</div>

	</body>
</html>