<?php 
hs_session('resend_ace_status',true);

$send_email_data   = array(
	'from_email'   => $hs['config']['email'],
	'from_name'    => $hs['config']['name'],
	'to_email'     => $me['email'],
	'to_name'      => $me['name'],
	'subject'      => hs_translate("Activate your account"),
	'charSet'      => 'UTF-8',
	'is_html'      => true,
	'message_body' => hs_loadpage('emails/activate_account', array(
		"name"     => $me['name'],
		"em_code"  => $me['em_code'],
	)),
); 

hs_send_mail($send_email_data);

hs_redirect('/');
