drop database store_v1_1_1;
create database store_v1_1_1 charset="utf8";
use store_v1_1_1;

/*==============================================================*/
/* 客户信息表
/*==============================================================*/
drop table if exists customer;
create table customer
(
   customer_id         varchar(35) not null primary key,   -- 客户Id
   customer_type        varchar(20) not null default '',   -- 客户类型
   user_id   varchar(35) not null default '',   -- 客户指向的用户Id
   promoter_id         varchar(35) not null default '',   -- 业务员Id
   merchandiser_id varchar(35) not null default '',   -- 跟单员Id
   my_team_id          varchar(35) not null default '',   -- 企业码
   business_address      varchar(50) not null default '',   -- 经营地址
   station   varchar(20) not null default '',   -- 从事岗位
   credit_rating      tinyint not null default 0,   -- 客户评级
   had_account tinyint not null default 0,   -- 是否建账 0为未建账 1为已建账 2账号被冻结
   update_date datetime,   -- 更新时间
   update_count int not null default 0   -- 更新次数
);

/*==============================================================*/
/* 客户跟进表
/*==============================================================*/
drop table if exists customer_follow;
create table customer_follow
(
   follow_id   varchar(35) not null primary key,   -- 跟进Id
   follow_title varchar(50) not null,   -- 跟进标题
   follow_date datetime not null,   -- 跟进时间
   follow_content text,   -- 跟进内容
   follow_result text,   -- 跟进结果
   customer_id         varchar(35) not null,   -- 客户Id
   customer_name   varchar(20) not null,   -- 客户姓名
   promoter_id         varchar(35) not null,   -- 业务员Id
   promoter_name   varchar(20) not null   -- 业务员姓名
);

/*==============================================================*/
/* 申请协助表
/*==============================================================*/
drop table if exists customer_assist;
create table customer_assist
(
   assist_id   varchar(35) not null primary key,   -- 申请Id
   assist_title varchar(100) not null default '',   -- 申请标题
   assist_reason varchar(255) not null default '',   -- 申请原因
   user_id   varchar(35) not null,   -- 申请人Id
   user_name   varchar(20) not null,   -- 申请人姓名
   create_date datetime   -- 申请时间
);

/*==============================================================*/
/* 协助关联客户表
/*==============================================================*/
drop table if exists customer_assist_customer;
create table customer_assist_customer
(
   assist_id   varchar(35) not null,   -- 申请Id
   customer_id varchar(35) not null,   -- 客户Id
   customer_name varchar(20) not null   -- 客户名称
);

/*==============================================================*/
/* 协助者关联表
/*==============================================================*/
drop table if exists customer_assist_user;
create table customer_assist_user
(
   assist_id   varchar(35) not null,   -- 申请Id
   assist_result text,   -- 协助结果
   user_id varchar(35) not null,   -- 协助者用户Id
   user_name varchar(20) not null,   -- 协助者名称
   department_name varchar(20) not null   -- 部门名称
);

/*==============================================================*/
/* 协助关联图片表
/*==============================================================*/
drop table if exists customer_assist_image;
create table customer_assist_image
(
   image_id varchar(35) not null primary key,   -- 图片Id
   image_path text,
   assist_id   varchar(35) not null   -- 申请Id
);

/*==============================================================*/
/* 客户库存类型
/*==============================================================*/
drop table if exists customer_repertory;
create table customer_repertory
(
   customer_type        varchar(20) not null default '',   -- 客户类型
   my_team_id          varchar(35) not null default '',   -- 企业码
   repertory_type       tinyint not null default 0   -- 库存类型 0 为未分配, 1 为一级, 2 为二级
);

/*==============================================================*/
/* 农户信息表
/*==============================================================*/
drop table if exists farmer;
create table farmer
(
   farmer_id varchar(35) not null primary key,   -- 农户Id
   customer_id varchar(35) not null default '',   -- 客户Id
   farmer_name varchar(20) not null default '',   -- 农户名称
   farmer_phone varchar(20) not null default ''   -- 农户电话
);

/*==============================================================*/
/* 经营单位
/*==============================================================*/
drop table if exists manage_unit;
create table manage_unit
(
   manage_id varchar(35) not null primary key,   -- 经营单位Id
   customer_id varchar(35) not null default '',   -- 客户Id
   manage_name varchar(20) not null default '',   -- 经营单位名称
   manage_type varchar(200),   -- 经营类目
   manage_address varchar(50) not null default '',   -- 经营地址
   manage_acreage int not null default 0   -- 经营面积
);

/*==============================================================*/
/* 客户场地信息
/*==============================================================*/
drop table if exists user_place;
create table user_place
(
   user_place_id        varchar(35) not null,   -- id
   customer_id              varchar(35) not null default '',   -- 客户 id
   user_place_name      varchar(20) not null default '',   -- 名称
   user_place_acreage   int not null default 0,   -- 面积
   user_employee_num    int not null default 0,   -- 工人数量
   user_owner_num    int not null default 0,   -- 权属人数
   user_already_use int not null default 0,   -- 使用情况
   user_place_address   varchar(50) not null default '',   -- 地址
   user_place_area      varchar(50) not null default '',   -- 区域
   user_place_type      varchar(15) not null default '',   -- 区域性质
   create_date         datetime not null default now(),   -- 创建时间
   is_deleted           tinyint not null default 0,
   delete_date          date,
   primary key (user_place_id)
);

