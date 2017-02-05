(function () {
  "use strict";

  angular.module("spa")
    .constant("spa.APP_CONFIG", {
      server_url: "http://localhost:3000",
      main_page_html: "spa/pages/main.html",
      states_html: "spa/states/states.html"
    });
})();
