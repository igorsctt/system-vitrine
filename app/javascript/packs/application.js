import $ from 'jquery';
window.$ = $;
window.jQuery = $;
import 'bootstrap';
import Rails from "@rails/ujs";
Rails.start();

// Exemplo de listener customizado (opcional, pode remover se não precisar)
// document.addEventListener('DOMContentLoaded', function() {
//   var logoutLinks = document.querySelectorAll('a[data-method="delete"]');
//   logoutLinks.forEach(function(link) {
//     link.addEventListener('click', function(e) {
//       console.log('Logout link clicado:', link.href);
//     });
//   });
//   console.log('Rails UJS está carregado:', typeof Rails !== 'undefined');
// });

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

console.log('Hello World from Webpacker');
