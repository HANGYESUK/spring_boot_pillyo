<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>검색창</title>
	<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script type="text/javascript">
			$(function() {	//화면 다 뜨면 시작
			    /* 약 전체 목록 data */
		    
				
				$("#searchInput").autocomplete({
					
					var drugArr = new Array();
			    	<c:forEach items="${drugList}" var="drug" varStatus="status">
			    		drugArr.push({
			    			key:"${drug.drugInfoNo}",
			    			name:"${drug.itemName}"
			    		});
					</c:forEach>
					console.log(drugArr);
					
					source : drugArr {
			             $.ajax({
			                    type: 'get',
			                    url: "/selectKeywordSearch",
			                    dataType: "json",
			                    //request.term = $("#autocomplete").val()
			                   	//data: {"param":"param"},
			                    success: function(drugNameList) {
			                        //서버에서 json 데이터 response 후 목록에 추가
			                        response(
			                            $.map(drugNameList, function(item) {	//json[i] 번째 에 있는게 item 임.
			                                return {
			                                    label: item+"label",	//UI 에서 보여지는 글자, 실제 검색어랑 비교 대상
			                                    value: item,	//그냥 사용자 설정값?
			                                    test : item+"test"	//이런식으로 사용
	
			                                }
			                            })
			                        );
			                    }
			               });
			            },	// source 는 자동 완성 대상
					select : function(event, ui) {	//아이템 선택시
						console.log(ui);//사용자가 오토컴플릿이 만들어준 목록에서 선택을 하면 반환되는 객체
						console.log(ui.item.label);	//김치 볶음밥label
						console.log(ui.item.value);	//김치 볶음밥
						console.log(ui.item.test);	//김치 볶음밥test
						
					},
					focus : function(event, ui) {	//포커스 가면
						return false;//한글 에러 잡기용도로 사용됨
					},
					minLength: 1,// 최소 글자수
					autoFocus: true, //첫번째 항목 자동 포커스 기본값 false
					classes: {	//잘 모르겠음
					    "ui-autocomplete": "highlight"
					},
					delay: 500,	//검색창에 글자 써지고 나서 autocomplete 창 뜰 때 까지 딜레이 시간(ms)
					//disabled: true, //자동완성 기능 끄기
					position: { my : "right top", at: "right bottom" },	//잘 모르겠음
					close : function(event){	//자동완성창 닫아질때 호출
						console.log(event);
					}
				});
				
			});



		</script>
	</head>
	<body>
		
		<section>
			<div id="searchBox">
				
					<input type="text" id="drugSearchInput" name="keyWord" />
					<input type="submit" value="검색" />
				
			</div>
		</section>
    	
	</body>
</html>