(function () {
  "use strict";

  angular.module("spa.states")
    .controller("spa.states.StatesController", StatesController);

  StatesController.$inject = ["spa.states.State"];
  function StatesController(State) {
    var $ctrl = this;
    $ctrl.states;
    $ctrl.state;

    activate();
    return;
    ///////////////
    function activate() {
      newState();
    }

    function newState() {
      $ctrl.state = new State();
    }
    function handleError(response) {
      console.log(response);
    }
    function edit(object, index) {

    }
    function create() {

    }
    function update() {

    }
    function remove() {

    }
    function removeElement(elements, element) {

    }
  }
})();
