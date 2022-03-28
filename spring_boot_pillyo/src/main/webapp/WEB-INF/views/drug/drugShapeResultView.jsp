<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>약물 낱알 검색 결과</title>
		<link rel="stylesheet" href="<c:url value='/css/drug/drugShape.css'/>">	
	</head>
	<style>
		#search_result_container{
			background: #fcf9f5;
    padding-top: 1px;
    margin: 0 auto;
		}
.displayNone {
		display:none;
	}
    
    width: 200px;
    height: 50px;
    /* margin-top: 14px; */
    padding-top: 10px;
    border-radius: 25px;
	}

	</style>
	<body>
		<div id="wrap">
			<!-- TOP -->
			<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
			<div id="navMargin"></div>
			
	<section id="section">
		<div id="drugSearchContainer">
			
			<jsp:include page="/WEB-INF/views/drug/drugShapeSearchBox.jsp" flush='true' />
			
		<div id="search_result_container">
			
				<h3 style="color: #388a6b;">약모양 검색 결과 </h3>
					<h5>
					<c:set var="comma" value=","/>
							<c:forEach items="${map}" var="map" varStatus="status">
					           <c:if test="${!status.last}">
						           ${map.value}
						            ${comma}
							   </c:if>  
							   <c:if test="${status.last}">
							        ${map.value}
								</c:if>
							</c:forEach>
							에 대한 결과 입니다.
					</h5>
				<c:choose>
					<c:when test="${fn:length(shapeList) >=  100}">
						<small>100건 이상이 검색되었습니다.</small>
					</c:when>
					<c:otherwise>
						<small>총 ${fn:length(shapeList)}건</small>
					</c:otherwise>
				</c:choose>
				
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
							</div>
						</div>
					</c:forEach>
					
				</div>
				
				<div id="more-Btn" class="low" onclick="more()"><h3>더보기</h3></div><br>
			   </c:otherwise> 
			</c:choose>
			</div>
						
			</div> <!-- searchResult_container -->
			</section>
			
		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
    	</div> <!-- wrap -->
    	
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
    	
	</body>
</html>