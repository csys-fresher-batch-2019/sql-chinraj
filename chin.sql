create table task(
task_name varchar2(30),
done_by varchar2(30),
deadline date,
done_on date,
status varchar2(20)
);
insert into task (task_name, done_by, deadline, done_on,status)
values('instal oracle','naresh',to_date('26-12-2019','dd-MM-yyyy'),to_date('25-12-2019','dd-MM-yyyy'),'completed');
insert into task (task_name, done_by, done_on,status)
values('instal jdk','siva',to_date('20-01-2020','dd-MM-yyyy'),'incomplete');
select* from task;
