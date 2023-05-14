<?php
if (empty($hs['is_admin'])) {
	hs_redirect('404');
}

$hs['pn']           = $store_page;
$hs['page_title']   = hs_translate('Account deleting - {%name%}',array('name' => $hs['config']['name']));
$hs['page_desc']    = $hs['config']['description'];
$hs['page_kw']      = $hs['config']['keywords'];
$hs['requests']     = hs_ap_info_get_account_removals(array('limit' => 10));
$hs['req_total']    = hs_ap_info_get_account_removals_tatal();
$hs['site_content'] = hs_loadpage("account_removals/content");