$(document).ready(function(){
  initialize();
});

function initialize() {
  
  const toggleElement = $(".ly_user_toggle");
  const toggleIcon = $('#toggle_icon');

  toggleIcon.on("click", function(){
    if (toggleElement.css('display') === 'none' || toggleElement.css('display') === '') {
      toggleElement.css('display', 'block');
      toggleIcon.addClass('open');
    } else {
      toggleElement.css('display','none');
      toggleIcon.removeClass('open');
    }
  });
};