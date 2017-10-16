--Query 1
Select c.name, c.city
from customers c
where c.city in(Select p.city
                from products p
                group by city
                order by count(p.pid)desc
                limit 1);
				
--query 2
select p1.name
from products p1 
where p1.priceUSD >=(select avg(p.priceUSD)
					from products p)
order by p1.priceUSD desc;
					
--Query 3
select c.name, o.pid, o.totalUSD
from orders o inner join customers c on c.cid = o.cid
where o.cid = c.cid
order by totalUSD asc;

--Query 4
Select c.name, coalesce(sum(totalUSD)) as "total price"
from orders o left outer join customers c on o.cid = c.cid
group by c.name
order by c.name desc;

--Query 5
Select c.name, p.name, a.name
from orders o inner join agents a on o.aid = a.aid
				inner join customers c on o.cid = c.cid
                inner join products p on o.pid = o.pid
where a.city = 'Newark';

--Query 6
SELECT ((o.quantity * p.priceUSD) * (1 - (c.discountPct / 100))), o.totalUSD
FROM orders o, customers c, products p
WHERE o.cid = c.cid 
AND o.pid = p.pid 
AND ((o.quantity * p.priceUSD) * (1 - (c.discountPct / 100))) != o.totalUSD;

--Question 7

Select c.name, o.ordno
from orders o left outer join customers c on c.cid = o.cid;


Select c.name, o.ordno
from orders o right outer join customers c on c.cid = o.cid;
/*The diffrence between left and right outer join depends on what table is on 
each side. for example if we use left outer join then the function will keep
all values in orders and compare them to the table on the right in this case
that would be customers and return null for any row that has missing data. 
and if we used left join then what was stated before woule be the opposite.

