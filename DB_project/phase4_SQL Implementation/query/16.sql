SELECT
    c.company_name,
    cm.company_role,
    cm.date_start,
    cc.birthdate,
    cc.education,
    cc.experience,
    cc.children_num,
    pn.phone_num
FROM company_manager cm
JOIN Company c ON cm.branch_id = c.branch_id
JOIN co_clerk cc ON cm.id = cc.id
LEFT JOIN phone_number pn ON cc.id = pn.id
WHERE cm.date_start > '2022-01-01'
ORDER BY cm.date_start DESC
LIMIT 10;