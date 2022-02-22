/**
 * drugShapeSearchForm.js 
 */
 
 
$(function(){
	
	//모양으로 약찾기 모양선택
$('#search_shape td input').click(function(){
		$('#search_shape td input').removeClass('selected');
		$(this).addClass('selected');
		$('#search_shape td input').find('input[type="checkbox"]').prop("checked",false);
		$(this).find('input[type="checkbox"]').prop("checked",true);
	})
	
		//색상으로 약찾기 모양선택
$('#search_color td input').click(function(){
		$('#search_color td input').removeClass('selected');
		$(this).addClass('selected');
		$('#search_color td input').find('input[type="checkbox"]').prop("checked",false);
		$(this).find('input[type="checkbox"]').prop("checked",true);
	})
});