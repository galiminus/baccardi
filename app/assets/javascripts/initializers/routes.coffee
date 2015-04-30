angular.module("app").config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise "/"

  $stateProvider
    .state "projections",
      url: "/"
      templateUrl: "projections-template.html"
      resolve:
        projections: (Restangular) ->
          Restangular.all("projections.json").getList()
      controller: ($scope, projections) ->
        $scope.projections = projections

.run ($rootScope) ->
  $rootScope.$on("$stateChangeError", console.log.bind(console));
