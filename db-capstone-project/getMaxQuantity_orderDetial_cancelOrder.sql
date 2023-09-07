create view OrdersView as select orderID, quantity, totalCost from orders where quantity > 2;
select * from OrdersView;

select cd.customerID, o.orderID, o.totalCost, m.courses, m.starters from customerdetails cd
left join bookings b on cd.customerID = b.customerID
left join orders o on o.bookingID = b.bookingID
left join menu m on m.menuID = o.menuID where o.totalCost > 20;

create procedure GetMaxQuantity()
select max(quantity) from orders;
call GetMaxQuantity();

prepare GetOrderDetail from "select orderID, quantity, totalCost FROM orders where orderID in (?)";
set @id = 1;
execute GetOrderDetail using @id;

delimiter //
create procedure CancelOrder(IN id INT)
delete from orders where orderID = id;
select  concat('order id' + id + 'is removed') as 'confirmation';
end //
call CancelOrder(2);
