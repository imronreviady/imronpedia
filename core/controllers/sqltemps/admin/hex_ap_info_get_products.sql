SELECT 
	prod.`id`,
	prod.`poster`, 
	prod.`thumb`, 
	prod.`name`,
	prod.`reg_price`,
	prod.`sale_price`,
	prod.`sold` as sales,
	prod.`activity_status`,
	prod.`variation_type`,
	prod.`approved`,
	prod.`time`,

	(SELECT COUNT('*') FROM `{%t_pvars%}` WHERE `activity_status` = 'active' AND `status` = 'active' AND `prod_id` = prod.`id`) AS variations

	FROM `{%t_prods%}` prod
	
	WHERE prod.`activity_status` = 'active'

	AND prod.`status` IN ('active','inactive','blocked') 

	AND prod.`editing_stage` = 'saved'

	{%if offset%}		
		{%if offset_to == 'gt'%}
			AND prod.`id` > {%offset%}
		{%endif%}	

		{%if offset_to == 'lt'%}
			AND prod.`id` < {%offset%}
		{%endif%}
	{%endif%}

	{%if keyword%}
		AND prod.`name` LIKE '%{%keyword%}%'
	{%endif%}

	ORDER BY prod.`id` {%order%} 

{%if limit%}	
	LIMIT {%limit%}
{%endif%}