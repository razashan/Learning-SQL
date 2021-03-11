/* Date-Time Management */

select *
from bookings;

select book_date, sum(total_amount) as sales
from bookings
group by 1
order by 2;


select extract('day' from book_date) as day, sum(total_amount) as sales
from bookings
group by 1
order by 2;



select extract('day' from book_date) as day, sum(total_amount) as sales
from bookings
group by 1
order by 1,2;



select extract('day' from book_date) as day, extract('month' from book_date)as month,sum(total_amount) as sales
from bookings
group by 1,2
order by 3


/* Time Data Management */
select book_date, count(*)
from bookings
group by book_date


select DATE_TRUNC('day',book_date) as day,count(total_amount) as total_booking
from bookings
group by DATE_TRUNC('day',book_date);


select DATE_TRUNC('day',book_date) as day, DATE_TRUNC('month',book_date) as month,
count(total_amount) as total_booking
from bookings
group by day,month


select DATE_PART('day',book_date) as day,DATE_PART('month',book_date) as month,
count(total_amount) as total_booking
from bookings
group by day,month
order by 1,2


select DATE_PART('day',book_date) as day,DATE_PART('month',book_date) as month,
count(total_amount) as total_booking
from bookings
group by day,month
having DATE_PART('month',book_date) = 6;



select DATE_PART('day',book_date) as day,DATE_PART('month',book_date) as month,
count(total_amount) as total_booking
from bookings
group by day,month
having DATE_PART('month',book_date) = 6 and DATE_PART('day',book_date) = 21

select DATE_PART('day',book_date) as day,DATE_PART('month',book_date) as month,
sum(total_amount) as sales
from bookings
group by day,month
having DATE_PART('month',book_date) = 6 and DATE_PART('day',book_date) = 21


select DATE_PART('dow',book_date) as day, DATE_PART('month',book_date) as month,
sum(total_amount) as sales
from bookings
group by day, month


select DATE_PART('dow',book_date) as day, DATE_PART('month',book_date) as month,
sum(total_amount) as sales
from bookings
group by day, month
having DATE_PART('month',book_date) = 7


