delimiter //
create procedure AddValidBooking(IN dt Date, IN tablenum int, IN custID int)
begin
  declare tn int;
  select tableNo into tn from bookings where  date = dt and tableNo = tablenum;
start transaction;
insert into bookings 
select max(bookingID) + 1, dt, tablenum, custID from bookings;
if tn is not null then
  rollback;
  select concat('Table ', tablenum , ' is already booked') as 'booking status' ;
else 
  commit;
  select concat('Table ', tablenum , ' is  booked') as 'booking status' ;
  end if;
end //
call AddValidBooking('2022-11-12' ,4,1);