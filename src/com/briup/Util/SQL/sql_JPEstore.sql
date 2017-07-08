select * from d_user;
------用户表----
drop table d_user;
create table d_user(
	id number primary key,
	name varchar2(40),
	password varchar2(40),
	zip varchar2(10),
	address varchar2(40),
	phone varchar2(20),
	email varchar2(30)
);
--创建用户注册时候实用的序列--
create sequence d_user_seq;
-----支付方式表------
drop table d_payway;
create table d_payway(
	id number primary key,
	pay_style varchar2(20),
	images varchar2(30)
);
------收件人表------
drop table d_receiver;
create table d_receiver(
	id number primary key,
	name varchar2(20),
	address varchar2(40),
	phone varchar2(20),
	user_id number references d_user(id)	
);
----订单表--------
drop table d_order;
create table d_order(
	id number primary key,
	num number,
	start_date varchar2(30),
	sum_price number,
	payway_id number references d_payway(id),
	status varchar2(20),
	user_id number references d_user(id),
	receiver_id number references d_receiver(id)
);
----书的种类表--------
drop table d_category;
create table d_category(
	id number primary key,
	name varchar2(20)
);
insert into d_category values(0,'文学类');
insert into d_category values(1,'教育类');
insert into d_category values(2,'计算机');
insert into d_category values(3,'儿童类');
insert into d_category values(4,'漫画类');
insert into d_category values(5,'工具类');
insert into d_category values(6,'期刊');
---书的详细非类表------
drop table d_category_detail;
create table d_category_detail(
	id number primary key,
	category_id number references d_category(id),
	name varchar2(20)
);
insert into d_category_detail values(0,0,'历史');
insert into d_category_detail values(1,0,'心理学');
insert into d_category_detail values(2,0,'法律');
insert into d_category_detail values(3,1,'教材');
insert into d_category_detail values(4,1,'外语');
insert into d_category_detail values(5,2,'C#');
insert into d_category_detail values(6,2,'java');
insert into d_category_detail values(7,2,'大数据');
insert into d_category_detail values(8,2,'C++');
insert into d_category_detail values(9,3,'科普');
insert into d_category_detail values(10,3,'百科');
insert into d_category_detail values(11,4,'连环画');
insert into d_category_detail values(12,4,'童话故事');
insert into d_category_detail values(13,5,'汽修');
insert into d_category_detail values(14,5,'电修');
insert into d_category_detail values(15,5,'水利维护');
insert into d_category_detail values(16,6,'时尚周刊');
insert into d_category_detail values(17,6,'汽车');
insert into d_category_detail values(18,6,'美食');
----出版社表-----
drop table d_publish;
create table d_publish(
	id number primary key,
	name varchar2(30)
);
insert into d_publish values(0,'人民出版社');
insert into d_publish values(1,'清华大学出版社');
insert into d_publish values(2,'电子工业出版社');
insert into d_publish values(3,'中华书局');
insert into d_publish values(4,'中信出版社');
insert into d_publish values(5,'上海译文出版社');
insert into d_publish values(6,'北京大学出版社');
insert into d_publish values(7,'机械工业出版社');
--------产品------------
drop table d_product;
alter table d_product modify description varchar2(2000)
create table d_product(
	id number primary key,
	name varchar2(30),
	price number,
	service_fg varchar2(50),
	service_myf varchar2(50),
	service_zt varchar2(50),
	service_th varchar2(50),
	version number,
	stock number,
	description varchar2(2000),
	writer varchar2(70),
	publish_id number references d_publish(id),
	pages number,
	ISBN varchar2(40),
	publish_date varchar2(30),
	feature_images varchar2(40),
	images varchar2(200),
	bill varchar2(4000),
	cat_detail_id references d_category_detail(id),
	start_date varchar2(30),
	sale_num number,
	flag number,
	explain varchar2(70)
);

------评论表-----
drop table d_evaluate;
create table d_evaluate(
	id number primary key,
	images varchar2(200),
	eva_date varchar2(30),
	state number,
	content varchar2(2000),
	user_id number references d_user(id),
	product_id number references d_product(id)
);
-------订单项----------
drop table d_orderline;
create  table d_orderline(
	id number primary key,
	amount number,
	single_price number,
	product_version number,
	order_id number references d_order(id),
	product_id number references d_product(id)
);
-------杰普简报------
drop table d_report;
create table d_report(
	id number primary key,
	title varchar2(50)
);
insert into d_report values(0,'竭诚向你推荐');
insert into d_report values(1,'最近热卖');
insert into d_report values(2,'洋溢的清楚');
insert into d_report values(3,'学习技术必备');
insert into d_report values(4,'大数据推荐');
----简报与产品关联表
drop table d_report_product;
create table d_report_product(
	report_id number references d_report(id),
	product_id number references d_product(id)
);
insert into d_report_product values(0,0);
insert into d_report_product values(0,1);
insert into d_report_product values(0,2);
insert into d_report_product values(1,3);
insert into d_report_product values(1,4);
insert into d_report_product values(2,0);
insert into d_report_product values(2,5);
insert into d_report_product values(2,7);
insert into d_report_product values(3,6);
insert into d_report_product values(3,7);
insert into d_report_product values(3,8);
insert into d_report_product values(4,9);
insert into d_report_product values(4,10);
------价格分类表--------
create table d_price_rank(
	id number primary key,
	min_price number,
	max_price number
);
insert into d_price_rank values(0,0,599);
insert into d_price_rank values(1,600,999);
insert into d_price_rank values(2,1000,1599);
insert into d_price_rank values(3,1600,1999);
insert into d_price_rank values(4,2000,2999);
insert into d_price_rank values(5,3000,3999);
insert into d_price_rank values(6,4000,4999);
insert into d_price_rank values(7,5000,5999);
insert into d_price_rank values(8,6000,6495);
 



