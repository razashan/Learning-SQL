/* RIGHT OUTER JOIN */
select t.passenger_name,t.ticket_no,tf.fare_conditions, 
DATE_PART('day',book_date)as day , DATE_PART('month',book_date) as month
from bookings b
right join tickets t
on b.book_ref = t.book_ref
right join ticket_flights tf
on tf.ticket_no = t.ticket_no
order by month, day;


/* FULL OUTER JOIN */
select * 
from tickets t
FULL JOIN boarding_passes b
on t.ticket_no = b.ticket_no


select * 
from boarding_passes b 
full join flights f
on b.flight_id = f.flight_id

/* CROSS JOIN */
/* RETURN EVERYTHING FROM TABLE 1 and TABLE 2 */
select *
from aircrafts
cross join airports;


select * 
from airports
cross join seats


/* UNION */

select * 
from aircrafts
where range > 4500
UNION 
select * 
from aircrafts
where range < 7500

select * 
from aircrafts
where range > 4500
UNION all
select * 
from aircrafts
where range < 7500


/* INTERSECT */
select * 
from aircrafts
where range >4500
INTERSECT
select * 
from aircrafts
where range < 7500


/* EXCEPT */
/* ROWS That is first set but not in second set */

select * 
from aircrafts
where range >4500
except
select * 
from aircrafts
where range <7500



/* USING */
select t.ticket_no, t.passenger_name,t.contact_data, b.total_amount,b.book_date
from tickets t
join bookings b
using(book_ref)


/* NATURAL JOIN */
select * 
from aircrafts a
natural join seats s 


select * 
from aircrafts a 
join seats s 
on a.aircraft_code = s.aircraft_code


