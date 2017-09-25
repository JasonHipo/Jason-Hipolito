--Query 1
Select city
From agents
where aid in(Select aid
            From orders
            where cid = 'c006');
                        
--Query 2 
select distinct pid
from orders
where aid in(select aid
                from orders
                where cid in(select cid
                                from customers
                                where city = 'Beijing'))
order by pid asc;

--Query 3 (check)

 select distinct cid
 from customers
 where cid not in(select cid
                     from orders
                     where aid = 'a03');
--Query 4
Select distinct cid
from orders
where pid = 'p01'
and cid in(select cid
           from orders
           where pid = 'p07');
--Query 5
select pid
from products
where pid not in
                (select pid
                from orders
                where aid = 'a02'
                or aid = 'a03')
order by pid desc;

--Query 6
select name, discountpct, city
from customers
where cid in
            (select cid
            from orders
            where aid in
                        (Select aid
                        from agents
                        where city = 'Tokyo'
                        or city = 'New York'));
                        
                        
--Query 7
select * 
from customers
where discountpct in(
                    select discountpct
                    from customers
                    where city = 'Duluth'
                    or city = 'London');
                    
--Question 8
--a check constraint is something you put in your database to avoid entering 
--bad database that is not relavent to that column. the advantage of doing this
--would be so that no wrong data can be entered and it will help keep the integity
--of the data. for example if you want to enter a month then you would want to
--add a check constraint that makes sure you are entering something like: 09, sept, or september.
--depending on what the standard for the DB is. a bad check would let you imput something
--like: hotdog, 13, ect in the month column. this would be bad because if someone
--else later tries to find out the date of what ever data they are looking for it
--would be meaningless data. 
                    
                    