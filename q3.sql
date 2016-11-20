SET search_path TO bnb, public;

CREATE VIEW regulatedBookings AS
SELECT l.listingId, b.startdate, b.numNights, l.city, l.propertyType, l.owner, c.regulationType, c.days 
FROM Booking b, Listing l, CityRegulation c
WHERE b.listingId = l.listingId AND l.city = c.city AND l.propertyType = c.propertyType; 

CREATE VIEW nonValidListings AS
SELECT r2.listingId, r2.startdate, r2.numNights, r2.city, r2.propertyType, r2.owner, r2.regulationType, r2.days
FROM regulatedBookings r1, regulatedBookings r2 
WHERE r1.listingId = r2.listingId AND r1.startdate > r2.startdate AND r1.startdate < r2.startdate + r2.numNights;

CREATE VIEW nonValidRegulatedBookings AS
SELECT r.listingId, r.startdate, r.numNights, r.city, r.propertyType, r.owner, r.regulationType, r.days
FROM regulatedBookings r, nonValidListings n
WHERE r.listingId = n.listingId;

CREATE VIEW validRegulatedBookings AS
SELECT *
FROM regulatedBookings
EXCEPT
SELECT *
FROM nonValidRegulatedBookings;

CREATE VIEW spillOver AS
select listingid, extract(year from startdate)+1 as year ,sum(GREATEST(numNights - (365 - extract(doy from startdate)), 0)) as partialtotal, owner, city, regulationType, days  from validregulatedbookings group by listingid, extract(year from startdate), owner, city, regulationType, days;

CREATE VIEW nonSpillOver AS
select listingid, extract(year from startdate) as year ,sum(LEAST((365 - extract(doy from startdate)), numNights)) as partialtotal, owner, city, regulationType, days  from validregulatedbookings group by listingid, extract(year from startdate), owner, city, regulationType, days;

CREATE VIEW combinedDays AS
(SELECT * FROM spillOver) UNION (SELECT * FROM nonSpillOver)
ORDER BY listingId;

CREATE VIEW summedDays AS
SELECT listingid, year, sum(partialtotal) as total, owner, city, regulationType, days FROM combinedDays
GROUP BY listingid, year, owner, city, regulationType, days
HAVING regulationType = 'max' AND sum(partialtotal) > days;


CREATE VIEW minViolations AS 
(SELECT v1.owner as homeowner, v1.listingID, cast(extract(year from v1.startdate) as integer) as year, v1.city
FROM validRegulatedBookings v1
WHERE v1.regulationType = 'min' AND v1.numNights < v1.days);

CREATE VIEW maxViolations As
(SELECT s.owner as homeowner, s.listingID, cast(s.year as integer) as year, s.city
FROM summedDays s
)
EXCEPT
(SELECT * FROM minViolations); 


(SELECT * FROM minViolations)
UNION
(SELECT * FROM maxviolations);

