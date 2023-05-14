<?php 
if ($page == 'ts_finish') {
	include_once("requests/ts_finish/content.php");
}

else if (not_empty($hs['temp_session'])) {
	echo hs_server_message('stop/temp_session_lock'); exit();
}

else {
	if (file_exists(sprintf("requests/%s/content.php",$page))) {
		include_once(sprintf("requests/%s/content.php",$page));

		if (empty($hs['site_content'])) {
			include_once('requests/404/content.php');
		}
	} 

	else {
		hs_redirect('404');
	}
}

$hs['announcements'] =  ((empty($hs['is_logged'])) ? array() : hs_get_announcement($me['id']));
$hs['site_content']  =  $hs['site_content'];
$content             =  hs_loadpage('mp_container',array(
	'theme_url'      => $hs['theme_url'],
	'site_url'       => $hs['theme_url'],
)); echo $content;exit();
