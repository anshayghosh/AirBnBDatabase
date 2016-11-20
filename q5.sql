create view allratings as select homeownerid,listingid,rating,homeownerrating.startdate from homeowner natural join listing natural join homeownerrating;

create view ratingcount as select homeownerid, rating, count(startdate) from allratings group by homeownerid,rating;
