angular.module("app").config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise "/"

  $stateProvider
    .state "login",
      url: "/"
      templateUrl: "login-template.html"
      controller: ($scope, $rootScope, $auth, $state) ->
        $scope.authenticate = ->
          $auth.authenticate('google').then (response) ->
            sessionStorage.setItem('id', response.data.id)
            $state.go "projections"

    .state "projections",
      url: "/projections"
      templateUrl: "projections-template.html"
      resolve:
        now: ->
          moment()
        date: (now) ->
          now.date()
        days: (now) ->
          now.daysInMonth()
        user: (Restangular) ->
          Restangular.one("users", sessionStorage.getItem("id"))
        projections: (user, Restangular) ->
          user.all("projections").getList()
      controller: ($scope, $state, projections, now, date, days) ->
        $scope.projections = projections
        $scope.now = now
        $scope.date = date
        $scope.days = days
        $scope.divider = (days - date + 1)

        $scope.logout = ->
          sessionStorage.removeItem("id")
          $state.go "login"

        $scope.$watch "projections", (projections) ->
          return unless projections

          if projections.length == 0
            $scope.total = null
          else
            $scope.total = projections.map (projection) ->
              projection.variation
            .reduce (x, y) -> x + y
        , true

    .state "projections.new",
      url: "/new"
      onEnter: ($mdDialog, $state, Restangular, user, projections) ->
        $mdDialog.show
          clickOutsideToClose: true
          templateUrl: "projections-new-dialog-template.html"
          controller: ($scope) ->
            $scope.projection = {}
            $scope.create = ->
              user.all("projections").post($scope.projection).then (projection) ->
                projections.unshift projection
                $mdDialog.hide()

        .finally ->
          $state.go "projections"

    .state "projections.edit",
      url: "/:id/edit"
      resolve:
        projection: (user, projections, Restangular, $stateParams) ->
          (projection for projection in projections when projection.id is Number($stateParams.id))[0]

      onEnter: ($mdDialog, $state, Restangular, user, projection, projections) ->
        $mdDialog.show
          clickOutsideToClose: true
          templateUrl: "projections-edit-dialog-template.html"
          controller: ($scope) ->
            $scope.projection = Restangular.copy(projection)
            $scope.destroy = ->
              $scope.projection.remove().then ->
                index = projections.indexOf projection
                projections.splice index, 1
                $mdDialog.hide()

            $scope.create = ->
              $scope.projection.put().then ->
                projection.label = $scope.projection.label
                projection.variation = $scope.projection.variation
                projection.recurring = $scope.projection.recurring
                $mdDialog.hide()

        .finally ->
          $state.go "projections"

.run ($rootScope, $state, $auth) ->
  $rootScope.$on "$stateChangeError", console.log.bind(console)
  $rootScope.$on '$stateChangeStart', (event, toState, toParams, fromState, fromParams) ->
    if !sessionStorage.getItem("id") and toState.name != "login"
      event.preventDefault();
      $state.transitionTo 'login'