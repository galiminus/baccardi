angular.module("app").config ($authProvider) ->
  $authProvider.google
    clientId: "791709844452-c5gulv0vv8j48ucpk2qng8asp0ouuk9r.apps.googleusercontent.com"
    url: "/users/auth/google"
