SELECT 

	{@ Notifications Data @}

	notif.`id`,
	notif.`notifier_id`,
	notif.`recipient_id`,
	notif.`subject`,
	notif.`message`,
	notif.`status`,
	notif.`url`,
	notif.`time`,

	{@ Notifier Data @}

	users.`avatar` as notifier_avatar,
	users.`verified` as notifier_verified,
	CONCAT(users.`fname`,' ',users.`lname`) as notifier_name

	FROM `{%t_notifs%}` notif

	INNER JOIN `{%t_users%}` users ON notif.`notifier_id` = users.`id`

	WHERE notif.`recipient_id` = {%recipient_id%}

	{%if offset%}
		AND notif.`id` < {%offset%}
	{%endif%}

	ORDER BY notif.`id` DESC

{%if limit%}
	LIMIT {%limit%}
{%endif%}