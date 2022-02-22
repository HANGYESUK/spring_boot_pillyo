<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>약 정보 수정 페이지</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		
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
		 
		 <!-- 임시 Css -->
	<style type="text/css">
	
	h2{ color : black;}
	h3{ color : black;}
	
	p{	color : black;}
	
	#UserName{
		color : #81B89A;
	}
	
	.hm{
		width : 95%;
		margin:0 auto;
		
	}
	table{
		color : black;
		margin:0 auto;
	}
	th{
		width : 100px;
	}
	.img_tr{
		text-align: center;
	}
	#img_box{
		border : 1px solid #A0A0A0;
	}
	#image_container{
		width: 300px;
		height: 300px;
	}
	#image_container img
	{
	  width: 300px;
	  height: 300px;
	}
	</style>
	
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
			
			<!-- 상비약 등록 -->
			<form id = "updateHmForm" method="post" action="<c:url value ='/updateHm'/>">
				<table>
					<!-- OCR로 이미지 넣어서 글씨 출력 -->
					<tr class="hm_OCR_img"> <td rowspan="5" id="img_box"><div id="image_container"></div></td></tr>
					<tr> <th id="hm">약품명</th>	<td><input type="text" id="hmName" name="hmName" value="${hm.hmName}"></td></tr>
					<tr> <th id="hm">카테고리</th>	<td><input type="number" id="hmCtgNo" name="hmCtgNo" list="hmCtgList" value="${hm.hmCtgNo}">
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
					<tr> <th id="hm">사용기한</th>	<td><input type="date" name="hmUseByDate" value="${hm.hmUseByDate}"></td></tr>
					<tr> <th id="hm">메모</th>	<td><textarea name="hmMemo" rows="10" cols="60" placeholder="내용을 입력하세요" style="resize: none;">${hm.hmMemo}</textarea></td>
					<tr> <th id="hm" class="btn_box">
	 							 <!-- 이미지 미리보기 : 올려진 이미지 파일을 화면에 띄워줌 -->
	 							 <input  id = "uploadFile" type="file" name="uploadFile" onchange="setThumbnail(event);"></th> <td></td>
	 							 <tr> <th id="hm" colspan="3"> <br>
	 							 <!-- 전송 버튼 / 취소 버튼 -->
	 							 <input class = "in" type="submit" value="등록" >
	 							 <input class = "in2" type="reset" value="취소">&nbsp;</th></tr>
				
				</table>
				<input type="hidden" id="hmNo" name="hmNo" value="${hm.hmNo }">
			</form>
		</section>

		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
		</div><!-- wrap -->
	</body>
</html>
