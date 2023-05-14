SELECT * FROM(

	SELECT * FROM `{%t_msgs%}` 

		WHERE ((`sent_by` = {%sent_by%} AND `sent_to` = {%sent_to%} AND `deleted_fs1` = 'N') OR (`sent_to` = {%sent_by%} AND `sent_by` = {%sent_to%} AND `deleted_fs2` = 'N'))

		{%if offset%} 
			{%if offset_to == 'gt'%}
				AND `id` >  {%offset%} 
			{%endif%}

			{%if offset_to == 'lt'%}
				AND `id` <  {%offset%} 
			{%endif%}
		{%endif%}

		{%if new%}
			AND `seen` = 0 
		{%endif%}

	ORDER BY `id` {%order_in%} LIMIT {%limit%}

) tw ORDER BY `id` {%order_out%};

