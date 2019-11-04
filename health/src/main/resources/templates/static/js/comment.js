/**
 * 
 */
let postNo = '${data.postNo}';

$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
    commentInsert(insertData); //Insert 함수호출(아래)
});
 
 
 
//댓글 목록 
function commentList(){
    $.ajax({
        url : '/comment/list',
        type : 'get',
        data : {'postNO':postNo},
        success : function(data){
            var a =''; 
            $.each(data, function(key, value){ 
                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                a += '<div class="commentInfo'+value.commentNo+'">'+'댓글번호 : '+value.commentNo+' / 작성자 : '+value.writer;
                a += '<a onclick="commentUpdate('+value.commentNo+',\''+value.content+'\');"> 수정 </a>';
                a += '<a onclick="commentDelete('+value.commentNo+');"> 삭제 </a> </div>';
                a += '<div class="commentContent'+value.commentNo+'"> <p> 내용 : '+value.content +'</p>';
                a += '</div></div>';
            });
            
            $(".commentList").html(a);
        }
    });
}
 
//댓글 등록
function commentInsert(insertData){
    $.ajax({
        url : '/comment/insert',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
                commentList(); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
            }
        }
    });
}
 
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(commentNo, content){
    var a ='';
    
    a += '<div class="input_group">';
    a += '<input type="text" class="form_control" name="content_'+commentNo+'" value="'+content+'"/>';
    a += '<span class="input_group_btn"><button class="btn" type="button" onclick="commentUpdateProc('+commentNo+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+commentNo).html(a);
    
}
 
//댓글 수정
function commentUpdateProc(commentNo){
    var updateContent = $('[name=content_'+commentNo+']').val();
    
    $.ajax({
        url : '/comment/update',
        type : 'post',
        data : {'content' : updateContent, 'commentNo' : commentNo},
        success : function(data){
            if(data == 1) commentList(postNo); //댓글 수정후 목록 출력 
        }
    });
}
 
//댓글 삭제 
function commentDelete(commentNo){
    $.ajax({
        url : '/comment/delete/'+commentNo,
        type : 'post',
        success : function(data){
            if(data == 1) commentList(postNo); //댓글 삭제후 목록 출력 
        }
    });
}
 
 
 
 
$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});