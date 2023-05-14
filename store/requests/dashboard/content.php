<?php
if ($me['admin'] == '1') {
 	require_once('admin/admin_dashboard.php');
} 

else {
	require_once('user/user_dashboard.php');
}