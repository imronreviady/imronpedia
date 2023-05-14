<?php 
$curr_time = time();
$db_lc     = fetch_or_get($hs['config']['db_lc'],$curr_time);

if ($curr_time >= $db_lc) {
	hs_ap_save_config('db_lc',($curr_time + 18000));
	try {
		require_once('tasks/clean_data_base.php');
	} 
	catch (Exception $e) {/* pass */}
}