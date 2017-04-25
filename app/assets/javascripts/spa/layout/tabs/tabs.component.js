(function() {
  "use strict";

  angular
    .module("spa.layout")
    .component("sdTabs", {
      templateUrl: tabsTemplateUrl,
      controller: TabsController,
      transclude: true,
      //bindings: {},
    })
    .component("sdTab", {
      controller: TabController,
      bindings: {
        label: "@"
      },
      require: {
        tabsController: "^^sdTabs"
      }
    })
    ;

  tabsTemplateUrl.$inject = ["spa.config.APP_CONFIG"];
  function tabsTemplateUrl(APP_CONFIG) {
    return APP_CONFIG.tabs_html;
  }

  TabsController.$inject = ["$scope"];
  function TabsController($scope) {
    var vm=this;
    vm.tabs=[];

    vm.$onInit = function() {
      console.log("TabsController",$scope);
    }
    return;
    //////////////
  }
  TabsController.prototype.addTab = function(tab) {
    this.tabs.push(tab);
  }


  TabController.$inject = ["$scope"];
  function TabController($scope) {
    var vm=this;

    vm.$onInit = function() {
      console.log("TabController",$scope);
      vm.tabsController.addTab(vm);
    }
    return;
    //////////////
  }
})();
