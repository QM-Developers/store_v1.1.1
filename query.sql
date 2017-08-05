SELECT gd.goods_id,gd.goods_name,gd.goods_sales,imgsp.image_path,
  (SELECT COUNT(0) FROM goodsinfo gd WHERE gd.goods_type_id = '0b49ef854bb74ff9b9317132dba053d7') count,
  (SELECT gs.standard_price FROM goods_standard gs WHERE gs.goods_id = gd.goods_id ORDER BY standard_price LIMIT 0,1) price
FROM goodsinfo gd
INNER JOIN goods_image img
ON img.goods_id = gd.goods_id
INNER JOIN image_space imgsp
ON imgsp.image_id = img.image_id
WHERE img.goods_img_type = 1 AND gd.goods_type_id = '0b49ef854bb74ff9b9317132dba053d7'
LIMIT 0,10
;