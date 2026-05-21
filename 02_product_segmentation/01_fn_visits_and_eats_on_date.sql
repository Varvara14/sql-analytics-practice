create or replace function fnc_person_visits_and_eats_on_date(
	pperson varchar default 'Dmitriy',
	pprice numeric default 500,
	pdate date default '2022-01-08')
returns table (
	pizzeria_name varchar) 
as $$ 
begin 
	return query 
	select distinct pz.name
	from person_visits pv 
	join person p on p.id = pv.person_id 
	join pizzeria pz on pz.id = pv.pizzeria_id 
	where p.name = pperson 
	and pv.visit_date = pdate
	and exists (
		select 1
		from menu m 
		where m.price < pprice and m.pizzeria_id = pz.id);
end;
$$ language plpgsql;
