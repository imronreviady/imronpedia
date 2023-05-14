<?php
$hs['pn']            = $store_page;
$hs['page_title']    = hs_translate('Account reviews - {%name%}',array('name' => $hs['config']['name']));
$hs['page_desc']     = $hs['config']['description'];
$hs['page_kw']       = $hs['config']['keywords'];
$hs['reviews']       = hs_get_account_reviews(array('user_id' => $me['id'],'limit' => 10,'media' => true));
$hs['reviews_total'] = hs_get_account_reviews_total($me['id']);
$hs['site_content']  = hs_loadpage("account_reviews/content");