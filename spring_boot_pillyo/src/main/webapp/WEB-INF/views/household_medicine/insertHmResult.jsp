<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>우리집 상비약 등록 완료</title>
	</head>
	<body>
	<table> <!-- OCR로 이미지 넣어서 글씨 출력 -->
			<c:forEach items="${hmList}" var="hm">
			<tr> <th id="hm">약품명</th>	<td> ${hm.hmName} </td></tr>
			<tr> <th id="hm">카테고리</th>	<td> ${hm.hmCtgNo} </td></tr>
			<tr> <th id="hm">사용기한</th>	<td> ${hm.hmUseByDate} </td></tr>
			<tr> <th id="hm">메모</th>	<td> ${hm.hmMemo} </td>
			<tr> <th id="hm">사진</th>	<td> ${hm.hmImg} </td></tr>
			</c:forEach>
			<!-- OCR로 이미지 넣어서 글씨 출력 -->
			<c:forEach items="${hmCtgList}" var="hm">
			<tr> <th id="hm">약품명</th>	<td> ${hmCtgList.hmName} </td></tr>
			<tr> <th id="hm">카테고리</th>	<td> ${hmCtgList.hmCtgNo} </td></tr>
			<tr> <th id="hm">사용기한</th>	<td> ${hmCtgList.hmUseByDate} </td></tr>
			<tr> <th id="hm">메모</th>	<td> ${hmCtgList.hmMemo} </td>
			<tr> <th id="hm">사진</th>	<td> ${hmCtgList.hmImg} </td></tr>
			</c:forEach>
		</table>
	</body>
</html>
