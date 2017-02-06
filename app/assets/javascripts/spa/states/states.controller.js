(function () {
  "use strict";

  angular.module("spa.states")
    .controller("spa.states.StatesController", StatesController);

  StatesController.$inject = ["spa.states.State"];
  function StatesController(State) {
    var vm = this;
    vm.states;
    vm.state;
    vm.edit = edit;
    vm.create = create;
    vm.update = update;
    vm.remove = remove;

    activate();
    return;
    ///////////////
    function activate() {
      newState();
      vm.states = State.query();
    }

    function newState() {
      vm.state = new State();
    }

    function handleError(response) {
      console.log(response);
    }

    function edit(object) {
      console.log("selected", object);
      vm.state = object;
    }

    function create() {
      vm.state.$save()
        .then(function (response) {
          console.log(response);
          vm.states.push(vm.state);
          newState();
        })
        .catch(handleError);
    }

    function update() {
      vm.state.$update()
        .then(function (response) {
          console.log(response);
        })
        .catch(handleError);
    }

    function remove() {
      vm.state.$delete()
        .then(function () {
          // vm.states = State.query();
          removeElement(vm.states, vm.state);
          newState();
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
