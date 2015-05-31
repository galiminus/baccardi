angular.module("app").config (RestangularProvider) ->
  RestangularProvider.addRequestInterceptor (elem, operation, what) ->
    if operation == 'post' || operation == 'put'
      wrapper = {}
      wrapper[what[0..-2]] = elem
      wrapper
    else
      elem

