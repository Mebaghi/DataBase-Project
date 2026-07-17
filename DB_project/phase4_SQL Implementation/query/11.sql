select * 
from co_team
where team_id in(
	select date_start
    from team_manager
    where id =2013

)
