// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.



import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "../channels";

import '../stylesheets/application';
import '../javascripts/codeAddress.js';
import '../javascripts/_form.js';
import '../javascripts/confirm.js';
import '../javascripts/index.js';
import '../javascripts/chat_rooms.js';

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// mypageでのフォロー、アンフォローのajax
// $(document).ready(function(){
//   let userId = $("#following_forms").data("user-id");
//   let followArea = $('#follow_area').html();
//   $("#following_forms" + userId ).html(followArea);

// })


