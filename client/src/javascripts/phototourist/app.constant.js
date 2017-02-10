(function () {
  "use strict";

  angular.module("phototourist")
    .constant("phototourist.APP_CONFIG", {
      server_url: "http://localhost:3000",
      cities_html: "phototourist/cities/cities.html",
    });
})();
