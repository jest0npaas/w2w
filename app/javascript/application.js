// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import "flowbite";

document.addEventListener("turbo:load", function () {
  if (typeof initFlowbite === "function") {
    initFlowbite();
  }
});
