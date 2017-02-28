(function () {
  "use strict";

  angular.module("spa.states")
    .factory("spa.states.State", StateFactory);

  StateFactory.$inject = ["$resource", "spa.config.APP_CONFIG"];
  function StateFactory($resource, APP_CONFIG) {
    return $resource(
      APP_CONFIG.server_url + "/api/states/:id",
      { id: '@id' },
      {
        update: { method: "PUT",
                  transformRequest: buildNestedBody },
        save: { method: "POST",
                  transformRequest: buildNestedBody }
      });
  }

  function buildNestedBody(data) {
    return angular.toJson({state: data});
  }
})();
