SELECT 

	por.`id`, 
	por.`user_id`, 
	por.`pp_link`, 
	por.`amount`, 
	por.`currency`, 
	por.`status`, 
	por.`time`,
	u.`username`,
	u.`avatar`,
	u.`verified`,
	u.`wallet` AS balance,
	CONCAT(u.`fname`, ' ',u.`lname`) AS full_name

	FROM `{%t_pouts%}` por 

	INNER JOIN `{%t_users%}` u ON por.`user_id` = u.`id`

	WHERE por.`id` > 0

	{%if offset%}		
		{%if offset_to == 'gt'%}
			AND por.`id` > {%offset%}
		{%endif%}	

		{%if offset_to == 'lt'%}
			AND por.`id` < {%offset%}
		{%endif%}
	{%endif%}

	{%if status%}		
		AND por.`status` = '{%status%}'
	{%endif%}

	ORDER BY por.`id` {%order%} 

{%if limit%}	
	LIMIT {%limit%}
{%endif%}