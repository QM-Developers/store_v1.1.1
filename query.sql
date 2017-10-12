SELECT branch_id
FROM qm_branch
WHERE my_team_id = '10001'
AND branch_type = 1
LIMIT 1
;