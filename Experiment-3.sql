show databases;
create database Experiment3;
-- Joins concepts 
use Experiment3;
 create table TStudent_Master(USN int(3) primary key,
 Name varchar(20) not null ,Coursename varchar(20) ,
 Batch varchar(20) , MobileNo bigInt,email varchar(25) ,
 city varchar(20));
select * from TStudent_Master;
insert into TStudent_Master values(121,'genniya','msaiml','B2','7890142356','geniya@gmail.com','hyd');
insert into TStudent_Master values(122,'hobi','aiml','B7',7190142356,'hobi@gmail.com','lowi');
insert into TStudent_Master values(123,'lisa','Mca','B2','9590142356','lisa@gmail.com','kochi');
insert into TStudent_Master values(124,'namjoon','Mbbs','B2','8830142356','rm@gmail.com','jaipur');
insert into TStudent_Master values(125,'money','Msdc','B1','5890142356','yamo@gmail.com','Miyapur');
insert into TStudent_Master values(126,'lucifier','mscv','B2','8890142356','luca@gmail.com','delhi');
insert into TStudent_Master values(127,'gojo','mssp','B2','9890142356','sukuna@gmail.com','hisar');
     
create table   TStudents_Details (USN int(2), 
SEMESTER varchar(2), TM1 int(2), TM2 int(2), TM3 int(2), LM1 int(2), LM2 int(2) ,TOTAL bigint,
PERCENTAGE int(2),foreign key (USN) references TStudent_Master(USN));
select * from TStudents_Details;
insert into TStudents_Details values(121,'s1',56,57,58,87,67,78,87);
insert into TStudents_Details values(123,'s2',86,47,78,82,65,78,57);
insert into TStudents_Details values(124,'s1',76,37,88,83,68,78,67);
insert into TStudents_Details values(125,'s3',66,77,98,84,69,78,77);
insert into TStudents_Details values(126,'s3',65,37,56,85,66,78,87);
insert into TStudents_Details values(127,'s3',56,47,51,86,67,78,77);
         
-- left join TStudent_Master with TStudents_Details on the USN column
SELECT TStudent_Master.USN,TStudent_Master.Name,TStudents_Details.PERCENTAGE from  TStudent_Master
inner join TStudents_Details
ON TStudent_Master.USN = TStudents_Details.USN;

select * from TStudents_Details;
SELECT * from  TStudent_Master
left join TStudents_Details
on TStudent_Master.USN = TStudents_Details.USN;


-- right join TStudent_Master with TStudents_Details on the USN column
Select * from  TStudent_Master
right join TStudents_Details
on TStudent_Master.USN = TStudents_Details.USN;


select * from TStudent_Master left join TStudents_Details on 
    TStudent_Master.USN = TStudents_Details.USN
union
select * from TStudents_Details right join TStudent_Master on 
TStudent_Master.USN = TStudents_Details.USN;

select 
    TStudent_Master.USN,TStudent_Master.Name,TStudent_Master.Coursename,
    TStudents_Details.SEMESTER,TStudents_Details.TM1,TStudents_Details.TM2,
    TStudents_Details.TM3 from
    TStudent_Master, TStudents_Details where
    TStudent_Master.USN = TStudents_Details.USN;

select TStudent_Master.USN,TStudent_Master.Name,TStudent_Master.Coursename,
TStudents_Details.SEMESTER,TStudents_Details.TM1,TStudents_Details.TM2,
TStudents_Details.TM3
from TStudent_Master inner join TStudents_Details on TStudent_Master.USN = TStudents_Details.USN;


select
    A.USN AS Student1_USN,
    A.Name AS Student1_Name,
    B.USN AS Student2_USN,
    B.Name AS Student2_Name,
    A.Batch
from
    TStudent_Master A
inner join
    TStudent_Master B on A.Batch = B.Batch and A.USN <> B.USN;
    
select TStudent_Master.USN,TStudent_Master.Name,
TStudents_Details.SEMESTER,
    TStudents_Details.TM1 from TStudent_Master cross join
    TStudents_Details;
