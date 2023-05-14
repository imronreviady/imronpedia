<?php 
if (empty($hs['is_logged'])) {
	hs_redirect('auth');
}

else {
	$store_page = (isset($_GET['store_page'])) ? hs_secure($_GET['store_page']) : 'dashboard';

	if (file_exists("store/requests/$store_page/content.php")) {
		include_once("store/requests/$store_page/content.php");
	} 

	else {
		hs_redirect('404');
	}

	if (empty($hs['site_content'])) {
		hs_redirect('404');
	}

	$hs['announcements'] = ((empty($hs['is_logged'])) ? array() : hs_get_announcement($me['id']));
	$store_page_content  = hs_loadpage('sp_container',array(
		'page_content'   => $hs['site_content'],
		'store_page'     => $hs['pn'],
	));

	echo $store_page_content;
	exit;
}