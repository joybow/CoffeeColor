// if (document.URL.match(/sign_up/)){
$(document).ready(function(){
  let timeoutId = 0;
  let hideTimeoutId;
  $(".chat-message").on('mousedown touchstart', function(){
    let $this = $(this);
    timeoutId = setTimeout(()=> {
        $this.find('.del').fadeIn(1000);
      });
    }).on(' mouseleave touchend', function(){
      clearTimeout(hideTimeoutId);
      let $this = $(this);
      hideTimeoutId = setTimeout(()=>{
        $this.find('.del').fadeOut(1000);
      });
      
    },);

  $(document).on('click', '.del',function(){
    let messageId = $(this).data('message-id');
    $.ajax({
      url: `/chat_messages/${messageId}`,
      type: 'DELETE',
      success: function(result){
        $(`#message-${messageId}`).remove();
      },
      error: function(xhr, status, error){
        console.error("削除に失敗しました：",status, error);
      }
    });
  });
});