/*==============================================================*/
/* 场地图片
/*==============================================================*/
drop table if exists place_image;
create table place_image
(
   img_id varchar(35) not null primary key,   -- 图片 Id
    img_type tinyint not null default 0,   -- 图片类型 1为场地证明，2为场地环境
    img_url text,   -- 图片物理地址
    user_place_id varchar(35) not null default '' -- 场地Id
);

/*==============================================================*/
/* 养殖类型
/*==============================================================*/
drop table if exists user_breed;
create table user_breed
(
   breed_id varchar(35) not null primary key,   -- 养殖 id
   breed_category varchar(30) not null default '', -- 养殖类目
   breed_variety varchar(30) not null default '', -- 品种
   breed_type varchar(30) not null default '', -- 类型
   male_num int not null default 0,   -- 公体数量
   female_num int not null default 0,   -- 母体数量
   obstetric_table_num int not null default 0,   -- 产床数量
   shed_num int not null default 0,   -- 栏舍数量
   empty_shed_num int not null default 0,   -- 空栏数量
   competitive_brand varchar(50) not null default '',   -- 竞争品牌
   livestock_num int not null default 0,   -- 存栏数量
   user_place_id        varchar(35) not null,   -- 场地 id
   breed_age int not null default 0, -- 养殖年限
   breed_scale int not null default 0,   -- 养殖规模
   create_date         datetime not null default now(),
   json text
);

/*==============================================================*/
/* 客户建账申请
/*==============================================================*/
drop table if exists customer_account_request;
create table customer_account_request
(
   request_id varchar(35) not null primary key,   -- 申请Id
   proposer_id varchar(35) not null,   -- 申请人Id
   proposer_name varchar(20) not null,   -- 申请人名称
   customer_id varchar(35) not null,   -- 客户Id
   customer_name varchar(20) not null,   -- 客户名称
   merchandiser_id varchar(35) not null,   -- 跟单Id
   merchandiser_name varchar(20) not null,   -- 跟单名称
   checker_id varchar(35) not null,   -- 审核员Id
   checker_name varchar(20) not null,   -- 审核员名称
   request_status tinyint not null,   -- 申请状态
   create_date datetime not null, -- 申请时间
   request_reason varchar(255) not null default ''   -- 申请事由
);

/*==============================================================*/
/* 数据字典
/*==============================================================*/
drop table if exists dictionary;
create table dictionary
(
   dict_id              varchar(35) not null,
   par_dict_id          varchar(35) not null default '',
   dict_name            varchar(50) not null default '',
   dict_code            varchar(50) not null default '',
   dict_create_date     datetime not null default now(),
   sort                 varchar(2) not null default '',
   primary key (dict_id)
);
-- INSERT INTO `dictionary` VALUES ('12bb04a1451b44d38f64d40d4029ea49','b3a5fa19c94d4a18b5b6c75ce8d3c828','次图','2','2017-05-17 15:55:08',''),('175c2264f2d2464fad0bc07f217ac567','ca970ab6c3d847b0b14cc6cd64ea253c','用户已建档','u_st_0','2017-05-17 15:55:08',''),('28871be938c9472d9a99a3342e227bfe','9fb5903640b340b795bc68481f1b48e3','经销商','c_g_1','2017-05-17 15:55:08',''),('33fd90a31c064873a7508adbd4ae46db','58c359e4f354459aa2d9692a50ca3e19','是','1','2017-05-17 15:55:08',''),('45f9b5362c0a41aeb6ecb484d26f2c48','ca970ab6c3d847b0b14cc6cd64ea253c','用户已建账','u_st_1','2017-05-17 15:55:08',''),('634ea0fb1c8043778b8f4d8b44b8cd10','9fb5903640b340b795bc68481f1b48e3','个体户','c_g_0','2017-05-17 15:55:08',''),('65541ff2799c49b59c32cd2b66ef5541','ca970ab6c3d847b0b14cc6cd64ea253c','用户已注册','u_st_2','2017-05-17 15:55:08',''),('6c2c760b10b64761bdbb46305067ab29','58c359e4f354459aa2d9692a50ca3e19','否','0','2017-05-17 15:55:08',''),('7e9388e1f649414dbf6940936c60f02b','9fb5903640b340b795bc68481f1b48e3','合作农户','c_g_2','2017-05-17 15:55:08',''),('9534f55deb734b04ada9c76d62fdf3e5','297ebc9fd0f640fca9f04c8fc067414e','选择','in_t_1','2017-05-17 15:55:08',''),('9e412dd707894b65be0752433e844b8c','297ebc9fd0f640fca9f04c8fc067414e','填写选择','in_t_2','2017-05-17 15:55:08',''),('b4fdcec2900b4a81afaf01a169ea453d','b3a5fa19c94d4a18b5b6c75ce8d3c828','主图','1','2017-05-17 15:55:08',''),('bb19f4c64e794ce3b9e5497e8503a2e5','7c91ff9e7e3b47a7ba42b4d4ea78ab5a','到付','pyment_method_1','2017-05-17 16:11:15',''),('bf2802c959a849e8b11a09aef0780361','7358aa8f92bd43dfb8e9472a7a4c74f5','审核通过','order_st_1','2017-05-17 16:11:04',''),('c561957680244ba1b87db8328f118838','7c91ff9e7e3b47a7ba42b4d4ea78ab5a','月结','pyment_method_0','2017-05-17 16:11:15',''),('d625f0d0abb242b2938cc7a8e69cefbe','7358aa8f92bd43dfb8e9472a7a4c74f5','正在审核','order_st_0','2017-05-17 16:11:04',''),('d8a71b2531654d80a97d50f458f2769b','297ebc9fd0f640fca9f04c8fc067414e','填写','in_t_0','2017-05-17 15:55:08',''),('e9f418217062471ca709630a59756974','7c91ff9e7e3b47a7ba42b4d4ea78ab5a','已付款','pyment_method_2','2017-05-17 16:11:15',''),('f1845e466d9a42b695ac0f5334634cb2','9fb5903640b340b795bc68481f1b48e3','合作社','c_g_3','2017-05-17 15:55:08','');

