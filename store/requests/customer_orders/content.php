<?php
$hs['pn']           =  $store_page;
$hs['page_title']   =  hs_translate('Customer orders');
$hs['page_desc']    =  $hs['config']['description'];
$hs['page_kw']      =  $hs['config']['keywords'];
$hs['orders_list']  =  hs_get_customer_orders(array(
	'seller_id'     => $me['id'],
	'limit'         => 10
));

$hs['site_content'] = hs_loadpage("customer_orders/content");