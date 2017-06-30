SELECT u.user_id,u.user_name,u.user_sex,u.user_phone,dt_state.dict_name user_status,cg.customer_group_name 
FROM customer c 
INNER JOIN customer_group cg 
ON cg.customer_group_id = c.customer_group_id 
INNER JOIN user u 
ON u.user_id = c.user_id 
INNER JOIN dictionary dt_sex 
ON dt_sex.dict_code = u.user_sex 
INNER JOIN dictionary dt_state 
ON dt_state.dict_code = u.user_status 
WHERE cg.customer_group_id = 'c_g_0'
AND c.promoter_id = '89d9317fb3834353bcf2a507bee2eb82'
UNION 
SELECT u.user_id,u.user_name,u.user_sex,u.user_phone,dt_state.dict_name user_status,cg.customer_group_name 
FROM customer c 
INNER JOIN customer_group cg 
ON cg.customer_group_id = c.customer_group_id 
INNER JOIN user_record u 
ON u.user_id = c.user_id 
INNER JOIN dictionary dt_state 
ON dt_state.dict_code = u.user_status 
WHERE cg.customer_group_id = 'c_g_0'
AND c.promoter_id = '89d9317fb3834353bcf2a507bee2eb82'
;