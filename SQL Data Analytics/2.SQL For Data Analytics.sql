/* COUNT */

select count(*)
from aircrafts;
-- The whole rows are 9 --


Create table pilots(
id serial primary key,
name text not null,
speciality text not null,
age text)

insert into pilots(name,speciality,age)
values ('John','pilot',50),
('Sara','co_pilot',34),
('Alvin','pilot',40)

select * from pilots

insert into pilots(name,speciality,age)
values('Kevin','pilot',Null)



select * from pilots

select count(age)
from pilots


select count(distinct passenger_name)
from tickets


/*  SUM */

select sum(total_amount)
from bookings

/* MIN , MAX , AVG */

select min(total_amount)
from bookings

select max(total_amount)
from bookings

select avg(total_amount)
from bookings

/* Aggregation */
select city, count(*)
from airports
group by city



select city, count(*)
from airports
group by city
having count(*) >1


select city ->>'en' as city , count(*)
from airports
group by city
having count(*) >1


/* 1. Calculate the Average tickets Sales? */
select avg(total_amount) as sales
from bookings


/* 2. Return the number of seats in the air craft that has aircraft code = 'CN1' ?*/
select * from seats

select count(*)
from seats
where aircraft_code = 'CN1'


/* 3. Return the number of seats in the air craft that has aircraft code = 'SU9'  ?*/
select count(*)
from seats
where aircraft_code = 'SU9'

/* 4. Write a query to return the aircraft_code 
and the number of seats of each air craft ordered ascending? */

select aircraft_code, count(*)
from seats
group by aircraft_code
order by count;

/* 5. calculate the number of seats in the salons for 
all aircraft models, but now taking into account the 
class of service Business class and Economic class.*/

select aircraft_code , fare_conditions, count(*)
from seats
group by aircraft_code, fare_conditions
order by aircraft_code, fare_conditions



/* 6. What was the least day in tickets sales? */
select min(total_amount)
from bookings


