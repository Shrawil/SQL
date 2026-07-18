-- i. Add a new column with name connect_date with datatype date.
alter table customer
add column connect_date date;

-- ii. Drop column connect_date.
alter table customer
drop column connect_date;

-- iii. Add primary key on cust_id column.
alter table customer
add primary key (cust_id);

-- iv. Add a new column connect_date with datatype date after name column.
alter table customer
add column connect_date date after name;