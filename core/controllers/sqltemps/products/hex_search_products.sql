SELECT 
	prod.`id`,
	prod.`name` AS query

	FROM `{%t_prods%}` prod
	
	WHERE prod.`activity_status` = 'active'

	AND prod.`status` = 'active'

	AND prod.`approved` = 'Y'

	AND prod.`editing_stage` = 'saved'

	AND (prod.`name` LIKE '{%keyword%}%' OR prod.`name` LIKE '%{%keyword%}%' OR prod.`name` LIKE '%{%keyword%}' ) 

{%if limit%}	
	LIMIT {%limit%}
{%endif%}