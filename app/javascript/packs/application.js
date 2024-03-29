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
import './codeAddress';
import './_form.js';
import './confirm.js';
Rails.start()
Turbolinks.start()
ActiveStorage.start()


