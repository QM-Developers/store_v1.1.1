select * from user
;

create table qm_experience
(
experience_id varchar(35) not null primary key,
contacts varchar(20) not null default '',
phone varchar(12) not null default '',
position varchar(30) not null default ''
);