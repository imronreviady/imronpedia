SELECT 

	r.`id`, 
	r.`user_id`,
	r.`reason`,
	r.`message`,
	r.`time`,
	u.`avatar`,
	u.`email`,
	u.`username`,
	u.`verified`,
	u.`last_active` AS last_seen,
	CONCAT(u.`fname`,' ', u.`lname`) as full_name

	FROM `{%t_acc_rms%}` r 

	INNER JOIN `{%t_users%}` u ON r.`user_id` = u.`id`

	WHERE r.`id` > 0

	{%if ids%}	
		AND r.`id` IN ({%ids%})
	{%endif%}

	{%if offset%}		
		{%if offset_to == 'gt'%}
			AND r.`id` > {%offset%}
		{%endif%}	

		{%if offset_to == 'lt'%}
			AND r.`id` < {%offset%}
		{%endif%}
	{%endif%}

	ORDER BY r.`id` {%order%} 

{%if limit%}	
	LIMIT {%limit%}
{%endif%}