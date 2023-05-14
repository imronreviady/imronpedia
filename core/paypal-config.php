<?php 
require_once('libs/paypal/vendor/autoload.php');
$paypal_conf = array(
 	"secret_key"      =>  $hs['config']['paypal_api_key'],
 	"publishable_key" =>  $hs['config']['paypal_api_pass']
);

$paypal = new \PayPal\Rest\ApiContext(
	new \PayPal\Auth\OAuthTokenCredential(
		$hs['config']['paypal_api_key'],
		$hs['config']['paypal_api_pass']
	)
);

$paypal->setConfig(
    array(
    	$hs['config']['paypal_mode']
    )
);