/*==============================================================*/
/* 好友信息表
/*==============================================================*/
drop table if exists friend;
create table friend
(
   friend_id         varchar(35) not null primary key,
   user_id              varchar(35) not null default '',
   friend_user_id       varchar(35) not null default '',
   friend_origin        varchar(10) not null default '',
   friend_remark_name   varchar(20) not null default '',
   friend_remark_text   varchar(200) not null default ''
);

/*==============================================================*/
/* 好友申请表
/*==============================================================*/
drop table if exists friend_request;
create table friend_request
(
   request_id varchar(35) not null primary key,
   user_id varchar(35) not null default '',
   friend_id varchar(35) not null default '',
   friend_origin        varchar(10) not null default '',
   request_info varchar(20) not null default '',
   request_state varchar(10) not null default '',
   is_read tinyint not null default 0,
   is_received tinyint not null default 0,
    create_date datetime not null default now()
);

/*==============================================================*/
/* 聊天记录
/*==============================================================*/
drop table if exists chat_history;
create table chat_history
(
   history_id varchar(35) not null primary key,
    send_user_id varchar(35) not null default '',
    receive_user_id varchar(35) not null default '',
    data_type int not null default 0,
    send_data text,
    send_time varchar(15) not null default '',
    is_read tinyint not null default 0,
    is_received tinyint not null default 0
);

/*==============================================================*/
/* 商品图片
/*==============================================================*/
drop table if exists goods_image;
create table goods_image
(
   goods_id             varchar(35) not null default '',
   image_id             varchar(35) not null default '',
   sort                 varchar(2) not null default '',
   goods_img_type       tinyint not null default 0
);

/*==============================================================*/
/* 商品规格
/*==============================================================*/
drop table if exists goods_standard;
create table goods_standard
(
   standard_id          varchar(35) not null,
   goods_id             varchar(35) not null default '',
   standard_name        varchar(20) not null default '',
   standard_price       float not null default 0,
   standard_count       int not null default 0,
   primary key (standard_id)
);

/*==============================================================*/
/* 商品类目属性
/*==============================================================*/
create table goods_type_attr
(
   goods_type_attr_id   varchar(35) not null,
   goods_type_id        varchar(35) not null default '',
   goods_type_attr_name varchar(50) not null default '',
   goods_type_attr_value varchar(30) not null default '',
   goods_type_attr_const tinyint not null default 0,
   goods_type_attr_input_type varchar(10) not null default '',
   is_deleted           tinyint not null default 0,
   delete_date          datetime,
   primary key (goods_type_attr_id)
);

/*==============================================================*/
/* 商品类目信息
/*==============================================================*/
create table goods_typeinfo
(
   goods_type_id        varchar(35) not null,
   goods_type_name      varchar(20) not null default '',
   goods_type_pid       varchar(35) not null default '0',
   is_deleted           tinyint not null default 0,
   delete_date          date,
   primary key (goods_type_id)
);

/*==============================================================*/
/* 商品信息
/*==============================================================*/
drop table if exists goodsinfo;
create table goodsinfo
(
   goods_id             varchar(35) not null,   -- 商品Id
   goods_type_id        varchar(35) not null default '',   -- 商品类目Id
   my_team_id           varchar(35) not null default '',   -- 企业码
   template_freight_id  varchar(35) not null default '',   -- 运费模板Id
   goods_name           varchar(60) not null default '',   -- 商品名称
   goods_code varchar(20) not null default '',   -- 商品编码
   goods_price          float not null default 0,   -- 商品价格
   goods_count          int not null default 0,   -- 商品总数
   goods_attr           text,   -- 商品属性
   goods_describe       text,   -- 商品描述
   goods_standard       text,   -- 商品规格
   goods_freight        int not null default 0,   -- 运费
   goods_sales         int not null default 0,   -- 销量
   goods_create_date    datetime not null default now(),   -- 发布时间
   is_deleted           tinyint not null default 0,   -- 是否删除
   delete_date          datetime,   -- 删除时间
   primary key (goods_id)
);

