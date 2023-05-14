SELECT 

	COUNT(basket.`id`) AS total_items

	FROM `{%t_basket%}` basket 

	INNER JOIN `{%t_prods%}` prods ON basket.`prod_id` = prods.`id`

	WHERE basket.`user_id` = {%user_id%} AND prods.`activity_status` = 'active' AND prods.`status` = 'active' AND prods.`approved` = 'Y' AND prods.`editing_stage` = 'saved';