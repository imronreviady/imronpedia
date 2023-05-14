<?php
if ($hs['is_logged'] == true) {
	hs_signout_user(); hs_redirect('auth');
}
else {
	hs_redirect('auth');
}