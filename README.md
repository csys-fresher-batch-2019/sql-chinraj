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
	pages number  not null,
   author_name varchar2(100) not null,
   price number not null,
   constraints pages_cq check(pages>0),
   constraint price_cq check (price>=0)
   );
   
### insert query
 
 insert into booklist(book_id,book_name,pages,author_name,price)
   values (1000,'SOM',465,'senthil',500);
    insert into booklist(book_id,book_name,pages,author_name,price)
   values (1001,'KOM',465,'sundar',500);
    insert into booklist(book_id,book_name,pages,author_name,price)
   values (1002,'DTS',465,'senthil',500);
    insert into booklist(book_id,book_name,pages,author_name,price)
   values (1003,'DOM',465,'sundar',500);   
   
```  
 
