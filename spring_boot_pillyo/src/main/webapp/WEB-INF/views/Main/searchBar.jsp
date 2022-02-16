<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>검색창</title>
	<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='drugAutoComplete.js'/>"></script>
	</head>
	<body>
		
		<section>
			<div id="searchBox" bgcolor="lightgray">
				<form method="post" action="<c:url value='/drugSearch'/>">
					<input type="text" id="drugSearchInput" name="keyWord" />
					<input type="submit" value="검색" />
				</form>
			</div>
		</section>
    	
	</body>
</html>