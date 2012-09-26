-- student
create index s_idx1 on table student(id);
create index s_idx2 on table student(name, lname);
create index s_idx3 on table student(lname, name);
create index s_idx4 on table student(absence) where absence > 0;
-- pretraga studenta na osnovu id-a, ili licnih podataka
select * from student where id = stud_id;
select * from student where name = student_name;
select * from student where lname = student_lname;
select * from student where absence > granica;
-- profesor
create index p_idx1 on table professor(id);
create index p_idx2 on table professor(name, lname);
create index p_idx3 on table professor(lname, name);
-- pretraga studenta na osnovu id-a, ili licnih podataka
select * from professor where id = p_id;
select * from professor where name = p_name;
select * from professor where lname = p_lname;
select * from professor where name = p_name and lname = plname;
select * from professor where lname = p_lname and name = pname;

-- teches 
create index t_idx1 on table teaches(id, cid, sid);
create index t_idx2 on table teaches(id, sid, cid);
create index t_idx3 on table teaches(cid, sid, id);
create index t_idx4 on table teaches(sid, cid, id);

-- provera kome neki profesor predaje (tj ko su ucenici za koje on treba da pise izvestaj)
select * from teaches where id = pid;
select * from teaches where id = pid and sid = s_id;
select * from teaches where id = pid and cid = c_id;
select * from teaches where cid = c_id;
select * from teaches where sid = s_id;
select * from teaches where cid = c_id and sid = s_id;
select * from teaches where sid = s_id and cid = c_id;

-- course
create index c_idx1 on table course(id);
create index c_idx2 on table course(name);
-- pretraga studenta na osnovu id-a, ili licnih podataka
select * from course where id = p_id;
select * from course where name = p_name;

-- report
create index r_idx1 on table report(id);
create index r_idx2 on table report(name);
-- pretraga reporta
select * from report where id = r_id;
select * from report where pid = p_id;

-- neki komplikovaniji upiti
select * from professor 
inner join teaches t on t.id = p.id 
inner join course c on c.id = t.cid 
inner join student s on c.side = s.id 
where p.name = 'Pera' and p.lname = 'Peric';


