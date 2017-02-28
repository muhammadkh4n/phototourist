(function () {
  "use strict";

  angular.module("spa")
    .config(RouterConfig);

  RouterConfig.$inject = ["$stateProvider", "$urlRouterProvider", "spa.config.APP_CONFIG"];
  function RouterConfig($stateProvider, $urlRouterProvider, APP_CONFIG) {
    $stateProvider
    .state("home", {
      url: "/",
      templateUrl: APP_CONFIG.main_page_html
    });

    $urlRouterProvider.otherwise("/");
  }
})();
