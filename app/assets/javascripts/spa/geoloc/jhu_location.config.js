(function() {
  "use strict";

  angular
    .module("spa.geoloc")
    .config(JhuLocationOverride);
	
  JhuLocationOverride.$inject=[];
  function JhuLocationOverride() {
  }
})();
