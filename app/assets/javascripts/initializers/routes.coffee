angular.module("app").config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise "/"

  $stateProvider
    .state "login",
      url: "/"
      templateUrl: "login-template.html"
      controller: ($scope, $auth, $state) ->
        $scope.authenticate = ->
          $auth.authenticate('google').then (response) ->
            $state.go "projections"

    .state "projections",
      url: "/projections"
      templateUrl: "projections-template.html"
      resolve:
        projections: (Restangular) ->
          Restangular.all("projections.json").getList()
      controller: ($scope, $auth, projections) ->
        $scope.projections = projections

.run ($rootScope) ->
  $rootScope.$on("$stateChangeError", console.log.bind(console));
