/* SUB-QUERIES */
select ai.city , ai.airport_code, ai.airport_name
from (
select city, count(*)
from airports
group by city
having count(*) >1) as q
join airports as ai
on q.city = ai.city
order by ai.city, ai.airport_name


Create Table teachers(
 id serial primary key,
 name varchar(20) Unique not null,
 salary serial );


insert into teachers (name,salary)
values('A',20000),
       ('B',2000),
	   ('C',300000),
	   ('D',500000),
	   ('E',600000),
	   ('F',7000000),
	   ('G',9000000),
	   ('I',10000)
	   
select * from teachers	   


select * 
from teachers
where salary > (select avg(salary) from teachers)


select * 
from teachers
where salary in(select salary from teachers 
			   where salary>20000)



select * 
from bookings

select book_ref, total_amount
from bookings 
where total_amount in( select total_amount 
					 from bookings
					 where total_amount>18100.00)
					
					
select book_ref, total_amount 
from bookings
where book_ref in(select book_ref
				 from bookings
				 where book_ref= '000012')
				 
select *
from airports

select airport_code, timezone
from airports
where timezone in(select timezone
				  from airports
				  where timezone = 'Asia/Yakutsk')
				  
select * 
from aircrafts

select aircraft_code , model, range
from aircrafts
where aircraft_code in(select aircraft_code
					  from aircrafts
					  where aircraft_code = '773')
					  
					  
select aircraft_code, model
from aircrafts
where aircraft_code in(select aircraft_code
					  from aircrafts
					  where range >1000)
					  
select * 
from boarding_passes


select ticket_no, boarding_no, seat_no
from boarding_passes
where flight_id in(select flight_id
				  from boarding_passes
				  where flight_id >30000)
				  
				  

select *
from pilots

select id, name,speciality
from pilots
where speciality in(select speciality
				   from pilots
				   where speciality = 'pilot')
				   
				   
				   