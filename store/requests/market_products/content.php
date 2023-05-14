<?php
if (empty($hs['is_admin'])) {
	hs_redirect('404');
}

$hs['pn']           =  $store_page;
$hs['page_title']   =  hs_translate('Products list of - {%name%}',array('name' => $hs['config']['name']));
$hs['page_desc']    =  $hs['config']['description'];
$hs['page_kw']      =  $hs['config']['keywords'];
$hs['market_prods'] =  hs_ap_info_get_products(array(
	'limit'         => 7,
));

$hs['site_content'] = hs_loadpage("market_products/content");