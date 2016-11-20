CREATE VIEW booking10 AS (SELECT listingId, startdate, travelerID FROM Booking WHERE date_part('year', startdate) >= (date_part('year',current_date)-10));

CREATE VIEW travelerbookings10 AS SELECT * FROM Traveler NATURAL INNER JOIN booking10;

CREATE VIEW numbookings AS SELECT extract ( year from startdate ) , travelerID, COUNT ( listingID ) FROM travelerbookings10 GROUP BY extract ( year from startdate ) , travelerID ;

CREATE VIEW numbookingswNulls AS SELECT traveler.travelerid, count, date_part FROM numbookings RIGHT OUTER JOIN traveler ON numbookings.travelerid = traveler.travelerid;



CREATE VIEW bookingrequest10 AS (SELECT requestID, startdate, travelerID FROM BookingRequest WHERE date_part('year', startdate) >= (date_part('year',current_date)-10));

CREATE VIEW travelerbookingrequests10 AS SELECT * FROM Traveler NATURAL INNER JOIN bookingrequest10;

CREATE VIEW numbookingrequests AS SELECT extract ( year from startdate ) , travelerID, COUNT ( requestID ) FROM travelerbookingrequests10 GROUP BY extract ( year from startdate ) , travelerID ;

CREATE VIEW numbookingrequestsswNulls AS SELECT traveler.travelerid, count, date_part FROM numbookingrequests RIGHT OUTER JOIN traveler ON numbookingrequests.travelerid = traveler.travelerid;