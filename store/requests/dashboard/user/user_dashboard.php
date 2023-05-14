<?php 
$hs['pn']              =  $store_page;
$hs['page_title']      =  hs_translate('Control panel dashboard - {%name%}',array('name' => $hs['config']['name']));
$hs['page_desc']       =  $hs['config']['description'];
$hs['page_kw']         =  $hs['config']['keywords'];

$user_id               =  $me['id'];
$hs['total_products']  =  hs_get_products_total($user_id);
$hs['total_new_ords']  =  hs_get_orders_total($user_id,'pending');
$hs['total_customers'] =  hs_get_customers_total($user_id);
$hs['weekly_stats']    =  hs_store_weekly_stats($user_id);

$hs['site_content']    = hs_loadpage("dashboard/user/content");