select 
	p.name as name,
	m.pizza_name as pizza_name,
	m.price as price,
	m.price - m.price * (pd.discount/100) as discount_price,
	pz.name as pizzeria_name
from person_order po
join menu m on po.menu_id = m.id 
join person_discounts pd on pd.person_id = po.person_id 
join person p on p.id = po.person_id 
join pizzeria pz on m.pizzeria_id = pz.id
order by 1, 2;