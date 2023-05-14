<?php 
if ($action == 'delete_announcement') {
	if (is_number($_GET['annc_id'])) {
		$annc_id = intval($_GET['annc_id']);
		$db      = $db->where('id',$annc_id);
		$db      = $db->where('user_id',$me['id']);
		$delete  = $db->delete(T_ANNOUNC);
	}
}