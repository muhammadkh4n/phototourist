(function() {
  "use strict";

  angular
    .module("spa.subjects")
    .component("sdCurrentSubjectsMap", {
      template: "<div id='map'></div>",
      controller: CurrentSubjectsMapController,
    });

  CurrentSubjectsMapController.$inject = ["$scope", "$q", "$element",
                                          "spa.geoloc.currentOrigin",
                                          "spa.geoloc.myLocation",
                                          "spa.geoloc.Map",
                                          "spa.subjects.currentSubjects",
                                          "spa.config.APP_CONFIG"];
  function CurrentSubjectsMapController($scope, $q, $element,
                                        currentOrigin, myLocation, Map, currentSubjects,
                                        APP_CONFIG) {
    var vm=this;

    vm.$onInit = function() {
      console.log("CurrentSubjectsMapController",$scope);
    }
    vm.$postLink = function() {
    }

    return;
    //////////////
    function getLocation() {
      //...
    }

    function initializeMap(element, position) {
      //...
    }

    function displaySubjects(){
      //...
    }

    function displaySubject(ti) {
      //...
    }
  }

  CurrentSubjectsMapController.prototype.updateOrigin = function() {
    //...
  }

  CurrentSubjectsMapController.prototype.setActiveMarker = function(thing_id, image_id) {
    //...
  }

  CurrentSubjectsMapController.prototype.originInfoWindow = function(location) {
    //...
  }
  CurrentSubjectsMapController.prototype.thingInfoWindow = function(ti) {
    //...
  }
  CurrentSubjectsMapController.prototype.imageInfoWindow = function(ti) {
    //...
  }


})();
