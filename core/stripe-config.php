<?php 
require_once('libs/stripe/vendor/autoload.php');
$stripe_conf = array(
 	"secret_key"      =>  $hs['config']['stripe_api_key'],
 	"publishable_key" =>  $hs['config']['stripe_api_pass']
);

\Stripe\Stripe::setApiKey($stripe_conf['publishable_key']); 
