--Day-26
create table mynum(num int);
/*insert into mynum values(8),(8),(3),(3),(1),(4),(5),(6);
*/
drop table mynum
insert into mynum values(8),(8),(3),(3),(2),(1),(5),(5);
select * from mynum

select max(num) as num from mynum
group by num
having count(*)=1
order by num desc
limit 1


--Day-25
create table followers(user_id int, follower_id int )
insert into followers values(0,1),(1,0),(2,0),(2,1)

select user_id,count(user_id) as followers_count
from followers
group by user_id
order by user_id

--Day-24
drop table courses
create table courses(student char,clas varchar)
insert into courses values('A','Math'),
('B','English'),
('C','Math'),
('D','Biology'),
('E','Math'),
('F','CoS'),
('G','Math'),
('H','Math'),
('I','Math');

select * from courses

select clas from courses
group by clas
having count(clas)>4
