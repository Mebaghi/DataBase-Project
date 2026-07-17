SELECT 
    c.company_name, 
    cm.company_role, 
    cm.date_start, 
    count(t.team_id) as num_teams, 
    sum(t.member_num) as total_team_members, 
    avg(t.score) as avg_team_score
FROM Company c
JOIN company_manager cm ON c.branch_id = cm.branch_id
LEFT JOIN Co_Team t ON c.branch_id = t.proj_id
WHERE c.company_name LIKE '%Corp%'
GROUP BY c.company_name, cm.company_role, cm.date_start
ORDER BY num_teams DESC
LIMIT 5;