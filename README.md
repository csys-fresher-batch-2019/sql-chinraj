# LIBRARY MANAGEMENT SYSTEM

## FEATURES
 ### Availablity of book
       After student taken book
       Before student taken book
       Fine amount of the student 
       For a particular date how many books 
       Student who taken the book on particular  date


### FEATURES 1
  Availablity of book


```sql
create table booklist( 
   book_id number  primary key,
   book_name varchar2(100) not null,
   books_available number not null,
   pages number not null,
   author_name varchar2(100) not null,
   price number,
   constraints pages_num check(pages>0),
   constraint price_pri check (price>=0)
   );
   
  insert into booklist(book_id,book_name,pages,author_name,price,books_available)
   values (1000,'SOM',40,'Senthil',500,50);
    insert into booklist(book_id,book_name,pages,author_name,price,books_available)
   values (1001,'KOM',46,'Sundar',500,50);
    insert into booklist(book_id,book_name,pages,author_name,price,books_available)
   values (1002,'DTS',43,'Senthil',500,50);
    insert into booklist(book_id,book_name,pages,author_name,price,books_available)
   values (1003,'DOM',42,'Kesava',500,50); 
     insert into booklist(book_id,book_name,pages,author_name,price,books_available)
   values (1004,'POM',65,'Jazz',500,50); 

    select * from booklist

| BOOK_ID | BOOK_NAME | BOOKS_AVAILABLE | PAGES | AUTHOR_NAME | PRICE |   
|---------|-----------|-----------------|-------|-------------|-------|
| 1000    | SOM       | 50              | 40    | Senthil     | 500   |   
| 1001    | KOM       | 50              | 46    | Sundar      | 500   |   
| 1002    | DTS       | 50              | 43    | Senthil     | 500   |   
| 1003    | DOM       | 50              | 42    | Kesava      | 500   |   
| 1004    | POM       | 50              | 65    | Jazz        | 500   |   
```
## FEATURE 2 BOOK SUMMARIZATION
```sql
----creating book_summary
   create table book_summary(
   student_id number primary key,
   book_id number not null,
   borrowed_date  date not null,
   due_date date not null,
   return_date date ,
   catagory varchar2(30),
   fines number,
   no_of_extra_days number,
   books_taken number not null,
   constraint book_id_uni unique(book_id)
   );
   
---- insert query of book_summary
insert into book_summary(student_id,book_id,borrowed_date,due_date,return_date,catagory, books_taken )
values(45,1000,to_date ('2019-10-10', 'YYYY-MM-DD'),to_date('2019-12-20', 'YYYY-MM-DD'),sysdate,'Mech',1);
insert into book_summary(student_id,book_id,borrowed_date,due_date,return_date,catagory,books_taken)
values(46, 1001,to_date('2019-10-10', 'YYYY-MM-DD'),to_date('2019-12-10', 'YYYY-MM-DD'),sysdate,'Comic',1);
insert into book_summary(student_id,book_id,borrowed_date,due_date,return_date,catagory ,books_taken )
values(47, 1002,to_date ('2019-10-10', 'YYYY-MM-DD'),to_date('2019-12-02', 'YYYY-MM-DD'),sysdate,'Journals',1);
insert into book_summary(student_id,book_id,borrowed_date,due_date,return_date,catagory, books_taken )
values(48, 1003,to_date ('2019-10-10', 'YYYY-MM-DD'),to_date('2019-12-08', 'YYYY-MM-DD'),sysdate,'ECE',1);   
insert into book_summary(student_id,book_id,borrowed_date,due_date,return_date,catagory, books_taken )
values(49,1004, to_date ('2019-12-10', 'YYYY-MM-DD'),to_date('2020-01-10', 'YYYY-MM-DD'),sysdate,'Programming',1);

------ update query of book_summary
 UPDATE book_summary
SET fines = 2* trunc( sysdate-due_date);

--- fine = Rs 2 per day

update book_summary
set no_of_extra_days = trunc( sysdate-due_date);

update book_summary
set fines=0 , no_of_extra_days=0
where trunc( sysdate-due_date) <=0;

| STUDENT_NAME | DEPT_NAME | BOOK_NAME | BORROWED_DATE | DUE_DATE  | NO_OF_EXTRA_DAYS | FINES | CATAGORY    | BOOKS_TAKEN |
|--------------|-----------|-----------|---------------|-----------|------------------|-------|-------------|-------------|
| Anbu         | ECE       | SOM       | 10-OCT-19     | 20-DEC-19 | 14               | 28    | Mech        | 1           |
| Veera        | EEE       | KOM       | 10-OCT-19     | 10-DEC-19 | 24               | 48    | Comic       | 1           |
| Kesav        | MECH      | DTS       | 10-OCT-19     | 02-DEC-19 | 32               | 64    | Journals    | 1           |
| Vijay        | ECE       | DOM       | 10-OCT-19     | 08-DEC-19 | 26               | 52    | ECE         | 1           |
| Chin         | CSE       | POM       | 10-DEC-19     | 10-JAN-20 | 0                | 0     | Programming | 1           |
```
```sql
  create table student (
   student_id number primary key,
    book_id number not null,
    student_name varchar2(30)not null,
    dept_name varchar2(30) not null
   
   );
    ---- insert query of student
 insert into student(student_id,book_id,student_name,dept_name)
 values(45,1000,'Anbu','ECE');
 insert into student(student_id,book_id,student_name,dept_name)
 values(46,1001,'Veera','EEE');
 insert into student(student_id,book_id,student_name,dept_name)
 values(47,1002,'Kesav', 'MECH');
 insert into student(student_id, book_id,student_name,dept_name)
 values(48,1003,'Vijay', 'ECE');
  insert into student(student_id, book_id,student_name,dept_name)
 values(49,1004,'Chin', 'CSE');
 
select * from student

```sql
| STUDENT_ID | BOOK_ID | STUDENT_NAME | DEPT_NAME | 
|------------|---------|--------------|-----------|
| 45         | 1000    | Anbu         | ECE       | 
| 46         | 1001    | Veera        | EEE       | 
| 47         | 1002    | Kesav        | MECH      | 
| 48         | 1003    | Vijay        | ECE       | 
| 49         | 1004    | Chin         | CSE       | 

