<?php
if (empty($hs['is_admin'])) {
 	hs_redirect('404');
} 

$hs['pn']               = $store_page;
$hs['page_title']       = hs_translate('Terms of use - {%name%}',array('name' => $hs['config']['name']));
$hs['page_desc']        = $hs['config']['description'];
$hs['page_kw']          = $hs['config']['keywords'];
$hs['doc_page_content'] = hs_ap_info_get_static_page('doc_terms');
$hs['site_content']     = hs_loadpage("doc_terms/content");