SET search_path TO bnb, public;

CREATE VIEW bookingWithRating AS
SELECT b.listingId, extract(year from b.startdate) as year, avg(t.rating) as avgRating, l.owner
FROM booking b, travelerRating t, listing l
WHERE b.listingId = t.listingId AND t.listingId = l.listingId AND b.startdate = t.startdate AND cast(extract(year from t.startdate) as integer) >= cast(extract(year from now()) as integer) - 10  
GROUP BY b.listingID, extract(year from b.startdate), l.owner 
ORDER BY b.listingID;

CREATE VIEW notNonDecreasing AS
SELECT b1.listingId 
FROM bookingWithRating b1, bookingWithRating b2
WHERE b1.listingID = b2.listingID AND b1.year > b2.year AND b1.avgRating < b2.avgRating;

CREATE VIEW bookingsForNotNonDecreasing AS
SELECT b.listingId, b.year, b.avgRating, b.owner 
FROM bookingWithRating b, notNonDecreasing n
WHERE b.listingID = n.listingID;

CREATE VIEW nonDecreasing AS 
(SELECT * 
FROM bookingWithRating)
EXCEPT
(SELECT *
FROM bookingsForNotNonDecreasing);

CREATE VIEW numWithNonDecreasing AS
SELECT sum(distinct owner) as count
FROM nonDecreasing;

CREATE VIEW numOwners AS
SELECT sum(distinct owner) as count
FROM bookingwithrating;

SELECT NULLIF(cast(cast(w.count as float)/(CASE WHEN cast(o.count as float) = cast(0 as float) THEN cast(1 as float) ELSE cast(o.count as float) END)*100 as integer), 0) as percentage
FROM numOwners o, numWithNonDecreasing w;


