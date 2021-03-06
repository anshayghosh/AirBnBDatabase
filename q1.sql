CREATE VIEW booking10 AS (SELECT listingId, startdate, travelerID FROM Booking WHERE extract (year from startdate) >= (extract (year from current_date) -10));

CREATE VIEW travelerbookings10 AS SELECT * FROM Traveler NATURAL INNER JOIN booking10;

CREATE VIEW numbookings AS SELECT extract ( year from startdate ) , travelerID, COUNT ( listingID ) FROM travelerbookings10 GROUP BY extract ( year from startdate ) , travelerID ;




CREATE VIEW bookingrequest10 AS (SELECT requestID, startdate, travelerID FROM BookingRequest WHERE extract (year from startdate) >= (extract (year from current_date) -10));

CREATE VIEW travelerbookingrequests10 AS SELECT * FROM Traveler NATURAL INNER JOIN bookingrequest10;

CREATE VIEW numbookingrequests AS SELECT extract ( year from startdate ) , travelerID, COUNT ( requestID ) FROM travelerbookingrequests10 GROUP BY extract ( year from startdate ) , travelerID ;



create view bookingandrequests as select coalesce(a.travelerid,b.travelerid) as travelerid,coalesce(a.date_part,b.date_part) as year,coalesce(a.count,0) as numBookings,coalesce(b.count,0) as numRequests from numbookings a full join numbookingrequests b on a.travelerid = b.travelerid and a.date_part = b.date_part;

select coalesce(a.travelerid,b.travelerid) as travelerid, email, year,coalesce(numrequests,0) as numRequests, coalesce(numbookings,0) as numBooking from bookingandrequests a right join traveler b on a.travelerid = b.travelerid order by year DESC, travelerid ASC;