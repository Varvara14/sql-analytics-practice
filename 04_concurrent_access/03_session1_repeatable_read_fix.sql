-- Session #1
begin transaction isolation level repeatable read;

select *
from pizzeria 
where name = 'Pizza Hut';

update pizzeria 
set rating = 4 where name = 'Pizza Hut';

commit;

select *
from pizzeria 
where name = 'Pizza Hut';