create database wayne;
show databases;
use sakila;
desc customer;

select first_name,last_name
from customer
where last_name = 'ZIEGLER';

select * 
from category;

select * 
from language;

select language_id , last_update
from language;

select name 
from language;


select last_update
from language;

select language_id,
'COMMON' language_usage,
language_id * 3.1415927 lang_pi_value,
upper(name) language_name
from language;

select version(),
user(),
database();


------------- ALIASES---------------
select language_id,
'COMMON' AS language_usage,
language_id * 3.1415927 AS lang_pi_value,
upper(name) AS language_name
from language;

--------------------- Removing Duplicates ----------------------

select actor_id 
from film_actor 
order by actor_id;


Select distinct actor_id 
from film_actor 
order by actor_id;


----------------------------- Sub-Query------------------------
select concat(cust.last_name, ',',cust.first_name)
full_name
from(select first_name, last_name,email
from customer 
where first_name ='JESSIE')
cust;


-------------------------- TEMPORARY TABLE-----------------
Although the implementations differ, every relational database allows
the ability to define volatile, or temporary, tables. These tables look 
just like permanent tables, but any data inserted into a temporary
table will disappear at some point (generally at the end of a
transaction or when your database session is closed). Here’s a simple
example showing how actors whose last names start with J can be
created


Create Temporary Table actors_j
(actor_id smallint(5),
first_name varchar(45),
last_name varchar(45));


Insert into actors_j
select actor_id, first_name,last_name
from actor
where last_name like 'J%';

select *
from actors_j;

/* ----------------- VIEW -----------------*/
/* A view is a query that is stored in the data dictionary. It looks and
acts like a table, but there is no data associated with a view (this is
why I call it a virtual table). When you issue a query against a view,
your query is merged with the view definition to create a final query
to be executed.*/

create view cust_vm as
select customer_id, first_name, last_name , active
from customer;

select first_name, last_name
from cust_vm
where active = 0;


/* --------------------- JOINS IN SQL -----------------------*/
Select customer.first_name , customer.last_name,
time(rental.rental_date) rental_time
from customer
inner join rental
on customer.customer_id = rental.customer_id
where date(rental.rental_date) = '2005-06-14';


select c.first_name, c.last_name,
time(r.rental_date) rental_time
from customer c
inner join rental r
on c.customer_id = r.customer_id
where date(r.rental_date) = '2005-06-14';


select c.first_name, c.last_name,
time(r.rental_date) rental_time
from customer as c
inner join rental as r
on c.customer_id = r.customer_id
where date(r.rental_date) = '2005-06-14';

select title 
from film
where rating = 'G' and rental_duration >=7;

select title 
from film
where rating = 'G' or rental_duration >=7;

select title, rating, rental_duration
from film
where (rating = 'G' and rental_duration >=7)
or ( rating = 'PG-13' and rental_duration <4);


/* -------------------------------------- GROUP BY AND HAVING CLAUSE ------------------------ */

/* --------- For example, let’s say you wanted to find all of the customers who
have rented 40 or more films. Rather than looking through all 16,044
rows in the rental table, you can write a query which instructs the
server to group all rentals by customer, count the number of rentals
for each customer, and then return only those customers whose rental
count is at least 40. When using the group by clause to generate
groups of rows, you may also use the having clause, which allows
you to filter grouped data in the same way the where clause lets you
filter raw data. */

select c.first_name, c.last_name, count(*)
from customer c
inner join rental r
on c.customer_id = r.customer_id
group by c.first_name, c.last_name
having count(*) >=40;



/* ----- ORDER BY CLAUSE */

/* --- The order by clause is the mechanism for sorting your result set
using either raw column data or expressions based on column data */

select c.first_name,c.last_name,
time(r.rental_date) rental_time
from customer c
inner join rental r
on c.customer_id = r.customer_id
where date(r.rental_date) = '2005-06-14';

select c.first_name,c.last_name,
time(r.rental_date) rental_time
from customer c
inner join rental r
on c.customer_id = r.customer_id
where date(r.rental_date) = '2005-06-14'
order by c.last_name;


select c.first_name,c.last_name,
time(r.rental_date) rental_time
from customer c
inner join rental r
on c.customer_id = r.customer_id
where date(r.rental_date) = '2005-06-14'
order by c.last_name,c.first_name;


/* Ascending Versus Descending Sort Order*/

select c.first_name,c.last_name,
time(r.rental_date) rental_time
from customer c
inner join rental r
on c.customer_id = r.customer_id
where date(r.rental_date) = '2005-06-14'
order by time(r.rental_date) desc;


/* Test Your Knowledge*/

/* 1.Retrieve the actor ID, first name, and last name for all actors. Sort by
last name and then by first name. */

show tables;
select actor_id,first_name, last_name
from actor
order by first_name,last_name;

/* 2. Retrieve the actor ID, first name, and last name for all actors whose
last name equals 'WILLIAMS' or .'DAVIS' */

select actor_id,first_name,last_name
from actor
where last_name = 'WILLIAMS' or 'DAVIS';

/* 3. Write a query against the rental table that returns the IDs of the
customers who rented a film on July 5th 2005 (use the
rental.rental_date column, and you can use the date()
function to ignore the time component). Include a single row for each
distinct customer ID. */
show tables;
desc rental;
select rental_id
from rental
where date(rental_date) = '2005-07-05';



select c.email, r.return_date
from customer c
inner join rental r
on c.customer_id = r.customer_id
where date(r.rental_date) = '2005-06-14'
order by email, return_date desc;