create view avg_experience as
select * 
from co_clerk
where experience > 
(
	select avg(experience)
    from co_clerk
    
);