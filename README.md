# LIBRARY MANAGEMENT SYSTEM

## FEATURES
   USER SHOULD ABLE TO SEE ALL BOOKS

### FEATURES 1
   TO VIEW BOOKS INFORMATIOM

create table booklist( 
   book_id int  primary key,
   book_name varchar2(90) not null,
	pages int  not null,
   author_name varchar2(50) not null,
   price int not null,
   constraint price_cq check (price>=0)
   );
	
  
 
