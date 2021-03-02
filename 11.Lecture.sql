/* Conditional Logic */
select first_name,last_name,active
from customer;

desc customer;

select first_name, last_name,
case 
when active = 1 then 'active'
else 'inactive'
end activity_type
from customer;


select c.first_name,c.last_name,
case
when active =0 then 0
else
(select count(*) from rental r
where r.customer_id = c.customer_id)
end num_rentals
from customer c;


select monthname(rental_date) month_name, count(*) num_rentals
from rental
where rental_date between '2005-05-01' and '2005-08-01'
group by monthname(rental_date);

select 
sum( case when monthname(rental_date) = 'May' then 1
else 0 end ) May_rentals,
sum( case when monthname(rental_date) = 'June' then 1
else 0 end) June_rentals,
sum( case when monthname(rental_date) = 'July' then 1
else 0 end) July_rentals
from rental
where rental_date between '2005-05-01' and '2005-08-01';


select f.title,
case (Select count(*) from inventory i 
where i.film_id = f.film_id)
when 0 then 'Out of Stock'
when 1 then 'Scarce'
when 2 then 'Scarce'
when 3 then 'Available'
when 4 then 'Available'
else ' Common'
end film_availability
from film f;


select c.first_name,c.last_name,
sum(p.amount) tot_payment_amt,
count(p.amount) num_payments,
sum(p.amount) / 
case when count(p.amount) =0 then 1
else count(p.amount) 
end avg_payment
from customer c
left outer join payment p
on c.customer_id = p.customer_id
group by c.first_name,c.last_name;

