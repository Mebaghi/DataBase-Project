create view avg_score as
select * 
from team_members
where team_id in (
	select team_id 
	from co_team
	where score > (
		select avg(score)
		from co_team
	)
)