/*SELECT * 
from aircrafts;
*/
select aircraft_code
from aircrafts;

select model
from aircrafts;

select * from airports;

select * from boarding_passes;

select * from bookings;

select * from seats;

/* DISTINCT */

select timezone from  airports;

select distinct timezone from airports;


/* WHERE */

select airport_code, airport_name, city
from airports;

select airport_code, airport_name ,city
from airports
where airport_code = 'KHV';


select airport_code, airport_name ,city
from airports
where city->>'en' = 'Moscow';

select airport_code, airport_name,city
from airports
where airport_name->>'en' = 'Sheremtyevo International Airport';


select * 
from aircrafts
where range = 3000;



select * from airports;

select * from airports
where airport_code !='YKS';


select * from bookings
where total_amount >200000;



select * from bookings 
where total_amount >200000 and total_amount <300000;


select * from bookings 
where total_amount >200000 or total_amount <300000;

select * from seats
where aircraft_code = '319' and fare_conditions = 'Business';


select * from seats
where aircraft_code = '319' or fare_conditions = 'Business';


select * from aircrafts
where model ->> 'en' like 'Airbus%';

select * from aircrafts
where model ->> 'en' like 'Airbus%200';

select * from aircrafts
where model ->> 'en' like '%200%';

select * from aircrafts
where model ->> 'en' Not like '%200%';

select * from aircrafts
where model ->> 'en' not like 'Airbus%' and model ->>'en' not like 'Boeing%';


/* LIMIT AND ORDER BY */
select passenger_name
from tickets
where passenger_name like '___%';


select passenger_name
from tickets
where passenger_name like '__IN%';

select * 
from tickets
where passenger_name = 'VALERIY TIKHONOV'
limit 10;

select ticket_no, fare_conditions
from ticket_flights
where fare_conditions = 'Business'
limit  10;


select passenger_name ,contact_data
from tickets
order by passenger_name desc
limit 50;


/* FETCH */
select *
from boarding_passes
fetch first 10 rows only; 


/* IF you want to skip first ten rows and want to fetch next 10*/
select * 
from boarding_passes
offset 10 rows
fetch first 10 rows only;


select  * 
from tickets
where ticket_no between '000543200' and '000045677654';


select * 
from aircrafts
where range in (5700,6700,1200);


select * 
from bookings
where book_date in ('2017-7-10%','2017-7-15%','2017-7-20%','2017-7-25%');

select book_date as Booking_date_of_passenger 
from bookings
where book_date in ('2017-7-10%','2017-7-15%','2017-7-20%','2017-7-25%');


select b.book_date as booking_date, b.total_amount as total
from bookings as b
where book_date in ('2017-7-10%','2017-7-15%','2017-7-20%','2017-7-25%');



select b.book_date as booking_date, b.total_amount as total
from bookings as b
where book_date not in ('2017-7-10%','2017-7-15%','2017-7-20%','2017-7-25%');


select * 
from aircrafts
where aircraft_code not in ('329','733');


select flight_id, flight_no, departure_airport, arrival_airport,status
from flights
where status not in ('Scheduled','Delayed','Cancelled');

select flight_id, flight_no, departure_airport, arrival_airport,status
from flights
where status in ('On Time','Departed','Arrived');


/* ISNULL */
select *
from flights
where actual_departure isnull and actual_arrival isnull;


select * 
from flights
where actual_departure is not null and actual_arrival is not null;

/* CAST */
select '50':: integer;

select '1-01-2021'::date;

select cast('50' as integer);

select cast('02-02-2021' as date);

select cast('F' as boolean);


select '30 minute'::interval;
select '5 hour'::interval;
select '3 day'::interval;
select '3 week'::interval;
select '12 month'::interval;


select cast('12 month' as interval);
select cast('3 week' as interval);
select cast('3 day' as interval);


/* Test You Self */
/* 1. List the cities in which there is no flights from Moscow ? */
select distinct a.city ->>'en' as city
from airports a
where a.city ->>'en' <> ' Moscom'
order by city;


/* 2. Select airports in a time zone is in Asia / Novokuznetsk and Asia / Krasnoyarsk ?*/
select * 
from airports
where timezone in ('Asia/Novokuznetsk','Asia/Krasnoyarsk');

/* 3. Which planes have a flight range in the range from 3,000 km to 6,000 km ? */
select * 
from aircrafts 
where range between '3000' and '6000';


/* 4. Get the model , range,  and miles of every air craft exist in the Airlines database, notice that miles = range / 1.609  and round the result to 2 numbers after the float point? */
select model, range, round(range/1.609,2) as miles 
from aircrafts;

/* 5. - Return all information about air craft that has aircraft_code = 'SU9' and its range in miles ? */
select aircraft_code, model, round(range/1.609) as miles
from aircrafts
where aircraft_code ='SU9';
