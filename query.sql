SELECT gd.goods_id,gd.goods_name, gd.goods_price,gd.goods_sales,gd.goods_attr,
  gd.goods_count,tof.template_default_price goods_freight,img.image_path goods_images,
  gs.standard_name,gs.standard_id,gs.standard_price,gs.standard_count
FROM dgg_store.goodsinfo gd
INNER JOIN dgg_store.template_of_freight tof
ON gd.template_freight_id = tof.template_freight_id
INNER JOIN dgg_store.goods_image gi
ON gi.goods_id = gd.goods_id
INNER JOIN dgg_store.image_space img
ON img.image_id = gi.image_id
LEFT JOIN dgg_store.goods_standard gs
ON gs.goods_id = gd.goods_id
;