/*==============================================================*/
/* 图片空间
/*==============================================================*/
create table image_space
(
   image_id             varchar(35) not null,
   my_team_id           varchar(35) not null default '',
   image_path           varchar(150) not null default '',
   primary key (image_id)
);

/*==============================================================*/
/* 系统菜单
/*==============================================================*/
create table menu
(
   menu_id              int not null,
   menu_name            varchar(20) not null default '',
   menu_url             varchar(100) not null default '',
   menu_pid             int not null default 0,
   menu_icon            varchar(15) not null default '',
   menu_isHeader        tinyint not null default 0,
   sort                 tinyint not null default 1,
   is_deleted           tinyint not null default 0,
   delete_date          datetime,
   primary key (menu_id)
);
-- INSERT INTO `menu` VALUES (1,'我的客户','/pages/customer/group.jsp',0,'',0,1,0,NULL),(2,'商城','',0,'',0,2,0,NULL),(3,'类目管理','/pages/mall/type/type.jsp',2,'',0,1,0,NULL),(4,'我的好友','/pages/friend/friend.jsp',0,'',0,1,0,NULL),(5,'添加商品','/pages/mall/goods/typeSelect.jsp',2,'',0,1,0,NULL),(7,'我的团队','/pages/team/team.jsp',0,'',0,1,0,NULL),(8,'系统菜单','',0,'',0,2,0,NULL),(9,'数据字典','/pages/dictionary/dictionary.jsp',8,'',0,1,0,NULL),(10,'商品管理','/pages/mall/goods/goodsManage.jsp',2,'',0,1,0,NULL);

/*==============================================================*/
/* 我的订单
/*==============================================================*/
drop table if exists my_order;
create table my_order
(
   order_id varchar(35) not null primary key,   -- 订单Id
   order_status tinyint not null default 0,    -- 订单状态
   order_status_before tinyint,   -- 订单状态保存
   order_number varchar(10) not null,   -- 订单号
   user_id varchar(35) not null default '',   -- 用户Id
   user_name varchar(20) not null,   -- 用户姓名
   my_team_id varchar(35) not null,   -- 企业码
   seller_message varchar(150) not null default '',   -- 卖家留言
   buyer_message varchar(150) not null default '',   -- 买家留言
   refund_message varchar(150),   -- 退货理由
   freight float not null default 0,   -- 运费
   payment_type tinyint not null default 0,   -- 支付方式
   payment_status tinyint not null default 0,   -- 付款状态
   shopping_address varchar(150) not null default '',   -- 收货地址
   logistics_status text,   -- 物流状态
   create_date datetime not null default now(),   -- 创建时间
   refund_date datetime,   -- 退款时间
   finish_date datetime   -- 完成时间
);

/*==============================================================*/
/* 订单商品列表
/*==============================================================*/
drop table if exists my_order_list;
create table my_order_list
(
   order_id varchar(35) not null default '',   -- 订单Id
    standard_id varchar(35) not null default '',   -- 规格Id
    goods_name varchar(60) not null default '',   -- 商品名称
    goods_price float not null default 0,   -- 商品价格
    goods_image text,   -- 商品图片
    goods_describe text,   -- 商品详情
    standard_name varchar(20) not null default '',   -- 规格名称
    buy_num int not null default 0,   -- 购买数量
    refund_num int not null default 0   -- 退货数量
);

/*==============================================================*/
/* 订单凭证
/*==============================================================*/
drop table if exists my_order_proof;
create table my_order_proof
(
   proof_id varchar(35) not null primary key,   -- 证明Id
    proof_url varchar(255) not null,   -- 证明图片路径
    order_id varchar(35) not null   -- 订单Id
);

/*==============================================================*/
/* 我的团队
/*==============================================================*/
drop table if exists my_team;
create table my_team
(
   my_team_id           varchar(35) not null,   -- 企业码
   my_team_name         varchar(20) not null default '',   -- 公司名称
   my_team_create_date  datetime not null default now(),   -- 创建时间
   my_team_area         varchar(100) not null default '',   -- 所在区域
   my_team_address      varchar(100) not null default '',   -- 详细地址
   lat_lng varchar(30) not null default '',   -- 经纬度
   primary key (my_team_id)
);
-- INSERT INTO `my_team` VALUES ('10001','','2017-05-17 15:41:47','','',1,'','');

/*==============================================================*/
/* 团队部门
/*==============================================================*/
create table team_department
(
   team_department_id varchar(35) not null primary key,
    team_department_name varchar(20) not null default '',
    department_type varchar(20) not null default '',
    department_text text,
    department_pid varchar(35) not null default '0',
    create_date datetime not null default now(),
    my_team_id varchar(35) not null default ''
);

