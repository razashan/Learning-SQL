/* Chapter 10. Joins Revisited */

use sakila;

select f.film_id, f.title, count(*) num_copies
from film f
inner join inventory i
on f.film_id = i.film_id
group by f.film_id , f.title;


select f.film_id,f.title,count(i.inventory_id) num_copies
from film f
left outer join inventory i
on f.film_id = i.film_id
group by f.film_id, f.title;


select f.film_id , f.title,i.inventory_id
from film f
inner join inventory i
on f.film_id = i.film_id
where f.film_id between 13 and 20
group by f.film_id, f.title;



select f.film_id, f.title,i.inventory_id
from film f
left outer join inventory i
on f.film_id = i.film_id
where f.film_id between 12 and 19;


select f.film_id, f.title, i.inventory_id
from film f
right outer join inventory i
on f.film_id = i.film_id
where f.film_id between 13 and 15;


/* Three-Way Outer Joins
In some cases, you may want to outer-join one table with two other
tables.*/
select f.film_id, f.title, i.inventory_id, r.rental_date
from film f
left outer join inventory i
on f.film_id = i.film_id
left outer join rental r
on i.inventory_id = r.inventory_id
where f.film_id between 13 and 20;

select cust.first_name,cust.last_name,date(r.rental_date)
from (select customer_id , first_name,last_name
from customer
)cust
natural join rental r;