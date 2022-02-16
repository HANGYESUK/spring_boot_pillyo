/**
 * drugAutoComplete.js
 */
 
 $('#drugSearchInput').autocomplete({ //autocomplete: jquery내의 자동완성 기능
				source:function(request, response){  //필드에 타이핑시 동작되는 나오는 목록,  source속성: 저장공간이랑 비슷한 개념
					$.ajax({
						url:"/drugAutoComplete",
						type:"get",
						data:{keyWord: $('#drugSearchInput').val()}, //검색 키워드
						success:function(data){
							response(
								$.map(data, function(item){
									return{
										lable: item.itemName
									};
								})		
							);
						}
						,error:function(){
							alert("전송실패");
						}
					});
				}
			,minLength:1 	// 조회를 위한 최소 글자수
			,autoFocus:false 	//첫번째 항목 자동 포커스 되도록(기본값:false)
			
			});