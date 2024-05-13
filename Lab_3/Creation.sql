create table customers (
    customerId serial primary key,
    customerName varchar(255),
    address text
);

create table orders (
    orderId serial primary key,
    customerId int references customers(customerId),
    orderDate date
);

create view customerOrders as
select customerName, address, orderid, orderdate
from customers
join orders on customers.customerid = orders.customerid;

create index idx_customers on customers (customerid, address);

create index idx_orders on orders (orderid, orderdate);
