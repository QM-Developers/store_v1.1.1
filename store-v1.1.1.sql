drop database store_v1_1_1;
create database store_v1_1_1 charset="utf8";
use store_v1_1_1;

/*==============================================================*/
/* 国内地区
/*==============================================================*/
drop table if exists china;
create table china
(
   id                   varchar(10) not null,
   name                 varchar(20) not null default '',
   pid                  varchar(10) not null default ''
);

/*==============================================================*/
/* 客户信息表
/*==============================================================*/
drop table if exists customer;
create table customer
(
   user_id              varchar(35) not null default '',
   promoter_id			varchar(35) not null default '',
   customer_id			varchar(35) not null default '',
   customer_group_id    varchar(35) not null default '',
   my_team_id 			varchar(35) not null default '',
   customer_remard      varchar(20) not null default '',
   credit_rating		tinyint not null default 0,
   primary key (customer_id)
);

/*==============================================================*/
/* 客户分组
/*==============================================================*/
create table customer_group
(
   customer_group_id    varchar(35) not null,
   customer_group_name  varchar(20) not null default '',
   sort                 varchar(2) not null default '',
   primary key (customer_group_id)
);

/*==============================================================*/
/* 数据字典
/*==============================================================*/
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
   friend_id			varchar(35) not null primary key,
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
    create_date datetime not null default now()
);

/*==============================================================*/
/* 聊天记录
/*==============================================================*/
drop table if exists chat_history;
create table chat_history
(
	history_id int not null primary key auto_increment,
    send_user_id varchar(35) not null default '',
    receive_user_id varchar(35) not null default '',
    data_type int not null default 0,
    send_data text,
    send_time datetime not null default now(),
    is_read int not null default 0
);

/*==============================================================*/
/* 商品图片
/*==============================================================*/
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
   delete_date          datetime,
   primary key (goods_type_id)
);

