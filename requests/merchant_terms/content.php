<?php
if (empty($hs['is_logged'])) {
	hs_redirect('auth');
}

$hs['page_title']       = hs_translate('Trading terms of sale in - {%name%}',array('name' => $hs['config']['name']));
$hs['page_desc']        = $hs['config']['description'];
$hs['page_kw']          = $hs['config']['keywords'];
$hs['pn']               = 'merchant_terms';
$hs['header_st']        = true;
$hs['doc_page_content'] = hs_ap_info_get_static_page('doc_merchant_terms');
$hs['doc_page_content'] = ((not_empty($hs['doc_page_content'])) ? $hs['doc_page_content'] : hs_redirect('404'));
$hs['doc_page_content'] = htmlspecialchars_decode($hs['doc_page_content']);
$hs['site_content']     = hs_loadpage('merchant_terms/content');