<?php 
if (empty($hs['is_logged'])) {
	hs_redirect("auth/login");
}

elseif ($hs['is_logged'] && $hs['me']['active'] == '1') {
	hs_redirect("/");
}

else {
	echo hs_server_message("stop/account_inactive");
    exit();
}