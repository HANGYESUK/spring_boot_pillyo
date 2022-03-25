<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>우리집 상비약 수정 폼</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<link rel="stylesheet" href="/css/hm/updateHmForm.css" />
		
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
		<section id="section3">
			<h3>등록하신 약을 수정하시겠습니까?</h3> <hr>

			<!-- 상비약 내용 수정 -->
			<form id = "updateHmForm" method="post" action="<c:url value ='/updateHm'/>" >
				<table>
					<tr> <th>약품명</th> 		<td><input type="text" id="hmName" name="hmName" value="${hm.hmName}" required ></td></tr>
					<tr> <th>카테고리</th> 	<td><input type="number" id="hmCtgNo" name="hmCtgNo" list="hmCtgList" value="${hm.hmCtgNo}" required >
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
		        	<tr> <th>사용기한</th>		<td><input type="date" name="hmUseByDate" value="${hm.hmUseByDate}" required ></td></tr>
					<tr> <th>메모</th>		<td><textarea name="hmMemo" rows="10" cols="60" placeholder="내용을 입력하세요" required >${hm.hmMemo}</textarea></td></tr>
					
					<tr> <th id="hm">사진</th>	<td><label class="input-file-button" for="hmImg"> Image Upload</label>&nbsp;
													<h6>* 이미지를 새로 등록할 경우 위에 있는 버튼을 눌러주세요</h6>
													<input id = "hmImg" type="file" name="hmImg" value="${hm.hmImg}" onchange="setThumbnail(event);" required></td>
					<tr> <th id="hm"></th>		<td id="img_box"> <div id="image_container"> <img src="<c:url value='/images/${hm.hmImg}'/>"></div>
																  <%-- <div>
																  <input type="text" value = "${hm.hmImg}">
																  <input type="submit" id="hmImg" name="hmImg" value="${hm.hmImg}">
																  </div> --%>
																  </td></tr>
																  
																  <!-- 이렇게 하면 될 것 같은데 왜 ,가 들어가는 걸까? 중복되게 들어가면 안되서??-->
					
				</table>
				<input type="hidden" id="hmNo" name="hmNo" value="${hm.hmNo }">
				
				 <!-- 전송 버튼 / 취소 버튼 -->
				 <div class="submitForm low">
					 <input class = "in subBtn" type="submit" value="수정내용 저장하기" >
					 <input class = "in2 delBtn" type="reset" value="내용 지우기">
					 <a href="/hmForm">
					 <input type="button" class="in3 btn" value="뒤로가기"></a>
				 </div>
				 
			</form>
		</section>

		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
		</div><!-- wrap -->
	</body>
</html>
