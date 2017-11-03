SELECT u.user_id, u.user_name, u.user_phone,
u.user_img,u.user_area, u.token,
u.user_status,u.role_id,
u.my_team_id,u.team_department_id
FROM user_view u
WHERE 1 = 1
AND u.user_id = '03ef5797bae2466699d5efc970a8962f'
AND u.user_password = ''