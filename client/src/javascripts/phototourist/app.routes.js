(function () {
  "use strict";

  angular.module("phototourist")
    .config(RoutesConfig);

  RoutesConfig.$inject = ["$stateProvider", "$urlRouterProvider", "phototourist.APP_CONFIG"];
  function RoutesConfig($stateProvider, $urlRouterProvider, APP_CONFIG) {
    var homeState = {
      url: "/",
      name: "home",
      templateUrl: APP_CONFIG.cities_html,
      controller: "phototourist.cities.CitiesController",
      controllerAs: "citiesVM"
    };

    $stateProvider
    .state(homeState);

    $urlRouterProvider.otherwise("/");
  }
})();
