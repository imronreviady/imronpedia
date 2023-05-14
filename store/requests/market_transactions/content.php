<?php
if(empty($hs['is_admin'])) {
	hs_redirect('404');
}

$hs['pn']               = $store_page;
$hs['page_title']       = hs_translate('Checkout transactions - {%name%}',array('name' => $hs['config']['name']));
$hs['page_desc']        = $hs['config']['description'];
$hs['page_kw']          = $hs['config']['keywords'];
$hs['market_checkouts'] = hs_ap_info_get_market_checkouts(array('limit' => 10));
$hs['total_checkouts']  = hs_ap_info_get_market_total_checkouts();
$hs['site_content']     = hs_loadpage("market_transactions/content");