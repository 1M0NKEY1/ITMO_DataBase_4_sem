create table users (
    userID serial primary key,
    name varchar(255),
    zipcode int4,
    birthday date
);


create table orders (
    orderID serial primary key,
    postcode int,
    city varchar(255)
);

select anon.init();

create materialized view anonymized_users as
select
    anon.generalize_int4range(zipcode,100) as zipcode,
    anon.generalize_tsrange(birthday,'decade') as birthday
from users;

create materialized view anonymized_orders as
select
       anon.fake_postcode(),
       anon.lorem_ipsum(2);

select * from anonymized_orders
