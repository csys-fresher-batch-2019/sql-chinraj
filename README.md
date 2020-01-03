# LIBRARY MANAGEMENT SYSTEM

## FEATURES
   USER SHOULD ABLE TO SEE ALL BOOKS

### FEATURES 1
   TO VIEW BOOKS INFORMATIOM
Query:

```
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
   values (1000,'SOM',460,'Senthil',500,50);
    insert into booklist(book_id,book_name,pages,author_name,price,books_available)
   values (1001,'KOM',476,'Sundar',500,50);
    insert into booklist(book_id,book_name,pages,author_name,price,books_available)
   values (1002,'DTS',434,'Senthil',500,50);
    insert into booklist(book_id,book_name,pages,author_name,price,books_available)
   values (1003,'DOM',412,'Kesava',500,50); 
     insert into booklist(book_id,book_name,pages,author_name,price,books_available)
   values (1004,'POM',365,'Jazz',500,50); 

    select * from booklist
```  
| BOOK_ID | BOOK_NAME | BOOKS_AVAILABLE | PAGES | AUTHOR_NAME | PRICE |   
|---------|-----------|-----------------|-------|-------------|-------|
| 1000    | SOM       | 50              | 460   | Senthil     | 500   |   
| 1001    | KOM       | 50              | 476   | Sundar      | 500   |   
| 1002    | DTS       | 50              | 434   | Senthil     | 500   |   
| 1003    | DOM       | 50              | 412   | Kesava      | 500   |   
| 1004    | POM       | 50              | 365   | Jazz        | 500   |   

```

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

```
| STUDENT_ID | BOOK_ID | BORROWED_DATE | DUE_DATE  | RETURN_DATE | CATAGORY    | FINES | NO_OF_EXTRA_DAYS | BOOKS_TAKEN |
|------------|---------|---------------|-----------|-------------|-------------|-------|------------------|-------------|
| 45         | 1000    | 10-OCT-19     | 20-DEC-19 | 03-JAN-20   | Mech        | 28    | 14               | 1           |
| 46         | 1001    | 10-OCT-19     | 10-DEC-19 | 03-JAN-20   | Comic       | 48    | 24               | 1           |
| 47         | 1002    | 10-OCT-19     | 02-DEC-19 | 03-JAN-20   | Journals    | 64    | 32               | 1           |
| 48         | 1003    | 10-OCT-19     | 08-DEC-19 | 03-JAN-20   | ECE         | 52    | 26               | 1           |
| 49         | 1004    | 10-DEC-19     | 10-JAN-20 | 03-JAN-20   | Programming | 0     | 0                | 1           |
```


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

```
| STUDENT_ID | BOOK_ID | STUDENT_NAME | DEPT_NAME | 
|------------|---------|--------------|-----------|
| 45         | 1000    | Anbu         | ECE       | 
| 46         | 1001    | Veera        | EEE       | 
| 47         | 1002    | Kesav        | MECH      | 
| 48         | 1003    | Vijay        | ECE       | 
| 49         | 1004    | Chin         | CSE       | 

```

------while borrowing book-----
----- to view availablity after book taken
    
update booklist bl
set bl.books_available=bl.books_available-(select bs.books_taken from book_summary bs where bs.book_id=bl.book_id)
where book_id=(select book_id from book_summary where book_id=bl.book_id); 
```
```
----while returning book of particular student----
update booklist bl
set bl.books_available=(bl.books_available+1)
where book_id=1004;
update book_summary bs
set bs.books_taken= (books_taken-1)
where student_id=49; 
```
```
select student_name,dept_name,book_name,borrowed_date,due_date,return_date,no_of_extra_days,fines,catagory, books_taken,books_available from booklist bl
inner join book_summary bs
on bl.book_id=bs.book_id
inner join student s
on s.student_id=bs.student_id

```
```
 ---for particular date how many students took book----
select *from book_summary
where borrowed_date = to_date ('2019-12-10', 'YYYY-MM-DD');

```



