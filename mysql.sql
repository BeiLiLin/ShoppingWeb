show variables like '%character%';
set character_set_database =utf8;
set character_set_server=utf8;
#创建数据库
create database shoppingweb;
use shoppingweb;

show variables like 'SQL_SAFE_UPDATES';
SET SQL_SAFE_UPDATES = 0;

#创建表
/*
用户表（t_user）：存放已注册的用户
商品表(t_commodity):存放商品信息
购物车表(t_cartitem)：存放用户的保存商品的信息 
订单表(t_order)：存放用户提交的订单信息
订单-商品表(t_order_comm)：存放用户订单的商品信息  
留言表(t_comment)：存放留言信息
*/

#用户表（user）
drop table if exists  t_user;
create table t_user(
id	int auto_increment,
uid	varchar(20) not null unique,
rank	int default 0,
uname	varchar(30) not null,
password	varchar(16) not null,
address	varchar(70) not null,
tele	varchar(20) not null,
create_by	varchar(64) not null default 'system',
create_date	timestamp not null default current_timestamp,
update_by	varchar(64),
update_date	timestamp ,
del_flag	int  default 0,
Version	int  default 0,
constraint pk_user primary key (id)
)ENGINE=innoDB default charset=utf8;
#user查询操作
select
 id,uid,rank,uname,password,address,tele,create_by,create_date,update_by,update_date,del_flag,version 
 from t_user ;
 #####
select
 id,uid,rank,uname,password,address,tele,create_by,create_date,update_by,update_date,del_flag,version 
 from t_user 
 where del_flag=0;
#插入数据
insert into  t_user(uid,rank,uname,password,address,tele,version)
values('1002',0,'张三',1234,'皇后大道东','15992696034',0)
,('1001',0,'李四',1234,'皇后大道','15992696034',0)
;
#逻辑删除
update t_user set del_flag =0 where id =1;
#物理删除
delete from t_user where id =1;
############################################################################################################################################

#商品表（commodity）
drop table if exists  t_commodity;
create table t_commodity(
id	int auto_increment,
cname	varchar(30) not null,
cost	decimal(10,2) not null,
Info	varchar(300),
classify	varchar(20) not null,
pic	varchar(300),
merchant	varchar(30),
store	int default 0,
create_by	varchar(64) not null default 'system',
create_date	timestamp not null default 0 default current_timestamp,
update_by	varchar(64) ,
update_date	timestamp ,
del_flag	int not null default 0,
version	int not null default 0,
constraint pk_commodity primary key(id)
)ENGINE=innoDB default charset=utf8;
#t_commodity查询操作
select 
id,cname,cost,Info,classify,pic,merchant,store,create_by,create_date,update_by,update_date,del_flag,version 
from t_commodity;
#查询未删除的数据
select 
id,cname,cost,Info,classify,pic,merchant,store,create_by,create_date,update_by,update_date,del_flag,version 
from t_commodity 
where del_flag=0;

#插入数据
insert into  t_commodity(cname,cost,Info,classify,pic,merchant,store,version)
values
('国美(GOME)S1','1299.00','3GB+32GB 手机 人脸识别 墨韵灰','手机','c11.png','国美自营',999,1)
('国美(GOME)S1','1299.00','3GB+32GB 手机 人脸识别 墨韵灰','手机','note6_64G.jpg','国美自营',999,1),
('魅族 魅蓝 Note6','1299.00','3GB+32GB 全网通公开版 皓月银 移动联通电信4G手机 双卡双待','手机','note6.jpg','国美自营',999,1),
('鼠标',300,'伟达鼠标','电子产品','2.jpg','维达科技',100,1),
('电脑',1000,'组装电脑','电子产品','1.jpg','维达科技',100,1);

update t_commodity set pic='c10.png' where id=4;

#删除
update t_commodity set del_flag =1 where id =1;

###############################################################################################################################################

#购物车表（cartItem）
drop table if exists  t_cartitem;
create table t_cartitem(
id	int auto_increment,
uid	int not null,
comid	int not null,
num	int default 0,
statu int default 0,
create_by	varchar(64) not null default 'system',
create_date	timestamp not null default current_timestamp,
update_by	varchar(64) ,
update_date	timestamp,
del_flag	int not null default 0,
version	int  not null default 0,
constraint pk_cartitem primary key(id),
constraint fk_cart_user foreign key (uid) references t_user(id),
constraint fk_cart_com foreign key (comid) references t_commodity(id)
)ENGINE=innoDB default charset=utf8;

#alter table t_cartitem add column statu int default 0;

#t_commodity查询操作
select 
id,uid,comid,num,statu,create_by,create_date,update_by,update_date,del_flag,version 
from t_cartitem;
#查询未删除的数据
select 
id,uid,comid,num,statu,create_by,create_date,update_by,update_date,del_flag,version 
from t_cartitem 
where  uid=2 and del_flag=0 
limit 10,10;

delete from t_cartitem where comid = 2 and uid =2;
update t_cartitem c set statu =0 where c.uid=2;
update t_cartitem c set  del_flag=0 where c.uid=2;
#插入数据
insert into  t_cartitem(uid,comid,num,version)
values(2,1,4,1),
(2,2,3,1),
(1,1,3,1),
(1,2,3,1),
(2,1,4,1),
(2,2,3,1);
#删除
update t_cartitem set del_flag =1 where id =1;
delete from t_cartitem where uid=2;
###############################################################################################################################################

