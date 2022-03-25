<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>우리집 상비약 목록</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<jsp:include page="/WEB-INF/views/chatBot.jsp"/>
		
		<style type="text/css">
		table{
    	border-collapse: collapse;
		color : black;
		text-align : center;
		}

		th,td{
			width:250px;
		}
		img{
			width:100px;
		}
		</style>
		
		<script src="<c:url value='/js/hmListView.js'/>"></script>
		
	</head>
	<body>
		<div class="hm_List_view">
		
			<table id="list_table">
				<tr> <th>사진</th> <th>제품명</th> <th>사용기한</th> </tr>
				
				<c:forEach items="${hmCtgList}" var="hmList">
				<tr> <td> <img src="<c:url value='/images/${hmList.hmImg}'/>"> </td>
					 <td> <a href="<c:url value='/householde_medicine/detailViewHm/${hmList.hmName}'/>"> ${hmList.hmName}</a></td>
					 <td>${hmList.hmUseByDate} 까지</td></tr>
				</c:forEach>
				</table>
		</div>
	</body>
</html>
