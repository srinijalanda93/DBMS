-- show databases;
create database StudentDetail;
use StudentDetail;
create table TStudentsMaster (Fn_Regno int(7) primary key,
Fs_Name varchar(30),
 Fs_Course varchar(10),
 Fn_Batch int(4) default 2024,
 Fn_mobile bigint(10),
 Fs_email varchar(40) check (Fs_email like '%@%.com'),
 Fs_City varchar(20));
 select * from  TStudentsMaster;
 insert into TStudentsMaster values(5025,'Srinija','MscAIML',2024,8897178758,'srinija@gmail.com','Hyderabad');
 insert into TStudentsMaster values(5026,'Lisa','MscDS',null,9807654312,'lisa@gmail.com','Hisar');
 insert into TStudentsMaster values(5027,'Ariana','BscH',null,8790124356,'everyday@gmail.com','mumbai');
insert into TStudentsMaster values(5028,'Jvke','BcomH',null,8709876531,'golden@gmail.com','bhopal');
insert into TStudentsMaster (Fn_Regno, Fs_Name, Fs_Course, Fn_mobile, Fs_email, Fs_City)
 values(5078,'slut','BTech',9012435688,'taylor@gmail.com','Delhi');
insert into TStudentsMaster values(5029,'Justin','BTech',2020,9012435698,'stay@gmail.com','Delhi');
 insert into TStudentsMaster values(5030,'Kookie','MCA',2023,1243560987,'seven@gmail.com','Bengalore');
insert into TStudentsMaster values(5031,'kateperry','Bsc',2019,8990124356,'kate@gmail.com','Hyderabad');
insert into TStudentsMaster values(5032,'Fordge','BALLB',2020,8790871243,'fordge@gmail.com','delhi');
insert into TStudentsMaster values(5033,'minnija','BA',2023,8012438956,'minnija@gmail.com','kochi');
select * from TStudentsMaster;
describe TStudentsMaster;
select * from TStudentsMaster;
-- alter table TStudentsMaster add column DOJ date;
alter table TStudentsMaster modify column DOJ varchar(30);
describe TStudentsMaster;
update TStudentsMaster set DOJ='01-06-2024';
select * from  TStudentsMaster;
alter table TStudentsMaster drop column DOJ; 
describe TStudentsMaster;
-- alter table TStudentsMaster rename  column  Fs_email to email;
alter table TStudentsMaster rename  column Fs_Name to Stu_Name ;
describe TStudentsMaster;
select stu_Name,Fs_Course,Fs_email,Fn_Regno from TStudentsMaster where Fs_City='Hyderabad';
-- distinct used to find the uniquness
select distinct Fn_Batch,Fs_Course from TStudentsMaster;
update TStudentsMaster set Fs_City="Bangalore" where Fn_Regno=5025;
update TStudentsMaster set Fs_City="Bangalore" where Fn_Regno=5028;
 select * from TStudentsMaster where Fs_City="Bangalore";
 delete from TStudentsMaster where Fn_Regno=5028;