<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>우리집 상비약 등록 폼</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/ocr.js'/>"></script>
		<link rel="stylesheet" href="<c:url value='/css/hm/insertHmForm2.css'/>">
		
		<%-- <script src="<c:url value='/js/insertHmForm2_check.js'/>"></script> --%>
		<!-- 이미지 불러오는 java Script -->
		<script type="text/javascript">
		 function setThumbnail(event) { // 이미지 등록 버튼의 onchange
				var reader = new FileReader(); 	// 파일을 불러옴
				$('#image_container').empty()
				reader.onload = function(event) { // 불러온 파일을 읽어 div#image_container에 넣음
					var image = document.createElement("img"); 
					image.setAttribute("src", event.target.result); 
					document.getElementById("image_container").appendChild(image);
					}
					
				reader.readAsDataURL(event.target.files[0]);
			}
		 </script>
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

						<div class="colum">
							<c:if test="${not empty sessionScope.sid}">
								<div class="low">
									<h4 id="UserName" style="color: #81B89A;">${sessionScope.sid} 님</h4>
									<p>어떤 약을 등록하실건가요?</p><br>
								</div>
								<p style="color: red;">* 이미지 파일은 영문으로 1MB 이하로 올려주세요</p>

							</c:if>
						</div>
						
						<!-- 상비약 등록 -->
						
						<form id="hmForm" name="hmForm" method="post" action="<c:url value ='/insertHm/'/>">
							<table class="inputHm">
							<tr> <th id="hm">약품명</th>	<td><input type="text" id="hmName" name="hmName" value="${ocrResult}" required ></td> </tr>
							<tr> <th id="hm">카테고리</th>	<td><input type="text" id="hmCtgNo" name="hmCtgNo" list="hmCtgList" required >
															<datalist id="hmCtgList">
													               <option value="1">두통약</option>
														           <option value="2">감기약</option>
														           <option value="3">소화제</option>
														           <option value="4">해열제</option>
														           <option value="5">진통제</option>
														           <option value="6">치통약</option>
														           <option value="7">알레르기약</option>
														           <option value="8">연고/파스</option>
														           <option value="9">기타</option>
												        	</datalist></td></tr>
							<tr> <th id="hm">사용기한</th>	<td><input type="date" name="hmUseByDate" required ></td></tr>
							<tr> <th id="hm">메모</th>	<td><textarea name="hmMemo" rows="10" cols="60" placeholder="내용을 입력하세요" style="resize: none;" required ></textarea></td></tr>
							<tr> <th id="hm">사진</th>	<td>다시 한번 이미지를 올려주세요 >>  <input  id = "hmImg" type="file" name="hmImg" onchange="setThumbnail(event);" required ></td>
							<tr> <th id="hm"></th>		<td id="img_box"><div id="image_container"><img id="image" src="#" alt="이미지 미리보기" /></div></td></tr>
							</table>
							<input type="hidden" name="userId" value="${sessionScope.sid}" />
							
							 <!-- 전송 버튼 / 취소 버튼 -->
							 <div class="submitForm low">
								 <input class="in subBtn" type="submit" value="등록" onclick="check_onclick()">
								 <input class="in2 delBtn" type="reset" value="취소">
							 </div>
						</form>
						<!-- <form id="ocrForm" enctype="multipart/form-data">
						<table>
							<tr> <th id="hm" rowspan="2">사진</th>	<td><input type="file" id="uploadFile" name="uploadFile">
																		<input type="submit" value="결과 확인"></td></tr>
							<tr>									<td><div id="image"></div><td></tr>
							</table>
						</form> -->

			
				</div>
			</div>
		</section>

		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
		</div><!-- wrap -->
	</body>
</html>