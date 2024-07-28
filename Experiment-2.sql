show databases;
use p2;
show tables; 
-- Experiment 2
drop table Department;
create table Department (DeptId int(1) primary key,DName varchar(10) not null,HODId int(2) not null);
select * from Department;
alter table Department modify column  DName varchar(20);
insert into Department values (1,'Electronics',11);
insert into Department values (2,'Management',12);
insert into Department values (3,'Life science',13);
insert into Department values (4,'computers',14);

-- create Instructor Table where DeptId (fk)
drop table Instructor;
create table Instructor (InstrId int(2) primary key,
iName varchar(20) not null, DeptId int(1),Email varchar(45) unique,
foreign key (DeptId) references Department(DeptId));
insert into Instructor values (11,'genniya',1,'g@gmail.com'); -- genniya is HOD electronics
insert into Instructor values (21,'sooya',1,'so@gmail.com');  -- sooya is belong to electronics
insert into Instructor values (13,'minnija',4,'mi@gmail.com'); -- minnij is HOD of computers
insert into Instructor values (31,'Hobi',4,'hob@gmail.com'); -- hobi is belongs to computers;
select * from Instructor;

-- create Course Table
