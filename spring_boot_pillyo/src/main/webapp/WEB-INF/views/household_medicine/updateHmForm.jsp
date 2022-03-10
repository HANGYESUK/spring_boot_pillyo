<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>우리집 상비약 수정 폼</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		
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
	
	.subBtn {
		background-color: #82bbfd;
	    color: white;
	    border: none;
	    padding: 10px;
	    padding-left: 30px;
	    padding-right: 30px;
	    font-size: 20px;
	    font-weight: bold;
	    border-radius: 30px;
	    cursor: pointer;
	}
	
	.delBtn {
		background-color: #ff5252;
		color: white;
	    border: none;
	    padding: 10px;
	    padding-left: 30px;
	    padding-right: 30px;
	    font-size: 20px;
	    font-weight: bold;
	    border-radius: 30px;
	    cursor: pointer;
	}
	.btn {
		background-color: #7A7A7A;
		color: white;
	    border: none;
	    padding: 10px;
	    padding-left: 30px;
	    padding-right: 30px;
	    font-size: 20px;
	    font-weight: bold;
	    border-radius: 30px;
	    cursor: pointer;
	}
	
	.low {
	    display: flex;
	    flex-direction: row;
	    align-items: center;
	    justify-content: center;
	}
	.submitForm {
		justify-content: space-around;
		margin-top: 20px;
	    margin-left: 80px;
	}
	
	#section3{
	box-shadow: 1px 1px 5px 1px #d1d1d1;
    padding-top: 15px;
    padding-bottom: 45px;
    width: 60%;
    margin: 0 auto;
    opacity: 100%;
    background-color: #ffffff;
    border-radius: 119px;

	}
	
	h3{
	padding-top: 0px;
    text-align: center;
    font-size: 25px;
    }
    
    td input,textarea,#img_box{
        box-shadow: 0px 0px 0px 1px #c7c7c7;
    border: 0;
    }
    
    #image_container{
    border:0;}
	</style>
	
	</head>
	<body>
		<div id="wrap">
		
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
		
		<div id="navMargin"></div>
		<section id="section3">
			<h3>약관리 뷰페이지</h3>
			
			<c:if test="${not empty sessionScope.sid}">
				<h3 id="UserName">${sessionScope.sid}님</h3>
			</c:if>
			
			<!-- 상비약 등록 -->
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
					<tr> <th>메모</th>		<td><textarea name="hmMemo" rows="10" cols="60" placeholder="내용을 입력하세요" style="resize: none;" required >${hm.hmMemo}</textarea></td></tr>
					
					<tr> <th id="hm">사진</th>	<td><input id = "hmImg" type="file" name="hmImg" value="${hm.hmImg}" onchange="setThumbnail(event);" required></td>
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
					 <input class = "in subBtn" type="submit" value="수정" >
					 <input class = "in2 delBtn" type="reset" value="취소">
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
