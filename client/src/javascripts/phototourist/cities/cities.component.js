(function () {
  "use strict";

  angular.module("phototourist.cities")
    .component("citiesForm", {
      templateUrl: templateUrl,
      bindings: {
        city: '<',
        onDelete: '&',
        onUpdate: '&',
        onCreate: '&'
      }
    });

  templateUrl.$inject = ["phototourist.APP_CONFIG"];
  function templateUrl(APP_CONFIG) {
    return APP_CONFIG.cities_form;
  }
})();
