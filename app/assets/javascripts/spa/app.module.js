(function () {
  "use strict";

  angular.module("spa", [
		"ui.router",
		"spa.config",
		"spa.authn",
		"spa.layout",
		"spa.states",
		"spa.subjects"
  ]);
})();
