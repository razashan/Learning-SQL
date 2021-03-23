/* JOINS */

select *
from aircrafts;

select s.seat_no,s.fare_conditions, model ->>'en' as model
from seats s
join aircrafts a 
on s.aircraft_code = a.aircraft_code


select s.seat_no,s.fare_conditions, model ->>'en' as model
from seats s 
join aircrafts a
on s.aircraft_code = a.aircraft_code
where a.model ->>'en' = 'Airbus A320-200'

select s.seat_no, s.fare_conditions,model ->>'en' as model,
flight_no,departure_airport,arrival_airport,status
from seats s
INNER JOIN aircrafts a
on s.aircraft_code = a.aircraft_code
JOIN flights f
on a.aircraft_code = f.aircraft_code

select s.seat_no, s.fare_conditions, model ->>'en' as model,
f.departure_airport,f.arrival_airport,f.status
from seats s 
INNER JOIN aircrafts a
on s.aircraft_code = a.aircraft_code
JOIN flights f 
on a.aircraft_code = f.aircraft_code
WHERE status = 'Cancelled' and model ->>'en' LIKE 'Cessna%';


/* ---------- LEFT OUTER JOIN -----------*/
SELECT t.passenger_name, t.ticket_no,tf.fare_conditions,
DATE_PART('day',book_date) as day, DATE_PART('month',book_date) as month
from tickets t
LEFT JOIN bookings b
on t.book_ref = b.book_ref
LEFT JOIN ticket_flights tf
on t.ticket_no = tf.ticket_no
where fare_conditions = 'Business'
order by month ,day;

SELECT t.passenger_name, t.ticket_no,tf.fare_conditions,
DATE_PART('day',book_date) as day, DATE_PART('month',book_date) as month
from tickets t
LEFT OUTER JOIN bookings b
on t.book_ref = b.book_ref
LEFT OUTER JOIN ticket_flights tf
on t.ticket_no = tf.ticket_no
where fare_conditions = 'Business'
order by month ,day;

SELECT DISTINCT t.passenger_name, t.ticket_no,tf.fare_conditions,
DATE_PART('day',book_date) as day, DATE_PART('month',book_date) as month
from tickets t
LEFT  OUTER JOIN bookings b
on t.book_ref = b.book_ref
LEFT OUTER JOIN ticket_flights tf
on t.ticket_no = tf.ticket_no
where fare_conditions = 'Business'
order by month ,day;



