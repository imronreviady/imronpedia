<?php 
$hs['pn']              = $store_page;
$hs['page_title']      = hs_translate('Administrator dashboard - {%name%}',array('name' => $hs['config']['name']));
$hs['page_desc']       = $hs['config']['description'];
$hs['page_kw']         = $hs['config']['keywords'];
$user_id               = $me['id'];
$hs['total_products']  = hs_ap_info_products_total();
$hs['total_merchants'] = hs_ap_info_get_total_merchants();
$hs['total_sales']     = hs_ap_info_sales_total();
$hs['total_users']     = hs_ap_info_users_total();
$hs['main_stats']      = hs_ap_info_yearly_main_stats();
$hs['site_content']    = hs_loadpage("dashboard/admin/content");
