<?php
if (empty($hs['is_admin'])) {
	hs_redirect('404');
}

$hs['pn']                  = $store_page;
$hs['page_title']          = hs_translate('Payouts - {%name%}',array('name' => $hs['config']['name']));
$hs['page_desc']           = $hs['config']['description'];
$hs['page_kw']             = $hs['config']['keywords'];
$hs['total_reqs']          = hs_ap_info_get_payouts_total();
$hs['total_reqs_paid']     = hs_ap_info_get_payouts_total('paid');
$hs['total_reqs_declined'] = hs_ap_info_get_payouts_total('declined');
$hs['total_reqs_pending']  = hs_ap_info_get_payouts_total('pending');
$hs['yearly_stats']        = hs_ap_info_yearly_payouts_stats();
$hs['payout_requests']     = hs_ap_info_get_market_payouts(array('limit' => 7,'status' => 'pending'));
$hs['site_content']        = hs_loadpage("market_payouts/content");