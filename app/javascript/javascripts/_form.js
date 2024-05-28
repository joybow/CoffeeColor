$(document).ready(function(){
  initialize();
})
$(document).on('turbolinks:load',function() {
  initialize();
})


function initialize() {
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
  $('#post_images').on('change', function(){
    let files = this.files;
    let container = $('#post_images_preview_container');

    for (let i = 0; i < files.length; i++) {
    let file = files[i];
    let reader = new FileReader();
    reader.onload = function(e) {
      let img = $('<img>').attr('src', e.target.result).addClass('mb-3 mt-3 mr-3 ml-3').attr('width', '100');
      container.append(img.hide().fadeIn(1000));
      let deleteButton = $('<button>').text('削除').addClass('btn btn-primary delete-button');
      container.append(deleteButton.hide().fadeIn(1000));
      
      deleteButton.click(function(){
        img.remove();
        deleteButton.remove();
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
};

