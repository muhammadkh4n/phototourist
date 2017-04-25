(function() {
  "use strict";

  angular
    .module("spa.subjects")
    .component("sdCurrentImages", {
      templateUrl: imagesTemplateUrl,
      controller: CurrentImagesController,
    });


  imagesTemplateUrl.$inject = ["spa.config.APP_CONFIG"];
  function imagesTemplateUrl(APP_CONFIG) {
    return APP_CONFIG.current_images_html;
  }

  CurrentImagesController.$inject = ["$scope",
                                     "spa.subjects.currentSubjects"];
  function CurrentImagesController($scope, currentSubjects) {
    var vm=this;

    vm.$onInit = function() {
      console.log("CurrentImagesController",$scope);
    }
    vm.$postLink = function() {
      $scope.$watch(
        function() { return currentSubjects.getImages(); },
        function(images) { vm.images = images; }
      );
    }
    return;
    //////////////
  }
})();
