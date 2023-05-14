<?php 
$ac_token = fetch_or_get($_GET['activation_token'],'none');

if ($ac_token == $me['em_code']) {
	hs_update_user_data($me['id'],array(
		'active'  => '1',
		'em_code' => sha1(time() + rand(111,999))
	));

	$insert_data    = array(
		'user_id'   => $me['id'],
		'title'     => 'Account activated successfully.',
		'message'   => 'Hi {%name%}! Your account has been successfully activated, thanks for your registration',
		'type'      => 'success',
		'static'    => 'N',
		'json_data' => json(array('name' => sprintf('<b>%s</b>',$me['name'])),true),
		'time'      => time()
	); $db->insert(T_ANNOUNC,$insert_data);

	hs_redirect('/');
}

else {
	header('Content-Type: application/json');
    echo json(array('status' => 400,"error" => 'Invalid account activation token'),1);
    exit();
}