/* CONDITIONAL STATEMENT */

select date_part('month',book_date) as month, sum(total_amount) as booking,
case when sum(total_amount) > 6958118400.00 then 'the most'
     when sum(total_amount) < 6958118400.00 then 'the least'
	 else 'the medium' End booking_qt
from bookings
group by month;



/* NULLIF */
select count(NULLIF(actual_departure,null)), count(NULLIF(actual_arrival,null))
from flights

/* TO REMOVE NULL VALUES */
select count(*)- count(nullif(actual_departure,null))non_cnt_1,
count(*) - count(nullif(actual_arrival,null)) non_cnt_2
from flights



/* TO CLEAN OUR DATA OUTPUT FROM NULL VALUES */
select status, actual_departure, actual_arrival
from flights


select status, coalesce(actual_departure, current_timestamp),
coalesce(actual_arrival,current_timestamp)
from flights


/* - write a query to arrange the range of model of
air crafts so  Short range is less than 2000, Middle 
range is more than 2000 and less than 5000 & any range above 5000 is long range?*/

select model, range,
CASE WHEN range< 2000  then ' TO SHORT'
     WHEN range< 5000 then 'Middle'
	 ELSE 'LONG'
	 END As range
from aircrafts
order by model;