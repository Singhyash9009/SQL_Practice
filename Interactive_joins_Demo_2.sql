SELECT * FROM hotel_detail_information;
SELECT * FROM Booking;

CREATE VIEW hotel_info as
 SELECT  hotel_detail_information.hotel_id,  Booking.Status_code, booking.Booking_date,
 hotel_detail_information.Cities
 FROM hotel_detail_information INNER JOIN booking
 ON hotel_detail_information.hotel_id= booking.Hotel_id;
