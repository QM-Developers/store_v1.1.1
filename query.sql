SELECT gi.goods_id, gi.goods_type_id, gi.goods_name,
gi.goods_attr, gi.goods_describe, gi.goods_standard,
gs.standard_id,gs.standard_name,gs.standard_price,
gs.standard_count,gs.standard_weight
FROM goodsinfo gi
LEFT JOIN goods_standard gs
ON gs.goods_id = gi.goods_id
WHERE gi.goods_id = ''

;

SELECT img.image_path,img.image_id
FROM goods_image gimg
LEFT JOIN image_space img
ON img.image_id = gimg.image_id
WHERE goods_id = '211de7c120a94e8d923a1032e363275e'
ORDER BY gimg.sort