/*==============================================================*/
/* 部门职位
/*==============================================================*/
drop table if exists department_position;
create table department_position
(
   position_id varchar(35) not null primary key,
    position_name varchar(10) not null default '',
    team_department_id varchar(35) not null default ''
);

/*==============================================================*/
/* 职位权限关联表
/*==============================================================*/
drop table if exists position_permission_re;
create table position_permission_re
(
   position_id varchar(35) not null default '',
    qm_permission_id varchar(35) not null default ''
);

/*==============================================================*/
/* 父类字典
/*==============================================================*/
create table parent_dictionary
(
   par_dict_id          varchar(35) not null,
   par_dict_name        varchar(50) not null default '',
   par_dict_create_date datetime not null default now(),
   sort                 varchar(2) not null default '',
   primary key (par_dict_id)
);
-- INSERT INTO `parent_dictionary` VALUES ('297ebc9fd0f640fca9f04c8fc067414e','填写类型','2017-05-17 15:51:15',''),('58c359e4f354459aa2d9692a50ca3e19','是否必填','2017-05-17 15:51:15',''),('7358aa8f92bd43dfb8e9472a7a4c74f5','订单状态','2017-05-17 15:51:15',''),('7c91ff9e7e3b47a7ba42b4d4ea78ab5a','付款方式','2017-05-17 15:51:15',''),('9fb5903640b340b795bc68481f1b48e3','客户分组','2017-05-17 15:51:15',''),('b3a5fa19c94d4a18b5b6c75ce8d3c828','图片类型','2017-05-17 15:51:15',''),('ca970ab6c3d847b0b14cc6cd64ea253c','用户状态','2017-05-17 15:51:15','');

/*==============================================================*/
/* 操作权限
/*==============================================================*/
create table permission
(
   permission_id        varchar(35) not null,
   permission_name      varchar(20) not null default '',
   permission_url       varchar(100) not null default '',
   permission_pid       varchar(35) not null default '',
   primary key (permission_id)
);

/*==============================================================*/
/* 客户权限
/*==============================================================*/
drop table if exists qm_permission;
create table qm_permission
(
   qm_permission_id        varchar(35) not null,
   qm_permission_name      varchar(20) not null default '',
   qm_permission_describe   varchar(100) not null default '',
   qm_permission_pid       varchar(35) not null default '0',
   qm_permission_type_id varchar(35) not null default '',
   sort                 tinyint not null default 1,
   primary key (qm_permission_id)
);

/*==============================================================*/
/* 客户权限与操作权限关联表
/*==============================================================*/
create table qm_permission_re
(
   permission_id        varchar(35) not null,
   qm_permission_id   varchar(35) not null default ''
);

/*==============================================================*/
/* 客户权限与个人关联
/*==============================================================*/
create table user_qm_permission_re
(
   user_id            varchar(35) not null,
   qm_permission_id   varchar(35) not null default ''
);

/*==============================================================*/
/* 角色
/*==============================================================*/
create table role
(
   role_id              int not null primary key auto_increment,
   role_name            varchar(20) not null default '',
   role_text            varchar(50) not null default '',
   role_create_date     datetime not null default now(),
   is_deleted           tinyint not null default 0,
   delete_date          date
);
-- INSERT INTO `role` VALUES (1001,'普通用户','没有后台权限','2017-05-17 15:46:24',0,NULL),(1002,'超级管理员','拥有所有权限','2017-05-17 15:46:24',0,NULL),(1003,'默认角色','没有权限','2017-05-17 15:46:24',0,NULL);

/*==============================================================*/
/* 收货地址
/*==============================================================*/
create table shopping_address
(
   user_address_id      varchar(35) not null,
   user_id              varchar(35) not null default '',
   user_address_text    varchar(50) not null default '',
   user_address_area    varchar(50) not null default '',
   user_address_name    varchar(20) not null default '',
   user_address_phone   varchar(20) not null default '',
   user_address_default tinyint not null default 0,
   primary key (user_address_id)
);

/*==============================================================*/
/* 购物车
/*==============================================================*/
drop table if exists shopping_cart;
create table shopping_cart
(
   user_id              varchar(35) not null default '',
   goods_id             varchar(35) not null default '',
   standard_id          varchar(35) not null default '',
   goods_num            int not null default 0,
   create_date datetime not null default now()
);

/*==============================================================*/
/* 运费模板
/*==============================================================*/
drop table if exists freight_temp;
create table freight_temp
(
   freight_id varchar(35) not null primary key,
   freight_name varchar(20) not null default '',
   weight_allowance float not null default 0,
   start_range float not null default 0,
   start_price float not null default 0,
   increase_range float not null default 0,
   increase_price float not null default 0,
   my_team_id varchar(35) not null default '',
   user_id varchar(35) not null default ''
);

