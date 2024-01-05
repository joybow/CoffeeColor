// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery3
//= require popper
//= require bootstrap

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import 'bootstrap/dist/js/bootstrap';
import '../stylesheets/application';
import 'jquery';

Rails.start()
Turbolinks.start()
ActiveStorage.start()
window.addEventListener('load', function(){
  const colorpicker = document.getElementById('arrow-icon-color-selector');
  const arrowicon = document.getElementById('arrow-icon');
  // カラーピッカーの入力値(inputの値)が変更されたら{}内の処理を実行する
  colorpicker.addEventListener('input', function(e) {  
    arrowicon.style.color = e.target.value; // アイコンのCSSのcolorプロパティの値を右辺の値にする。右辺の値とはすなわち、カラーピッカーでの選択値である。
  });
});
