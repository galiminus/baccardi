angular.module("app").config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise "/"

  $stateProvider
    .state "projections",
      url: "/"
      templateUrl: "projections-template.html"
      resolve:
        projections: (Restangular) ->
          Restangular.all("projections.json").getList()
      controller: ($scope, $auth, projections) ->
        $scope.projections = projections
        $scope.authenticate = ->
          $auth.authenticate('google').then (response) ->
            console.log response

.run ($rootScope) ->
  $rootScope.$on("$stateChangeError", console.log.bind(console));
