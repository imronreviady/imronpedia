SELECT 
	prod.`id`,
	prod.`poster`, 
	prod.`name`,
	prod.`reg_price`,
	prod.`sale_price`,
	prod.`rating`,
	prod.`sold` as sales

	FROM `{%t_prods%}` prod
	
	WHERE prod.`activity_status` = 'active'

	AND prod.`status` = 'active'

	AND prod.`editing_stage` = 'saved'

	AND prod.`approved` = 'Y'

	{%if offset%}		
		AND prod.`id` < {%offset%}
	{%endif%}

	ORDER BY prod.`id` DESC, prod.`sold` DESC

{%if limit%}	
	LIMIT {%limit%}
{%endif%}