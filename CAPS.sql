create database CAPS;
use CAPS;
show tables;
-- corrdinator Table
create table coordinator (
    coordinator_id int primary key,
    name varchar(100) not null,
    email varchar(100) not null unique
);

-- inserting coordinators
insert into coordinator (coordinator_id, name, email) values 
(1001, 'suresh', 'suresh@example.com'), 
(1002, 'Ramesh', 'Ramesh@example.com');

create table wing (
    wing_id int primary key,
    wing_name varchar(100) not null
);

-- populating the wing table
insert into wing (wing_id, wing_name) values 
(2001, 'peer-to-peer'), 
(2002, 'techdeveloper'), 
(2003, 'psychological facts');

create table mentor (
    mentor_id int primary key,
    name varchar(100) not null,
    email varchar(100) not null unique,
    wing_id int,
    foreign key (wing_id) references wing(wing_id)
);

-- inserting mentors
insert into mentor (mentor_id, name, email, wing_id) values 
(3001, 'srinija', 'srinija@example.com', 2001), 
(3002, 'sudha', 'sudha@example.com', 2003);

create table committee (
    committee_id int primary key,
    committee_name varchar(100) not null,
    wing_id int,
    foreign key (wing_id) references wing(wing_id)
);

-- populating the committee table
insert into committee (committee_id, committee_name, wing_id) values 
(4001, 'gd', 2001), 
(4002, 'resume building', 2001), 
(4003, 'portfolio building', 2001),
(4004, 'coderbrainly', 2002), 
(4005, 'python intelligence', 2002), 
(4006, 'javascript builder', 2002);

create table teamleader (
    teamleader_id int primary key,
    name varchar(100) not null,
    email varchar(100) not null unique,
    committee_id int,
    foreign key (committee_id) references committee(committee_id)
);

-- inserting team leaders
insert into teamleader (teamleader_id, name, email, committee_id) values 
(5001, 'Arjun Das','Arjundas@gmail.com', 4001), 
(5002, 'Avi malik', 'Avimalik@gmail.com', 4001),
(5003, 'Genniya', 'gennniya@gmail.com', 4002), 
(5004, 'sooya', 'sooya@gmail.com', 4002),
(5005, 'vikram', 'vikram.com', 4003), 
(5006, 'perra', 'perra@gmail.com', 4003),
(5007, 'Aksika','Aksika@gmail.com', 4004), 
(5008, 'Krisha', 'krishna@gmail.com', 4004),
(5009, 'vijaya', 'vijaya@gmail.com', 4005), 
(5010, 'chandu', 'chandu@gmail.com', 4005),
(5011, 'sneha', 'sneha@gmail.com', 4006), 
(5012, 'Minnija', 'Minnija.com', 4006);

create table volunteer (
    volunteer_id int primary key,
    name varchar(100) not null,
    email varchar(100) not null unique,
    teamleader_id int,
    foreign key (teamleader_id) references teamleader(teamleader_id)
);

-- inserting volunteers
insert into volunteer (volunteer_id, name, email, teamleader_id) values 
(6001, 'Joel Kumar', 'jeol.kumar@example.com', 5001), 
(6002, 'Aisha Gupta', 'aisha.gupta@example.com', 5001),
(6003, 'Rajesh Sharma', 'rajesh.sharma@example.com', 5002), 
(6004, 'Priya Singh', 'priya.singh@example.com', 5002),
(6005, 'robin Patel', 'robin.patel@example.com', 5003),
(6006, 'Nisha Reddy', 'nisha.reddy@example.com', 5003),
(6007, 'Karan Mehta', 'karan.mehta@example.com', 5004),
(6008, 'Aunsha Iyer', 'sneha.iyer@example.com', 5004),
(6009, 'Amit Joshi', 'amit.joshi@example.com', 5005),
(6010, 'harika Desai', 'pooja.desai@example.com', 5005),
(6011, 'Anil Chauhan', 'anil.chauhan@example.com', 5006),
(6012, 'Ritu Kapoor', 'ritu.kapoor@example.com', 5006),
(6013, 'Sunil Verma', 'sunil.verma@example.com', 5007),
(6014, 'Meera Naik', 'meera.naik@example.com', 5007),
(6015, 'Deepak Rao', 'deepak.rao@example.com', 5008),
(6016, 'Anjali Mishra', 'anjali.mishra@example.com', 5008),
(6017, 'Rohan Bhatia', 'rohan.bhatia@example.com', 5009),
(6018, 'Komal Sethi', 'komal.sethi@example.com', 5009),
(6019, 'Sameer Goel', 'sameer.goel@example.com', 5010),
(6020, 'Tina Arora', 'tina.arora@example.com', 5010),
(6021, 'Manish Thakur', 'manish.thakur@example.com', 5011),
(6022, 'Neha Malhotra', 'neha.malhotra@example.com', 5011),
(6023, 'Vivek Nair', 'vivek.nair@example.com', 5012),
(6024, 'Sonal Kulkarni', 'sonal.kulkarni@example.com', 5012);


