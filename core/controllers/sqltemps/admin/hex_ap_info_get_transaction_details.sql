SELECT 

	trans.`id`, 
	trans.`seller_id`, 
	trans.`buyer_id`, 
	trans.`amount`, 
	trans.`order_id`, 
	trans.`prod_id`, 
	trans.`status`, 
	trans.`method`, 
	trans.`stripe_pid`, 
	trans.`paypal_pid`, 
	trans.`wallet_pid`, 
	trans.`market_rate`, 
	trans.`market_rate`, 
	trans.`time`, 
	seller.`avatar` AS seller_avatar,
	seller.`username` AS seller_uname,
	buyer.`username` AS buyer_uname,
	buyer.`email` AS buyer_email,
	buyer.`avatar` AS buyer_avatar,
	prods.`name` AS prod_name,

	CONCAT(seller.`fname`, ' ',seller.`lname`) AS seller_name,
	CONCAT(buyer.`fname`, ' ',buyer.`lname`) AS buyer_name

	FROM `{%t_couts%}` trans 

	INNER JOIN `{%t_users%}` seller ON trans.`seller_id` = seller.`id`

	INNER JOIN `{%t_users%}` buyer ON trans.`buyer_id` = buyer.`id`

	INNER JOIN `{%t_prods%}` prods ON trans.`prod_id` = prods.`id`

	WHERE trans.`id` = {%trans_id%}

LIMIT 1;