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
	  })
	  .state("accountSignup", {
	      url: "/signup",
	      templateUrl: APP_CONFIG.signup_page_html
	  })

    $urlRouterProvider.otherwise("/");
  }
})();
