SELECT u.user_id,u.user_name,u.user_sex,
	u.user_phone,u.user_identity,u.user_img,
	mt.my_team_name,
	td.team_department_name,
	dp.position_name
FROM user u
INNER JOIN my_team mt
ON mt.my_team_id = u.my_team_id
INNER JOIN team_department td
ON td.team_department_id = u.team_department_id
INNER JOIN department_position dp
ON dp.position_id = u.position_id
WHERE 1 = 1
AND u.my_team_id = '10001'