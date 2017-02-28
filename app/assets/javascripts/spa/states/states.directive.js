(function () {
  "use strict";

  angular.module("spa.states")
    .directive("states", StatesDirective);

  StatesDirective.$inject = ["spa.config.APP_CONFIG"];
  function StatesDirective(APP_CONFIG) {
    var ddo = {
      templateUrl: APP_CONFIG.states_html,
      bindToController: true,
      replace: true,
      controller: "spa.states.StatesController",
      controllerAs: "statesVM",
      restrict: "E",
      scope: {},
      link: link
    };
    return ddo;

    function link(scope, element, attrs) {
      console.log("StatesDirective", scope);
    }
  }
})();
