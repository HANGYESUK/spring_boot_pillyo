<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

	<script src="https://code.jquery.com/jquery-latest.min.js"></script>

    <!-- 제이쿼리 -->
    <script
    src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
    crossorigin="anonymous"></script>

    <!-- 폰트어썸 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.2.0/css/all.min.css" integrity="sha512-6c4nX2tn5KbzeBJo9Ywpa0Gkt+mzCzJBrE1RB6fmpcsoN+b/w/euwIMuQKNyUoU/nToKN3a8SgNOtPrbW12fug==" crossorigin="anonymous" />


	<link rel="stylesheet" href="/css/dashboard/dashboardContent.css" />
	<link rel="stylesheet" href="/css/dashboard/dashboard.css" />



	<script src="./jquery.fullPage.js"></script>
    <title>Document</title>
</head>
<body>

	<div class="container low">
		<div class="dashboard low">
			<div class="profile">
				<div class="profile-Box colum">
					<h1>Pill-Yo</h1>
					<div class="profile-My-Box low">
						<dvi class="proflie-Img">
							<img src="/img/루피.jpg" class="loopy">
						</dvi>
						<div class="profile-Text">
							<h3>홍길동</h3>
							<h4>나이 : 26</h4>
						</div>
					</div>
					<div class="profile-Family low">
						
						  <c:forEach items="${famList }" var="fam">
						   	<a href="/dashboard2/${fam.famNo}">
							   	<div class="profile-Family-Icon" style="text-align: center;">
							   		<h4>${ fam.famMember}</h4>
							   		<input type="hidden" class="prInfo" value="☌">
								</div>
								<!-- test1 -->
							</a>
						  </c:forEach>

					</div>
				</div>
				<div class="btn-Container colum">
					<div class="btn low"><h4>공지사항</h4></div>
					<div class="btn low"><h4>약국찾기</h4></div>
					<div class="btn low"><h4>맞춤추천</h4></div>
					<div class="btn low"><h4>복용하기</h4></div>
					<div class="btn low"><h4>마이페이지</h4></div>
					<div class="btn low"><h4>로그아웃</h4></div>
				</div>
			</div>
			<div class="main-Content-Container">
				<div class="main-Content-Header colum">
					<nav id="main-navigation">
						<div class="pull-right fix low">
							<div class="outer-menu">
								<div class="outer-menu-btn"><a href="/"><h5>HOME</h5></a></div>
								<div class="outer-menu-btn"><a href="#"><h5>복용관리</h5></a></div>
								<div class="outer-menu-btn"><a href="#"><h5>재고관리</h5></a></div>
								<div class="outer-menu-btn"><a href="<c:url value = '/famListView'/>"><h5>가족관리</h5></a></div>
								<div class="outer-menu-btn"><a href="#"><h5>건강관리</h5></a></div>
							</div>
				  
							<div class="search-bar">
								<form>
									<input type="text" class="input-search" placeholder="약에 대한 정보를 얻고 싶으시면 이곳에 입력해주세요">
									<input type="submit" class="input-search-submit" value="☌">
								</form>
							</div>
						</div>
					</nav>
				</div>

				<div class="main-Content-Body low">

					<div class="basket-Item-Container">
					
						<c:if test="${empty body}">

	                    </c:if>
	                    
	                    <c:if test="${not empty body}">
							<div class="basket-Item">
								<i class="fas fa-times" onclick="go()" data-prdNo="${cart.prdNo }"></i>
								<div class="basket-Item-Main-Box colum">
									<h5>키 : ${body.height}</h5>
									<h5>몸무게 : ${body.weight}</h5>
									<h5>BMI : ${body.bmi}</h5>
								</div>
							</div>
	                    </c:if>
	                    
						
						<div class="basket-Item">
							<i class="fas fa-times" onclick="go(this);" data-prdNo="${cart.prdNo }"></i>
							<div class="basket-Item-Main-Box colum">
								<h5>기분척도 : ${feel.feelScale}</h5>
								<h5>기분일기 : ${feel.feelMemo}</h5>
								<h5>기록날짜 : ${feel.feelRecordDate}</h5>
								<h5>기록시간 : ${feel.feelRecordTime}</h5>
							</div>
						</div>
						
						<div class="basket-Item">
							<i class="fas fa-times" onclick="go(this);" data-prdNo="${cart.prdNo }"></i>
							<div class="basket-Item-Main-Box colum">
								<h5>상황 : ${pressure.situation}</h5>
								<h5>수축기 혈압 : ${pressure.SBP}</h5>
								<h5>이완기 혈압 : ${pressure.DBP}</h5>
								<h5>심박수 : ${pressure.bpm}</h5>
								<h5>메모 : ${pressure.pressureMemo}</h5>
								<h5>기록날짜 : ${pressure.pressureRecordDate}</h5>
								<h5>기록시간 : ${pressure.pressureRecordTime}</h5>
							</div>
						</div>
						
						<div class="basket-Item">
							<i class="fas fa-times" onclick="go(this);" data-prdNo="${cart.prdNo }"></i>
							<div class="basket-Item-Main-Box colum">
								<h5>상황 : ${sugar.situation}</h5>
								<h5>투약 : ${sugar.sugarMedication}</h5>
								<h5>식전/식후 : ${sugar.acpc}</h5>
								<h5>혈당수치 : ${sugar.sugarLevel}</h5>
								<h5>식전/식후 메모 : ${sugar.acpcMemo}</h5>
								<h5>기록날짜 : ${sugar.sugarRecordDate}</h5>
								<h5>기록시간 : ${sugar.sugarRecordTime}</h5>
							</div>
						</div>

                    </div>
					

				</div>


			</div>
		</div>
	</div>

    <script>
    
			let profileFamIcon = document.getElementsByClassName('profile-Family-Icon')
		    function go() {
		        console.log(this.fam.famNo)
		    }
		        	
        	
        	$.ajax({
                url:"<c:url value='/product/deleteCart'/>",
                type:"post",
                data:{prdNo : prdNo },
                success:function (result) {
                	console.log(result)
                    if(result == 0) {
           
                    	 let mainBtnX = $(".main-X");
                         let semiBtn = $(".semi-btn");
                         let basketItem = $(".basket-Item")[0];

                         $(clickElement).parent().parent().remove()
                         
                         let amount = $('.amount').length;
                         console.log("amount : " + amount);
                         let value = [amount]
                         let total = 0;

                         for(let i=0; i<amount; i++) {
                            value[i] = + parseInt($('.amount').eq(i).text());
                         }
                         
                        /*  let fullPrice =  $('.amount').val(); */
                        for(let i=0; i<amount; i++) {
                            total += value[i]
                         }
                        	$('#prdPrice').html(total + "원")
                         $('#totalPrice').html((total -5000 +2500) + "원")
                         console.log("total: " + total)
                         
                         
                    }
                },
                error:function() {
                    alert("오류가 발생했습니다.")
                }
            })
       }
		
		
    </script>
</body>
</html>