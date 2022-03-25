<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>우리집 상비약 : OCR</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/ocr.js'/>"></script>
		<link rel="stylesheet" href="/css/hm/insertHmForm.css" />
		
		
	</head>
	<body>
		<div id="wrap">
		
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
		
		<div id="navMargin"></div>
		<section id="section">
		
		<div class="main-Content-Body low">
				<div class="basket-Item-Container colunm">
				<h2>우리집 약관리</h2>
					<c:if test="${not empty sessionScope.sid}">
						<p>먼저 이미지 파일을 올려주세요</p>
						<p id="pColor">* 이미지 파일은 영문으로 1MB 이하로 올려주세요</p>
					</c:if> <br><br>
					
					<div class = "hm">
					<!-- 1. OCR로 이미지 보여지고 텍스트 출력-->
						<form id="ocrForm" enctype="multipart/form-data" style="display:inline-block;">
						
							<table>
								<tr> <th id="hm">사진</th>	<td><input type="file" id="uploadFile" name="uploadFile"></td>
															<td><input type="submit" id="ocr" value="OCR로 약품명 가져오기"></td>
															<td><input class="in2" id="reset" type="reset" value="취소"></td></tr>
							</table>
							
							<!-- 업로드한 이미지  -->
							<div id="image"></div><br>
							<!-- OCR로 받아온 이미지의 텍스트 출력부분  -->
							<input type="text" id="hmName" name="hmName"> 
							
							<!--다음페이지 이동 -->
							<!-- <input class = "in" type="submit" value="등록" ><br><br> -->
	
						</form>
					</div>
				</div>
			</div>
		</section>

		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
		</div><!-- wrap -->
	</body>
</html>