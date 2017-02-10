(function () {
  "use strict";

  angular.module("phototourist.cities")
    .controller("phototourist.cities.CitiesController", CitiesController);

  CitiesController.$inject = ["phototourist.cities.City"];
  function CitiesController(City) {
    var vm = this;
    vm.cities;
    vm.city;

    activate();
    return;

    function activate() {
      vm.city = newCity();
      vm.cities = City.query();
    }

    // Create new Instance of a city.
    function newCity() {
      vm.city = new City();
    }
  }
})();
