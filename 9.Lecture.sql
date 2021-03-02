/* Subqueries */

/* A subquery is a query contained within another SQL statement
(which I refer to as the containing statement for the rest of this
discussion). A subquery is always enclosed within parentheses, and it
is usually executed prior to the containing statement */

select customer_id, first_name, last_name
from customer 
where customer_id  = (select max(customer_id) from customer);

select max(customer_id) 
from customer;

select first_name, last_name, customer_id
from customer
where customer_id = 599;

select city_id, city
from city 
where country_id <>
(select country_id from country where country = 'INDIA');

select country_id from country where country <> 'INDIA';

select country_id,country
from country
where country in ('Mexico','Canada');

SELECT country_id
FROM country
WHERE country = 'Canada' OR country = 'Mexico';

select city_id ,city
from city
where country_id in (select country_id from country where country in ('CANDA','MEXICO'));


select city_id, city
from city
where city not in 
(select country_id
from country 
where country in ('Canada','Mexic'));


/*  Multi-Column Subqueries */
select fa.actor_id , fa.film_id
from film_actor fa
where fa.actor_id in
(select actor_id from actor where last_name = 'MONROE')
and fa.film_id in (select film_id from film where rating = 'PG');


select c.first_name,c.last_name
from customer c
where 20 = (select count(*) from rental r
where r.customer_id = c.customer_id);

select c.first_name, c.last_name
from customer c
where (select sum(p.amount) from payment p 
where p.customer_id = c.customer_id)
between 180 and 240;


select a.first_name, a.last_name
from actor a 
where not exists
(select 1
from film_actor fa
inner join film f on f.film_id = fa.film_id
where fa.actor_id = a.actor_id
and f.rating = 'R');


SELECT c.first_name,c.last_name, pymnt.num_rentals,pymnt.tot_payments
from customer c
inner join( select customer_id, count(*) num_rentals,sum(amount) tot_payments
from payment
group by customer_id
)pymnt
on c.customer_id = pymnt.customer_id;

select customer_id, count(*) rentals,sum(amount) tot_amounts 
from payment
group by customer_id;

select 'Small Fry' name, 0 low_limit, 74.99 high_limit
union all
select 'Average Joes' name, 75 low_limit , 149.99 high_limit
union all
select 'Heavy Hitters' name,150 low_limit , 9999999.99 high_limit;

select a.actor_id,a.first_name,a.last_name
from actor a
order by
(select count(*)  from film_actor fa
where fa.actor_id = a.actor_id) desc;

