$(document).ready(function() {
  initialize();
});


// $(document).on('turbolinks:load',function() {
//   if (typeof Turbolinks !== 'undefined') {
//     initialize();
//   }
// });

// $(document).on('turbolinks:before-visit', function(event){
//   if (event.data.url.includes('mypage/edit')){
//     Turbolinks.clearCache();
//     Turbolinks.visit(event.data.url, {action: 'replace'});
//     console.log("置き換わったよ。");
//   }
// })

function initialize() {
  const editSections = [
    { textSelector: '.userName', inputSelector: '.editUserName', labelClass: 'userNameEditLabel' },
    { textSelector: '.userMail', inputSelector: '.editUserMail', labelClass: 'userMailEditLabel' },
    { textSelector: '.userPhone', inputSelector: '.editUserPhone', labelClass: 'userPhoneEditLabel' },
    { textSelector: '.userPassword', inputSelector: '.editUserPassword', labelClass: 'userPasswordEditLabel', formId: '#editPasswordForm' }
  ];

  editSections.forEach(section => {
    const $labelElement = $(`.${section.labelClass}`);
    $labelElement.on('click', function() {
      switchEditUserInfo(section.textSelector, section.inputSelector, $(this));
    });
  });

  function switchEditUserInfo(textSelector, inputSelector, $labelElement, formId) {
    const $textElement = $(textSelector);
    const $inputElement = $(inputSelector);
    const $form = $(formId) ? $(formId) : null;

    if ($textElement.is(':visible')) {
      $labelElement.text('キャンセル');
      $textElement.collapse('hide');
      $inputElement.collapse('show');
      if (formId === '#editPasswordForm'){
        $form.find('.password-field').attr('required', true);
      }
      $labelElement.off('click').on('click', function() {
        switchEditUserInfo(textSelector, inputSelector, $(this), formId);
      });
    } else {
      $labelElement.text('編集');
      $textElement.collapse('show');
      $inputElement.collapse('hide');

      if (formId === '#editPasswordForm'){
        $form.find('.password-field').removeAttr('required');
      }
    }
  }


  function userImage(obj){
  var fileReader = new FileReader();
  fileReader.onload = (function(){
    document.getElementById('user_image_preview').src = fileReader.result;
  });
  fileReader.readAsDataURL(obj.files[0]);
  }
};