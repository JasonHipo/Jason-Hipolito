--Jason Hipolito
--Lab 3

--Query 1
Select ordno, totalusd
from orders;

--Query 2
Select name, city
from agents
where name = 'Smith';

--Query 3
Select pid, name, priceusd
from products
where qty > 200010;

--Query 4
Select name, city
From customers
where city = 'Duluth';

--Query 5 
Select name, city
from agents
where city != 'New York' or city != 'Duluth';

--Query 6 (check)
Select *
From products
Where (city != 'Dallas' or city != 'Duluth') and priceusd > 1;

--Query 7
Select *
From orders
Where month = 'Mar'
or month = 'May';

--Query 8 
Select * 
From orders
Where month = 'Feb'
and totalusd >= 500;

--Query 9
Select * 
From orders
Where cid = 'c005';