<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>약물 낱알 유형 식별 검색 폼</title>
		<link rel="stylesheet" href="/css/drug/drugShapeSearchForm.css" />
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
        <link rel="stylesheet" href="<c:url value='/css/drug/drugShape.css'/>">	
		<script src="<c:url value='/js/drugShapeSearchForm.js'/>"></script>
		<style>
		#search_result_container{
			/* background: #fcf9f5; */
			    padding-top: 1px;
			    
		}
		
		#search_result_container > h3{
			    color: #388a6b;
		    font-size: 24px;
		}
		
		#search_result_container > small{
			font-size: 20px;
		    color: #388a6bcc;
		}
		.displayNone {
				display:none;
		}
			
		#more-Btn > h3{
			color: #388a6b;
		    font-size: 35px;
		    
		    width: 200px;
		    height: 50px;
		    /* margin-top: 14px; */
		    padding-top: 10px;
		    border-radius: 25px;
		}
	
	 /* 페이징 css */
		
		 .pageInfo{
		  	list-style : none;
		  	display: inline-block;
		    margin: 50px 0 0 -50px; 	
		  }
		  .pageInfo li{
		  	float: left;
		    font-size: 20px;
		    margin-left: 18px;
		    padding: 7px;
		    font-weight: 500;
		  }
		#pagingBox a:link {color:black; text-decoration: none;}
		#pagingBox a:visited {color:black; text-decoration: none;}
		#pagingBox a:hover {color:black; text-decoration: underline;}
				  	.active{
		  					background-color: #cdd5ec;
		  					}

		/* 페이징 css */ 
		#searchResultBox{
		 	display: flex;
		 	flex-direction: column;
		}
	</style>
	</head>
	
	<body>
		<div id="wrap">
			
			<!-- TOP -->
			<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
			<div id="navMargin"></div>
			
			<section id="section">
			<div id="drugSearchContainer">
			
			<jsp:include page="/WEB-INF/views/drug/drugShapeSearchBox.jsp" flush='true' />
				
				<div id="search_result_container">
			
					<h3>약모양 리스트 </h3>
					
					<small>총 <fmt:formatNumber value="${total}" pattern="#,###" /> 건</small>
					<hr />
					
			<c:choose>
		    	 <c:when test="${fn:length(shapeList) == 0}">
		       		 조회결과가 없습니다.
				 </c:when>
		    	 <c:otherwise>
				
				<div id="searchResultBox">
					<div id="searchResult">
					
					<c:forEach items="${shapeList}" var="shape" >
						<div class="drugBox">
							<div class="drugShapeBox">
								<%-- <a href="<c:url value='/drugDetailView/${shape.itemSeq}'/>"> --%>
									<img src="${shape.itemImage}" class="drugShapeImg" onerror="this.src='/img/fill_null.png'">
									<div class="drugShapeInfo">
										<span class="itemName">${shape.itemName}</span>
										<span class="shapeInfo">${shape.entpName}</span>
										<span class="shapeInfo">${shape.chart}</span>
										<span class="shapeInfo">${shape.print_front}</span>
										<span class="shapeInfo">${shape.drug_shape}</span>
										<span class="shapeInfo">${shape.color_class}</span>
										<span class="shapeInfo">${shape.form_code_name}</span>
										<span class="shapeInfo">${shape.class_name}</span>
									</div>
								<!-- </a> -->
							</div>
						</div>
					</c:forEach>
					</div>
					
					<div id="pagingBox">
					 <div class="search_wrap">
						<div class="search_area">
							<select name="type">
								<option value="" <c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
								<option value="N" <c:out value="${pageMaker.cri.type eq 'N'?'selected':'' }"/>>제품명</option>
								<option value="P" <c:out value="${pageMaker.cri.type eq 'P'?'selected':'' }"/>>업체명</option>
								
							</select>		
							<input type="text" name="keyword" value="${pageMaker.cri.keyword }">
							<button>검색</button>
						</div>
					</div>	
					
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
			   </c:otherwise> 
			</c:choose>
		</div>
		
			<!-- 페이징 스크립트 -->
			<script>
			$(document).ready(function(){
				

				let result = '<c:out value="${result}"/>';
				
				checkAlert(result);
				console.log(result);
				
				
			});

				
				let moveForm = $("#moveForm");
					$(".move").on("click", function(e){
						e.preventDefault();
						
						/* 검색했을때  */
						moveForm.append("<input type='hidden' name='itemName' value='"+ $(this).attr("href")+ "'>");
						moveForm.attr("action", "/drugShapeSearchForm");
						moveForm.submit();
					});
					$(".pageInfo a").on("click", function(e){
						e.preventDefault();
						moveForm.find("input[name='pageNum']").val($(this).attr("href"));
						/* 목록 매핑 주소 입력  */
						moveForm.attr("action", "/drugShapeSearchForm");
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
		
		<!-- 	<div id="more-Btn" class="low" onclick="more()"><h3>더보기</h3></div><br>
			<script>
			        let count = 9;
			        let drugBox = document.getElementsByClassName("drugBox")
			        
			        for(let i=count; i<drugBox.length; i++) {
			        	drugBox[i].classList.add('displayNone')
			        }
			        
			        function more() {
				        for(let i=count; i<drugBox.length; i++) {
				        	drugBox[i].classList.remove('displayNone')
				        	if(i >= count + 8) {
				        		break;
				        	}
				        }
				        count += 9
			        }
	    	</script> -->
		
					
					
		
			</div>	
			</section>
	        
			<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
	<script type="text/javascript">
/* 		// 기본으로 체크되어있는 값 테두리 설정
		$(document).ready(function() {
			if($('input[type=checkbox]').is(':checked')){
				var chk = $('input[type=checkbox]').is(':checked');
				//chk.parent().parent().css('border', '4px solid #697fba');
				console.log(chk);
			}
		}); */

		//	모양 선택
		$('.sBox').change(function(){
			$('.sBox').parent().parent().css('border', 'none');
			
			if($(this).is(':checked')){
				$(this).parent().parent().css('border', '4px solid #697fba');
			}
		    else{
				$(this).parent().parent().css('border', 'none');
			}
		});
		
		// 색상 선택
		$('.cBox').change(function(){
			$('.cBox').parent().parent().css('border', 'none');
			
			if($(this).is(':checked')){
				$(this).parent().parent().css('border', '4px solid #697fba');
			}
		    else{
				$(this).parent().parent().css('border', 'none');
			}
		});
		
		// 제형 선택
		$('.tBox').change(function(){
			$('.tBox').parent().parent().css('border', 'none');
			
			if($(this).is(':checked')){
				$(this).parent().parent().css('border', '4px solid #697fba');
			}
		    else{
				$(this).parent().parent().css('border', 'none');
			}
		});
		
		// 분할선 선택
		$('.lBox').change(function(){
			$('.lBox').parent().parent().css('border', 'none');
			
			if($(this).is(':checked')){
				$(this).parent().parent().css('border', '4px solid #697fba');
			}
		    else{
				$(this).parent().parent().css('border', 'none');
			}
		});
	</script>
</html>