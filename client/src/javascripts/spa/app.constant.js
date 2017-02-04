(function () {
  "use strict";

  angular.module("phototourist")
    .constant("phototourist.APP_CONFIG", {
      server_url: "http://localhost:3000",
      main_page_html: "spa/pages/main.html"
    });
})();
