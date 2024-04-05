$(document).on('turbolinks:load',function() {
  // テキストエリアの高さを自動調節する関数
  function adjustTextFieldHeight() {
    $('.auto-resize-textarea').each(function() {
      // 最初に高さを自動調節するために初期値に戻す
      $(this).css('height', 'auto');
      $(this).css('height', $(this)[0].scrollHeight + 'px'); // スクロール領域の高さを設定
    });
  }
  //テキスト入力フィールドの高さを自動調節
  document.querySelectorAll(".auto-resize-textarea").forEach(function(textField){
    textField.addEventListener("input", adjustTextFieldHeight);
  });
  //enterキーを押した時に確認になってしまうことをキャンセルしてます。
  // Enterキーを押したときの処理
  $('#post_title').keydown(function(event) {
    // Enterキーが押されたら
    if (event.key === 'Enter') {
      event.preventDefault(); // デフォルトの動作をキャンセル
    }
  });
  $('input[type="submit"]').click(function(e) {
    // 内容が空の場合
    if ($('#post_content').val() === '') {
      e.preventDefault(); // デフォルトのsubmit動作を無効にする
      alert('内容を入力してください'); // ユーザーに通知
    }
    
  });

  
    $('.delete-button').click(function(e){
      e.preventDefault();
      let deleteButton = $(this);
      let blobId = deleteButton.closest('.existing-image').data('blob-id');
      $.ajax({
        url: '/posts/image_delete/' + blobId,
        type: 'DELETE',
        dataType: 'json',
        data: { blob_id: blobId },
        success: function(data){
          console.log(data);
          let messageBox = $('.message-box');
          let messageText = $('.message-text');
          messageText.text(data.message);
          messageBox.addClass('success');
          let deletedImageParent = $('.existing-image[data-blob-id="' + blobId + '"]');
          let deletedImageContainer = deletedImageParent.parent();
          
          deletedImageParent.remove();
          if (deletedImageContainer.children().length == 0){
            deletedImageContainer.remove();
          }
          messageBox.fadeIn(function(){
            setTimeout(function(){
              messageBox.fadeOut(function(){
                messageText.text('');
                messageBox.removeClass('success');
              });
            }, 3000);
          });
        },
        error: function(jqXHR, textStatus, errorThrown){
          let messageText = $('.message-text');
          let messageBox = $('.message-box');
          messageText.text("画像削除失敗");
          messageBox.addClass('error');

          messageBox.fadeIn(function(){
            setTimeout(function(){
              messageBox.fadeOut(function(){
                messageText.text('');
                messageBox.removeClass('error');
              });
            }, 3000);
          });
        }
      });
    });
  $('#post_images').on('change', function(){
    console.log('file_filedが変更されました。')
    let files = this.files;
    let container = $('.existing-image');
    for (let i = 0; i < files.length; i++) {
    let file = files[i];
    let reader = new FileReader();
    reader.onload = function(e) {
      let imgPreview = $('<div>').addClass('img-preview');
      let img = $('<img>').attr('src', e.target.result).addClass('mb-3 mt-3 mr-3 ml-3').attr('width', '100');
      imgPreview.append(img);
      container.append(imgPreview.hide().fadeIn(1000));

      let deleteButton = $('<button>').text('削除').addClass('btn btn-primary delete-button');
      container.append(deleteButton.hide().fadeIn(1000));

      let hiddenField = $('<input>').attr({
        type: 'hidden',
        name: 'post[post_images][]',
        value: file.name
      });
      container.append(hiddenField.hide().fadeIn(1000));
      deleteButton.click(function(){
        console.log('削除ボタンがクリックされました。');
        img.remove();
        deleteButton.remove();
        hiddenField.remove();
        files = Array.from(files).filter(function(f){
          return f !== file;
        });
        let newFileList = new DataTransfer();
        files.forEach(function(file){
          newFileList.items.add(file);
        })

        $('#post_images')[0].files = newFileList.files;
        console.log('file_fieldが更新されました');
        });
      };
      reader.readAsDataURL(file);
    } 
  });
  $('#edit_form').on('submit',function(){
    console.log("ボタンが押されました。")
    $('input[name="post[exists_images][]"]').remove();
    
    let existsCount = $('.existing-image').length;
    let existingBlobIds = [];

    for(let i= 0; i < existsCount; i++){
    let blobId = $('.existing-image').eq(i).data('blob-id')
    existingBlobIds.push(blobId);
    }

    existingBlobIds.forEach(function(blobId){
      let hiddenField = $('<input>').attr({
      type: 'hidden',
      name: 'post[exists_images][]',
      value: blobId
    });
    $('#new-post').append(hiddenField);
    console.log("hidden_fieldを作りました。")
    });
  });
});

