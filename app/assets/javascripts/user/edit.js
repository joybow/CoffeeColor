$(document).on('turbolinks:load',function() {
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
    const $form = $(formId);

    if ($textElement.is(':visible')) {
      $labelElement.text('キャンセル');
      $textElement.collapse('hide');
      $inputElement.collapse('show');
      if (formId === '#editPasswordForm'){
        $form.find('.password-field').attr('required', true);
      }
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
})