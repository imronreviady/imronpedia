<?php
$hs['pn']             = $store_page;
$hs['page_title']     = hs_translate('Account settings - {%name%}',array('name' => $hs['me']['name']));
$hs['page_desc']      = $hs['config']['description'];
$hs['page_kw']        = $hs['config']['keywords'];
$hs['del_req_exists'] = hs_where_exists(T_ACC_DEL_REQS,array('user_id' => $me['id']));
$me['verif_status']   = hs_get_verif_status($me['id']);
$hs['site_content']   = hs_loadpage("main_settings/content");