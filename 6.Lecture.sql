/* Querying Multiple Tables */

use sakila;

/* INNER JOINS */

select c.first_name,c.last_name, a.address
from customer c join address a
on c.address_id = a.address_id;


select c.first_name,c.last_name , a.address
from customer c inner join address a 
on c.address_id = a.address_id;


/* If the names of the columns used to join the two tables are identical,
which is true in the previous query, you can use the using subclause
instead of the on subclause, */
select c.first_name,c.last_name, a.address
from customer c inner join address a
using(address_id);


select c.first_name,c.last_name,a.address
from customer c, address a 
where c.address_id = a.address_id;


select c.first_name,c.last_name,a.address
from customer c , address a
where c.address_id = a.address_id
and a.postal_code = 52137;


select c.first_name, c.last_name,a.address
from customer c inner join address a
on c.address_id  = a.address_id
where a.postal_code = 52137;


/*  Joining Three or More Tables */
desc address;
desc city;

select c.first_name,c.last_name,ct.city
from customer c
inner join address a
on c.address_id = a.address_id
inner join city ct
on a.city_id = ct.city_id;

select c.first_name,c.last_name,ct.city
from customer c
inner join address a
on c.address_id = a.address_id
inner join city ct
on a.city_id = ct.city_id;

select c.first_name,c.last_name,ct.city
from city ct
inner join address a
on a.city_id = ct.city_id
inner join customer c
on c.address_id = a.address_id;

select first_name,last_name,city
from address a
inner join city ct
on a.city_id = ct.city_id
inner join customer c
on c.address_id = a.address_id;

/* Using Subqueries As Tables */

select c.first_name,c.last_name,addr.address, addr.city
from customer c
inner join 
(select a.address_id,a.address,ct.city
from address a 
inner join city ct
on a.city_id = ct.city_id
where a.district = 'California') addr
on c.address_id = addr.address_id;


select a.address_id,a.address,ct.city
from address a
inner join city ct
on a.city_id = ct.city_id
where a.district = 'California';

select f.title
from film f
inner join film_actor fa
on f.film_id = fa.film_id
inner join actor a
on fa.actor_id = a.actor_id
where ((a.first_name = 'CATE' and a.last_name = 'MCQUEN')
or (a.first_name = 'CUBA' and a.last_name = 'BIRCH'));


/*                     Test Your Knowledge               
1. Write a query that returns the title of every film in which an actor
with the first name JOHN appeared.
*/
desc film;
desc actor;

select ft.title
from film ft
inner join film_actor fa 
on ft.film_id = fa.film_id
inner join actor a 
on fa.actor_id = a.actor_id
where a.first_name = 'JOHN';

