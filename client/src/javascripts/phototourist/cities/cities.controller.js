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

    // Error Handler function.
    function handleError(response) {
      console.log(response);
    }

    // Edit selected object
    function edit(object) {
      console.log("selected", object);
      vm.city = object;
    }

    function update() {
      vm.city.$update()
        .then(function (response) {
          console.log(response);
        })
        .catch(handleError);
    }

    function remove() {
      vm.city.$delete()
        .then(function (response) {
          removeElement(vm.cities, vm.city);
          newCity();
        })
        .catch(handleError);
    }

    function create() {
      vm.city.$save()
        .then(function (response) {
          console.log(response);
          vm.cities.push(vm.city);
          newCity();
        })
        .catch(handleError);
    }

    function removeElement(elements, element) {
      for (var i = 0; i < elements.length; i++) {
        if (elements[i].id == element.id) {
          elements.splice(i, 1);
          break;
        }
      }
    }
  }
})();
