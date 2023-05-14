<?php
if(empty($hs['is_admin'])) {
	hs_redirect('404');
}

$hs['pn']           = $store_page;
$hs['page_title']   = hs_translate('Create a backup - {%name%}',array('name' => $hs['config']['name']));
$hs['page_desc']    = $hs['config']['description'];
$hs['page_kw']      = $hs['config']['keywords'];
$hs['backups']      = hs_ap_info_get_backups();
$hs['site_content'] = hs_loadpage("backup/content");