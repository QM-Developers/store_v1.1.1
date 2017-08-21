select * from customer
;

select * from my_team
;

show create table user_view
;


show create view user_view
;

CREATE view user_view AS select `user`.`user_id` AS `user_id`,`user`.`my_team_id` AS `my_team_id`,`user`.`team_department_id` AS `team_department_id`,`user`.`role_id` AS `role_id`,`user`.`user_name` AS `user_name`,`user`.`user_password` AS `user_password`,`user`.`user_sex` AS `user_sex`,`user`.`user_phone` AS `user_phone`,`user`.`user_birthday` AS `user_birthday`,`user`.`user_address` AS `user_address`,`user`.`user_area` AS `user_area`,`user`.`user_email` AS `user_email`,`user`.`user_create_date` AS `user_create_date`,`user`.`user_last_login_time` AS `user_last_login_time`,`user`.`user_status` AS `user_status`,`user`.`user_qq` AS `user_qq`,`user`.`uesr_wechat` AS `uesr_wechat`,`user`.`user_img` AS `user_img`,`user`.`user_nickname` AS `user_nickname`,`user`.`token` AS `token`,`user`.`is_deleted` AS `is_deleted`,`user`.`delete_date` AS `delete_date`,`user`.`user_identity` AS `user_identity`,`user`.`lng_and_lat` AS `lng_and_lat`,`user`.`user_update_time` AS `user_update_time` from `user` union select `user_record`.`user_id` AS `user_id`,`user_record`.`my_team_id` AS `my_team_id`,`user_record`.`team_department_id` AS `team_department_id`,`user_record`.`role_id` AS `role_id`,`user_record`.`user_name` AS `user_name`,`user_record`.`user_password` AS `user_password`,`user_record`.`user_sex` AS `user_sex`,`user_record`.`user_phone` AS `user_phone`,`user_record`.`user_birthday` AS `user_birthday`,`user_record`.`user_address` AS `user_address`,`user_record`.`user_area` AS `user_area`,`user_record`.`user_email` AS `user_email`,`user_record`.`user_create_date` AS `user_create_date`,`user_record`.`user_last_login_time` AS `user_last_login_time`,`user_record`.`user_status` AS `user_status`,`user_record`.`user_qq` AS `user_qq`,`user_record`.`uesr_wechat` AS `uesr_wechat`,`user_record`.`user_img` AS `user_img`,`user_record`.`user_nickname` AS `user_nickname`,`user_record`.`token` AS `token`,`user_record`.`is_deleted` AS `is_deleted`,`user_record`.`delete_date` AS `delete_date`,`user_record`.`user_identity` AS `user_identity`,`user_record`.`lng_and_lat` AS `lng_and_lat`,`user_record`.`user_update_time` AS `user_update_time` from `user_record`
;
