<?php 
$hs['resend_ace_status'] = hs_session('resend_ace_status');

if ($hs['resend_ace_status'] == true) {
	hs_session_unset('resend_ace_status');
}

echo hs_server_message("stop/account_inactive");
exit();