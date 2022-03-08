<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>약물 상세 정보</title>
				<link rel="stylesheet" href="<c:url value='/css/drug/drug.css'/>">	
		
	</head>
		<style>
		
		.useMethod {
	    	text-decoration: none;
 	    color: #0d3bb1;
 	 	margin-left: 11px;
		}
		
		p {
			text-decoration: none;
 	    color: #0d3bb1;
 	 	    margin-left: 27px;
 	 	margin-bottom: -7px;
 	 	    margin-right: 15px;
		
		}
		.drugBox2 > img {
	    width: 100%;
   		 height: 50%;
   		     padding-bottom: 25px;
		}
		
		.drugBoxText > a{
		margin-left:20px;
		}
		
		.drugBoxText{
		width: 570px;
    	margin-left: 12px;
		}
		
		.Box1{
		float:left;
		}
		
		.Box2{
		float:right;
		}
		
		.BoxAll{
			    height: 654px;
   				       background: white;
		}
		.h3{
		    background: white;
		margin-bottom: 0px;
		}
		h3{
		margin-bottom: 0px;
		}
		
		.drugBox2 > h4{
		    text-decoration: none;
    color: #0d3bb1;
    margin-left: 14px;
    font-size: 20px;
    margin-bottom: -20px;
    }
    h4{
        text-decoration: none;
    color: #0d3bb1;
    margin-left: 14px;
    font-size: 20px;
    margin-bottom: -20px;}
    
    .h3{
    text-align: left;
    height: 39px;
    font-size: 23px;
    color: #213670;
    margin-left: 18px;
    }
	</style>
		
	<body>
		<div id="wrap">
			
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
		
		<div id="navMargin"></div>
		
		<section id="section2">
			<div style="    		background:#ffffff;
;
			">
				<div class="h3">
					<h3>약 정보 상세 조회</h3>
				</div>
			
		<div class="BoxAll">		
			<div class="Box1">
				<div class="drugBox2">
							<img src="${drug.itemImage}" >
									<div class="drugBoxText">
										<a class="itemName">${drug.itemName}<br></a>
										<a class="shapeInfo">${drug.entpName}</a>
										<p class="useMethod"><h4>효능</h4><br>  ${drug.efcyQesitm}</p>
										<%-- <p class="useMethod"><h4>사용방법</h4><br> ${drug.useMethodQesitm}</p> --%>
										<p class="useMethod"><h4>보관방법</h4><br>${drug.depositMethodQesitm}</p>
									</div>					
								
				</div>
			</div>
							
							
				<%-- <div class="drugImg">
					<img src="${drug.itemImage}" height="180px" onerror="this.src='/img/fill_null.png'">
				</div> --%>
			<%-- 	<div class="drugName">
				<h4>제품명:</h4>	${drug.itemName} <br>
				<h4>업체명:</h4>	${drug.entpName}
				</div> --%>
				<div class="Box2">
					<div class="drugBox2">
										<div class="drugBox2scroll">
					
					<%-- <h4>효능</h4><br>  ${drug.efcyQesitm} --%>
					<h4>사용방법</h4><br> ${drug.useMethodQesitm}
					<h4>주의사항</h4><br> ${drug.atpnQesitm}
					<h4>주의해야할 약 또는 음식</h4><br>${drug.intrcQesitm}
					<h4>이상반응</h4><br>${drug.seQesitm}
					<%-- <h4>보관방법</h4><br>${drug.depositMethodQesitm} --%><br>
									</div>
					</div>
				</div>
			</div>
				
			</div>
		</section>
	
		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
    	</div> <!-- wrap -->
	</body>
</html>