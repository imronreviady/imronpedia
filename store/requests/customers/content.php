<?php
$hs['pn']              = $store_page;
$hs['page_title']      = hs_translate('Store customer');
$hs['page_desc']       = $hs['config']['description'];
$hs['page_kw']         = $hs['config']['keywords'];
$hs['store_customers'] = hs_get_store_customers(array('seller_id' => $me['id'],'limit' => 10));
$hs['site_content']    = hs_loadpage("customers/content");
