/* Grouping and Aggregates */

use sakila;
select customer_id 
from rental;

select customer_id
from rental
group by customer_id;

select customer_id, count(*)
from rental
group by customer_id;

select customer_id, count(*)
from rental
group by customer_id
order by 2 desc;

select customer_id, count(*)
from rental
group by customer_id
having count(*) >=40;

/* Aggregate Function 
-> max()
-> min()
-> avg()
-> sum()
-> count()
*/

select max(amount) max_amt,
min(amount) min_amt,
avg(amount) avg_amt,
sum(amount) sum_amt,
count(*) num_payments
from payment;


SELECT customer_id,
MAX(amount) max_amt,
MIN(amount) min_amt,
AVG(amount) avg_amt,
SUM(amount) tot_amt,
COUNT(*) num_payments
FROM payment;

select customer_id,
max(amount) max_amt,
min(amount) min_amt,
avg(amount) avg_amt,
sum(amount) sum_amt,
count(*) num_payments
from payment
group by customer_id;

/* Counting Distinct Values */
select count(customer_id) num_rows,
count(distinct customer_id) num_customers
from payment;



/* How Nulls Are Handled */
create table number_tbl
(val smallint);


insert into number_tbl values(1);

insert into number_tbl values(2);
insert into number_tbl values(5);

select count(*) num_rows,
count(val) count_val,
sum(val) sum_val,
max(val) max_val,
min(val) min_val,
avg(val) avg_val
from number_tbl;


insert into number_tbl values(NULL);
select count(*) num_rows,
count(val) count_val,
sum(val) sum_val,
max(val) max_val,
min(val) min_val,
avg(val) avg_val
from number_tbl;


select actor_id, count(*)
from film_actor
group by actor_id;

/* Multi-Column Grouping */
select fa.actor_id ,f.rating , count(*)
from film_actor fa
inner join film f
on fa.film_id = f.film_id
group by fa.actor_id, f.rating
order by 1,2;


select extract(Year from rental_date) year,
count(*) how_many
from rental 
group by extract(Year from rental_date);


/* ROLL=UP */
select fa.actor_id, f.rating , count(*)
from film_actor fa
inner join film f
on fa.film_id = f.film_id
group by fa.actor_id, f.rating with rollup
order by 1,2;

/* GROUP FILTER CONDITIONS */
select fa.actor_id , f.rating ,count(*)
from film_actor fa
inner join film f 
on fa.film_id = f.film_id
where f.rating in ('G','PG')
group by fa.actor_id, f.rating
having count(*) >9;

