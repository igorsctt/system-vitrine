import rails from "@rails/ujs"
rails.start()
document.addEventListener('DOMContentLoaded', function() {
  var logoutLinks = document.querySelectorAll('a[data-method="delete"]');
  logoutLinks.forEach(function(link) {
    link.addEventListener('click', function(e) {
      console.log('Logout link clicado:', link.href);
    });
  });
  console.log('Rails UJS está carregado:', typeof Rails !== 'undefined');
});
document.addEventListener('DOMContentLoaded', function() {
  var logoutLinks = document.querySelectorAll('a[data-method="delete"]');
  logoutLinks.forEach(function(link) {
    link.addEventListener('click', function(e) {
      console.log('Logout link clicado:', link.href);
    });
  });
  console.log('Rails UJS está carregado:', typeof Rails !== 'undefined');
});
/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//

import Rails from "@rails/ujs";
Rails.start();


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

console.log('Hello World from Webpacker')
