<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>OCR</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/ocr.js'/>"></script>
		<!-- 이미지 불러오는 java Script -->
		<script type="text/javascript">
		 function setThumbnail(event) { // 이미지 등록 버튼의 onchange
				var reader = new FileReader(); 	// 파일을 불러옴
			    
				reader.onload = function(event) { // 불러온 파일을 읽어 div#image_container에 넣음
					var image = document.createElement("img"); 
					image.setAttribute("src", event.target.result); 
					document.getElementById("image_container").appendChild(image);
					}
					
				reader.readAsDataURL(event.target.files[0]);
			}
		 </script>
		
		<style type="text/css">
		
		th{
		width : 100px;
		}
		
		#hmName{
			width : 440px;
			height : 20px;
			font-size : 14px;
			font-weight : bold;
		}
		#hmCtgNo{
			width : 440px;
			height : 20px;
			font-size : 14px;
		}
		#hmUseByDate{
			width : 440px;
			height : 20px;
			font-size : 14px;
		}
		
		#img_box{
			border : 1px solid #A0A0A0;
			width: 400px;
		}
		#image_container{
			width: 450px;
			height: 450px;
		}
		#image_container img
		{
		  width: 450px;
		  height: 450px;
		}
		</style>
		
	</head>
	<body>
		<div id="wrap">
		
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
		;
		<div id="navMargin"></div>
		<section id="section">
			<div class = "hm">
				<h2>우리집 약관리</h2>
				<hr><br>
				<c:if test="${not empty sessionScope.sid}">
					<h4 id="UserName">${sessionScope.sid} 님</h4>
					<p>어떤 약을 등록하실건가요? </p><br><br>
					<p>* 이미지 파일은 영문으로 1MB 이하로 올려주세요</p>
				</c:if>
				
				<!-- 상비약 등록 -->
				
				<form id="hmForm" method="post" action="<c:url value ='/insertHm/'/>">
					<table class="inputHm">
					<tr> <th id="hm">약품명</th>	<td><input type="text" id="hmName" name="hmName" value="${ocrResult}"></td> </tr>
					<tr> <th id="hm">카테고리</th>	<td><input type="text" id="hmCtgNo" name="hmCtgNo" list="hmCtgList">
													<datalist id="hmCtgList">
											            <option value="1">두통약</option>
											            <option value="2">감기약</option>
											            <option value="3">소화제</option>
											            <option value="4">해열제</option>
											            <option value="5">진통제</option>
											            <option value="6">치통약</option>
											            <option value="7">연고/파스</option>
											            <option value="8">기타</option>
										        	</datalist></td></tr>
					<tr> <th id="hm">사용기한</th>	<td><input type="date" name="hmUseByDate"></td></tr>
					<tr> <th id="hm">메모</th>	<td><textarea name="hmMemo" rows="10" cols="60" placeholder="내용을 입력하세요" style="resize: none;"></textarea></td></tr>
					<tr> <th id="hm">사진</th>	<td>다시 한번 이미지를 올려주세요 >>  <input  id = "hmImg" type="file" name="hmImg" onchange="setThumbnail(event);"></td>
					<tr> <th id="hm"></th>		<td id="img_box"> <div id="image_container"></div></td></tr>
					</table>
					<input type="hidden" name="userId" value="${sessionScope.sid}" />
					
					 <!-- 전송 버튼 / 취소 버튼 -->
					 <input class = "in" type="submit" value="등록" >
					 <input class = "in2" type="reset" value="취소">
				</form>
				<!-- <form id="ocrForm" enctype="multipart/form-data">
				<table>
					<tr> <th id="hm" rowspan="2">사진</th>	<td><input type="file" id="uploadFile" name="uploadFile">
																<input type="submit" value="결과 확인"></td></tr>
					<tr>									<td><div id="image"></div><td></tr>
					</table>
				</form> -->
				
				<br>

			</div>
		</section>

		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
		</div><!-- wrap -->
	</body>
</html>