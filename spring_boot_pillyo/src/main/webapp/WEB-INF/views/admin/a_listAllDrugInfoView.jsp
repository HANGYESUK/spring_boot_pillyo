<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>약정보 리스트</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<link rel="stylesheet" href="/css/paging/paginate.css">
	    <link rel="stylesheet" href="/css/paging/ligne.css">
	    <script type="text/javascript" src="js/paginate.js"></script>
		<%-- <link rel="stylesheet" href="<c:url value='/css/admin/a_listAllDrugInfoView.css'/>"> --%>
		<link rel="stylesheet" href="<c:url value='/css/admin/adminTable.css'/>">
		<!-- 페이징 css  -->
		<style>
			 .pageInfo{
			  	list-style : none;
			  	display: inline-block;
			    margin: 50px 0 0 100px;  	
			  }
			  .pageInfo li{
			  	float: left;
			    font-size: 20px;
			    margin-left: 18px;
			    padding: 7px;
			    font-weight: 500;
			  }
			#outter a:link {color:black; text-decoration: none;}
			#outter a:visited {color:black; text-decoration: none;}
			#outter a:hover {color:black; text-decoration: underline;}
					  	.active{
			  					background-color: #cdd5ec;
			  					}
		</style>
		<!-- 페이징 css  -->
	</head>
	<body>
		<div id="wrap">
			
			<!-- TOP -->
			<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
			<div id="navMargin"></div>
			
			<section id="section">
			
			<div id="adminContainer">
			
			<jsp:include page="/WEB-INF/views/admin/adminMainMenu.jsp" flush='true' />
			
				<div id="adminTableBox">
				 <table class="adminTable">
					 	 <thead>
				 	 	<tr>
					 		<th>약이미지</th>
					 		<th>약정보번호</th>
					 		<th>제품명</th>
					 		<th>업체명</th>
					 		<th>품목번호</th>
					 		<th width="50px">상세</th>
					 	</tr>
				 		</thead>

				 	<c:forEach items="${drugList}" var="drug">
				 		<tr>
					 		<td><img src="${drug.itemImage }" alt="약정보" onerror="this.src='/img/fill_null.png'" width="50px" height="25px"/></td>
					 		<td>${drug.drugInfoNo }</td>
					 		<td>${drug.itemName }</td>
					 		<td>${drug.entpName }</td>
					 		<td>${drug.itemSeq }</td>
					 		<td><button onclick="location.href='/a_drugDetailView/${drug.drugInfoNo}'">상세</button></td>
				 		</tr>
				 	
				 	</c:forEach>
				 </table>
				 	 <!-- 페이징 처리   -->
					 <div class="pageInfo_wrap" >
						<div class="pageInfo_area">
							<ul id="pageInfo" class="pageInfo">
							
								<!-- 이전페이지 버튼 -->
								<c:if test="${pageMaker.prev}">
									<li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
								</c:if>
								
								<!-- 각 번호 페이지 버튼 -->
								<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
									<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
								</c:forEach>
								
								<!-- 다음페이지 버튼 -->
								<c:if test="${pageMaker.next}">
									<li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }">Next</a></li>
								</c:if>	
								
							</ul>
						</div>
					</div>
					
					<form id="moveForm" method="get">	
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">	
						<input type="hidden" name="type" value="${pageMaker.cri.type }">	
					</form>
					 <!-- 페이징 처리   -->
			</div>
			
			</div>
			<!-- 페이징 스크립트 -->
			<script>
				$(document).ready(function(){
					
						let result = '<c:out value="${result}"/>';
						
						checkAlert(result);
						console.log(result);
						
						function checkAlert(result){
							
							if(result === ''){
								return;
							}
							
							if(result === "enrol success"){
								alert("등록이 완료되었습니다.");
							}
							
							if(result === "modify success"){
								alert("수정이 완료되었습니다.");
							}
							
							if(result === "delete success"){
								alert("삭제가 완료되었습니다.");
							}		
						}	
						
					});
						let moveForm = $("#moveForm");
						$(".move").on("click", function(e){
							e.preventDefault();
							
							moveForm.append("<input type='hidden' name='itemName' value='"+ $(this).attr("href")+ "'>");
							moveForm.attr("action", "/board/get");
							moveForm.submit();
						});
						$(".pageInfo a").on("click", function(e){
							e.preventDefault();
							moveForm.find("input[name='pageNum']").val($(this).attr("href"));
							/* 목록 매핑 주소 입력  */
							moveForm.attr("action", "/listAllDrug");
							moveForm.submit();
							
						});	
						
						
						$(".search_area button").on("click", function(e){
							e.preventDefault();
							
							let type = $(".search_area select").val();
							let keyword = $(".search_area input[name='keyword']").val();
							
							if(!type){
								alert("검색 종류를 선택하세요.");
								return false;
							}
							
							if(!keyword){
								alert("키워드를 입력하세요.");
								return false;
							}		
							
							moveForm.find("input[name='type']").val(type);
							moveForm.find("input[name='keyword']").val(keyword);
							moveForm.find("input[name='pageNum']").val(1);
							moveForm.submit();
					});
			</script>
			</section>
	        
			<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>