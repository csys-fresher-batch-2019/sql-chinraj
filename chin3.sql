drop table task;
create table task(
emp_id int,
task_name varchar2(30),
done_by varchar2(30),

deadline date default to_date('26-12-2019','dd-MM-yyyy'),
done_on date,
status varchar2(20)
);
insert into task (emp_id, task_name, done_by, done_on)
values('1','instal oracle','naresh',to_date('25-12-2019','dd-MM-yyyy'));
insert into task (emp_id, task_name, done_by, done_on)
values('1','instal bpo','naresh',to_date('25-12-2019','dd-MM-yyyy'));

insert into task (emp_id, task_name, done_by, done_on)
values('2','instal oracle','naresh',to_date('12-12-2019','dd-MM-yyyy'));
insert into task (emp_id, task_name, done_by)
values('3','instal jdk','siva');
update task
set status='success'
where deadline>=done_on;
update task
set status='pending '
where deadline<done_on or done_on is null;
select* from task
order by task_name asc ;
