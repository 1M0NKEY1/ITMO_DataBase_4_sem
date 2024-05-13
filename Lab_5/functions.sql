create or replace function ordersInsertTrigger()
returns trigger as $$
begin
    if ( new.orderDate >= date '2022-01-01' and new.orderDate < date '2023-01-01' ) then
        insert into orders_2022 values (new.*);
    elsif ( new.orderDate >= date '2023-01-01' and new.orderDate < date '2024-01-01' ) then
        insert into orders_2023 values (new.*);
    elsif ( new.orderDate >= date '2024-01-01' ) then
        insert into orders_2024 values (new.*);
    else
        raise exception 'Order date out of range.  Fix the orders_insert_trigger() function!';
    end if;
    return null;
end;
$$
language plpgsql;

create trigger insertOrderTrigger
    before insert on orders
    for each row execute procedure ordersInsertTrigger();