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
			background: white;
			    padding-top: 1px;
		}
		
		#search_result_container > h3{
			color: #e75500;
		    font-size: 24px;
		}
		
		#search_result_container > small{
			font-size: 20px;
		    color: #e75500;
		}
		.displayNone {
				display:none;
		}
			
		#more-Btn > h3{
			color: #e75500;
		    font-size: 35px;
		    
		    width: 200px;
		    height: 50px;
		    /* margin-top: 14px; */
		    padding-top: 10px;
		    border-radius: 25px;
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
					<small>총 <fmt:formatNumber value="${fn:length(shapeList)}" pattern="#,###" /> 건</small>
					<hr />
					
			<c:choose>
		    	 <c:when test="${fn:length(shapeList) == 0}">
		       		 조회결과가 없습니다.
				 </c:when>
		    	 <c:otherwise>
				<div id="searchResult">
				
					<c:forEach items="${shapeList}" var="shape" >
						<div class="drugBox">
							<div class="drugShapeBox">
								<a href="<c:url value='/drugDetailView/${shape.itemSeq}'/>">
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
								</a>
							</div>
						</div>
					</c:forEach>
				</div>
			   </c:otherwise> 
			</c:choose>
			
			<div id="more-Btn" class="low" onclick="more()"><h3>더보기</h3></div><br>
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
	    	</script>
			</div>
					
		
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