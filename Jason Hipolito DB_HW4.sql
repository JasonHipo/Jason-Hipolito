--Query 1
Select city
From agents
where aid in(Select aid
            From orders
            where cid = 'c006');
                        
--Query 2 (try to compress)
Select distinct pid 
from products 
where pid in (select pid
             from orders
             where aid in(select aid
                         from orders
                         where cid in(select cid
                                     from customers 
                                     where city = 'Beijing')
                         )
             )
order by pid asc;

--Query 3 (check)
Select cid, name 
from customers 
where cid in(select cid
            from orders
            where aid != 'a03');
            
--Query 4 (should return c001, c006 but its also giveing me c004)
Select cid 
from customers
where cid in (select cid
             from orders
             where pid = 'p01'
             or pid in (select pid
                        from orders 
                        where pid = 'p07'));