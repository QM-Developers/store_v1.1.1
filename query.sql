        SELECT t1.user_id ,t1.user_name,t1.user_img
        FROM
        (SELECT u.user_id,u.user_name,u.my_team_id,
        u.team_department_id,u.user_img,u.role_id,
        qpr.permission_id
        FROM user u
        INNER JOIN position_permission_re ppr
        ON ppr.position_id = u.position_id
        INNER JOIN qm_permission_re qpr
        ON qpr.qm_permission_id = ppr.qm_permission_id
        UNION
        SELECT u.user_id,u.user_name,u.my_team_id,
        u.team_department_id,u.user_img,u.role_id,
        qpr.permission_id
        FROM user u
        INNER JOIN user_qm_permission_re uqpr
        ON uqpr.user_id = u.user_id
        INNER JOIN qm_permission_re qpr
        ON qpr.qm_permission_id = uqpr.qm_permission_id) t1
        WHERE t1.my_team_id = '10001'
        AND t1.permission_id = 'follow'
        AND role_id = '1003'
        AND t1.team_department_id NOT IN (
        SELECT department_id
        FROM qm_branch
        WHERE my_team_id = '10001'
        AND branch_type = 2)
        ;
        
        select * from user
        ;
        
        