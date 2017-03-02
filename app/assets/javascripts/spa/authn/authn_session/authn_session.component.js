(function(){
	"use strict";

	angular
		.module("spa.authn")
		.component("sdAuthnSession", {
			templateUrl: templateUrl,
			controller: AuthnSessionController
		});

	templateUrl.$inject = ["spa.config.APP_CONFIG"];
	function templateUrl(APP_CONFIG) {
		return APP_CONFIG.authn_session_html;
	}

	AuthnSessionController.$inject = ["$scope", "spa.authn.Authn"];
	function AuthnSessionController($scope, Authn) {
		var vm = this;
		vm.loginForm = {};
		vm.login = login;
		vm.getCurrentUser = Authn.getCurrentUser;
		vm.getCurrentUserName = Authn.getCurrentUserName;
		vm.logout = logout;

		vm.$onInit = function() {
			console.log("AuthnSessionController", $scope);
		};
		vm.$postLink = function () {
			vm.dropdown = $("#login-dropdown");
		};

		return;
		///////////////

		function login() {
			console.log("login");
			Authn.login(vm.loginForm).then(
				function (response) {
					vm.dropdown.removeClass("open");
				}
			);
		}

		function logout() {
			Authn.logout().then(
				function(){
					vm.dropdown.removeClass("open");
				});
		}
	}
})();
