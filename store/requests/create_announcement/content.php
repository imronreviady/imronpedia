<?php
if(empty($hs['is_admin'])) {
	hs_redirect('auth');
}

$hs['pn']           = $store_page;
$hs['page_title']   = hs_translate('Announcements - {%name%}',array('name' => $hs['config']['name']));
$hs['page_desc']    = $hs['config']['description'];
$hs['page_kw']      = $hs['config']['keywords'];
$hs['site_content'] = hs_loadpage("create_announcement/content");