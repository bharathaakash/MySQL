create database db;
use db;
create table employee(
emp_id int,
emp_name varchar(20),
salary int,
location varchar(20));

describe employee;
insert into employee values(1,'bharatrh',3000,'chennai');
select * from employee;
insert into employee (salary,emp_name) values(5000,'rahul');

select * from employee;
select emp_name,salary from employee;
select emp_name ep,salary*2 sal from employee;

select * from employee;
delete from employee where emp_name = 'rahul';
select * from employee;
insert into employee values (4,'inder',100000,'salem');

select * from employee where salary > 5000;
select * from employee where location = 'chennai';
select * from employee;
insert into employee values(4,'inder',100000,'salem');
select distinct * from employee;
insert into employee values(4,'inder',200,'salem');
select * from employee where emp_name = 'sanjai';

select * from employee;
select * from employee where salary > 3000 and location = 'salem';
select * from employee where salary < 5000 or location = 'chennai';
select * from employee where not salary >=100000;

select * from employee;
select * from employee where location between 'chennai' and 'salem';
select *from employee where location not between 'coimbatore' and 'salem';
select *from employee where salary not between 200 and 5000;
select *from employee where salary between 200 and 5000;
Select *from employee where salary in (200,5000);
select *from employee where salary not in (200,5000);

select *from employee;
select *from employee where emp_name like 'r%';
select *from employee where emp_name like '%i';
select *from employee where emp_name like '%i%';
select *from employee where emp_name like 'i%r';
select *from employee where emp_name not like 'i%';
select *from employee where emp_name like '%e_';
select *from employee where emp_name not like '%r_';
select *from employee where emp_name like '_av_';

select *from employee;
alter table employee add column position varchar(20);
alter table employee drop column position;
alter table employee modify column emp_name varchar(50);          -- change only datatype 
alter table employee change column emp_name e_name varchar(20);   -- change both name and datatype
alter table employee rename column emp_id to e_id;                -- change only the column name


select *from employee;

set autocommit=0;
set sql_safe_updates=0;

select *from employee;
delete from employee;
rollback;

rename table employee to workers;
rename table workers to employee;

insert into employee values(8,'kuppu',70000,'coimbatore');
select *from employee;
update employee set location = 'chennai' where emp_name = 'rahul';
update employee set e_id = '2' where emp_name = 'rahul';
delete from employee;
rollback;
delete from employee where e_id = 1; 
rollback;
delete from employee where e_id =1; 
update employee set location = null where e_id =1;

select *from employee;
select upper(emp_name) from employee;
select upper(emp_name) emplo from employee;
select lower(emp_name) emplo from employee;
select length(emp_name) from employee;
select *from employee where length(emp_name)=4;
select trim(' bharath  ');
select trim('z' from 'zzbharzathzz');
select substr('bharath',2,4);
select substr('bharath',2);
select *from employee;
select substr(emp_name,3,3) from employee;
select concat('bharath','akash');
select concat_ws(',','bharath',20,'gollahalli');


select *from employee;
select abs(-40);
select abs(40);
select sqrt(49);
select mod(10,3);
select power(2,3);

select truncate(12.345,1);
select truncate(12.3456,3);
select truncate(6547,-1);
select truncate(6547,-2);
select truncate(12.345,-1);
select truncate(12345.987,-3);

select greatest(10,13,8,67);
select least(10,13,8,67);

select *from employee;


select curdate();
select curtime();
select now();
select sysdate();
select day('2002-05-22');
select month('2002-05-22');
select year('2002-05-22');

select *from employee;
select sum(salary) from employee;
select avg(salary) from employee;
select max(salary) from employee;
select min(salary) from employee;
select count(*) from employee;

select * from employee;
create table department (dep_name varchar(10),dep_id int , e_id int);
describe department;


set sql_safe_updates =0;
delete from employee;

describe employee;
insert into employee values(105,'diwakar',10000,'vellore');
select * from employee;
describe department;
insert into department values('ece',202);
select *from department;
describe employee;

select *from employee;
select salary from employee group by dep_id;
use db;
select dep_id,sum(salary) from employee group by dep_id;
select *from employee;
select dep_id,max(salary),min(salary) from employee group by dep_id;
select e_id ,dep_id,count(*) from employee group by dep_id , e_id;

select dep_id,sum(salary) as salary from employee group by dep_id having salary>10000;
select *from employee;
select dep_id,sum(salary) from employee where dep_id <> 202 group by dep_id having sum(salary)>1000;
select dep_id,sum(salary) from employee where dep_id <> 202 group by dep_id having sum(salary)>1000 order by sum(salary) desc;


select *from employee;
select *from department;

select dep_id from employee union select dep_id from department;
select * from employee order by emp_name;


select dep_id from employee union select dep_id from department;
select 'bharath',dep_id from employee union select 'ravi',dep_id from department;

select dep_id from employee union all select dep_id from department;
select 'bharath',dep_id from employee union all select 'ravi',dep_id from department;

select * from employee;
select * from department;

