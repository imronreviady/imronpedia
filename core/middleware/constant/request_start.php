<?php 
error_reporting(0);
if (not_empty($config['server_mode'])) {
	if ($config['server_mode'] == 'debug') {
		ini_set('display_errors', 1);
		ini_set('display_startup_errors',1);
		error_reporting(E_ALL);
	}
}