/*==============================================================*/
/* 商品信息
/*==============================================================*/
create table goodsinfo
(
   goods_id             varchar(35) not null,
   goods_type_id        varchar(35) not null default '',
   my_team_id           varchar(35) not null default '',
   template_freight_id  varchar(35) not null default '',
   goods_name           varchar(60) not null default '',
   goods_price          float not null default 0,
   goods_count          int not null default 0,
   goods_attr           text,
   goods_describe       text,
   goods_standard       text,
   goods_freight        int not null default 0,
   goods_sales			int not null default 0,
   goods_create_date    datetime not null default now(),
   is_deleted           tinyint not null default 0,
   delete_date          datetime,
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
create table my_order
(
   order_id             varchar(35) not null,
   customer_id              varchar(35) not null default '',
   order_type           varchar(15) not null default '',
   order_status         varchar(15) not null default '',
   recipient            varchar(20) not null default '',
   contact_number       varchar(20) not null default '',
   address              varchar(100) not null default '',
   remark               varchar(100) not null default '',
   payment              varchar(20) not null default '',
   order_create_date    datetime not null default now(),
   roder_success_date   datetime,
   is_deleted           tinyint not null default 0,
   delete_date          date,
   primary key (order_id)
);

/*==============================================================*/
/* 订单商品列表
/*==============================================================*/
create table my_order_list
(
   order_list_id        varchar(35) not null,
   order_id             varchar(35) not null default '',
   goods_num            int not null default 0,
   price                float not null default 0,
   goods_name           varchar(60) not null default '',
   goods_id        varchar(35) not null default '',
   primary key (order_list_id)
);

/*==============================================================*/
/* 我的团队
/*==============================================================*/
drop table if exists my_team;
create table my_team
(
   my_team_id           varchar(35) not null,
   my_team_name         varchar(20) not null default '',
   my_team_create_date  datetime not null default now(),
   my_team_area         varchar(50) not null default '',
   my_team_address      varchar(50) not null default '',
   my_team_member_number int not null default 0,
   my_team_sort         tinyint not null default 1,
   my_team_type			varchar(20) not null default '',
   my_team_pid          varchar(35) not null default '',	-- 上级团队Id
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
   sort                 varchar(2) not null default '',
   is_deleted           tinyint not null default 0,
   delete_date          date,
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
   qm_permission_describe	varchar(100) not null default '',
   qm_permission_pid       varchar(35) not null default '0',
   sort                 tinyint not null default 1,
   is_deleted           tinyint not null default 0,
   delete_date          date,
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
create table shopping_cart
(
   customer_id              varchar(35) not null default '',
   goods_id             varchar(35) not null default '',
   standard_id          varchar(35) not null default '',
   goods_num            int not null default 0
);

/*==============================================================*/
/* 运费模板
/*==============================================================*/
create table template_of_freight
(
   template_freight_id  varchar(35) not null,
   user_id              varchar(35) not null default '',
   template_freight_name varchar(25) not null default '',
   template_delivery_time int not null default 0,
   template_freight_isfree tinyint not null default 0,
   template_charge_model tinyint not null default 0,
   template_default_num float not null default 0,
   template_default_price float not null default 0,
   template_add_num     float not null default 0,
   template_add_price   float not null default 0,
   primary key (template_freight_id)
);

/*==============================================================*/
/* 地区运费
/*==============================================================*/
create table area_freight
(
   area_freight_id  varchar(35) not null,
   template_freight_id varchar(35) not null,
   area_first_num int not null default 0,
   area_first_price float not null default 0,
   area_continue_num     int not null default 0,
   area_continue_price   float not null default 0,
   primary key (area_freight_id)
);

/*==============================================================*/
/* 地区Id关联
/*==============================================================*/
create table area_id
(
   area_freight_id  varchar(35) not null,
   area_id varchar(20) not null default ''
);

/*==============================================================*/
/* 用户信息
/*==============================================================*/
create table user
(
   user_id              varchar(35) not null,
   my_team_id           varchar(35) not null default '',
   team_department_id	varchar(35) not null default '',
   position_id          varchar(35) not null default '',
   role_id              int not null default 0,
   user_name            varchar(20) not null default '',
   user_identity 		varchar(18) not null default '',
   user_password        varchar(50) not null default '',
   user_sex             varchar(10) not null default '',
   user_phone           varchar(20) not null default '',
   user_birthday        date,
   user_address         varchar(50) not null default '',
   user_area            varchar(50) not null default '',
   user_email           varchar(100) not null default '',
   user_create_date     datetime not null default now(),
   user_last_login_time datetime not null default now(),
   user_update_time 	datetime not null default now(),
   user_status          varchar(10) not null default '',
   user_qq              varchar(20) not null default '',
   uesr_wechat          varchar(20) not null default '',
   user_img             varchar(150) not null default '',
   user_nickname        varchar(30) not null default '',
   user_card_front      text,
   user_card_back       text,
   user_card_hand       text,
   real_name            tinyint not null default 2,
   token                varchar(50) not null default '',
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
/* 角色拥有的权限
/*==============================================================*/
drop table if exists role_permission_RE;
create table role_permission_RE
(
   permission_id        varchar(35) not null,
   role_id              int not null,
   primary key (permission_id, role_id)
);

/*==============================================================*/
/* 客户场地信息
/*==============================================================*/
drop table if exists user_place;
create table user_place
(
   user_place_id        varchar(35) not null,
   customer_id              varchar(35) not null default '',
   user_place_name      varchar(20) not null default '',
   user_place_acreage   int not null default 0,
   user_employee_num    int not null default 0,
   user_place_address   varchar(50) not null default '',
   user_place_area      varchar(50) not null default '',
   user_place_type      varchar(15) not null default '',
   create_date			datetime not null default now(),
   is_deleted           tinyint not null default 0,
   delete_date          date,
   primary key (user_place_id)
);


/*==============================================================*/
/* 养殖类型
/*==============================================================*/
drop table if exists user_breed_type;
create table user_breed_type
(
   user_breed_type_id   varchar(35) not null,
   user_place_id        varchar(35) not null default '',
   user_breed_type      varchar(20) not null default '',
   user_breed_variety   varchar(20) not null default '',
   user_breed_num       varchar(20) not null default '',
   user_sell_num        varchar(20) not null default '',
   user_breed_style     varchar(20) not null default '',
   user_fodder_type     varchar(20) not null default '',
   user_fodder_style    varchar(20) not null default '',
   user_fodder_num      int not null default 0,
   create_date			datetime not null default now(),
   is_deleted           tinyint not null default 0,
   delete_date          datetime,
   primary key (user_breed_type_id)
);

/*==============================================================*/
/* 场地硬件信息
/*==============================================================*/
drop table if exists user_place_hardware;
create table user_place_hardware
(
   user_hardware_id     varchar(35) not null,
   user_place_id        varchar(35) not null default '',
   user_hardware_name   varchar(20) not null default '',
   user_hardware_num    int not null default 0,
   create_date			datetime not null default now(),
   is_deleted           tinyint not null default 0,
   delete_date          date,
   primary key (user_hardware_id)
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

/*客户分组关联*/
alter table customer add constraint FK_customer_group_re foreign key (customer_group_id)
      references customer_group (customer_group_id) on delete restrict on update restrict;
      
/*客户用户关联*/
alter table customer add constraint FK_customers_re foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

/*父类字典关联*/
alter table dictionary add constraint FK_par_dic_child_dic_RE foreign key (par_dict_id)
      references parent_dictionary (par_dict_id) on delete restrict on update restrict;

/*用户好友关联*/
alter table friend add constraint FK_friend_re1 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

/*好友用户关联*/
alter table friend add constraint FK_friend_re2 foreign key (friend_id)
      references user (user_id) on delete restrict on update restrict;
	  
/*好友申请关联*/
alter table friend_request add constraint FK_friend_req1 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;
	  
/*申请好友关联*/
alter table friend_request add constraint FK_friend_req2 foreign key (friend_id)
      references user (user_id) on delete restrict on update restrict;

/*商品图片关联*/
alter table goods_image add constraint FK_goods_img_RE foreign key (goods_id)
      references goodsinfo (goods_id) on delete restrict on update restrict;

/*商品图片与图片空间关联*/
alter table goods_image add constraint FK_goods_img_space_re foreign key (image_id)
      references image_space (image_id) on delete restrict on update restrict;

/*商品规格关联*/
alter table goods_standard add constraint FK_goods_standard_re foreign key (goods_id)
      references goodsinfo (goods_id) on delete restrict on update restrict;

/*商品类目属性关联*/
alter table goods_type_attr add constraint FK_type_detail_re foreign key (goods_type_id)
      references goods_typeinfo (goods_type_id) on delete restrict on update restrict;

/*商品运费模板关联*/
alter table goodsinfo add constraint FK_goods_freight_re foreign key (template_freight_id)
      references template_of_freight (template_freight_id) on delete restrict on update restrict;

/*商品类目关联*/
alter table goodsinfo add constraint FK_goods_type_RE foreign key (goods_type_id)
      references goods_typeinfo (goods_type_id) on delete restrict on update restrict;

/*商品团队关联*/
alter table goodsinfo add constraint FK_team_goods_re foreign key (my_team_id)
      references my_team (my_team_id) on delete restrict on update restrict;

/*团队与图片空间关联*/
alter table image_space add constraint FK_team_img_space foreign key (my_team_id)
      references my_team (my_team_id) on delete restrict on update restrict;

/*部门与团队关联*/
alter table team_department add constraint FK_team_department_re foreign key (my_team_id)
      references my_team (my_team_id) on delete restrict on update restrict;

/*订单用户关联*/
alter table my_order add constraint FK_user_order_RE foreign key (customer_id)
      references customer (customer_id) on delete restrict on update restrict;

/*订单列表关联*/
alter table my_order_list add constraint FK_order_info_RE foreign key (order_id)
      references my_order (order_id) on delete restrict on update restrict;

/*用户与收货地址关联*/
alter table shopping_address add constraint FK_address_user_RE foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

/*购物车与已选择的商品规格关联*/
alter table shopping_cart add constraint FK_card_standard_re foreign key (standard_id)
      references goods_standard (standard_id) on delete restrict on update restrict;

/*购物车商品关联*/
alter table shopping_cart add constraint FK_goods_card_re foreign key (goods_id)
      references goodsinfo (goods_id) on delete restrict on update restrict;

/*购物车用户关联*/
alter table shopping_cart add constraint FK_customer_card_re2 foreign key (customer_id)
      references customer (customer_id) on delete restrict on update restrict;

/*运费模板与用户关联*/
alter table template_of_freight add constraint FK_user_freight_re foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

/*用户角色关联*/
alter table user add constraint FK_user_role_re foreign key (role_id)
      references role (role_id) on delete restrict on update restrict;

/*用户团队关联*/
alter table user add constraint FK_user_team_re foreign key (my_team_id)
      references my_team (my_team_id) on delete restrict on update restrict;

/*用户团队关联*/
alter table user add constraint FK_user_department_re foreign key (team_department_id)
      references team_department (team_department_id) on delete restrict on update restrict;

/*场地与养殖类型关联*/
alter table user_breed_type add constraint FK_place_breed_RE foreign key (user_place_id)
      references user_place (user_place_id) on delete restrict on update restrict;

/*用户设备关联*/
alter table user_devices add constraint FK_user_device_re foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

/*用户商品收藏关联*/
alter table goods_enshrine add constraint FK_user_goods_RE foreign key (goods_id)
      references goodsinfo (goods_id) on delete restrict on update restrict;

/*用户商品收藏关联*/
alter table goods_enshrine add constraint FK_user_goods_RE2 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

/*角色菜单关联*/
alter table user_menu_re add constraint FK_user_menu_re foreign key (role_id)
      references role (role_id) on delete restrict on update restrict;

/*用户菜单关联*/
alter table user_menu_re add constraint FK_user_menu_re2 foreign key (menu_id)
      references menu (menu_id) on delete restrict on update restrict;

/*用户权限关联*/
alter table role_permission_RE add constraint FK_role_permission_RE foreign key (permission_id)
      references permission (permission_id) on delete restrict on update restrict;

/*角色权限关联*/
alter table role_permission_RE add constraint FK_role_permission_RE2 foreign key (role_id)
      references role (role_id) on delete restrict on update restrict;

/*用户场地关联*/
alter table user_place add constraint FK_user_place_re foreign key (customer_id)
      references customer (customer_id) on delete restrict on update restrict;

/*场地硬件关联*/
alter table user_place_hardware add constraint FK_place_hardware_RE foreign key (user_place_id)
      references user_place (user_place_id) on delete restrict on update restrict;
      
/*模板与地区运费关联*/
alter table area_freight add constraint FK_area_price_RE foreign key (template_freight_id)
      references template_of_freight (template_freight_id) on delete restrict on update restrict;
      
/*地区运费与地区关联*/
alter table area_id add constraint FK_price_area_RE foreign key (area_freight_id)
      references area_freight (area_freight_id) on delete restrict on update restrict;
      
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