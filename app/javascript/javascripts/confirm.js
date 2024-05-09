$(document).on('turbolinks:load', function(){
  $('[id^="del_btn_"]').on('click', function(){
    let imageContainer = $(this).closest('.image-container');
    let imageId = $(this).attr('data-image-id')
    console.log(imageId)
    
      $.ajax({
        url: '/posts/confirm/'+ imageId,
        method: 'DELETE',
        data: { id: imageId },
        success: function(response){
          console.log('画像削除');
          imageContainer.remove();
        },
        error: function(xhr, status, error){
          console.error('画像削除できませんでした:', error);
        }
      });
    
  })
})