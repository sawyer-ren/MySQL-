--查询
	--查询所有字段
		select * from students;
		select * from classes;
	
	--查询指定字段
		select name,gender from students;
		select name as 姓名, gender as 性别 from students;
	
	--给表起别名
		select s.name,s.age from students as s;
	
	--消除重复行
		select distinct gender from students;
	
	
--条件查询
	--比较运算符
		select * from students where age>=18;
		select name,gender from students where age>=18;
		
	--逻辑运算符
		select * from students where age>=18 and age<=28;
		select * from students where age>18 and gender = 2;
		
	--模糊查询
		--like(_表示一个字符,%表示多个字符)
			select name from students where name like "小%";--“小”字开头
			select name from students where name like "%小%";--有“小”字
			select name from students where name like "__";--两个字符
			
		--rlike 正则
			select name from students where name rlike "^周.*";--周开头
			select name from students where name rlike "^周.*伦$";--周开头,伦结尾
		

	--范围查询
		select name,age from students where age in (12,18,34);
		select name,age from students where age between 18 and 34;
		
	--判断空
		select name,high from students where high is null;


--排序
	--order by

	--年龄18到34的男性，年龄从小到大排序
		select * from students where (age between 18 and 34) and gender=1 order by age asc;
	
	--年龄18到34的女性，身高从大到小排序
		select * from students where (age between 18 and 34) and gender=2 order by high desc;

	--order by 多个字段
		select * from students where (age between 18 and 34) and gender=2 order by high desc,id desc;
		select * from students order by age asc,high desc;
		
	
--聚合函数
	--总数 count
		select count(*) as 男性人数 from students where gender=1;
		select count(*) as 女性人数 from students where gender=2;
		
	--最大值 max
		select max(age) from students;
		select max(high) from students where gender=2;
		
	--最小值 min
	
	--求和 sum
		select sum(age) from students;
	
	--平均值 avg
		select avg(age) from students;
		select sum(age)/count(age) from students;
		
	--四舍五入 round
		select round(avg(age),2) from students;--保留2位
	
	
--分组
	--group by
	--根据性别分组
		select gender from students group by gender;
		select gender,count(*) from students group by gender;
		select gender,group_concat(name) from students group by gender;
	
	--计算男性人数
		select gender,count(*)  from students where gender=1 group by gender;
	
	--having
	--查询平均年龄超过30的性别，以及姓名
		select gender,group_concat(name),avg(age) from students group by gender having avg(age)>30;
	
	--每种性别中的人数多于2个的信息
		select gender,group_concat(name) from students group by gender having count(*)>2;
	

--分页
	--limit start, count
	--限制查询个数
		select * from students where gender=1 limit 2;
		select * from students where gender=2 order by age limit 0,5 ;--从第0个开始 共5个
		select * from students where gender=2 order by high desc limit 0,5;

	
--连接查询
	-- inner join ... on
		select * from students inner join classes on students.cls_id=classes.id;
		select students.*,classes.name from students inner join classes on students.cls_id=classes.id;
		select students.name,classes.name from students inner join classes on students.cls_id=classes.id order by classes.name;

	--left join
		select * from students as s left join classes as c on c.id=s.cls_id;
	

--自关联
	select * from areas as province inner join areas as city on city.pid=province.aid having atitile="山东省";
	

--子查询
	--查询最高的男生的信息
		select * from students where high=(select max(high) from students);
	
	
	
	
	
	
	
	
	
	
	
	
	
	




		