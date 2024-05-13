create table users (
    id serial primary key,
    userName varchar(255),
    contacts varchar(255),
    userHistory text
);

insert into users (userName, contacts, userHistory)
values
('Egor', '16606', ' '),
('Karina', '77777', ' '),
('Pavel', '84688', ' '),
('Said', '55655', ' '),
('Vlad', '43381', ' '),
('Dima', '84684', ' '),
('Sergey', '44555', ' '),
('Ira', '54003', ' '),
('Andrew', '79103', ' ');

-- copy users(userName, contacts, userHistory)
-- from 'userData.csv'
--     with (format csv, header, delimiter ',');


create table policies (
    id serial primary key,
    type varchar(255),
    cost float,
    conditions text
);

create table insuranceCases (
    id serial primary key,
    damageDescription text,
    insuranceId int references policies(id),
    status varchar(255)
);

create table auxiliaryTable (
    userId int not null unique references users(id),
    policyId int not null unique references policies(id)
);

create table services (
    id serial primary key,
    serviceName varchar(255),
    serviceDescription text,
    serviceCost float
);

create table additionalService (
    id serial primary key,
    adServiceId int references services(id),
    adServiceDescription text,
    adServiceCost float
);

create table payments (
    id serial primary key,
    sum float,
    date date,
    status varchar(255),
    userId int references users(id),
    serviceId int references services(id)
);

create table reviews (
    id serial primary key,
    name varchar(255),
    userId int references users(id),
    reviewText text,
    reviewDate date,
    score int
);



