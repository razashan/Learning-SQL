/*Filtering */
show databases;
use sakila;

select c.email
from customer c
inner join rental r
on c.customer_id = r.customer_id
where date(r.rental_date) = '2005-06-14';

select c.email
from customer c
inner join rental r
on c.customer_id = r.customer_id
where date(r.rental_date) <> '2005-06-14';

select customer_id, rental_date
from rental
where rental_date < '2005-06-14';

select customer_id,rental_date
from rental
where rental_date <= '2005-06-16'
and rental_date >= '2005-06-14';


select customer_id , rental_date
from rental
where rental_date between '2005-06-14' and '2005-06-16';


select customer_id, payment_date,amount 
from payment
where amount between 10.0 and 11.99;

select last_name, first_name
from customer
where last_name between 'FA' and 'FR';

select last_name,first_name
from customer
where last_name between 'FA' and 'FRB';

select title,rating
from film
where rating = 'G' or rating ='PG';

select title, rating
from film
where rating in ('G','PG');

select title,rating
from film
where rating in (Select rating from film where title LIKE '%PET%');

select title,rating
from film
where rating Not in ('PG-13','R','NC-17');

select last_name, first_name
from customer
where left(last_name,1) = 'Q';


select last_name,first_name
from customer
where last_name LIke '_A_T%S';

select last_name,first_name
from customer
where last_name LIKE 'Q%' OR last_name like 'Y%';

select rental_id, customer_id
from rental
where return_date IS Null;

select rental_id, customer_id
from rental
where return_date = NULL;

select rental_id, customer_id,return_date
from rental
where return_date Is not Null
limit 20;


select rental_id, customer_id, return_date
from rental
where return_date not between '2005-05-01' and '2005-09-01';


select rental_id,customer_id, return_date
from rental
where return_date is null
or return_date not between '2005-05-01' and '2005-09-01';


select amount
from payment
where amount = 1.98 or amount = 7.98 or amount = 9.98;

show tables;
select last_name
from customer
where last_name LIKE '_A%W%';

