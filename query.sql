SELECT gd.goods_id,gd.goods_name,gd.goods_sales,imgsp.image_path,
(SELECT MIN(gs.standard_price) FROM goods_standard gs WHERE gs.goods_id = gd.goods_id) 
goods_price 
FROM goodsinfo gd 
INNER JOIN goods_image img 
ON img.goods_id = gd.goods_id 
INNER JOIN image_space imgsp 
ON imgsp.image_id = img.image_id 
WHERE img.goods_img_type = 1 
AND gd.my_team_id = '10001' ORDER BY goods_price desc
LIMIT 0,10
;