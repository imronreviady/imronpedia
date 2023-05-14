<?php
if (not_num($_GET['id'])) {
	hs_redirect('/');
}

$order_id         = intval($_GET['id']);
$hs['pn']         = 'my_orders';
$hs['child_pn']   = 'order_invoice';
$hs['page_title'] = hs_translate('Order invoice - {%name%}',array('name' => $hs['config']['name']));
$hs['page_desc']  = $hs['config']['description'];
$hs['page_kw']    = $hs['config']['keywords'];
$hs['order_data'] = hs_get_order_invoice($order_id);

if (not_empty($hs['order_data'])) {
	$hs['order_data']['is_canceled']  = hs_order_is_canceled($hs['order_data']['id']);
	$hs['order_data']['is_suspended'] = in_array($hs['order_data']['status'], array('canceled','expired','returned','failed'));
	$hs['site_content']               = hs_loadpage("order_invoice/content");
}

else{
	hs_redirect('404');
}