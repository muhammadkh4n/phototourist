(function () {
  "use strict";

  angular.module("spa", [
		"ui.router",
		"ngFileUpload",
		"spa.config",
		"spa.authn",
		"spa.authz",
		"spa.layout",
		"spa.states",
		"spa.subjects"
  ]);
})();