/*==============================================================*/
/* 用户信息
/*==============================================================*/
create table user
(
   user_id              varchar(35) not null,
   my_team_id           varchar(35) not null default '',
   team_department_id   varchar(35) not null default '',
   position_id          varchar(35) not null default '',
   role_id              int not null default 0,
   user_name            varchar(20) not null default '',
   user_identity       varchar(18) not null default '',
   user_password        varchar(50) not null default '',
   user_sex             varchar(10) not null default '',
   user_phone           varchar(20) not null default '',
   user_birthday        date,
   user_address         varchar(50) not null default '',
   user_area            varchar(50) not null default '',
   user_email           varchar(100) not null default '',
   user_create_date     datetime not null default now(),
   user_last_login_time datetime not null default now(),
   user_update_time    datetime not null default now(),
   user_status          varchar(10) not null default '',
   user_img             varchar(150) not null default '',
   user_card_front      text,
   user_card_back       text,
   user_card_hand       text,
   real_name            tinyint not null default 2,
   token                varchar(50) not null default '',
   umeng_device_token varchar(50) not null default '',
   is_deleted           tinyint not null default 0,
   delete_date          datetime,
   primary key (user_id)
);
-- INSERT INTO `user` VALUES ('89d9317fb3834353bcf2a507bee2eb82','',1679617,1002,'张三','825682eafec59c2e1632828195133a52','sex_1','13688888888',NULL,'','','','2017-05-17 16:07:49','2017-05-17 16:07:49','u_st_2','','','','','','','',0,NULL);

/*==============================================================*/
/* 用户设备
/*==============================================================*/
create table user_devices
(
   user_device_id       varchar(35) not null,
   user_id              varchar(35) not null default '',
   user_device_name     varchar(20) not null default '',
   is_deleted           tinyint not null default 0,
   delete_date          datetime,
   primary key (user_device_id)
);

/*==============================================================*/
/* 商品收藏
/*==============================================================*/
create table goods_enshrine
(
   goods_id             varchar(35) not null,
   user_id              varchar(35) not null,
   primary key (goods_id, user_id)
);

/*==============================================================*/
/* 用户可见的菜单
/*==============================================================*/
create table user_menu_re
(
   role_id              int not null,
   menu_id              int not null,
   primary key (role_id, menu_id)
);

/*==============================================================*/
/* app 更新信息
/*==============================================================*/
drop table if exists app_update;
create table app_update
(
   app_update_id     int not null primary key auto_increment,
   app_version        varchar(25) not null default '',
   app_update_url   text,
   app_update_content    text
);

/*==============================================================*/
/* 体验申请表
/*==============================================================*/
drop table if exists qm_experience;
create table qm_experience
(
   experience_id varchar(35) not null primary key,   
   company varchar(20) not null default '',
   contacts varchar(20) not null default '',
   phone varchar(12) not null default '',
   position varchar(20) not null default ''
);

/*==============================================================*/
/* 销售点信息
/*==============================================================*/
drop table if exists qm_branch;
create table qm_branch
(
   branch_id varchar(35) not null primary key,
    branch_name varchar(20) not null default '',
    branch_type tinyint not null,
    department_id varchar(35) not null default '',
    my_team_id varchar(35) not null default '',
    department_name varchar(20) not null default '',
    user_id varchar(35) not null default '',
    user_name varchar(20) not null default '',
    user_phone varchar(20) not null default '',
    branch_area varchar(50) not null default '',
    lat_lng varchar(30) not null default ''
);

/*==============================================================*/
/* 库存修改记录
/*==============================================================*/
drop table if exists repertory_record;
create table repertory_record
(
   record_id varchar(35) not null primary key,   -- 记录Id
   record_code   varchar(35) not null, -- 记录编号
   my_team_id varchar(35) not null,   -- 团队Id
   branch_id varchar(35) not null,   -- 销售点Id
   branch_name varchar(35) not null,   -- 销售点名称
   operator_id varchar(35) not null,   -- 操作员Id
   operator_name varchar(20) not null,   -- 操作员姓名
   create_date datetime not null,   -- 修改时间
   record_remark varchar(255) not null   -- 备注
);

/*==============================================================*/
/* 库存修改记录列表
/*==============================================================*/
drop table if exists repertory_record_list;
create table repertory_record_list
(
   record_id varchar(35) not null,   -- 记录Id
   record_type tinyint not null,   -- 修改类型
   record_reason varchar(20) not null,   -- 修改原因
   goods_id varchar(35) not null,   -- 商品Id
   goods_name varchar(60) not null,   -- 商品名称
   standard_id varchar(35) not null,   -- 规格Id
   standard_name varchar(20) not null,   -- 规格名称
   standard_count int not null   -- 申请数量
);

