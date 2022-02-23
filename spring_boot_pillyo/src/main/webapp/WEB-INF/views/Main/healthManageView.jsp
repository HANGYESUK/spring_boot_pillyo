<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HealthList</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	 	<link rel="stylesheet" href="/css/dashboard/dashboard.css" />
	 	<link rel="stylesheet" href="/css/health/healthManage.css" />
		 	
		 <style>
		 	.display-none {
		 		display: none;
		 	}
		 </style>
</head>
<body>

	<div id="wrap">
			<!-- TOP -->
			<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
			<div id="navMargin"></div>
			
			<section id="section" class="calum">
			
			<div class="fam-List calum">
				 <c:forEach items="${famList }" var="fam">
				   	<a href="<c:url value='/healthManageView/${fam.famNo}'/>">
					   	<div class="profile-Family-Icon" style="text-align: center;">
					   		<h4>${ fam.famMember}</h4>
					   		<input type="hidden" class="prInfo" value="☌">
						</div>
						<!-- test1 -->
					</a>
				 </c:forEach>
			   <a href="<c:url value = '/famInsertForm'/>">
			 		<div class="profile-Family-Icon"><p id="plus">+</p></div>
			   </a>
			 </div>

			
			<h3>${famMember} 님의 건강관리 입니다.</h3><br><br>
			
				
		
				<div class="chart">
			        <canvas id="myChart1"></canvas>
			    </div>
			    
			    <div class="chart">
			        <canvas id="myChart2"></canvas>
			    </div>
			    
			    <div class="chart">
			        <canvas id="myChart3"></canvas>
			    </div>
			    
			    <div class="chart">
			        <canvas id="myChart4"></canvas>
			    </div>
			    
			    
			    <div class="health-Btn-Container low">
			  		<button class="health-Btn " value=0 onclick="change(this.value)">체형</button>
				    <button class="health-Btn" value=1 onclick="change(this.value)">혈압</button>
				    <button class="health-Btn" value=2 onclick="change(this.value)">기분</button>
				    <button class="health-Btn" value=3 onclick="change(this.value)">혈당</button>
			    </div>

			
		
		 
		 
			 	<!-- 체형 변수 -->
				<script>
			        let height = []
			        let weight = []
			        let bmi = []
				</script>
			  
				<div class="health-Container calum">
					<div class="healthTitle low">
						<h2>체형 리스트</h2>
						<a href="<c:url value='/bodyForm/${famNo}'/>"><button value="0" class="btn low">등록</button></a>
					</div>
					<div class="calum" style="width: 90%;">
					 <c:forEach items="${bodyList }" var="body">
						<div class="health-Container-Box calum">
							<div class="health-Content-Title low">
									<img src="#"/>
									<div class="health-Box1 low">
										<h2>번호 ${body.bodyNo}</h2>
									</div>
									<div class="health-Box2 low">
										<h2>기록일 : ${body.bodyRecordDate}</h2>
									</div>
									<button value="${body.bodyNo}" class="moreBtn low"  onclick="toggle(this)">더보기</button>
									<a href="javascript:deleteCheck();"><button class="delBtn low">삭제</button></a>

							</div>
							<div class="health-Content low border">
								<div class="health-Box1 low">
									<h2>키</h2>
								</div>
								<div class="health-Box2 low">
									<h2>${body.height}</h2>
								</div>
							</div>
							<div class="health-Content low border">
								<div class="health-Box1 low">
									<h2>몸무게</h2>
								</div>
								<div class="health-Box2 low">
									<h2>${body.weight}</h2>
								</div>
							</div>
							<div class="health-Content low border">
								<div class="health-Box1 low">
									<h2>BMI</h2>
								</div>
								<div class="health-Box2 low">
									<h2>${body.bmi}</h2>
								</div>
							</div>
								<a href="<c:url value='/updateBodyForm/${body.bodyNo}'/>"><button class="updateBtn btn low">수정</button></a>
							
							<script type="text/javascript">
								function deleteCheck(){
									var answer = confirm("선택한 체형 정보를 삭제하시겠습니까?");
									if(answer == true){
										location.href="<c:url value='/deleteBody/${body.bodyNo}' />";
									}
								}
							</script><br>
		 		 
					 		 <script>
						        height.push(${body.height})
						        weight.push(${body.weight})
						        bmi.push(${body.bmi})
						        
						        console.log(${body.bodyNo})
					 		</script>
						</div>
						</c:forEach>
					</div>
				</div>




		<!-- 혈압 변수 -->
		<script>
	        let SBP = []
	        let DBP = []
	        let bpm = []
		</script>
			
					
					<div class="health-Container calum">
					<div class="healthTitle low">
						<h2>혈압 리스트</h2>
						<a href="<c:url value='/pressureForm/${famNo}'/>"><button value="0" class="btn low">등록</button></a>
					</div>
					<div class="calum" style="width: 90%;">
					 <c:forEach items="${pressureList }" var="pressure">
						<div class="health-Container-Box calum">
							<div class="health-Content-Title low">
									<img src="#"/>
									<div class="health-Box1 low">
										<h2>상황 : ${pressure.situation}</h2>
									</div>
									<div class="health-Box2 low">
										<h2>기록일 : ${pressure.pressureRecordDate}</h2>
									</div>
									<button value="1" class="moreBtn low"  onclick="toggle(this)">더보기</button>
									<a href="javascript:deleteCheck();"><button class="delBtn low">삭제</button></a>

							</div>
							<div class="health-Content low border">
								<div class="health-Box1 low">
									<h2>최고혈압</h2>
								</div>
								<div class="health-Box2 low">
									<h2>${pressure.SBP}</h2>
								</div>
							</div>
							<div class="health-Content low border">
								<div class="health-Box1 low">
									<h2>최저혈압</h2>
								</div>
								<div class="health-Box2 low">
									<h2>${pressure.DBP}</h2>
								</div>
							</div>
							<div class="health-Content low border">
								<div class="health-Box1 low">
									<h2>심박수</h2>
								</div>
								<div class="health-Box2 low">
									<h2>${pressure.bpm}</h2>
								</div>
							</div>
								<a href="<c:url value='/updatePressureForm/${pressure.pressureNo}'/>"><button class="updateBtn btn low">수정</button></a>
							
		 		 
						 	<script>
			 					SBP.push(${pressure.SBP})
						        DBP.push(${pressure.DBP})
						        bpm.push(${pressure.bpm})
					 		</script>
				 		
						</div>
						</c:forEach>
						
							<script type="text/javascript">
								function deleteCheck(){
									var answer = confirm("선택한 혈압 정보를 삭제하시겠습니까?");
									if(answer == true){
										location.href="<c:url value='/deleteBody/${body.bodyNo}' />";
									}
								}
							</script>
					</div>
				</div>
					
				<script>

			        console.log("${pressure.pressureRecordDate}")
		 		</script>

			   	<a href="<c:url value='/updatePressureForm/${pressure.pressureNo}'/>">혈압 관리 정보 수정</a>
			   	<a href="javascript:deleteCheck();">혈압 관리 정보 삭제</a><br>
			   	

 				<br>
 				
 			
			
				<!-- 기분 변수 -->
				<script>
			        let feelScale = []
				</script>

				
				
			<div class="health-Container calum">
					<div class="healthTitle low">
						<h2>기분 리스트</h2>
						<a href="<c:url value='/feelForm/${famNo}'/>"><button value="0" class="btn low">등록</button></a>
					</div>
					<div class="calum" style="width: 90%;">
					 	<c:forEach var="feel" items="${feelList}">
						<div class="health-Container-Box calum">
							<div class="health-Content-Title low">
									<img src="#"/>
									<div class="health-Box1 low">
										<h2>기분점수 ${feel.feelScale}</h2>
									</div>
									<div class="health-Box2 low">
										<h2>기록일 : ${feel.feelRecordDate}</h2>
									</div>
									<button value="1" class="moreBtn low"  onclick="toggle(this)">더보기</button>
									<a href="javascript:deleteCheck();"><button class="delBtn low">삭제</button></a>

							</div>
							<div class="health-Content low border">
								<div class="health-Box1 low">
									<h2>기록자</h2>
								</div>
								<div class="health-Box2 low">
									<h2>${feel.famNo}</h2>
								</div>
							</div>
							<div class="health-Content low border">
								<div class="health-Box1 low">
									<h2>기분일기</h2>
								</div>
								<div class="health-Box2 low">
									<h2>${feel.feelMemo}</h2>
								</div>
							</div>
								<a href="<c:url value='/updateFeelForm/${feel.feelNo}'/>"><button class="updateBtn btn low">수정</button></a>
							
		 		 
							<script>
								feelScale.push(${feel.feelScale})
						        console.log(${feel.feelRecordDate})
					 		</script>
					 		
					 	<script type="text/javascript">
							function deleteCheck(){
								var answer = confirm("선택한 기분 정보를 삭제하시겠습니까?");
								if(answer == true){
									location.href="<c:url value='/deleteFeel/${feel.feelNo}' />";
								}
							}
						</script>
						
						</c:forEach>	
				 		
						</div>
					</div>

			
			

				
				
				
				<!-- 혈당 변수 -->
			<script>
		        let sugarMedication = []
		        let sugarLevel = []
			</script>
		
		 		
		 	<div class="health-Container calum">
					<div class="healthTitle low">
						<h2>혈당 리스트</h2>
						<a href="<c:url value='/sugarForm/${famNo}'/>"><button value="0" class="btn low">등록</button></a>
					</div>
					<div class="calum" style="width: 90%;">
					 <c:forEach items="${sugarList}" var="sugar">
						<div class="health-Container-Box calum">
							<div class="health-Content-Title low">
									<img src="#"/>
									<div class="health-Box1 low">
										<h2>번호 ${sugar.sugarNo}</h2>
									</div>
									<div class="health-Box2 low">
										<h2>기록일 : ${sugar.sugarRecordDate}</h2>
									</div>
									<button value="1" class="moreBtn low"  onclick="toggle(this)">더보기</button>
									<a href="javascript:deleteCheck();"><button class="delBtn low">삭제</button></a>

							</div>
							<div class="health-Content low border">
								<div class="health-Box1 low">
									<h2>상황</h2>
								</div>
								<div class="health-Box2 low">
									<h2>${sugar.situation}</h2>
								</div>
							</div>
							<div class="health-Content low border">
								<div class="health-Box1 low">
									<h2>투약</h2>
								</div>
								<div class="health-Box2 low">
									<h2>${sugar.sugarMedication}</h2>
								</div>
							</div>
							<div class="health-Content low border">
								<div class="health-Box1 low">
									<h2>수치</h2>
								</div>
								<div class="health-Box2 low">
									<h2>${sugar.sugarLevel}</h2>
								</div>
							</div>
							<div class="health-Content low border">
								<div class="health-Box1 low">
									<h2>메모</h2>
								</div>
								<div class="health-Box2 low">
									<h2>${sugar.acpcMemo}</h2>
								</div>
							</div>
			
								<a href="<c:url value='/updateSugarForm/${sugar.sugarNo}'/>"><button class="updateBtn btn low">수정</button></a>
		 
						</div>
						<script>
					        sugarMedication.push(${sugar.sugarMedication})
					        sugarLevel.push(${sugar.sugarLevel})
						</script>
				 	</c:forEach>
						
					</div>
				</div>

			<script type="text/javascript">
				function deleteCheck(){
					var answer = confirm("선택한 혈당 정보를 삭제하시겠습니까?");
					if(answer == true){
						location.href="<c:url value='/deleteSugar/${sugar.sugarNo}' />";
					}
				}
			</script>		
			
			</section>
	        <!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->		
      
      
      
      <!-- 더보기 기능, 수정버튼 숨기기 -->
     	<script>
	
			let healthContent = document.getElementsByClassName('health-Content');
			
			let updateBtn = $('.updateBtn');
	
			
		    for(let i=0; i<healthContent.length; i++) {
				healthContent[i].classList.add('display-none')
			}
		    
		    
		    for(let i=0; i<updateBtn.length; i++) {
		    	updateBtn[i].classList.add('display-none')
			}
		    
			
	
			function toggle(a) {
	
				let item = $(a).parent().parent().find('.health-Content')
				
				let updateBtnItem = $(a).parent().parent().find('.updateBtn')
				
				
				if($(item[0]).hasClass('display-none') === true) {
					
					updateBtnItem[0].classList.remove('display-none')
					
					for(let i=0; i<item.length; i++) {
						item[i].classList.remove('display-none')
					}
				}
				else {
					
					updateBtnItem[0].classList.add('display-none')
					
					for(let i=0; i<item.length; i++) {
						item[i].classList.add('display-none')
					}
				}
				
				
			}
			
			function go() {
	
			}
			
		 </script>   
      
       
       
       
       <!-- 체형 차트 -->
        <script>
        /*
        - Chart를 생성하면서, 
        - ctx를 첫번째 argument로 넘겨주고, 
        - 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
        */
       
       
     
        let date = ['1일','2일','3일','4일','5일','6일','7일']
            new Chart(document.getElementById("myChart1"), {
            type: 'line',
            data: {
                labels:date,
                datasets: [{ 
                    data: height,
                    label: "키",
                    borderColor: "#3e95cd",
                    fill: false
                },
                { 
                    data: weight,
                    label: "몸무게",
                    borderColor: "#3e95cd",
                    fill: false
                },
                { 
                    data: bmi,
                    label: "BMI",
                    borderColor: "#3e95cd",
                    fill: false
                }]
            },
            options: {
                maintainAspectRatio: false,
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero:true
                        }
                    }]
                },
                title: {
                display: true,
                text: '월간 체형',
                }
            }
            });
        </script>
        
    <!-- 혈압 차트 -->
    <script>
    // 우선 컨텍스트를 가져옵니다. 
    /*
    - Chart를 생성하면서, 
    - ctx를 첫번째 argument로 넘겨주고, 
    - 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
    */
    
    new Chart(document.getElementById("myChart2"), {
        type: 'line',
        data: {
            labels:date,
            datasets: [{ 
                data: SBP,
                label: "최고혈압",
                borderColor: "#3e95cd",
                fill: false
            }, 
            {
                data: DBP,
                label: "최저혈압",
                borderColor: "#e74c3c",
                fill: false
            },
            {
                data: bpm,
                label: "심박수",
                borderColor: "#e74c3c",
                fill: false
            }]
        },
        options: {
            maintainAspectRatio: false,
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true
                    }
                }]
            },
            title: {
            display: true,
            text: '주간 혈압',
            }
        }
        });
    </script>

	<!-- 기분 차트 -->
    <script>
    // 우선 컨텍스트를 가져옵니다. 
    /*
    - Chart를 생성하면서, 
    - ctx를 첫번째 argument로 넘겨주고, 
    - 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
    */
    
    new Chart(document.getElementById("myChart3"), {
        type: 'line',
        data: {
            labels:date,
            datasets: [{ 
                data: feelScale,
                label: "기분점수",
                borderColor: "#f1c40f",
                fill: false
            }]
        },
        options: {
            maintainAspectRatio: false,
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true
                    }
                }]
            },
            title: {
            display: true,
            text: '주간 기분',
            }
        }
        });
    </script>


	<!-- 혈당 차트 -->
    <script>
    // 우선 컨텍스트를 가져옵니다. 
    /*
    - Chart를 생성하면서, 
    - ctx를 첫번째 argument로 넘겨주고, 
    - 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
    */
    
    
    new Chart(document.getElementById("myChart4"), {
        type: 'line',
        data: {
            labels:date,
            datasets: [{ 
                data: sugarMedication,
                label: "혈당",
                borderColor: "#f1c40f",
                fill: false
            },
            { 
                data: sugarLevel,
                label: "투약",
                borderColor: "#f1c40f",
                fill: false
            }]
        },
        options: {
            maintainAspectRatio: false,
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true
                    }
                }]
            },
            title: {
            display: true,
            text: '주간 혈당',
            }
        }
        });
    </script>
    
    <script>

	    let chart = document.getElementsByClassName('chart')
	    
	    let healthContainer = document.getElementsByClassName('health-Container')  
	
	
	    for(let i=0; i<chart.length; i++) {
	        chart[i].classList.add('display-none') 
	        healthContainer[i].classList.add('display-none') 
	    }
	
	    chart[0].classList.remove('display-none') 
	    healthContainer[0].classList.remove('display-none')
	
	    function change(a) {
	    	
	        for(let i=0; i<chart.length; i++) {
	            chart[i].classList.add('display-none') 
	            healthContainer[i].classList.add('display-none') 
	        }
	
	        chart[a].classList.remove('display-none')
	        healthContainer[a].classList.remove('display-none')
	
	    }

    </script>
</body>
</html>