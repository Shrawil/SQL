-- Customer 
create table customer(
    cust_id int,
    name varchar(50),
    address varchar(500)
);

-- Orders
create table orders(
    pid int primary key,
    pname varchar(50),
    cust_id int,
    foreign key (cust_id) references customer (cust_id)
);