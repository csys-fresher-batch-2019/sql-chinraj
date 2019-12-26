drop table task;
create table task(
task_name varchar2(30),
done_by varchar2(30),
deadline date default to_date('26-12-2019','dd-MM-yyyy'),
done_on date,
status varchar2(20)
);
insert into task (task_name, done_by, done_on)
values('instal oracle','naresh',to_date('25-12-2019','dd-MM-yyyy'));
insert into task (task_name, done_by, done_on)
values('instal jdk','siva',to_date('28-01-2020','dd-MM-yyyy'));
update task
set status='complete'
where deadline>=done_on;
update task
set status='incomplete'
where deadline<done_on;
select* from task;
