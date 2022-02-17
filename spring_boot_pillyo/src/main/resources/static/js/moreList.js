/**
 * 
 */
 
$(document).ready(function moreList(){
	$('#drugSearchResultView').on('moreList', function(){
		event.preventDefault();
		
    $.ajax({
        url : "/drugSearch",
        type : "POST",
        cache : false,
        dataType: 'json',
        data : "conectType="+conectType +"&eDate="+eDate+"&sDate="+sDate+"&codeId="+codeId+"&limit="+limit,
        success : function(data){
            //console.log(data);
            var content="";
            for(var i=0; i<data.hashMapList.length; i++){
                content +=
                "<tr>"+
                    "<td>"+data.hashMapList[i].drugInfoNo+"</td>"+
                    "<td>"+data.hashMapList[i].itemName+"</td>"+
                    "<td>"+data.hashMapList[i].entpName+"</td>"+
                    "<td>"+data.hashMapList[i].cnt+"</td>"+
                "</tr>";
            }
            content+="<tr id='addbtn'><td colspan='5'><div class='btns'><a href='javascript:moreList();' class='btn'>더보기</a></div>  </td></tr>";
            $('#addbtn').remove();//remove btn
            $(content).appendTo("#table");
        }, error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
           }
    });
});
});