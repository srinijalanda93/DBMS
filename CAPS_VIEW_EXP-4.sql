-- caps database
use caps;
show tables;
-- single table views
create view view_coordinators as
select coordinator_id, name, email
from coordinator;

create view view_wings as select wing_id, wing_name from wing ;select * from wing;


-- multiple table views
-- View for Volunteers and Their Team Leaders
create view view_volunteers_teamleaders as
select v.volunteer_id, v.name as volunteer_name, t.name as teamleader_name
from volunteer v
join teamleader t on v.teamleader_id = t.teamleader_id;

-- View for Mentors and Their Committees
create view view_mentors_committees as
select m.mentor_id, m.name as mentor_name, c.committee_name
from mentor m
join wing w on m.wing_id = w.wing_id
join committee c on w.wing_id = c.wing_id;


-- 
create view view_attendance_records as
select a.attendance_id, v.name as volunteer_name, a.attendance_date, a.status
from attendance a
join volunteer v on a.member_id = v.volunteer_id and a.member_type = 'volunteer';


-- insert operation
insert into view_coordinators values (1003, 'deepa', 'deepa@example.com');
select * from view_coordinators;

select a.attendance_id, v.name as volunteer_name, a.attendance_date, a.status
from attendance a
join volunteer v on a.member_id = v.volunteer_id and a.member_type = 'volunteer';


--
insert into view_coordinators (coordinator_id, name, email)
values (1004, 'kezya', 'kezya@gmail.com');
insert into view_wings (wing_id, wing_name)
values (2004, 'stromMarvels');

select * from view_coordinators;
select * from view_wings;

insert into volunteer (volunteer_id, name, email, teamleader_id)
values (6025, 'Honiya', 'Honiya@gmail.com', 5003);


-- update 
update view_coordinators
set name = 'suresh kumar'
where coordinator_id = 1001;

select * from view_coordinators;
select * from view_wings;
update view_wings set wing_name="MarvelousPrj" where wing_id=2004; 


-- DELETE THE RECORD
delete from view_coordinators where coordinator_id=1001;
delete from view_wings where wing_id=2004;
select * from view_coordinators;
select * from view_wings;