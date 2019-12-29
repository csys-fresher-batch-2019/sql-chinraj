   CREATE TABLE BOOK (
    book_id int NOT NULL primary key,
    book_Name varchar(255) NOT NULL unique,
    author_Name varchar(255),
    price int,
    constraint price_cq check(price>=0),
    publisher varchar(100) not null,
catogory varchar(100),
active varchar(100),
constraint active_cq check(active in('y','n'))
  
);
insert into book(book_ID,book_name,author_name,price,publisher, catogory,active)
values (2016,'the mystry', 'anbu',420,' chin','books','y');
   create table orders(
   order_id int not null primary key,
   username varchar2(100),
   book_id int not null,
   total_amount int,
   quantity int,
   order_date timestamp not null,
   delivery_date timestamp not null,
   constraints book_id_fk foreign key (book_id)references BOOK(book_id),
   status varchar2(100) default 'pending',
   constraints status_cq check(status in ('delivered','ordered','pending')),
   comments varchar2(200),
   constraint amt_cq_ check (total_amount>=0)
   );
 insert into orders(order_ID,username,book_id,total_amount,quantity, order_date, delivery_date, comments)
 values(2002,'chinn',2016,2000,2,sysdate,sysdate,'qwe');
    insert into orders(order_ID,username,book_id,total_amount,quantity, order_date, delivery_date,status, comments)
 values(2001,'chinn',2016,2000,2,sysdate,sysdate,'delivered','qwe');
SELECT* FROM ORDERS
select* 
from book b
inner join orders o
on b.book_id=o.book_id
