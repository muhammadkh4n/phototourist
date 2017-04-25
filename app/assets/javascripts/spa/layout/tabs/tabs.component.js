(function() {
  "use strict";

  angular
    .module("spa.layout")
    .component("sdTabs", {
      templateUrl: tabsTemplateUrl,
      controller: TabsController,
      transclude: true,
      //bindings: {},
    });


  tabsTemplateUrl.$inject = ["spa.config.APP_CONFIG"];
  function tabsTemplateUrl(APP_CONFIG) {
    return APP_CONFIG.tabs_html;
  }

  TabsController.$inject = ["$scope"];
  function TabsController($scope) {
    var vm=this;

    vm.$onInit = function() {
      console.log("TabsController",$scope);
    };
    return;
    //////////////
  }
})();
