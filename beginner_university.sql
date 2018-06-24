-- create person table
create table person(
	id int primary key auto_increment,
	first_name varchar(32),
	last_name varchar(32),
	email varchar(64),
	gender varchar(8),
	birthday date,
	date_joined date
);

-- get a list of ramdom people to become prof
select *
from person
where birthday < '1980-01-01'
order by RAND()
limit 100;

-- create faculty table
create table faculty(
	id INT primary key auto_increment,
	title VARCHAR(32),
	person_id INT,
	foreign key (person_id) references person(id)
);

-- insert faculty person_id
insert into faculty (person_id)
select id
from person
where birthday < '1980-01-01'
order by RAND()
limit 100;

-- select all faculty information
select p.id, p.first_name, p.last_name, p.email, p.gender, p.birthday, p.date_joined, f.title
from person p
inner join faculty f on p.id = f.person_id;

-- more concise
select p.*, f.title
from person p
inner join faculty f
on p.id = f.person_id;


-- Update with select in mysql.
update faculty f, (
 select id
 from faculty
 where title is null
 order by rand()
 limit 1
) sq
set title = "President"
where f.id = sq.id;


update faculty f, (
	select id 
	from faculty
	where title is null
	order by rand()
	limit 10
) sq
set title = "Vice President"
where f.id = sq.id;

update faculty f, (
	select id 
	from faculty
	where title is null
	order by rand()
	limit 30
) sq
set title = "Professor"
where f.id = sq.id;

update faculty
set title = "Associate Professor"
where title is null;
