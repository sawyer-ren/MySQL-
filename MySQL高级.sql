	--三张表结合
	select g.*,c.name as cate_name,b.name as brand_name from goods as g left join
	goods_cates as c on g.cate_id=c.id left join brands as b on
	g.brand_id=b.id;
	
	--创建视图
	create view v_goods_info as select g.*,c.name as cate_name,b.name as brand_name from goods as g left join
	goods_cates as c on g.cate_id=c.id left join brands as b on
	g.brand_id=b.id;
	
	--开启事务
	start transaction;
	
	update goods set name="小霸王学习机" where id = 2;
	commit;
	
	--建立索引
	create index title_index on test_index(title(10));
	
	--查看索引
	show index from test_index;
	
	--备份
	mysqldump -u root -p jing_dong > jd.sql
	mysqldump -u root -p --all-databases --lock-all-tables > ~/master_db.sql
	
	--回复
	mysql -u root -p jd < jd.sql
	mysql -u root -p < master_db.sql