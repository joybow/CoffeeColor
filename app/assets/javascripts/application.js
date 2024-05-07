import $ from 'jquery';
import '../stylesheets/application';

const colorpicker = document.getElementById('arrow-icon-color-selector');
  const arrowicon = document.getElementById('arrow-icon');
  // カラーピッカーの入力値(inputの値)が変更されたら{}内の処理を実行する
  colorpicker.addEventListener('input', function(e) {  
    arrowicon.style.color = e.target.value; // アイコンのCSSのcolorプロパティの値を右辺の値にする。右辺の値とはすなわち、カラーピッカーでの選択値である。
  });
  