/*==============================================================*/
/* 库存申请记录
/*==============================================================*/
drop table if exists repertory_apply;
create table repertory_apply
(
   apply_id varchar(35) not null primary key,   -- 记录Id
   apply_code varchar(35) not null,   -- 记录编号
   branch_id varchar(35) not null,   -- 销售点Id
   my_team_id varchar(35) not null,   -- 团队Id
   branch_name varchar(35) not null,   -- 销售点名称
   create_date datetime not null,   -- 申请时间
   accept_date datetime,   -- 同意时间
   proposer_id varchar(35) not null,   -- 申请人
   proposer_name varchar(20) not null,   -- 申请人姓名
   approver_id varchar(35),   -- 审批人
   approver_name varchar(20) not null,   -- 审批人姓名
   apply_status tinyint not null,   -- 申请状态
   apply_remark varchar(255) not null -- 备注
);

/*==============================================================*/
/* 库存申请列表
/*==============================================================*/
drop table if exists repertory_apply_list;
create table repertory_apply_list
(
   apply_id varchar(35) not null,
   goods_id varchar(35) not null,   -- 商品Id
   goods_name varchar(60) not null,   -- 商品名称
   standard_id varchar(35) not null,   -- 规格Id
   standard_name varchar(20) not null,   -- 规格名称
   standard_count int not null   -- 申请数量
);

/*==============================================================*/
/* 库存进仓记录
/*==============================================================*/
drop table if exists repertory_income;
create table repertory_income
(
   record_id varchar(35) not null primary key,   -- 记录Id
   record_code   varchar(35) not null,   -- 记录编号
   my_team_id varchar(35) not null,   -- 团队Id
   branch_id varchar(35) not null,   -- 销售点Id
   branch_name varchar(35) not null,   -- 销售点名称
   operator_id varchar(35) not null,   -- 操作员Id
   operator_name varchar(20) not null,   -- 操作员姓名
   create_date datetime not null,   -- 进仓时间
   record_remark varchar(255) not null   -- 备注
);

/*==============================================================*/
/* 库存进仓记录列表
/*==============================================================*/
drop table if exists repertory_income_list;
create table repertory_income_list
(
   record_id varchar(35) not null,   -- 记录Id
   goods_id varchar(35) not null,   -- 商品Id
   goods_name varchar(60) not null,   -- 商品名称
   standard_id varchar(35) not null,   -- 规格Id
   standard_name varchar(20) not null,   -- 规格名称
   standard_count int not null   -- 申请数量
);


/*==============================================================*/
/* 销售点商品
/*==============================================================*/
drop table if exists qm_branch_goods;
create table qm_branch_goods
(
   branch_id varchar(35) not null default '',
    goods_id varchar(35) not null default '',
    standard_id          varchar(35) not null,
   standard_count       int not null default 0
);

/*==============================================================*/
/* 通用申请表
/*==============================================================*/
drop table if exists common_apply;
create table common_apply(
   apply_id varchar(35) not null primary key,   -- 申请的Id
    apply_title varchar(100) not null,   -- 申请的标题
   proposer_id varchar(35) not null,   -- 申请人Id
   proposer_name varchar(20) not null,   -- 申请人姓名
    begin_date date,   -- 开始时间
    end_date date,   -- 结束时间
    create_date   datetime not null, -- 创建时间
    apply_result tinyint not null,   -- 申请状态
    apply_reason text   -- 申请原因
);

/*==============================================================*/
/* 通用申请审批人列表
/*==============================================================*/
drop table if exists common_apply_approve;
create table common_apply_approve(
   apply_id varchar(35) not null,   -- 申请的Id
   approve_id varchar(35) not null,   -- 审批人的Id
    approve_name varchar(35) not null,   -- 审批人的姓名
    approve_result tinyint not null,   -- 审批的结果
    approve_sequence tinyint,   -- 审批的顺序
    approve_advice text   -- 审批意见
);

/*==============================================================*/
/* 通用申请图片
/*==============================================================*/
drop table if exists common_apply_image;
create table common_apply_image(
   apply_id varchar(35) not null default '',   -- 申请的Id
    image_id varchar(35) not null,   -- 图片的Id
    image_path varchar(255) not null,   -- 图片路径
    image_sort tinyint not null default 0
);

/*==============================================================*/
/* 查看其他人客户
/*==============================================================*/
drop table if exists customer_visit;
create table customer_visit(
   member_id varchar(35) not null,   -- 用户Id
   department_id varchar(35) not null,   -- 部门Id
   department_name varchar(20) not null -- 部门名称
);

/*==============================================================*/
/* 推送消息
/*==============================================================*/
drop table if exists push_message;
create table push_message(
   msg_id varchar(35) not null primary key,   -- 消息Id
   msg_title varchar(100) not null,   -- 标题
   msg_text varchar(255) not null,   -- 内容
   msg_ticker varchar(100) not null,   -- 提示文字
   msg_type tinyint not null   -- 消息分类
);

/*==============================================================*/
/* 系统用户表
/*==============================================================*/
drop table if exists sys_user;
create table sys_user(
   user_id varchar(35) not null primary key,   -- 用户Id
    user_name varchar(20) not null,   -- 用户姓名
    user_password varchar(32),   -- 登陆密码
    user_phone varchar(20) not null,   -- 手机号
    token varchar(50) not null default ''   -- 令牌
);