#订单表（t_order）
drop table if exists  t_order;
create table t_order(
id			int auto_increment,
oid			varchar(50) not null unique,#订单号
uid			int not null,
ship_number	varchar(100),				#快递单号
pay_price	decimal(20,2),
ship_by		varchar(20),
ship_date	timestamp not null default current_timestamp,
receipt_by	 varchar(20) not null ,
receipt_date timestamp,
is_receipt	int not null default 0,
is_pay		int not null default 0,
pay_time    timestamp,
create_by	varchar(64) not null default 'system',
create_date	timestamp  not null default current_timestamp,
update_by	varchar(64) ,
update_date	timestamp,
statu	int not null default 0,
del_flag 	int not null default 0,
version  	int not null default 0,
constraint pk_order primary key (id),
constraint fk_order_user foreign key (uid) references t_user(id)
)ENGINE=innoDB default charset=utf8;
#t_order查询操作
select 
id,oid,uid,ship_number,pay_price,ship_by,ship_date,receipt_by,receipt_date,,create_bycreate_date,is_receipt,is_pay,pay_time,update_by,update_date,del_flag,version 
from t_order;
#查询未删除的数据
select 
id,oid,uid,ship_number,pay_price,ship_by,ship_date,receipt_by,receipt_date,is_receipt,is_pay,pay_time,create_by,create_date,update_by,update_date,del_flag,version 
from t_order 
where del_flag=0;
#插入数据
insert into  t_order(oid,uid,ship_number,pay_price,ship_by,receipt_by,is_pay,version)
values('dingdanghao1',1,'kuaidihao1',1520,'伟达电器','李四',1,1),
('dingdanghao2',2,'kuaidihao2',1520,'伟达电器','张三',1,1);
#删除
update t_order set del_flag =1 where id =1;


#订单表
select c.oid,c.cartid,com.comid,o.uid,c.num,com.cname,com.classify,com.pic,com.info,com.cost,com.merchant,com.store,o.mystatus 
from t_order o,t_cartitem c,t_commodity com 
where o.oid=c.oid and c.comid = com.comid
and c.del_flag=0 and o.del_flag=0 and com.del_flag=0;
#查找uid=1的订单购物车货品
select c.oid,c.cartid,com.comid,o.uid,c.num,com.cname,com.classify,com.pic,com.info,com.cost,com.merchant,com.store,o.mystatus 
from t_order o,t_cartitem c,t_commodity com 
where o.oid=c.oid and c.comid = com.comid
and o.oid=1
and c.del_flag=0 and o.del_flag=0 and com.del_flag=0;


################################################################################################################################################
#订单-商品表表（t_order_com）
drop table if exists  t_order_com;
create table t_order_com(
id			int auto_increment,
oid			int not null,
comid		int not null,
coms_num	int not null default 0,
coms_price	decimal(20,2) not null default 0.0,
create_by	varchar(64) not null default 'user',
create_date	timestamp not null default current_timestamp,
update_by	varchar(64),
update_date	timestamp,
statu		int not null default 0,
del_flag	int not null default 0,
version		int not null default 0,
constraint pk_order_com primary key (id),
constraint fk_order foreign key (oid) references t_order(id),
constraint fk_commodity foreign key (comid) references t_commodity(id)
)ENGINE=innoDB default charset=utf8;
#t_order_com查询操作
select 
id,oid,comid,coms_num,coms_price,create_by,create_date,update_by,update_date,statu,del_flag,version 
from t_order_com;
#查询未删除的数据
select 
id,oid,comid,coms_num,coms_price,create_by,create_date,update_by,update_date,statu,del_flag,version 
from t_order_com 
where del_flag=0;
#插入数据
insert into  t_order_com(oid,comid,coms_num,coms_price,version)
values(1,1,3,1000,1),
(1,2,3,300,1),
(2,1,3,1000,1),
(2,2,3,300,1)
;
#删除
update t_order_com set del_flag =1 where id =1;


###############################################################################################################################################
#留言（tb_comment）
drop table if exists  t_comment;
create table t_comment(
id	int  auto_increment,
uid	varchar(20),
cid	int	not null,
message	Text not null,	
evaluate	int	not null default 5,
create_by	varchar(64) 	 not null default 'user',
create_date	timestamp	 not null default current_timestamp,
update_by	varchar(64),
update_date	timestamp,
del_flag	int	not null default 0,
version 	int not null default 0,
constraint pk_comment primary key (id)
)ENGINE=innoDB default charset=utf8;
#t_comment查询操作
select 
id,uid,cid,message,evaluate,create_by,create_date,update_by,update_date,del_flag,version 
from t_comment;
#查询未删除的数据
select 
id,uid,cid,message,evaluate,create_by,create_date,update_by,update_date,del_flag,version 
from t_comment
where del_flag=0;
#插入数据
insert into  t_comment(uid,cid,message,evaluate,create_by,version)
values(2,3,'好看',5,'李四',1),
(2,3,'好看',5,'李四',1),
(2,3,'好看',5,'张三',1),
(2,2,'好看',5,'张三',1)
;
#删除
update t_comment set del_flag =1 where id =1;


###############################################################################################################################################





