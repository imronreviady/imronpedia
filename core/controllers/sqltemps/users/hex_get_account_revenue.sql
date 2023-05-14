SELECT 
	
	{@ Checkout Transaction Info @}

	ct.`id`,
	ct.`amount`,
	ct.`time`

	FROM `{%t_trans%}` ct

	WHERE ct.`seller_id` = {%account_id%}

	{%if date%}
		AND ct.`time` >= '{%date%}'
	{%endif%}