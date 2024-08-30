use sakila;

select title as "Film Name" from film;

SELECT 
    title, length, rental_rate
FROM
    film
WHERE
    rental_rate = 4.99;
SELECT 
    *
FROM
    customer
WHERE
    last_name = 'Smith'
        OR Last_name = 'Jones';
SELECT 
    *
FROM
    customer
WHERE
    first_name = 'Alisha'
        AND Last_name = 'Joy';
        
SELECT 
    *
FROM
    customer
WHERE not
    first_name = 'Mary';

SELECT 
    title, length, rental_rate
FROM
    film
WHERE
    rental_rate between  0.99 and 4;
    
SELECT 
    title, length, rental_rate
FROM
    film
WHERE
    title like "f%";

SELECT 
    title, length, rental_rate
FROM
    film
WHERE
    title like "_f%";

SELECT 
    title, length, rental_rate
FROM
    film
WHERE
    title in ("African egg","agent truman","alone trip");
    
SELECT 
    title, length, rental_rate
FROM
    film
WHERE
    title regexp "^p";
    

    
    
use rox_hotel;
select * from booking_details;
select * from booking_details where room_description in ('delux','semi delux');

create table Booking(Reservation_Id Int not null, Status_Code Int not null, Booking_Date date not null, Days int not null);
insert into Booking(Reservation_id,Status_Code, Booking_date, Days) values(104,'166','2021-03-24',18),
(105,'166','2021-04-5',10),
(106,'167','2021-04-24',9),
(107,'167','2021-05-2',7),
(108,'166','2021-05-25',20),
(109,'166','2021-06-15',6),
(110,'167','2021-07-24',18),
(111,'166','2020-03-20',10),
(112,'167','2020-03-9',9),
(113,'166','2020-03-24',18),
(114,'167','2020-03-15',30),
(115,'166','2020-03-24',18),
(116,'166','2022-01-24',18);
select * from booking;
select * from booking where status_code=166 and  month(booking_date)=3 and year(booking_date)=2020;
select * from booking order by days desc;

create table Hotel_Detail_Information(Hotel_names varchar(100) not null, 
Email_id varchar(100) not null, 
Cities Varchar(100) not null, 
URLs varchar(100) not null, 
Rating int not null, 
Tarrif_in_$ int not null,
Floors Varchar(50) not null);


insert into Hotel_Detail_Information(Hotel_names, Email_id, Cities, URLs, Rating, Tarrif_in_$,Floors) 
values ('HotelOne','HotelOne@gmail.com','New York','https://www.hotelOne.com/',4,150,'First'),
('HotelTwo','HotelTwo@gmail.com','Los Angeles','https://www.hotelTwo.com/',4,150,'Second'),
('HotelThree','HotelThree@gmail.com','Chicago','https://www.hotelThree.com/',5,150,'Third'),
('HotelFour','HotelFour@gmail.com','Chicago','https://www.hotelFour.com/',5,200,'Forth'),
('HotelFive','HotelFive@gmail.com','New York','https://www.hotelFive.com/',5,200,'Fifth'),
('HotelSix','HotelSix@gmail.com','Los Angeles','https://www.hotelSix.com/',5,150,'Sixth'),
('HotelSeven','HotelSeven@gmail.com','Los Angeles','https://www.hotelSeven.com/',4,150,'Seventh'),
('HotelEight','HotelEight@gmail.com','Los Angeles','https://www.hotelEight.com/',5,300,'Third'),
('HotelNine','HotelNine@gmail.com','Houston','https://www.hotelNine.com/',4,200,'First'),
('HotelTen','HotelTen@gmail.com','San Jose','https://www.hotelTen.com/',5,300,'Fifth'),
('HotelEleven','HotelEleven@gmail.com','San Jose','https://www.hotelEleven.com/',5,300,'Fifth'),
('HotelTwelve','HotelTwelve@gmail.com','San Jose','https://www.hotelTwelve.com/',4,150,'First');

select * from hotel_detail_information;

select floors ,avg(Tarrif_in_$) As "Average Room Rent" from hotel_detail_information
group by floors;