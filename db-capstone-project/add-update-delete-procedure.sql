delimiter //
create procedure AddBooking ( IN bid int, IN cid int, IN tno int, IN bdt date)
  begin 
  insert into bookings  (bookingID, date, tableNo, customerID)
  values (bid, bdt, tno, cid);
  select ('new booking added') as 'confirmation' ;
  end//
  call AddBooking (6, 3, 4, "2022-12-30")
  
  delimiter //
create procedure UpdateBooking ( IN bbid int, IN bbdt date)
  begin 
  update bookings set date = bbdt where bookingID = bbid ;
  select concat('Booking', bbid, 'updated') as 'confirmation' ;
  end//
  call UpdateBooking (5,  "2022-11-16")
  
    delimiter //
create procedure CancelBooking ( IN bbid int)
  begin 
  delete from  bookings where bookingID = bbid ;
  select concat('Booking ', bbid, ' cancelled') as 'confirmation' ;
  end//
  call CancelBooking (6)
  
  
