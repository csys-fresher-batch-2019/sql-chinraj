# LIBRARY MANAGEMENT SYSTEM

## FEATURES
 ### 
 Add Books
 View Books
 Remove Books
 Add Students
 Remove Students
 Borrow Book
 Mail for Students
 Fine Detect By using Id

### FEATURES 1
 Add Books


```sql

create table booklist( 
   ISBN number  primary key,
    book_name varchar2(100)not null,
   pages number not null,
   author_name varchar2(100) not null, 
   publication varchar2(100),
   released_date date ,
   price number,
   category varchar2(50),
   book_status varchar2(100) default 'Available',
   rack_no number not null,
   constraints book_status check(book_status in ('Available','Notavailable')),
   constraints pages_num check(pages>0),
   constraint price_pri check (price>=0)
   );
  
  
  
  insert into booklist(ISBN,book_name,pages,author_name,publication,released_date,price,category,rack_no)
   values (9781234678900,'Wings of fire',460,'A.P.J.Abdul Kalam','Universities Press',to_date ('2020-02-10', 'YYYY-MM-DD'),500,'science',1);
    insert into booklist(ISBN,book_name,pages,author_name,publication,released_date,price,category,rack_no)
   values (978123467892,'Harry Potter ',467,'J.K.Rowling','New Century Book House',to_date ('2020-02-15', 'YYYY-MM-DD'),500,'fantasy',2);


    select * from booklist

```
## FEATURE 2 
Add Students
```sql


create table student(
   student_id number primary key,
   student_name varchar2(50),
   dept_name varchar2(40),
   mail_id varchar2(100)unique
   );
   
insert into student(student_id,student_name,dept_name,mail_id)
values(2020,'chin','MECH','chinraj044@gmail.com');
insert into student(student_id,student_name,dept_name,mail_id)
values(2021,'anbu','CSE','anbuarasu984@gmail.com');

select * from student

```
```sql

   create table book_summary(
   student_id number ,
   ISBN number unique ,
   borrowed_date  date not null,
   renewal_count number default 0,
   due_date date not null,
   return_date date ,
   status varchar2(30) default 'Notreturned',
   constraint renewal_count_cq check (renewal_count<=2),
   constraints status check(status in ('Returned','Notreturned')),
   constraint student_id_FK foreign key(student_id) references  student(student_id),
  constraint ISBN_fw foreign key(ISBN) references booklist(ISBN)
   );
   
insert into book_summary(student_id,ISBN,borrowed_date,due_date)
values(2020,9781234678900,to_date ('2020-02-01', 'YYYY-MM-DD'),to_date('2020-02-10', 'YYYY-MM-DD'));

select * from book_summary



```sql

create table amount (
student_id number unique ,
amount_in_id number default 0,
library_wallet number default 0,
constraint student_id_kf foreign key(student_id) references  student(student_id)
);
insert into amount(student_id,amount_in_id)
values(2020,500);

select * from amount


```sql      |

create table fine_amount(
  student_id  number,
  ISBN number ,  
  fines_per_day number ,
  no_of_extra_days number default 0,
  fines number default 0,
 
   constraint student_id_pq foreign key(student_id) references student (student_id),
   constraint ISBN_kq foreign key(ISBN) references  booklist(ISBN)
  );

alter table fine_amount
 add fine_status varchar2(40) default 'unpaid'
 add lost_penality number default 0

  insert into fine_amount(student_id,ISBN,fines_per_day)
  values(46,9781234678900,2);

select * from fine_amount

```sql
