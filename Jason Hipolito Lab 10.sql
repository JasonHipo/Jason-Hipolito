--Jason Hipolito
--11/26/2017
--	Returns	the	immediate prerequisites for	the passed-in course number.
create or replace function get_course_prerequisites(int, REFCURSOR) 
returns refcursor as $$
declare
   wanted_course int       := $1;
   resultset   REFCURSOR := $2;
begin
   open resultset for 
      select prereqnum
      from   prerequisites
       where  coursenum = wanted_course;
   return resultset;
end;
$$ 
language plpgsql;

SELECT get_course_prerequisites(499, 'results');
FETCH ALL FROM results;

--Returns the courses for which	the	passed-in course number is an 
--immediate	pre-requisite.	
create or replace function get_course_unlocked(int, REFCURSOR) 
returns refcursor as $$
declare
   can_take int       := $1;
   resultset   REFCURSOR := $2;
begin
   open resultset for 
      select coursenum
      from   prerequisites
       where  prereqnum = can_take;
   return resultset;
end;
$$ 
language plpgsql;

SELECT get_course_unlocked(221, 'results');
FETCH ALL FROM results;