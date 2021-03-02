/* Data Generation, Manipulation, and Conversion */

/* String Generation */
create table string_tbl
(char_fld char(30),
vchar_fld varchar(30),
text_fld text);

insert into string_tbl(char_fld,vchar_fld,text_fld)
values('This is char data',
'This is varchar data',
'This is text data');

select vchar_fld
from string_tbl;

select length(char_fld) char_length,
length(vchar_fld) varchar_length,
length(text_fld) text_field
from string_tbl;

use sakila;
select name,name like '%y' ends_in_y
from category;

/* CONCAT() */
select concat(first_name, ' ',last_name,
'has been a customer since',date(create_date)) cust_narrative
from customer;


select (37*59) /(78 - (8*6));

select mod(10,4);

select pow(2,8);

select pow(2,10) kilobye, pow(2,20) megabyte ,pow(2,30) gigabytes, pow(2,40) terabyte;

select ceil(72.445), floor(72.456);

SELECT ROUND(72.49999), ROUND(72.5), ROUND(72.50001);

SELECT ROUND(72.0909, 1), ROUND(72.0909, 2), ROUND(72.0909, 3);

SELECT TRUNCATE(72.0909, 1), TRUNCATE(72.0909, 2),TRUNCATE(72.0909, 3);

SELECT CURRENT_DATE(), CURRENT_TIME(), CURRENT_TIMESTAMP();

SELECT DATE_ADD(CURRENT_DATE(), INTERVAL 5 DAY);
