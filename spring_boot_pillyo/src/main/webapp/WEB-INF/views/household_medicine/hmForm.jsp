<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>우리집 상비약 메인</title>
    <script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
    <link rel="stylesheet" href="/css/hm/hmForm.css" />
    <%-- <jsp:include page="/WEB-INF/views/chatBot.jsp"/> --%>
    
	<!-- <script src="/js/hmListView.js"></script> -->
</head>
<body>

	<script>
		function go(a) {
			
			console.log(a)
           		
           		$.ajax({
           			type:"post",
           			url:"/listCtgHm",
           			// url:"/listCtgHm/{hmCtgNo}",
           			data:{"hmCtgNo" : a},  
           			success:function(result){ 	
           				console.log(result)	
           				$('#list_table').empty()
           				$('#list_table').append('<tr><th>사진</th> <th>제품명</th> <th>사용기한</th> </tr>')
           				for(var i=0; i <result.length; i++){
    						$('#list_table').append('<tr><td id="tbimg"><img src="/images/' + result[i].hmImg + '"></td><td>' +
    																						   '<a href="/updateHmForm/' + result[i].hmNo + '">' + result[i].hmName + '</a></td>' +
    																						   '<td>' + result[i].hmUseByDate + '까지</td></tr>'
    																						 	);
    					}
				
           			},
           			error:function(data, textStatus){
           				alert("전송 실패");
           			}
           		});
           	}
           
	</script>
	<div id="wrap">
			
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
		
		<div id="navMargin"></div>
		<section id="section">
		
			<jsp:include page="/WEB-INF/views/Main/subSideMenu.jsp" flush='true' />
		
			<div class="main-Content-Body low">
				<div class="basket-Item-Container colunm">
					<h1 id ="hmName">우리집 약관리</h1>

					<hr>

					<div id="hm">
						<!-- 약 카테고리 -->
						<div class="hm_Category colum"> 
							<form id="hmCtg_ListView low">
								<!-- <button type="button" id="hm_ctg" value="1" onclick="go(this.value)"> -->
								<!-- <input type="text" id="hmCtgInput">
								<input type="submit" value="전송"> -->
								
								<button type="button" id="hm_ctg" value="1" onclick="go(this.value)">
								<img src="/img/hm/두통.png" alt="" style="width:45px; height:45px;"><br>
								<span>두통약</span></button>
								
								<button type="button" id="hm_ctg" value="2" onclick="go(this.value)">
								<img src="/img/hm/감기.png" alt="" style="width:45px; height:45px;"><br>
								<span>감기약</span></button>
								
								<button type="button" id="hm_ctg" value="3" onclick="go(this.value)">
								<img src="/img/hm/소화.png" alt="" style="width:45px; height:45px;"><br>
								<span>소화제</span></button>
								
								<button type="button" id="hm_ctg" value="4" onclick="go(this.value)">
								<img src="/img/hm/해열.png" alt="" style="width:45px; height:45px;"><br>
								<span>해열제</span></button>
								
								<button type="button" id="hm_ctg" value="5" onclick="go(this.value)">
								<img src="/img/hm/진통.png" alt="" style="width:45px; height:45px;"><br>
								<span>진통제</span></button>
								
								<button type="button" id="hm_ctg" value="6" onclick="go(this.value)">
								<img src="/img/hm/치통.png" alt="" style="width:45px; height:45px;"><br>
								<span>치통약</span></button>
								
								<button type="button" id="hm_ctg" value="7" onclick="go(this.value)">
								<img src="/img/hm/알레르기.png" alt="" style="width:45px; height:45px;"><br>
								<span>알레르기</span></button>
								 
								<button type="button" id="hm_ctg" value="8" onclick="go(this.value)">
								<img src="/img/hm/연고.png" alt="" style="width:45px; height:45px;"><br>
								<span>연고/파스</span></button>
								
								<button type="button" id="hm_ctg" value="9" onclick="go(this.value)">
								<img src="/img/hm/기타.png" alt="" style="width:45px; height:45px;"><br>
								<span>기타</span></button>
								
							</form>
						</div><!-- hm_Category -->
						
						<!-- 선택한 카테고리의 약 목록 -->
						<div id="hm_list_view">
							<!-- <iframe id="iframeUrl" name="iframeUrl" src="http://localhost:8082/listCtgHm/1"></iframe> -->
								<table id="list_table"></table>
								
						</div>
						
						
						<div style="margin-top: 40px" class="low">
								<a href="/insertHmForm">
								<input type="button" class="btn" value="등록하러가기"></a>
								
								<a href="/insertHmResult">
								<input type="button" class="btn" value="등록된 전체 목록 보러가기"></a>
						</div>
					</div><!-- hm -->
				</div>
			</div>
		</section>
	
		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
		</div><!-- wrap -->
	</body>
</html>