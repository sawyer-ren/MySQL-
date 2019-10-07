	--登录
	mysql -u root -p
	
	--登出
	quit  exit  
	
	--显示数据库
	show databases;
	
	--显示时间
	select now();
	
	--显示版本
	show version();

	--创建数据库
	create database python04;

	--删除数据库
	drop database python04;
	
	--显示选择的数据库
	select database();
	
	--选择数据库
	use python04;
	
	--显示数据表
	show tables;
	
	--创建数据表
	create table xxxxx(id int, name varchar(30));
	create table yyyy(
		id int primary key not null auto_increment, 
		name varchar(30)
	);
	
	--显示数据表设置
	desc xxxx;
	
	--创建students表（id，name，age，high，gender，cls_id）
	create table students(
		id int unsigned primary key not null auto_increment,
		name varchar(30) default '',
		age tinyint unsigned default 0,
		high decimal(5,2),
		gender enum("男","女","中性","保密") default '保密',
		cls_id int unsigned default 0,
		is_delete bit default 0
	);

	insert into students values(0,"老王",18,188.88,"男",0);
	select * from students;
	
	--创建classes表(id,name)
	create table classes(
		id int unsigned primary key auto_increment not null,
		name varchar(30) not null
	);
	
	--修改增删字段
	alter table students add birthday datetime;
	alter table students modify birthday date;--不改名
	alter table students change birthday birth date default "1990-01-01";--改名
	alter table students drop high;
	
	--删除表格
	drop table xxxx;
	
	--查看创建方式
	show create table students;
	
	
	--增删改查(curd)
	
		--增加
	
				+--------+----------------------------+------+-----+------------+----------------+
			| Field  | Type                       | Null | Key | Default    | Extra          |
			+--------+----------------------------+------+-----+------------+----------------+
			| id     | int(10) unsigned           | NO   | PRI | NULL       | auto_increment |
			| name   | varchar(30)                | YES  |     | NULL       |                |
			| age    | tinyint(3) unsigned        | YES  |     | NULL       |                |
			| gender | enum('男','女','中性')     | YES  |     | NULL       |                |
			| cls_id | int(10) unsigned           | YES  |     | NULL       |                |
			| birth  | date                       | YES  |     | 1990-01-01 |                |
			+--------+----------------------------+------+-----+------------+----------------+
			--增加
			insert into classes values(0,"菜鸟班");
			insert into students values(0,"赵四",20,"男",1,"1990-01-01");
			insert into students values(null,"赵四",20,"男",1,"1990-01-01");
			insert into students values(default,"赵四",20,"男",1,"1990-01-01");
			insert into students values(default,"赵四",20,1,1,"1990-01-01");
			
			--部分插入
			insert into students(name,gender) values ("小乔",2);
			
			--多行插入
			insert into students(name,gender) values ("小乔",2),("貂蝉",2);
			insert into students values (),();
		
		--修改
			
			update students set gender=1 where name="老李";
			update students set cls_id=1 where id=4;
			
			update students set gender=2,age=18 where id=5;
	
		--查询基本使用
		
			--所有列
			select * from students;
			select * from students where id<3;
			
			--查询指定列
			select name,gender from students;
			select name as 姓名,gender as 性别 from students;
			
		--删除
			
			--物理删除
			delete from students where id=2;
			
			--逻辑删除
			alter table students add is_delete bit default 0;
	
	insert into students values
	(0,"小明",18,180.00,2,1,0),
	(0,"小月月",18,180.00,2,2,1),
	(0,"彭于晏",29,185.00,1,1,0),
	(0,"刘德华",59,175.00,1,2,1),
	(0,"黄蓉",38,160.00,2,1,0),
	(0,"凤姐",28,150.00,4,2,1),
	(0,"王祖贤",18,172.00,2,1,1),
	(0,"周杰伦",36,null,1,1,0),
	(0,"陈坤",27,181.00,1,2,0),
	(0,"刘亦菲",25,166.00,2,2,0),
	(0,"金星",33,162.00,3,3,1),
	(0,"静香",12,180.00,2,4,0),
	(0,"郭靖",12,170.00,1,4,0),
	(0,"周杰",34,176.00,2,5,0);
	
	
	
	
	
	
