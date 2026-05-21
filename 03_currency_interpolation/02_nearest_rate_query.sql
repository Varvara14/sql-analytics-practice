with currency_rates as (
	select 
		b.*,
		(select c.rate_to_usd
		from currency c 
		where c.id = b.currency_id and c.updated <= b.updated 
		order by c.updated desc 
		limit 1) as rate_before,
		(select c.rate_to_usd 
		from currency c
		where c.id = b.currency_id and c.updated > b.updated 
		order by c.updated asc 
		limit 1) as rate_after,
		(select c.name 
		from currency c 
		where c.id = b.currency_id 
		limit 1) as currency_name
	from balance b 
	where exists (select 1 from currency c where c.id = b.currency_id)
)
select 
	coalesce(u.name, 'not defined') as name, 
	coalesce(u.lastname, 'not defined') as lastname,
	currency_name,
	cr.money * coalesce(cr.rate_before, cr.rate_after) as currency_in_usd	
from currency_rates cr 
left join "user" u on u.id = cr.user_id 
order by 
	name desc,
	lastname asc, 
	currency_name asc;