<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!--  파일 업로드 -->
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>

<%
	Date nowDate = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
	<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
	<link href="<c:url value='/css/board/board.css'/>" rel="stylesheet" type="text/css">	
	<script src="<c:url value='/js/mainBanner.js'/>"></script>
	<script src="<c:url value='/js/boardImg.js'/>"></script>
	<link href="<c:url value='/css/mainBanner.css'/>" rel="stylesheet" type="text/css">	
</head>


<!-- 이미지 불러오는 java Script -->
<!-- 	<script type="text/javascript">
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
	 </script> -->
	 

<style>
	.layout {
	width:500px; /* 태그의 넓이를 500px로 */
	margin:0 auto; /* 양쪽 여백을 위아래는 0 좌우는 자동으로 잡아주겠다! */
	margin-top : 40px;
	}
	
	.layout input { /* .layout > input 은 layout 바로 밑 하위태그 input에 적용이고 */
					/* .layout input 은 layout 안의 input 태그에 적용 */
	width:100%;
	box-sizing : border-box;
	    height: 30px;
	}
	#boardCtg {
	    float: left;
	}
	td > textarea{
	    color: #3f63b5;
    height: 40px;
    font-size: 20px;
    background: #cfe3f6;
    border-color: aliceblue;

	}
	
	#boardCtgNo    {/* background: #f2f9fb; */
	border:0;
    float: left;
    height: 30px;
    text-align: center;
    font-size: 19px;
	width: 95px;
    color: #3f63b5;
    border-radius: 10px;
    border-color: #f2f9fb;
    font-weight: 400;
	}
	
	input file-upload-button{
	color:red;
	}
	
	#img_box{
		border : 1px solid #A0A0A0;
		width: 400px;
	}
	#image_container{
		width: 506px;
		height: 400px;
	}
	#image_container img
	{
	  width: 506px;
	  height: 360px;
	}
</style>



<body>
	
	<div id="wrap">
			<!-- TOP -->
			<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
			<div id="navMargin"></div>
			
			<section id="section">
	


	<div class="layout">
		<form id= "boardForm" name="boardForm" enctype="multipart/form-data" method="post" action="<c:url value='/insertboard'/>"> <!--  writedo로 넘겨주고 post방식으로 넘겨주겠다 -->
		<br>															<%-- method="post" action="<c:url value='/insertboard'/>" --%>
		<table class="table table-striped" style="width:500px;">
		<!-- 실행시 form 안에 데이터가 writedo로 넘어간다 -->
		<thead>
			<tr>
				<th colspan="2" style="text-align: center;">공지사항 글쓰기</th>
			</tr>	
		</thead>
		<tbody>
		<tr>
			<td><select id="boardCtgNo" name="boardCtgNo">
				<option value="0" selected>소식</option>
				<option value="1">카드뉴스</option>
				<option value="2">건강관리</option>
				<option value="3">우리집약관리</option>
				<option value="4">복용관리</option>
				<option value="5">회원</option>
				
			</select></td>
			</tr>
			<tr>
		    <td><textarea rows="1" cols="50" placeholder="글 제목"  name="boardTitle" maxlength="50" style="width: 600px;
    border-color: #cfe2f6;
    background: #f4faff;
    color: #3f63b5;
    font-size: 16px;
    border: none;
    resize: none;
    border: 1px soild #cfe2f6;
    outline: none;"></textarea></td>
		    </tr>
		    <tr>
			<td><textarea class="form-control" placeholder="글 내용" rows="10" cols="50" name="boardContent" maxlength="2048" style="height: 450px;
    width: 600px;
    border-color: #cfe2f6;
    background: #f4faff;
    color: #3f63b5;
    font-size: 16px;
    border: none;
    resize: none;
    border: 1px soild #cfe2f6;
    outline: none;" >${boardCtgList.boardContent}</textarea>
				
			</td>
		</tbody>
		</table>
		</form>
		
			<input type="hidden" name="boardImg" value="">  <!-- 세션 아이디 받아오기 -->
			<input type="hidden" name="userId" value="${sessionScope.sid}">  <!-- 세션 아이디 받아오기 -->
			<input type="hidden" name="boardWriteDate" value="<%= sf.format(nowDate) %>"> 
			<input type="submit" name="submit" value="등록하기">
		
		<!-- <button type="submit" button style="float:right;">작성</button> --> <!-- submit -> 이 버튼의 역할은 데이터를 전송하는 것 -->
		
		<form id="OCRForm" >
			<table>
			<tr> <td><input type="file" id="uploadFile" name="uploadFile">
					 <input type="submit" id="ocr" value="이미지 가져오기"></td></tr>
			
			<tr> <td><div id="image"></div></td></tr>
			</table>
		</form>
				<%-- <a href="<c:url value='/boardDetailView/${boardCtgList.boardNo}'/>"><button>돌아가기</button></a> --%>
				<a href="<c:url value='/listAllBoard'/>"><button>목록</button></a>

		<br>
		<%-- <form action="<c:url value='boardDetailView'/>" enctype="multipart/form-data" method="post">
<!-- <input type="file" name="profile">
<input type="submit"> -->
</form> --%>
	</div>
	
	</section>
	        
			<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
</body>
</html>