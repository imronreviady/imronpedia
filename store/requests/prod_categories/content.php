<?php
if(empty($hs['is_admin'])) {
	hs_redirect('404');
}

$hs['all_catgs']    = hs_ap_info_get_prod_categories(array('limit' => 10));
$hs['pn']           = $store_page;
$hs['page_title']   = hs_translate('Manage categories');
$hs['page_desc']    = $hs['config']['description'];
$hs['page_kw']      = $hs['config']['keywords'];
$hs['site_content'] = hs_loadpage("prod_categories/content");