<?php
if (empty($hs['is_logged'])) {
	hs_redirect('auth');
}

$hs['page_title']   =  $hs['config']['title'];
$hs['page_desc']    =  $hs['config']['description'];
$hs['page_kw']      =  $hs['config']['keywords'];
$hs['pn']           =  'home';
$hs['header_st']    =  true;
$hs['prods']        =  hs_get_products(array(
	'limit'         => 40,
	'approved'      => true,
	'nf_dgt'        => 0,
));

$hs['prods']        = ((not_empty($hs['prods'])) ? $hs['prods'] : array());
$hs['ghosts']       = ((count($hs['prods']) < 10) ? range(1, (10 - count($hs['prods']))) : array());;
$hs['site_content'] = hs_loadpage('home/content');