create table attendance (
    attendance_id int primary key,
    member_id int not null,
    member_type enum('coordinator', 'mentor', 'teamleader', 'volunteer') not null,
    attendance_date date not null,
    status enum('present', 'absent') not null
);

-- example attendance records (you can insert more as needed)
insert into attendance (attendance_id, member_id, member_type, attendance_date, status) values 
(7001, 1001, 'coordinator', '2024-08-01', 'present'),
(7002, 3001, 'mentor', '2024-08-01', 'present'),
(7003, 5001, 'teamleader', '2024-08-01', 'absent'),
(7004, 6001, 'volunteer', '2024-08-01', 'present');

-- 1 Retrieve the names of volunteers who are under the same team leader as the volunteer 'Joel Kumar'.
select v2.name 
from volunteer v1 
join volunteer v2 on v1.teamleader_id = v2.teamleader_id 
where v1.name = 'joel kumar' and v1.volunteer_id <> v2.volunteer_id;

-- 2 Find the committees that have more volunteers than the average number of volunteers in all committees.
SELECT c.committee_id, COUNT(v.volunteer_id) AS num_volunteers
FROM committee c
LEFT JOIN teamleader tl ON c.committee_id = tl.committee_id
LEFT JOIN volunteer v ON tl.teamleader_id = v.teamleader_id
GROUP BY c.committee_id;
SELECT AVG(num_volunteers)
FROM (
    SELECT COUNT(v.volunteer_id) AS num_volunteers
    FROM committee c
    LEFT JOIN teamleader tl ON c.committee_id = tl.committee_id
    LEFT JOIN volunteer v ON tl.teamleader_id = v.teamleader_id
    GROUP BY c.committee_id
) AS subquery;

-- 3 List the names of mentors who are responsible for the committees that 'Aisha Gupta' is volunteering for.
select distinct m.name 
from mentor m 
join wing w on m.wing_id = w.wing_id 
join committee c on w.wing_id = c.wing_id 
join teamleader t on c.committee_id = t.committee_id 
join volunteer v on t.teamleader_id = v.teamleader_id 
where v.name = 'aisha gupta';

-- 4 Retrieve the names of volunteers who have more attendance days marked 'present' than the average attendance in 'coderbrainly' committee.
insert into attendance (attendance_id, member_id, member_type, attendance_date, status) values 
(7005, 6001, 'volunteer', '2024-08-01', 'present'),  -- Joel Kumar
(7006, 6002, 'volunteer', '2024-08-01', 'present'),  -- Aisha Gupta
(7007, 6003, 'volunteer', '2024-08-01', 'present'),  -- Rajesh Sharma
(7008, 6004, 'volunteer', '2024-08-01', 'absent'),   -- Priya Singh
(7009, 6001, 'volunteer', '2024-08-02', 'present'),  -- Joel Kumar
(7010, 6002, 'volunteer', '2024-08-02', 'absent'),   -- Aisha Gupta
(7011, 6003, 'volunteer', '2024-08-02', 'present'),  -- Rajesh Sharma
(7012, 6004, 'volunteer', '2024-08-02', 'present');  -- Priya Singh

select * from attendance;
-- volunteers from "coderbrainly"
select v.volunteer_id, v.name
from volunteer v
join teamleader t on v.teamleader_id = t.teamleader_id
join committee c on t.committee_id = c.committee_id
where c.committee_name = 'coderbrainly';

-- Attendance Records for coderbrainly
select v.volunteer_id, v.name, count(a.attendance_id) as present_count
from volunteer v
join teamleader t on v.teamleader_id = t.teamleader_id
join committee c on t.committee_id = c.committee_id
join attendance a on v.volunteer_id = a.member_id and a.member_type = 'volunteer'
where c.committee_name = 'coderbrainly' and a.status = 'present'
group by v.volunteer_id, v.name;


