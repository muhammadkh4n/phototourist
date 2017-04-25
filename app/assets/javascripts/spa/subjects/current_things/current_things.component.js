(function() {
  "use strict";

  angular
    .module("spa.subjects")
    .component("sdCurrentThings", {
      templateUrl: thingsTemplateUrl,
      controller: CurrentThingsController,
    });


  thingsTemplateUrl.$inject = ["spa.config.APP_CONFIG"];
  function thingsTemplateUrl(APP_CONFIG) {
    return APP_CONFIG.current_things_html;
  }

  CurrentThingsController.$inject = ["$scope",
                                     "spa.subjects.currentSubjects"];
  function CurrentThingsController($scope,currentSubjects) {
    var vm=this;

    vm.$onInit = function() {
      console.log("CurrentThingsController",$scope);
    }
    vm.$postLink = function() {
      $scope.$watch(
        function() { return currentSubjects.getThings(); },
        function(things) { vm.things = things; }
      );
    }
    return;
    //////////////
  }
})();
