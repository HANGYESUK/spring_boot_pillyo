<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>가족 등록 폼</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
		
			<!-- TOP -->
			<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
	
			<!--  가족 등록 폼  -->
			<section>
		        <h1>가족 등록</h1>
		        <hr>
		        <form methond="post" action="<c:url value='/famInsert'/>">
		          <table>
		            <tr><th>이름</th><td><input type="text" id="famMember" name="famMember" ></td></tr>
		            <tr><th>생년월일</th><td><input type="text" id="famBirth" name="famBirth" /></td>
		            <tr>
		            	<th>성별</th>
		            	<td>
           					<input type="radio" id="famGender0" name="famGender" value="0">남성
                            <input type="radio" id="famGender1" name="famGender" value="1">여성
           				</td>
		            </tr>
		            <tr>
		            	<td colspan="2">
		            		<input type="submit" id="famSubmitBtn" value="등록">
		                    <input type="reset" id="famResetBtn" value="취소">
		                </td>
		            </tr>          
		           </table>
		        </form> 
	        </section>
	        
			<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
		</div> <!-- wrap -->
	</body>
</html>