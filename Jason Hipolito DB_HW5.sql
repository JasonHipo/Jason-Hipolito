--Jason Hipolito
--Lab 5
--Prof. Alan L.

--Query 1 Shows the cities of agents that placed an order for customer c006
Select a.city
From agents a INNER JOIN orders o ON a.aid = o.aid
where cid = 'c006';

--Query 2 Shoes the ids of products orderd through the agient in beijing
select p.pid
from orders o inner join customers c on c.cid = o.cid
			   inner join products p on o.pid = p.pid
where c.city = 'Beijing'
ORDER BY o.pid desc;

--Q3 Shows customers that necer placed an order using subqueries
select c.cid
from customers c
where c.cid not in (select o.cid
                   from orders o);
                   
--Q4 Shows customers that necer placed an order using join queries
select o.ordno, c.cid
from orders o right outer join customers c on o.cid = c.cid
where o.ordno is NULL;

--Query 5 shows agents and customers who placed an order with someone in the same city
Select distinct c.name, c.city, a.name
from orders o inner join customers c on o.cid = c.cid
				inner join agents a on a.aid = o.aid
where c.city = a.city;

--Query 6 Show customers and agents name and thier city if they live in the same city
Select c.name, a.name, c.city
from customers c inner join agents a on c.city = a.city;

--Query 7 Shows the customers who live in the same city that produce the fewest products
Select name, city
From customers
Where city in (Select city 
           		From products
            	Group by city
              	Order by Count(products.city));
