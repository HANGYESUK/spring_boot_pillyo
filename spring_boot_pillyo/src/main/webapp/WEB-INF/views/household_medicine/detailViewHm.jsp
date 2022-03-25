<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상세페이지</title>
		<jsp:include page="/WEB-INF/views/chatBot.jsp"/>
		
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
			<table>
				<tr> <th>약품명</th> 		<td><input type="text" id="hmName" name="hmName" value="${hm.hmName}" required ></td></tr>
				<tr> <th>카테고리</th> 	<td><input type="number" id="hmCtgNo" name="hmCtgNo" list="hmCtgList" value="${hm.hmCtgNo}" required >
	        	<tr> <th>사용기한</th>		<td><input type="date" name="hmUseByDate" value="${hm.hmUseByDate}" required ></td></tr>
				<tr> <th>메모</th>		<td><textarea name="hmMemo" rows="10" cols="60" placeholder="내용을 입력하세요" style="resize: none;" required >${hm.hmMemo}</textarea></td></tr>
				
				<tr> <th id="hm">사진</th>	<td><input id = "hmImg" type="file" name="hmImg" value="${hm.hmImg}" onchange="setThumbnail(event);" required></td>
				<tr> <th id="hm"></th>		<td id="img_box"> <div id="image_container"> <img src="<c:url value='/images/${hm.hmImg}'/>"></div> </td></tr>
			</table>
			<input type="hidden" id="hmNo" name="hmNo" value="${hm.hmNo }">

		</section>

		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
		</div><!-- wrap -->
	</body>
</html>
