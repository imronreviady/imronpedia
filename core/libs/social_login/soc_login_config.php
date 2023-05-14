<?php
$provider            =   ((empty($provider)) ? "None" : $provider);
$social_login_config =   array(
	"callback"       =>  hs_link(sprintf("social_login?provider=%s",$provider)),
	"providers"      =>  array(
		"Google"     =>  array(
			"enabled" => true,
			"keys"    => array(
				"id"     => $config['google_api_id'],
				"secret" => $config['google_api_key']
			),
		),
		"Facebook"    => array(
			"enabled" => true,
			"keys"    => array(
				"id"     => $config['facebook_api_id'], 
				"secret" => $config['facebook_api_key']
			),
			"scope"          => "email",
			"trustForwarded" => false
		),
		"Twitter"     => array(
			"enabled" => true,
			"keys"    => array(
				"key"    => $config['twitter_api_id'], 
				"secret" => $config['twitter_api_key']
			),
			"includeEmail" => true
		),
	),
	"debug_mode" => false,
	"debug_file" => "",
);
?>