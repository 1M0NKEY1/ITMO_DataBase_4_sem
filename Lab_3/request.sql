select *
from customerOrders
where orderDate > '2024-01-01';

explain (analyse, buffers , verbose)
select *
from customers
where customerid = 500 or address = 'ad';

explain (analyse , buffers , verbose )
select *
from orders
where orderid = 300 or orderdate = '2024-03-13';