```sql

------while borrowing book-----
----- to view availablity after book taken
    
update booklist bl
set bl.books_available=bl.books_available-(select bs.books_taken from book_summary bs where bs.book_id=bl.book_id)
where book_id=(select book_id from book_summary where book_id=bl.book_id); 
```

```sql
----while returning book of particular student----
update booklist bl
set bl.books_available=(bl.books_available+1)
where book_id=1004;
update book_summary bs
set bs.books_taken= (books_taken-1)
where student_id=49; 

| STUDENT_NAME | DEPT_NAME | BOOK_NAME | BORROWED_DATE | DUE_DATE  | NO_OF_EXTRA_DAYS | FINES | CATAGORY    | BOOKS_TAKEN |
|--------------|-----------|-----------|---------------|-----------|------------------|-------|-------------|-------------|
| Anbu         | ECE       | SOM       | 10-OCT-19     | 20-DEC-19 | 14               | 28    | Mech        | 1           |
| Veera        | EEE       | KOM       | 10-OCT-19     | 10-DEC-19 | 24               | 48    | Comic       | 1           |
| Kesav        | MECH      | DTS       | 10-OCT-19     | 02-DEC-19 | 32               | 64    | Journals    | 1           |
| Vijay        | ECE       | DOM       | 10-OCT-19     | 08-DEC-19 | 26               | 52    | ECE         | 1           |
| Chin         | CSE       | POM       | 10-DEC-19     | 10-JAN-20 | 0                | 0     | Programming | 0           |             

```sql      |
select student_name,dept_name,book_name,borrowed_date,due_date,return_date,no_of_extra_days,fines,catagory, books_taken,books_available from booklist bl
inner join book_summary bs
on bl.book_id=bs.book_id
inner join student s
on s.student_id=bs.student_id

 ---for particular date how many students took book----
select student_id, book_id, borrowed_date,due_date,catagory,books_taken from book_summary
where borrowed_date = to_date ('2019-12-10', 'YYYY-MM-DD');

|STUDENT_ID	|BOOK_ID |BORROWED_DATE| DUE_DATE |	CATAGORY    |FINES |  NO_OF_EXTRA_DAYS |	BOOKS_TAKEN|
|-----------|--------|-------------|----------|-------------|------|-------------------|--------------|
|49	      | 1004   |10-DEC-19	  |10-JAN-20 |  Programming|	0   |       0           |	1           |
```





