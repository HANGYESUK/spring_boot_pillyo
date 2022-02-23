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
			
			<section id="section">
	


			가족 목록(dashboard3으로 페이지 다시 호출(ajax는 아님.))<br>
			<c:forEach items="${famList}" var="fam">
				<a href="<c:url value='/healthManageView/${fam.famNo}'/>">${fam.famMember} </a><br>
			</c:forEach>
			<br><br>
			
			<a href="<c:url value='/sugarForm/${famNo}'/>">혈당등록</a><br>
			<a href="<c:url value='/bodyForm/${famNo}'/>">체형등록</a><br>
			<a href="<c:url value='/pressureForm/${famNo}'/>">혈압등록</a><br>
			<a href="<c:url value='/feelForm/${famNo}'/>">기분등록</a><br>
			<br><br>
			
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
			    
			    
			    
			    <button value=0 onclick="change(this.value)">체형</button>
			    <button value=1 onclick="change(this.value)">혈압</button>
			    <button value=2 onclick="change(this.value)">기분</button>
			    <button value=3 onclick="change(this.value)">혈당</button>
			
			
			<h3>전체 혈당 관리 목록</h3>
			
			<!-- 혈당 변수 -->
			<script>
		        let sugarMedication = []
		        let sugarLevel = []
			</script>
			
			<c:forEach items="${sugarList}" var="sugar">
		 		번호 ${sugar.sugarNo}
		 		상황 ${sugar.situation}
		 		투약 ${sugar.sugarMedication}
		 		식전/식후 ${sugar.acpc}
		 		수치 ${sugar.sugarLevel}
		 		메모 ${sugar.acpcMemo}
		 		기록날짜 ${sugar.sugarRecordDate}
		 		기록시간 ${sugar.sugarRecordTime}
		 		가족번호 ${sugar.famNo}
		 		
		 		<a href="<c:url value='/updateSugarForm/${sugar.sugarNo}'/>">혈당 정보 수정</a>
		 		<a href="javascript:deleteCheck();">혈당 정보 삭제</a><br><br>
		 		
				<script>
			        sugarMedication.push(${sugar.sugarMedication})
			        sugarLevel.push(${sugar.sugarLevel})
				</script>
		 			 		
			<script type="text/javascript">
				function deleteCheck(){
					var answer = confirm("선택한 혈당 정보를 삭제하시겠습니까?");
					if(answer == true){
						location.href="<c:url value='/deleteSugar/${sugar.sugarNo}' />";
					}
				}
			</script>		
			<br>
		 </c:forEach>
		 
		 
		 	<!-- 체형 변수 -->
			<script>
		        let height = []
		        let weight = []
		        let bmi = []
			</script>
		    
			    <h3>전체 체형 관리 목록</h3>
			
			   <c:forEach items="${bodyList }" var="body">
			   	<div>
		   			체형관리 번호 ${body.bodyNo}
		   			키 ${body.height}
		   			몸무게 ${body.weight}
		   			BMI ${body.bmi}
		   			기록날짜 ${body.bodyRecordDate}
		   			가족 번호 ${body.famNo}
		   		</div>
		   			
		 		<script>
			        height.push(${body.height})
			        weight.push(${body.weight})
			        bmi.push(${body.bmi})
			        
			        console.log(${body.bodyRecordDate})
		 		</script>

			   	<a href="<c:url value='/updateBodyForm/${body.bodyNo}'/>">체형 관리 정보 수정</a>
			   	<a href="javascript:deleteCheck();">체형 관리 정보 삭제</a><br>
			   	
			   	<script type="text/javascript">
					function deleteCheck(){
						var answer = confirm("선택한 체형 정보를 삭제하시겠습니까?");
						if(answer == true){
							location.href="<c:url value='/deleteBody/${body.bodyNo}' />";
						}
					}
				</script>
 		 <br>
		</c:forEach>
		
		
		<h3>전체 혈압 관리 목록</h3>


		<!-- 혈압 변수 -->
		<script>
	        let SBP = []
	        let DBP = []
	        let bpm = []
		</script>
			   <c:forEach items="${pressureList }" var="pressure">
		   			상황 : ${pressure.situation}
					수축기 혈압 : ${pressure.SBP}
					이완기 혈압 : ${pressure.DBP}
					심박수 : ${pressure.bpm}
					메모 : ${pressure.pressureMemo}
					기록날짜 : ${pressure.pressureRecordDate}
					기록시간 : ${pressure.pressureRecordTime}
					
				<script>

			        console.log("${pressure.pressureRecordDate}")
		 		</script>

			   	<a href="<c:url value='/updatePressureForm/${pressure.pressureNo}'/>">혈압 관리 정보 수정</a>
			   	<a href="javascript:deleteCheck();">혈압 관리 정보 삭제</a><br>
			   	
			   	<script type="text/javascript">
					function deleteCheck(){
						var answer = confirm("선택한 혈압 정보를 삭제하시겠습니까?");
						if(answer == true){
							location.href="<c:url value='/deleteBody/${body.bodyNo}' />";
						}
					}
				</script>
 				<br>
 				
 				<script>
 					SBP.push(${pressure.SBP})
			        DBP.push(${pressure.DBP})
			        bpm.push(${pressure.bpm})
			        
			        console.log(${body.bodyRecordDate})
		 		</script>
		 		
			</c:forEach>
			   
			<h3>전체 기분 관리 목록</h3>
			<c:if test="${not empty sessionScope.sid}">
				<h5 id="UserName">${sessionScope.sid}님의 기분 기록입니다</h5>
			</c:if>
			
				<!-- 기분 변수 -->
				<script>
			        let feelScale = []
				</script>
			
			<c:forEach var="feel" items="${feelList}">
				기분척도 : ${feel.feelScale}
				기분일기 : ${feel.feelMemo}
				기록날짜 : ${feel.feelRecordDate}
				기록시간 : ${feel.feelRecordTime}
				기록자 : ${feel.famNo}
				
				<script>
					feelScale.push(${feel.feelScale})
			        console.log(${feel.feelRecordDate})
		 		</script>
				
			<a href="<c:url value='/updateFeelForm/${feel.feelNo}'/>">기분 정보 수정</a>
		 	<a href="javascript:deleteCheck();">기분 정보 삭제</a><br><br>

			<script type="text/javascript">
				function deleteCheck(){
					var answer = confirm("선택한 기분 정보를 삭제하시겠습니까?");
					if(answer == true){
						location.href="<c:url value='/deleteFeel/${feel.feelNo}' />";
					}
				}
			</script>
			
			</c:forEach>	
			
			</section>
	        <!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->		   
      
       
       
       
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
	
	
	    for(let i=0; i<chart.length; i++) {
	        chart[i].classList.add('display-none') 
	    }
	
	    chart[0].classList.remove('display-none') 
	
	    function change(a) {
	        for(let i=0; i<chart.length; i++) {
	            chart[i].classList.add('display-none') 
	        }
	
	        chart[a].classList.remove('display-none')
	
	    }

    </script>
</body>
</html>