SELECT u.user_id,u.user_name,u.user_sex,
    u.user_phone,u.user_identity,u.team_department_id,
    u.position_id
    FROM user u
    ;
    
SELECT dp.position_id,dp.position_name
FROM department_position dp
WHERE dp.team_department_id = ''
;

select * from team_department
;

select * from department_position
;