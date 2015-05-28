angular.module("app").config (RestangularProvider) ->
  RestangularProvider.addRequestInterceptor (elem, operation, what) ->
    if operation == 'post' || operation == 'put'
      wrapper = {}
      wrapper[what[0..-2]] = elem
      console.log wrapper
      wrapper
    else
      elem

