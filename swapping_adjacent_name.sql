-- table data
drop table if exists students;
create table students
(
id int primary key,
student_name varchar(50) not null
);
insert into students values
(1, 'James'),
(2, 'Michael'),
(3, 'George'),
(4, 'Stewart'),
(5, 'Robin');

select * from students;

-- query to swap the adjacent names

with naing as (select *, ntile(3) over() as ok from students),
	haming as (  select *, 
			     last_value(student_name) over(partition by ok) as yum, 
			     first_value(student_name) over( partition by ok ) yumm from naing),
	hamingg as ( select *, 
				case when id % 2 != 0 then yum else yumm end as okk from haming )
	
select id, student_name, okk as new_student_name from hamingg