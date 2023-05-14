SELECT 

	u.`id`, 
	u.`email`,
	u.`avatar`,
	u.`active`,
	u.`last_active`,
	u.`username`,
	u.`verified`,
	u.`country_id`,
	u.`ipv4_address`,
	CONCAT(u.`fname`,' ', u.`lname`) as full_name

	FROM `{%t_users%}` u 

	WHERE u.`active` IN ('1','2')

	{%if offset%}		
		{%if offset_to == 'gt'%}
			AND u.`id` > {%offset%}
		{%endif%}	

		{%if offset_to == 'lt'%}
			AND u.`id` < {%offset%}
		{%endif%}
	{%endif%}

	{%if keyword%}
		AND (u.`fname` LIKE '%{%keyword%}%' OR u.`lname` LIKE '%{%keyword%}%' OR CONCAT(u.`fname`,' ',u.`lname`) LIKE '%{%keyword%}%')
	{%endif%}

	ORDER BY u.`id` {%order%} 

{%if limit%}	
	LIMIT {%limit%}
{%endif%}