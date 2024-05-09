$(document).on('click', '.deleted_flg', function(event) {
  let button = $(this);
  let deleteOffset = $('.deleted').position();
  let deleteHeight = $('.deleted').outerHeight();
  let flashMessage = button.closest('td').find('.flash-messages');
  let message = '復旧完了';
  
  let buttonOffset = button.position();
  let buttonHeight = button.outerHeight();
  
  flashMessage.text(message).css({
    position: 'absolute',
    top: deleteOffset.top + deleteHeight + 10,
    left: buttonOffset.left,
    display: 'none'
  });
  
  flashMessage.fadeIn(200);
  
  setTimeout(function() {
    flashMessage.fadeOut(200);
  }, 3000);
});