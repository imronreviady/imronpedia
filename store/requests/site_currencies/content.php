<?php
if(empty($hs['is_admin'])) {
	hs_redirect('404');
}

$hs['site_currencies'] = hs_get_currencies();
$hs['pn']              = $store_page;
$hs['page_title']      = hs_translate('Manage currencies');
$hs['page_desc']       = $hs['config']['description'];
$hs['page_kw']         = $hs['config']['keywords'];
$hs['site_content']    = hs_loadpage("site_currencies/content");