<?php
if (empty($hs['is_admin'])) {
	hs_redirect('404');
}

$hs['pn']         =  $store_page;
$hs['page_title'] =  hs_translate('New products - {%name%}',array('name' => $hs['config']['name']));
$hs['page_desc']  =  $hs['config']['description'];
$hs['page_kw']    =  $hs['config']['keywords'];
$hs['new_prods']  =  hs_ap_info_get_new_products(array(
	'limit'       => 7
));

$hs['site_content'] = hs_loadpage("new_products/content");