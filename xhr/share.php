<?php 
if($action == 'get_prods') {
	$data['status'] = 404;
	$html_arr       = array();

	if (is_number($_GET['offset'])) {
		$offset      = intval($_GET['offset']);
		$hs['prods'] = hs_get_preview_products(array('offset' => $offset));
		if (not_empty($hs['prods'])) {
			foreach ($hs['prods'] as $hs['prod_item']) {
				array_push($html_arr, hs_loadpage('share/includes/prod_item'));
			}

			$data['status'] = 200;
			$data['html']   = implode('', $html_arr);
		}
	}
}