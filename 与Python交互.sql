-- 创建goods数据表
create table goods(
	id int unsigned primary key auto_increment not null,
	name varchar(150) not null,
	cate_name varchar(40) not null,
	brand_name varchar(40) not null,
	price decimal(10,3) not null default 0,
	is_show bit not null default 1,
	is_saleoff bit not null default 0
);

--插入数据
insert into goods values
(0,"r510vc 15.6英寸","笔记本","华硕",3399,default,default),
(0,"y400n 14.0英寸","笔记本","联想",4999,default,default),
(0,"g150th 15.6英寸","游戏本","雷神",8499,default,default),
(0,"x550cc 15.6英寸","笔记本","华硕",2799,default,default),
(0,"x240","超极本","联想",4880,default,default),
(0,"u330p 13.3英寸","超极本","联想",4299,default,default),
(0,"ipad mini 7.9英寸","平板电脑","苹果",1998,default,default),
(0,"ipad air 9.7英寸","平板电脑","苹果",3388,default,default),
(0,"ideacentre c340 20英寸","台式机","联想",3499,default,default),
(0,"vostro 3800-r1206","台式机","戴尔",2899,default,default),
(0,"imac mc886ch/a","台式机","苹果",9188,default,default),
(0,"z220sff f4f06pa","服务器/工作站","惠普",4288,default,default),
(0,"poweredge ii","服务器/工作站","戴尔",5388,default,default),
(0,"hmz-t3w","笔记本配件","索尼",6999,default,default),
(0,"商务双肩背包","笔记本配件","索尼",99,default,default);

--查询每种类型的最高价格的电脑信息
select goods.* from goods inner join
(select cate_name,max(price) as max_price 
from goods group by cate_name) as good_info
on goods.cate_name=good_info.cate_name and goods.price=good_info.max_price;

--创建商品分类表
create table if not exists goods_cates(
	id int unsigned primary key auto_increment,
	name varchar(30) not null
);

--插入cate_name列
insert into goods_cates (name) select cate_name from goods group by cate_name;

--更新goods表中的cate_name
update goods as g inner join goods_cates as c on g.cate_name=c.name set g.cate_name=c.id;

--references约束
alter table goods add foreign key (cate_id) references goods_cates(id);

--品牌分类表
create table brands(
	id int unsigned primary key auto_increment,
	name varchar(30) not null
);
insert into brands (name) select brand_name from goods group by brand_name;
update goods inner join brands on goods.brand_name=brands.name set goods.brand_name=brands.id;
alter table goods change brand_name brand_id int not null;
alter table goods add foreign key (brand_id) references brands(id);












