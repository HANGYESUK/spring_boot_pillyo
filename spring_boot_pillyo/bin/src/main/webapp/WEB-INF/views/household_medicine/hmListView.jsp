<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>제품 리스트</title>
		<style type="text/css">
		th{
			width:220px;
		}
		</style>
		
		<script src="<c:url value='/js/hmListView.js'/>"></script>
		
	</head>
	<body>
		<div class="hm_List_view">
		
			<table id="list_table">
				<tr> <th rowspan="2">사진</th><th>제품명</th></tr>
											 <th>사용기간</th></tr>
				
				<c:forEach items="${hmList}" var="hmList">
				<tr> <td rowspan="2">${hmList.img}</td>
					 <td> <a href="<c:url value='/householde_medicine/detailViewHm/${hmCtgList.hmName}'/>">
					 	 ${hmList.hmName}</a></td>
					 <td>${hmList.hmUseByDate}</td></tr>
				</c:forEach>
				</table>
				
				<a href="/insertHm">
				<input type="button" value="등록하러가기"></a>
		</div>
	</body>
</html>
