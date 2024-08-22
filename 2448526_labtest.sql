show databases;
create database domainTest;
use domainTest;
drop table wing;
drop table teamleader;
drop table coreofCaps;
-- create tabel caps ppl in wings and volunteer
create table wing (
    wing_id int primary key,wing_name varchar(20) not null);
    
-- teamleader table 
create table teamleader(tid int primary key,Volunteerstrength int,tName varchar(30) not null);
drop table teamleader;
-- create the mentor(core) and teamleader table
create table coreOfCaps(coreid int primary key,wing_id int ,
coreName varchar(50),coreTeamleadid int,
 foreign key (coreTeamleadid) references teamleader(tid),
 foreign key(wing_id) references wing(wing_id));
 

drop table teamleader;
drop table  wing;
drop table coreOfCaps;
show tables;

select * from wing;
insert into wing (wing_id, wing_name) values 
(2001, 'peer-to-peer'), 
(2002, 'techdeveloper'), 
(2003, 'psychological facts');

select * from teamleader;
insert into teamleader values (26,34,'Aina'),(24,45,'jin'),(25,8,'hari');
-- use this frist 
select * from coreOfCaps;
insert into coreOfCaps values (24451,2001,'ram sir',26),
(24452,2002,'genniya',24),
(24453,2003,'namjoon',25);
drop table coreOfcaps;
#Demonstrate the enforcement of constraint using alter table command. 
alter table coreOfCaps add column  Doj date;
alter table coreOfCaps drop column Doj;
alter table coreOfCaps add column hworked int;
insert into coreOfCaps values (24456,2001,'Hari',26,45),
(24457,2002,'puritha',24,78.9);
select * from coreOfCaps;
-- truncate 
truncate table coreOfCaps;
drop table coreOfCaps;
select * from coreOfCaps;

-- drop and truncate
create table dummy (dit int);
insert  dummy values (23);
select * from dummy;
truncate table dummy;
drop table dummy;
truncate table dummy;














select * from wing; -- wing_id,wing_name
select * from coreOfCaps;
describe wing;
describe coreOfCaps;
describe teamleader;
show tables;
-- inner join on wings and coreOfCaps let fetch the name of wing and coreTeam name 
select wing_name,corename from wing 
inner join coreOfCaps on wing.wing_id=coreOfCaps.wing_id;
-- left join
select wing_name,corename from wing 
left join coreOfCaps on wing.wing_id=coreOfCaps.wing_id;
-- right join
select wing_name,corename from wing 
right join coreOfCaps on wing.wing_id=coreOfCaps.wing_id;
-- self join
select c1.coreName as cname,c2.coreName as samecore from coreofCaps as c1
inner join coreofCaps as c2 on c1.wing_id =c2.wing_id 
and c1.coreid<=c2.coreid;
-- ------ --------------------------------------------------------
select * from wing;
select * from teamleader;
-- inner using the 3 table
select tname,wing_name from wing inner join coreofCaps on coreofCaps.wing_id=wing.wing_id
inner join teamleader on coreofCaps.coreTeamleadid=teamleader.tid;
-- full join
select wing_name,corename from wing 
left join coreOfCaps on wing.wing_id=coreOfCaps.wing_id union
select wing_name,corename from wing 
right join coreOfCaps on wing.wing_id=coreOfCaps.wing_id;

-- cross table
select wing_name,corename from wing 
cross join coreOfCaps on wing.wing_id=coreOfCaps.wing_id;

-- domain (AVG, SUM, COUNT, MIN, MAX, MEDIAN, CORR and STDDEV) 
-- and appropriately use GROUPBY and HAVING clause  (6)
select * from teamleader; -- 26,25,24
select * from coreOfCaps; -- 26 ,24
insert into teamleader values (10,34,'kina'),(15,45,'jinko'),(14,8,'mari');
insert into coreOfCaps values (24459,2001,'jungkook',15,0),
(24413,2002,'vishnu',25,7.9);
insert into coreOfCaps values (24419,2001,'thv',15,0);
select avg(volunteerstrength) from teamleader  group by tid having tid=15;
select sum(volunteerstrength) from teamleader  group by tid having tid>15;
select min(volunteerstrength) from teamleader  group by tName;
select max(volunteerstrength) from teamleader  group by tName order by tid desc;

select tid, MOD(Volunteerstrength, 5) AS remainder
from teamleader
group by tid, Volunteerstrength;

select tid, avg(Volunteerstrength) as median
from (select t1.tid, 
         t1.Volunteerstrength,
         (select count(*) from teamleader t2 
         where t2.Volunteerstrength <= t1.Volunteerstrength 
         and t1.tid = t2.tid) as r, 
         (select count(*) from teamleader t2 where t2.tid = t1.tid) as c
  from teamleader t1
) as subset
where subset.r<= subset.c / 2 AND subset.r>=subset.c / 2 + 1
group by tid;

drop database domainTest;
create database ginn;