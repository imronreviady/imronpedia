<?php
$hs['pn']           = $store_page;
$hs['page_title']   = hs_translate('My orders - {%name%}',array('name' => $hs['me']['name']));
$hs['page_desc']    = $hs['config']['description'];
$hs['page_kw']      = $hs['config']['keywords'];
$hs['myorders']     = hs_get_my_orders(array('limit' => 10,'order' => 'DESC'));
$hs['site_content'] = hs_loadpage("my_orders/content");