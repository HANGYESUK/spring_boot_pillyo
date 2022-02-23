<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>제품 리스트</title>
		<style type="text/css">
		table{
		border: 1px solid #444444;
    	border-collapse: collapse;
		color : black;
		text-align : center;
		}

		th,td{
			width:200px;
			border: 1px solid #444444;
		}
		img{
			width:200px;
		}
		</style>
		
		<script src="<c:url value='/js/hmListView.js'/>"></script>
		
	</head>
	<body>
		<div class="hm_List_view">
		
			<table id="list_table">
				<tr> <th>사진</th> <th>제품명</th> <th>사용기간</th> </tr>
				
				<c:forEach items="${hmCtgList}" var="hmList">
				<tr> <td> <img src="<c:url value='/images/${hmList.hmImg}'/>"> </td>
				<%-- <td> <img src="<c:url value='/images/${hmList.hmImg}'/>"> </td> --%>
				<%-- <tr> <td> <img src="/img/hmListImg/${hmList.hmImg}"></td> --%>
				<%-- 테스트 했는데 안되는것들 ------> 이거 WebConfig 쓰는거라 절대경로쓰는건데 왜 안나오지
				<img src="/images/${hmList.hmImg}"> ${hmList.hmImg}</td>
				<img src="/img/${hmList.hmImg}"> ${hmList.hmImg}</td> 
				<img src="/images/${hmList.hmImg}.jpg"> ${hmList.hmImg}</td>
				<img src="<c:url value="/images/${hmList.hmImg}"/>"> ${hmList.hmImg}</td>
				--%>
					 <td> <a href="<c:url value='/householde_medicine/detailViewHm/${hmList.hmName}'/>"> ${hmList.hmName}</a></td>
					 <td>${hmList.hmUseByDate}</td></tr>
				</c:forEach>
				</table>
				
				<a href="/insertHmForm">
				<input type="button" value="등록하러가기"></a>
		</div>
	</body>
</html>
