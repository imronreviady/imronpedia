<?php
if (empty($hs['is_logged'])) {
	hs_redirect('auth');
}

$hs['page_title']   = sprintf('F.A.Q - %s',$hs['config']['name']);
$hs['page_desc']    = $hs['config']['description'];
$hs['page_kw']      = $hs['config']['keywords'];
$hs['pn']           = 'help';
$hs['header_st']    = true;
$hs['site_content'] = hs_loadpage('help/content');