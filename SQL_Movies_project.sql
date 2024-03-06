-- SQL EXAM 

create database sql_exam;
use sql_exam;

-- 1.  Write a query where it should contain all the data of the 
-- movies which were released after 1995 having their movie
-- duration greater than 120 and should be including A in their
-- movie title.

select * from movie 
where mov_year > 1995 
and mov_time > 120
and mov_title like '%a%';

-- Q2. Write an SQL query to find the actors who played a role in the 
-- movie 'Chinatown'. Fetch all the fields of actor table. (Hint: Use 
-- the IN operator)

select a.act_id , a.act_fname ,a.act_lname, a.act_gender , m.mov_title
from actor as a
inner join cast as c on a.act_id = c.act_id
inner join movie as m on c.mov_id = m.mov_id
where mov_title in ('Chinatown') 
group by 1;


select act_id , act_fname , act_lname ,act_gender from actor where act_id in
(select act_id from cast where mov_id in 
(select mov_id from movie where mov_title = 'Chinatown'));

-- Q3. Write an SQL query for extracting the data from the ratings 
-- table for the movie who got the maximum number of ratings.

select m.mov_title, max(r.num_o_ratings) as max_ratings 
from movie as m
inner join ratings as r on m.mov_id = r.mov_id
group by 1
order by 2 desc;

-- Q4. Write an SQL query to determine the Top 7 movies which were 
-- released in United Kingdom. Sort the data in ascending order 
-- of the movie year.

select mov_id, mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country 
from movie where mov_rel_country ='UK' 
order by 3 limit 7;


-- Q5. Set the language of movie language as 'Chinese' for the movie 
-- which has its existing language as Japanese and their movie 
-- year was 2001.
update movie set mov_lang='Chinese' where mov_lang='Japanese' and mov_year=2001;



select * from movie;
update movie
set mov_lang = 'Chinese'
where  mov_year = 2001 and mov_lang = 'Japanese' ;
set sql_safe_updates =0;

-- Q6. Print genre title, maximum movie duration and the count the 
-- number of movies in each genre

select g.gen_title, max(m.mov_time)as max_duratn, count(m.mov_title) as movies_count
from movie as m
inner join movie_genres as mg on m.mov_id = mg.mov_id
inner join genres as g on mg.gen_id = g.gen_id
group by 1;

select g.gen_title , max(m.mov_time) as max_duration, count(m.mov_id) as movie_count
from genres as g 
left join movie_genres as mg on(g.gen_id = mg.gen_id)
left join movie as m on(mg.mov_id = m.mov_id)
group by 1
order by 3 desc;

-- Q7. Create a view which should contain the first name, last name, 
-- title of the movie & role played by particular actor.

create view movie_details as (
select a.act_fname, a.act_lname, m.mov_title, c.role as role_played
from actor as a 
inner join cast as c on(a.act_id = c.act_id)
inner join movie as m on(m.mov_id = c.mov_id));

-- Q8. Display the movies that were released before 31st March 1995.
select * from movie where mov_dt_rel < '1995-03-31' ;
select * from movie where mov_dt_rel <'31/03/1995';
select * from movie where mov_dt_rel < '31-03-1995';

-- Q9. Write a query which fetch the first name, last name & role 
-- played by the actor where output should all exclude Male 
-- actors

select a.act_id, a.act_fname, a.act_lname, a.act_gender, c.role
from actor as a 
inner join cast as c on a.act_id = c.act_id
where act_gender != 'M';

-- Q10. Insert five rows into the cast table where the ids for movie 
-- should be 936,939,942,930,941 and their respective roles 
-- should be Darth Vader, Sarah Connor, Ethan Hunt, Travis 
-- Bickle, Antoine Doinel & their actor ids should be set up as 
-- 126,140,135,131,144.

insert into cast (mov_id, role,act_id) values
(936,'Darth Vader',126),
(939,'Sarah Connor',140),
(942,'ethan hunt',135),
(930,'Travis bickle',131),
(941,'Antoine Doinel',144);

select * from cast;

select * from actor; 
select * from cast;
select * from director;
select * from genres;
select * from movie;
select * from movie_direction;
select * from movie_genres;
select * from ratings;
select * from reviewer;





