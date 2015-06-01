angular.module('app').constant 'angularMomentConfig',
  timezone: 'Europe/Paris'
.run (amMoment) ->
  amMoment.changeLocale 'fr'