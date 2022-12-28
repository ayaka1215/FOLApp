$(function(){
    console.log('hogehoge');
    $('.btn-delete').click(function() {
        if(confirm('本当に削除しますか？')) {
            return true;
        } else {
            return false;
        }
    })
    
});