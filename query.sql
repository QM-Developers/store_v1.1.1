SELECT t1.user_id ,t1.user_name,t1.user_img
        FROM
        (SELECT u.user_id,u.user_name,u.my_team_id,
            u.team_department_id,u.user_img,
            qpr.permission_id
        FROM user u
        INNER JOIN position_permission_re ppr
        ON ppr.position_id = u.position_id
        INNER JOIN qm_permission_re qpr
        ON qpr.qm_permission_id = ppr.qm_permission_id
        UNION
        SELECT u.user_id,u.user_name,u.my_team_id,
            u.team_department_id,u.user_img,
            qpr.permission_id
        FROM user u
        INNER JOIN user_qm_permission_re uqpr
        ON uqpr.user_id = u.user_id
        INNER JOIN qm_permission_re qpr
        ON qpr.qm_permission_id = uqpr.qm_permission_id) t1
        LEFT JOIN qm_branch qb
        ON qb.department_id = t1.team_department_id
        WHERE t1.my_team_id = '10001'
        AND t1.permission_id = 'follow'
		AND t1.team_department_id = '4bc0ec2d68a444e7a584b9f8d03cbc44'
        AND qb.branch_type = 2
        ;
        
        select * from user
        ;