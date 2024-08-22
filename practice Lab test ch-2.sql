-- Topics where clause,ch-3 (Select quries),Using Aliases,inner join

create table FavCategory (CategoryId int , MemberId int,
foreign key (CategoryId) references Category(CategoryId),
foreign key (MemberId) references memberdetails(MemberId));
use FristDatabase;
show tables;
select * from films;
select * from memberdetails;
-- where using logical operator
update MemberDetails set state='Sg palya' where MemberId <> 1;
UPDATE MemberDetails SET State = 'Mega State' WHERE State = 'Small State' OR State = 'Stateside';
-- insert the data
INSERT INTO MemberDetails (MemberID, FirstName, LastName, DateOfBirth, Street, City, State, ZipCode, Email, DateOfJoining)
VALUES
(7, 'John', 'Jackson', '1974-05-27', 'Long Lane', 'Orange Town', 'New State', '88992', 'jjackson@mailme.net', '2005-11-21'),
(8, 'Jack', 'Johnson', '1945-06-09', 'Main Street', 'Big City', 'Mega State', '34566', 'jjohnson@me.com', '2005-06-02'),
(9, 'Seymour', 'Botts', '1956-10-21', 'Long Lane', 'Windy Village', 'Golden State', '65422', 'Seymour@botts.org', '2005-07-17');

-- getting the distinct columns along from Memberdetails
select  distinct State from memberdetails;
SELECT DISTINCT State, MemberId FROM MemberDetails;

-- Using Aliases
select * from memberdetails;
select LastName as surName,
state as statesliving,street as colonies,Email as id 
 from memberdetails;
 
 describe  memberdetails;
 alter table memberdetails add constraint MemberId primary key (MemberId);
 
 --- FavCategory
 insert into memberdetails 
 (memberid, firstname, lastname, dateofbirth, street, city, state, zipcode, email, dateofjoining)
values
(10, 'susie', 'simons', '1937-01-20', 'main road', 'townsville', 'mega state', '123456', 'susie@mailme.com', '2005-08-20');

INSERT INTO FavCategory (CategoryId, MemberId)VALUES ( 1, 10 ),( 3, 10 ),(6,10);
insert into memberdetails (memberid, firstname, lastname, dateofbirth, street, city, state, zipcode, email, dateofjoining)
values 
    (11, 'jamie', 'hills', '1992-07-17', 'newish lane', 'orange town', 'new state', '88776', 'jamie@the_hills.com', '2005-08-22'),
    (12, 'stuart', 'dales', '1956-08-07', 'long lane', 'windy village', 'golden state', '65422', 'sdales@mymail.org', '2005-08-27'),
    (13, 'william', 'doors', '1994-05-28', 'winding road', 'big city', 'mega state', '34512', 'knockon@thedoors.com', '2005-08-29');

insert into favcategory (categoryid, memberid)
values 
    (4, 11),
    (3, 11),
    (5, 11),
    (1, 12),
    (4, 12),
    (6, 12),
    (3, 13);
select * from favcategory;

-- film
select * from films;
alter table films add column plotsummary text;
insert into films (filmid, filmname, yearreleased, plotsummary, availableondvd, rating, categoryid)
values 
    (9, 'one flew over the crow''s nest', 1975, 'life and times of a scary crow.', 'y', 2, 3),
    (10, 'raging bullocks', 1980, 'a pair of bulls get cross with each other.', 'n', 4, 1),
    (11, 'the life of bob', 1984, 'a 7 hour drama about bob''s life. what fun!', 'y', 1, 1),
    (12, 'gone with the window cleaner', 1988, 'historical documentary on window cleaners. thrilling', 'y', 3, 6),
    (13, 'the good, the bad, and the facially challenged', 1989, 'joe seeks plastic surgery in this spaghetti western.', 'y', 5, 6);
select * from films;

-- Using the following SQL, query the database to produce a list of all the films released in the
-- 1980s that have a rating between 2 and 4 and are available on DVD. The answer should detail
-- the film name, date of release, rating, and availability on DVD.
select filmname,yearreleased,rating,availableondvd from films
 where (rating between 2 and 4) and (availableondvd ='n') and (yearReleased=1980);
 
 -- Query the database to produce a list of films of any decade except the 1960s whose names are
-- between P and T. The answer should detail the film names. Use the following SQL to execute the query:
select filmname from films where (yearreleased not between 1960 and 1969) and (filmname not between 'P' and 'T');

-- like operator
select * from memberdetails; 
select * from memberdetails where lastname like 'j%'; -- fetch the frist character as j
select * from memberdetails where firstname like 'J__k';
select * from memberdetails where street  not like'W%';
-- Use the following SQL to query the database to find out which people don’t live on a street called Road or Street
select * from memberdetails where street not like '%Road' and  Street not like '%Street';

-- in operator
select * from memberdetails where city in ('orange town','Windy Village','Main Road');
select * from films;

-- order by clause;
select FilmName from films order by yearReleased desc;
SELECT FilmName, Rating, YearReleased FROM Films ORDER BY Rating desc , YearReleased, FilmName;
SELECT LastName, FirstName, DateOfBirth FROM MemberDetails
WHERE DateOfJoining BETWEEN '2005-01-01' AND '2005-12-31'ORDER BY LastName, DateOfBirth, FirstName;

select * from Films;
select concat(filmname,rating) as Heading from films;

-- inner join come into picture when we need to fetch the data
select * from category;
select categoryid from category where category='Historical';
select filmname from films where categoryid=6;

select filmname as MovieTitle from films inner join category  on films.categoryid=category.categoryid;
select f.filmname as movietitle from films as f  inner join category as c on f.categoryid = c.categoryid where c.categoryid=6;
select filmname as MovieTitle ,category from films inner join category  on films.categoryid=category.categoryid where category.categoryid=6;

select * from favcategory;
select * from category;

select category.category as cName ,memberdetails.lastname ,memberdetails.firstname  from
( category 
inner join
favcategory on favcategory.categoryid=category.categoryid)
 inner join
 memberdetails on favcategory.memberid=memberdetails.memberid;
 
 select * from memberdetails;
 select state from memberdetails group by state;
 select * from films;
 
 SELECT State
 FROM MemberDetails
 WHERE State IN ('Mega State', 'Golden State','New State')
 GROUP BY State;
 
 SELECT City, COUNT(MemberId) FROM MemberDetails group by city;