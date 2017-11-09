SELECT c.customer_id,c.business_address,c.credit_rating, c.customer_type,c.station,c.had_account, u.user_name,u.user_phone, u.user_address,u.user_sex,u.user_img, u.user_id, IFNULL(u.user_birthday,"") user_birthday 
FROM customer c 
INNER JOIN user_view u 
ON u.user_id = c.user_id
 WHERE c.my_team_id = '10001' 
 AND c.promoter_id = ''
 AND c.merchandiser_id = ? 
 LIMIT ?,?