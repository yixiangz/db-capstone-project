SELECT * FROM littlelemondb.bookings;
update littlelemondb.bookings set date = '2022-10-10', tableNO = 5 where bookingID = 1;
update littlelemondb.bookings set date = '2022-11-12', tableNO = 3, customerID = 3 where bookingID = 2;
update littlelemondb.bookings set date = '2022-10-11', tableNO = 2, customerID = 2 where bookingID = 3;
insert into littlelemondb.bookings values (4, '2022-10-13', 2, 1)

delimiter //
create procedure CheckBooking(IN dt Date, IN tablenum int)
begin
select case  when tableNo is not null then concat('Table ', tablenum , ' is already booked')
else concat('Table ' ,tablenum , ' is available')  end as 'Booking status' from bookings where date = dt and tableNo = tablenum;
end //
call CheckBooking('2022-11-12' ,4);







