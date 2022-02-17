/**
 * 
 */
 
 function commentList(board_id, pageNum) {
        $.ajax({
           url : '/commentlist',
           type : 'POST',
           data : {
              'board_id' : board_id,
              'page' : pageNum
          },
           dataType:"json",
           success : function(data) {
              var a = '';
              var page = data.page;
              var startpage = data.startpage;
              var endpage = data.endpage;
              var boardList = data.boardList;

              $.each(boardList, function(key, value) {
                 console.log("data : " + boardList);
                 console.log(boardList);
                 console.log(page + "," + startpage + "," + endpage);
                 console.log("start : " + startpage);
                 console.log("end : " + endpage);
                 a += '<div class="commentArea" style="boarder-bottom:1px solid darkgray; margin-bottom: 15px;">';
                 a += '<div class="commentInfo'+value.board_re_id+'">'+'댓글번호 : '+value.board_re_id+' / 작성자 : '+value.mem_id;
                 a += '<a onclick="commentUpdate('+value.board_re_id+',\''+value.board_re_content+'\');"> 수정 </a>';
                 a += '<a onclick="commentDelete('+value.board_re_id+');"> 삭제 </a> </div>';
                 a += '<div class="commentContent'+value.board_re_id+'"> <p> 내용 : '+value.board_re_content +'</p>';
                 a += '</div></div>';
              });
              
              for (var num=startpage; num<=endpage; num++) {
                 if (num == page) {
                      a += '<a href="#" onclick="commentList(' + board_id + ', ' + num + '); return false;" class="page-btn">' + num + '</a>';
                 } else {
                      a += '<a href="#" onclick="commentList(' + board_id + ', ' + num + '); return false;" class="page-btn">' + num + '</a>';
                 }
              }
            $('.commentList').html(a);
         }
      });
   }
