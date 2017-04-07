(function() {
  "use strict";

  angular
    .module("spa.geoloc")
    .service("spa.geoloc.geocoder", Geocoder);

  Geocoder.$inject = ["$resource", "spa.config.APP_CONFIG"];

  function Geocoder($resource, APP_CONFIG) {
    var service = this;
    service.getLocationByAddress=getLocationByAddress;
    service.getLocationByPosition=getLocationByPosition;

    return;
    ////////////////

    //returns location information for a provided address
    function getLocationByAddress(address) {    
      console.log("locateByAddress=", result);
    }

    //returns location information for a specific {lng,lat} position
    function getLocationByPosition(position) {
      console.log("locationByPosition", this, position);
    }    
  }
})();
