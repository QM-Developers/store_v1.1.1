SELECT gd.goods_id,gd.goods_name,gd.goods_sales,imgsp.image_path,
          (SELECT MIN(gs.standard_price) FROM goods_standard gs WHERE gs.goods_id = gd.goods_id) goods_price
        FROM goodsinfo gd
        INNER JOIN goods_image img
        ON img.goods_id = gd.goods_id
        INNER JOIN image_space imgsp
        ON imgsp.image_id = img.image_id
        WHERE img.goods_img_type = 1
        AND gd.my_team_id = #{type.myTeamId}
        <if test="childType != null">
            AND gd.goods_type_id IN
            <foreach collection="childType" item="typeId" separator="," open="(" close=")" index="i">
                #{typeId}
            </foreach>
        </if>
        <if test="type.keyword != null and type.keyword != ''">
            AND gd.goods_name LIKE CONCAT('%', #{type.keyword}, '%')
        </if>
        <if test="type.orderBy != null and type.orderBy == 'goodsPrice'">
            <choose>
                <when test="type.sort != null and type.sort == 'desc'">
                    ORDER BY goods_price desc
                </when>
                <otherwise>
                    ORDER BY goods_price asc
                </otherwise>
            </choose>
        </if>
        <if test="type.orderBy != null and type.orderBy == 'goodsSales'">
            <choose>
                <when test="type.sort != null and type.sort == 'desc'">
                    ORDER BY gd.goods_sales desc
                </when>
                <otherwise>
                    ORDER BY gd.goods_sales asc
                </otherwise>
            </choose>
        </if>
        LIMIT #{pageNum},#{pageSize}