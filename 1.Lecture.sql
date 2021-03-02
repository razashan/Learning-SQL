show databases;
use sakila;
show tables;
use movies;

Create database moviess;

Create table corporation
(corp_id smallint,
name varchar(30),
constraint pk_corporation primary key (corp_id)
);

insert into corporation (corp_id,name)
VALUES (27, 'Acme Paper Corporation');
select * from corporation;

select name
from corporation
where corp_id = 27;

select corp_id,name
from corporation
where corp_id = 27;

Select t.txn_id, t.txn_type_cd, t.txn_date, t.amount 
from individual i
INNER JOIN account a on i.cust_id = a.cust_id 
INNER JOIN product p on p.product_cd = a.product_cd
INNER JOIN transaction t on t.account_id = a.account_id
Where i.fname - 'George' and i.lname = 'Blake'
AND p.name = 'checking account';


show databases;
use sakila;
select now();

show character set;
show tables;

create table person
(person_id smallint unsigned,
fname varchar(20),
lname varchar(20),
eye_color char(2),
birth_date date,
street varchar(30),
city varchar(20),
state varchar(20),
country varchar(20),
postal_code varchar(20),
constraint pk_person primary key (person_id));



show tables;

select * 
from person;

desc person;

insert into person
(person_id,fname,lname,eye_color,birth_date)
values(1,'William','Turner','BR','1972-05-27');

select * 
from person;
select person_id, fname,lname,birth_date
from person
where person_id = 1;

select person_id, fname,lname, birth_date
from person
where lname = 'Turner';

create table favorite_food
(person_id smallint unsigned,
food varchar(20),
constraint pk_favorite_food primary key (person_id,food),
constraint fk_fav_food_person_id foreign key (person_id)
references person (person_id));


desc favorite_food;

INSERT INTO favorite_food (person_id,food)
values (1,'pizza');

INSERT INTO favorite_food (person_id, food)
VALUES (1, 'cookies');

insert into favorite_food (person_id,food)
values (1,'spinach');


insert into favorite_food(person_id,food)
values(1,'Nachos');

select food 
from favorite_food
where person_id = 1
order by  food;

insert into person
(person_id, fname,lname,eye_color,birth_date,street,city,state,country,postal_code)
values(2,'Susan','Smith','BL','1975-11-02','23 Maple St,','Arlington','VA','USA','20220');

select person_id,fname,lname,birth_date
from person;

UPDATE person
set street = '1225 Tremont St.',
city = 'Boston',
state = 'MA',
country = 'USA',
postal_code = '02138'
WHERE person_id = 1;

select *
from person;


delete from person
where person_id =2;

select *
from person;


------------------- WHEN STATEMENT GOES WRONG --------

Insert into person
(person_id,fname,lname,eye_color,birth_date)
values(1, 'Charles','Fulton','GR','1968-01-11');

Insert into person
(person_id,fname,lname,eye_color,birth_date)
values(2, 'Charles','Fulton','GR','1968-01-11');

select * 
from person;

INSERT INTO favortie_food(person_id,food)
values (999,'lasagna');


-------------------The table definition for the favorite_food table includes the
creation of a foreign key constraint on the person_id column. This
constraint ensures that all values of person_id entered into the
favorite_food table exist in the person table--------------------------


DROP table favorite_food;

DROP table person;

desc customer;



Create Table teacherss(
id smallint unsigned not null auto_increment,
firstname varchar(25),
lastname varchar(25),
school varchar(25),
hire_date date,
salary numeric,
constraint pk_branch primary key (id)) ;


INSERT INTO teacherss(firstname,lastname, school,hire_date,salary)
values('Janet', 'Smith', 'F.D. Roosevelt HS', '2011-10-30', 36200),
('Lee', 'Reynolds', 'F.D. Roosevelt HS', '1993-05-22', 65000),
       ('Samuel', 'Cole', 'Myers Middle School', '2005-08-01', 43500),
       ('Samantha', 'Bush', 'Myers Middle School', '2011-10-30', 36200),
       ('Betty', 'Diaz', 'Myers Middle School', '2005-08-30', 43500),
       ('Kathleen', 'Roush', 'F.D. Roosevelt HS', '2010-10-22', 38500);
       
select * 
from teacherss;actor_info


INSERT INTO teachers(First_Name,Last_Name,School_Name,Hire_Date,Salary)
values('Janet', 'Smith', 'F.D. Roosevelt HS', '2011-10-30', 36200),
('Lee', 'Reynolds', 'F.D. Roosevelt HS', '1993-05-22', 65000),
       ('Samuel', 'Cole', 'Myers Middle School', '2005-08-01', 43500),
       ('Samantha', 'Bush', 'Myers Middle School', '2011-10-30', 36200),
       ('Betty', 'Diaz', 'Myers Middle School', '2005-08-30', 43500),
       ('Kathleen', 'Roush', 'F.D. Roosevelt HS', '2010-10-22', 38500);