/*==============================================================*/
/* 系统角色表
/*==============================================================*/
drop table if exists sys_role;
create table sys_role(
   role_id varchar(35) not null primary key,   -- 角色Id
    role_name varchar(20) not null,   -- 角色名称
    role_text varchar(100) not null default ''   -- 角色说明
);

/*==============================================================*/
/* 系统用户角色关联表
/*==============================================================*/
drop table if exists sys_user_role_re;
create table sys_user_role_re(
   role_id varchar(35) not null,   -- 角色Id
    user_id varchar(35) not null
);


/*==============================================================*/
/* 系统权限表
/*==============================================================*/
drop table if exists sys_permission;
create table sys_permission(
   permission_id varchar(35) not null primary key,   -- 权限Id
    permission_name varchar(20) not null,   -- 权限名称
    permission_url varchar(255) not null default '',   -- 操作地址
    permission_text varchar(100) not null default ''   -- 权限说明
);

/*==============================================================*/
/* 系统角色权限关联表
/*==============================================================*/
drop table if exists sys_role_permission_re;
 CREATE TABLE `sys_role_permission_re` (
  `role_id` varchar(35) NOT NULL,
  `permission_id` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*==============================================================*/
/* 养殖类目表
/*==============================================================*/
drop table if exists sys_breed_type;
create table sys_breed_type(
   type_id varchar(35) not null primary key,   -- 类目Id
    type_name varchar(20) not null,   -- 类目名称
    select_id varchar(35) not null default '',   -- 养殖类目选项Id
    select_name varchar(20) not null default ''   -- 养殖类目选项名称
);

/*==============================================================*/
/* 养殖类目选项表
/*==============================================================*/
drop table if exists sys_breed_type_select;
create table sys_breed_type_select(
   select_id varchar(35) not null primary key,   -- 选项Id
    select_name varchar(20) not null,   -- 选项名称
    type_id varchar(35) not null,   -- 类目Id
    type_name varchar(20) not null   -- 类目名称
);

/*==============================================================*/
/* 养殖类目信息表
/*==============================================================*/
drop table if exists sys_breed_type_info;
create table sys_breed_type_info(
   info_id varchar(35) not null primary key,   -- 信息Id
    info_name varchar(20) not null,   -- 信息名称
    info_type varchar(35) not null,   -- 填写类型
    select_id varchar(35) not null default '',   -- 养殖类目选项Id
   select_name varchar(20) not null default ''   -- 养殖类目选项名称
);

/*==============================================================*/
/* 客户信息表
/*==============================================================*/
drop table if exists sys_customer;
create table sys_customer(
   customer_id varchar(35) not null primary key,   -- 客户Id
    customer_sex varchar(5) not null default '',   -- 客户性别
    customer_name varchar(20) not null default '',   -- 客户姓名
    customer_phone varchar(20) not null default '',   -- 手机号
    customer_identity varchar(18) not null default '',   -- 身份证号
    team_id varchar(35) not null default '',   -- 企业码
   team_name         varchar(20) not null default '',   -- 公司名称
   team_create_date  datetime not null default now(),   -- 创建时间
   team_area         varchar(50) not null default '',   -- 所在区域
   team_address      varchar(50) not null default '',   -- 详细地址
    department_id varchar(35) not null,   -- 部门Id
    department_name varchar(20) not null,   -- 部门名称
    department_type varchar(20) not null,   -- 部门类型
    position_id varchar(35) not null,   -- 职位Id
    position_name varchar(10) not null,   -- 职位名称
    user_id varchar(35) not null,   -- 业务员Id
    had_account tinyint not null,   -- 是否建账
    role_id int not null,   -- 角色Id
    branch_type tinyint not null,   -- 销售点类型
    lat_lng varchar(30) not null -- 经纬度
);

/*==============================================================*/
/* 客户建账申请
/*==============================================================*/
drop table if exists sys_customer_account;
create table sys_customer_account(
   account_id varchar(35) not null primary key,   -- 申请的Id
    account_status tinyint not null,   -- 申请状态
   user_id varchar(35) not null,   -- 申请人Id
    user_name varchar(35) not null,   -- 申请人姓名
   customer_id varchar(35) not null,   -- 客户Id
   customer_name varchar(35) not null   -- 客户名称
);
      
/*修改团队自增Id初值*/
/*alter table my_team AUTO_INCREMENT=1679617;*/

/*修改角色自增Id初值*/
alter table role AUTO_INCREMENT=1000;

/*用户档案表*/
drop table if exists user_record;
create table user_record
select * from user where 1=2 ;

/*用户表更改记录*/
drop table if exists user_history;
create table user_history
select * from user where 1=2 ;

/*用户场地更改记录*/
drop table if exists user_place_history;
create table user_place_history
select * from user_place where 1=2;

/*用户硬件更改记录*/
drop table if exists user_place_hardware_history;
create table user_place_hardware_history
select * from user_place_hardware where 1=2;

/*用户养殖更改记录*/
drop table if exists user_breed_type_history;
create table user_breed_type_history
select * from user_breed_type where 1=2;