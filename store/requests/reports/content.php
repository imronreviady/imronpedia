<?php
if(empty($hs['is_admin'])) {
	hs_redirect('404');
}

$hs['pn']           = $store_page;
$hs['page_title']   = hs_translate('Reports - {%name%}',array('name' => $hs['config']['name']));
$hs['page_desc']    = $hs['config']['description'];
$hs['page_kw']      = $hs['config']['keywords'];
$hs['reports']      = hs_ap_info_get_customer_reports(array('limit' => 10));
$hs['site_content'] = hs_loadpage("reports/content");