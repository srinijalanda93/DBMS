show databases;
-- syntax for creating the database
create database FristDataBase;
-- once create need to use the Database
use FristDatabase;
-- to drop the database 
-- drop database FristDatabase;
-- Create the table simple table
create table train_times(
start_loc varchar(75),dsetination varchar(75),starts time,arrives time);
select * from train_times;
-- Alter the table which helps us to add and delete the fields in the entity
alter table train_times add Train_No int;
alter table train_times add Train_Name varchar(23), add 
Train_engineNo int(8);
-- to drop the attribute from the entity we can use the drop column with its colname
alter table train_times drop column start_loc;
-- to fetech the cols
select * from train_times;
-- to delete the entity we follow one syntax which delete 
 drop table train_times;
 
 -- constraint
 -- Rename the database  syntax as there is no syntax for rename the database we need to do the backup
-- rename database FristDataBase to FilmClub;
-- FilmcLUB

-- memberDetails ,Attendance (relational tables)
 create table MemberDetails(MemberId int,FirstName nvarchar(50),
LastName nvarchar(50),
DateOfBirth date,
Street varchar(100),
City varchar(75),
State varchar(75),
ZipCode varchar(12),
Email varchar(200),
DateOfJoining date);
 -- create the attendance of member
 create table Attendance(MeetingDate date,
Location varchar(200),
MemberAttended char(1),
MemberId int);

-- alter the table
alter table Attendance modify MeetingDate datetime;
-- lets drop the both entities
drop table Attendance;
drop table MemberDetails;

 -- films filmid(pk),CategoryId(fk)
 create table films (filmid int,
 FilmName varchar(100),
 yearReleased varchar(2000),
AvailableOnDVD char(1),
Rating integer,
CategoryId integer,
foreign key (CategoryId) references Category(CategoryId)
);

-- alter the film table add the constraint filmid primary key
-- alter table films add constraint filmid primary key;
ALTER TABLE films
ADD CONSTRAINT filmid_pk PRIMARY KEY (filmid);
-- adding the constraint to the not null  for the film name
select *from films;
ALTER TABLE films MODIFY FilmName VARCHAR(100) NOT NULL;
 --
describe  films;
drop table films;
 --
create table Category(CategoryId int primary key,Category varchar(100));

show tables;

-- chapter 2 Entering Information in these chapter I will discuss about the data insertion and update
select * from Category;
insert into Category values(2,'Romance'), (3, 'Horror'),(4, 'War'),(5, 'Sci-fi');
INSERT INTO Category (Category, CategoryId) VALUES ('Historical', 6);
-- members insertions
select * from MemberDetails;
insert into MemberDetails values(1,'Katie', 'Smith', '1977-01-09', 'Main Road','Townsville','Stateside','123456','katie@mail.com','2004-02-23');
insert into MemberDetails values(2,'Bob', 'Robson', '1987-01-09', 'Little Street','Big City','Small State','34565','rob@mail.com','2004-03-13');
insert into MemberDetails values(4,'Steve','Gee','1993-04-02','Holy street','NK city','Westside','23456','steve@gmail.com','2004-03-13');
-- UPDATE SYNTAX
update  MemberDetails set Street = '45 Upper Road',City = 'New Town',State = 'New State',ZipCode = '99112' WHERE MemberId = 4;
SET SQL_SAFE_UPDATES = 0;
-- fetch the details
select * from MemberDetails;


