angular.module("app").config ($mdIconProvider) ->
	$mdIconProvider
		.icon("menu"       , "assets/ic_more_vert_24px.svg"          , 24)
		.icon("close"      , "assets/ic_close_24px.svg"              , 24)
		.icon("spending"   , "assets/ic_trending_down_24px.svg"      , 24)
		.icon("income"     , "assets/ic_trending_up_24px.svg"        , 24)
		.icon("settings"   , "assets/ic_settings_24px.svg"           , 24)
		.icon("disconnect" , "assets/ic_do_not_disturb_24px.svg"     , 24)