-- cartesian takes place here.
select emp_name, employee.dep_id from employee,department;
select emp_name, department.dep_id from employee,department;
select *from employee;
select max(salary) from employee where salary < (select max(salary) from employee); 

-- joins
select *from employee;
select *from department;
select *from employee e,department d where e.dep_id = d.dep_id;
select e.emp_name,d.dep_name,e.dep_id from employee e inner join department d on e.dep_id = d.dep_id;
select e.emp_name,d.dep_name,e.dep_id from employee e,department d where e.dep_id = d.dep_id;
select *from employee e right join department d on e.dep_id = d.dep_id;
select *from employee e left join department d on e.dep_id = d.dep_id;
select *from employee e cross join department d on e.dep_id = d.dep_id; -- not applicable on mysql -- wrong answer

-- self join
select *from employee;
select e.emp_name,e.location from employee e,employee m where e.e_id <> m.e_id and e.location = m.location; -- employ from same city

-- sub query
select * from employee;
select max(salary) from employee where salary < (select max(salary) from employee); -- second highest salary


-- in , all , any for multi value sub query
select emp_name from employee where salary in (select salary from employee where salary between 5000 and 50000);
select emp_name,salary from employee where salary <any(select salary from employee where salary between 5000 and 50000);
select emp_name,salary from employee where salary <all(select salary from employee where salary between 5000 and 50000);


-- group by

select *from employee;
select avg(salary),dep_id from employee group by dep_id;        -- multiple value
select avg(salary),dep_id from employee where dep_id = 201;     -- single value

-- integrity constrints

select *from employee;
select *from department;

alter table department modify column dep_name varchar(10) not null;
describe department;
select *from department;
set sql_safe_updates =0;
delete from department where dep_id = 205;
insert into department values(null,205);     -- not null

alter table department modify column dep_id int unique;
describe department;
select *from department;
insert into department values('it',204);          -- unique
insert into department values('it',null);         -- multiple null value accepted
insert into department values('ice',null);
select *from department;

-- primary and foreign key 

select *from employee;
select *from department;
alter table department modify column dep_id int primary key;
describe department;
insert into department values('cse',201);  -- duplicate entry
alter table employee add constraint dep_idfk foreign key(dep_id) references department(dep_id);  -- not working
alter table employee add constraint dep_idfk foreign key(dep_id) references department(dep_id) on delete cascade;
describe employee;



-- check constraint
select *from employee;
alter table employee modify column salary int check(salary between 500 and 100000);
describe employee;
insert into employee values(107,'harish',200,'namakal',203); -- constraint voilated
select *from employee;
alter table employee modify column location varchar(50) check(location in('chennai','salem','madurai','vellore','erode'));
insert into employee values(107,'harish',4000,'mumbai',201); -- constraint voialated

-- default constraint
select now();
create table orders(od_id int,date_time datetime);
alter table orders modify column date_time datetime default now();
insert into orders(od_id)values(101);
insert into orders(od_id)values(102);
select *from orders;

use db;
create table school(st_id int , class varchar(10), marks int default 50);
insert into school values (1,'cse',200);
select *from school;
insert into school values(2,'ece',300);
insert into school(st_id,class)values(3,'it');

-- auto incerment 
create table school(s_id int, st_name varchar(10));
alter table school modify column s_id int primary key auto_increment;
insert into school (st_name) values('kuppu');
alter table school auto_increment = 101;
delete from school where st_name = 'kuppu';
select *from school;
drop table school;

-- views 
select *from employee;
create table workers as select emp_name,location from employee;  -- another way to create table
select *from workers;
drop table workers;
create view workers as select *from employee;
describe workers;
describe employee;
alter table employee add constraint primary key(e_id);   
select *from workers;
insert into workers values(107,'kuppu',3000,'dharmapuri',207);

-- values inserted on view does not shows on original table but inserted in original table shows on view.


-- limit
select *from employee;
select *from employee limit 5;
select *from employee limit 3,2;

-- with clause
use db;
select *from employee;
select emp_name,salary from employee where salary > (select avg(salary) from employee); -- its impossible to print avg(salary) column in select 
select emp_name,salary,(select avg(salary) from employee) from employee where salary > (select avg(salary) from employee);

with workers as (select avg(salary) as average from employee) -- by using with clause we can print the avg(salary) as a 
-- with workers(average) as (select avg(salary) from employee) both give the same result..
select *from workers;


-- to find employee whose salary is greater than average salary of all the employee by using with clause .. 
with workers(avg_sal) as (select avg(salary) from employee)
select emp_name,salary,avg_sal from employee,workers where salary > avg_salary;

with workers(avg_salary) as (select avg(salary) from employee)
select e.emp_name,e.salary,w.avg_salary from employee e,workers w where e.salary > w.avg_salary;

-- window function
select *from employee;
insert into employee values(108,'eniya',2500,'dharmapuri',203);
select max(salary),min(salary),dep_id from employee group by dep_id;

use db;
select *,salary from employee;









































































