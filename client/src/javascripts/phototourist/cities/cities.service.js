(function () {
  "use strict";

  angular.module("phototourist.cities")
    .factory("phototourist.cities.City", CityFactory);

  CityFactory.$inject = ['$resource', "phototourist.APP_CONFIG"];
  function CityFactory($resource, APP_CONFIG) {
    return $resource(
      APP_CONFIG.server_url + "/api/cities/:id",
      {id: '@id'},
      {
        update: { method: 'PUT' },
        save: { method: 'POST' }
      }
    );
  }

  // Transforms request body.
  function buildRequestBody(data) {
    return angular.toJson({
      city: data
    });
  }
})();
