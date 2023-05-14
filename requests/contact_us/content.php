<?php
if (empty($hs['is_logged'])) {
	hs_redirect('auth');
} 

$hs['page_title']   = hs_translate('Contact info of - {%name%}',array('name' => $hs['config']['name']));
$hs['page_desc']    = $hs['config']['description'];
$hs['page_kw']      = $hs['config']['keywords'];
$hs['pn']           = 'contact_us';
$hs['header_st']    = true;
$hs['site_content'] = hs_loadpage('contact_us/content');
