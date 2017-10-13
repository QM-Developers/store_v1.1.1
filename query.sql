SELECT COUNT(0)
FROM user_qm_permission_re uqpr
INNER JOIN qm_permission_re qp
ON qp.qm_permission_id = uqpr.qm_permission_id
INNER JOIN permission p
ON p.permission_id = qp.permission_id
WHERE user_id = '528832fa9cc54d0290f6ee2922b27256'
AND p.permission_url = '/s/updateSalesmanPass.action'
;

    SELECT user_id approver_id,user_name approver_name
    FROM
    (SELECT u.user_id,u.user_name,u.my_team_id,qpr.permission_id
    FROM user u
    INNER JOIN position_permission_re ppr
    ON ppr.position_id = u.position_id
    INNER JOIN qm_permission_re qpr
    ON qpr.qm_permission_id = ppr.qm_permission_id
    UNION
    SELECT u.user_id,u.user_name,u.my_team_id,qpr.permission_id
    FROM user u
    INNER JOIN user_qm_permission_re uqpr
    ON uqpr.user_id = u.user_id
    INNER JOIN qm_permission_re qpr
    ON qpr.qm_permission_id = uqpr.qm_permission_id) t1

;

SELECT COUNT(0)
FROM permission p
INNER JOIN qm_permission_re qpr
ON p.permission_id = qpr.permission_id
INNER JOIN user_qm_permission_re uqpr
ON uqpr.qm_permission_id = qpr.qm_permission_id
INNER JOIN user u
ON u.user_id = uqpr.user_id
WHERE u.user_id = '528832fa9cc54d0290f6ee2922b27256'
AND p.permission_url = '/s/updateSalesmanPass.action'
;