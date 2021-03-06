create view allratings as select homeownerid,listingid,rating,travelerrating.startdate from travelerrating natural join listing cross join homeowner where listing.owner = homeowner.homeownerid;

create view ratingcount as select homeownerid, rating, count(startdate) from allratings group by homeownerid,rating;

create view r5 as select homeownerid, count as r5 from ratingcount where rating = 5;

create view r4 as select homeownerid, count as r4 from ratingcount where rating = 4;

create view r3 as select homeownerid, count as r3 from ratingcount where rating = 3;

create view r2 as select homeownerid, count as r2 from ratingcount where rating = 2;

create view r1 as select homeownerid, count as r1 from ratingcount where rating = 1;

create view r5r4 as select coalesce(r5.homeownerid, r4.homeownerid) as homeownerid, r5, r4 from r5 full join r4 on r5.homeownerid = r4.homeownerid;

create view r5r4r3 as select coalesce(r5r4.homeownerid, r3.homeownerid) as homeownerid,r5,r4,r3 from r5r4 full join r3 on r5r4.homeownerid = r3.homeownerid;


create view r5r4r3r2 as select coalesce(r5r4r3.homeownerid, r2.homeownerid) as homeownerid,r5,r4,r3,r2 from r5r4r3 full join r2 on r5r4r3.homeownerid = r2.homeownerid;

create view histogram as select coalesce(r5r4r3r2.homeownerid, r1.homeownerid) as homeownerid,r5,r4,r3,r2,r1 from r5r4r3r2 full join r1 on r5r4r3r2.homeownerid = r1.homeownerid;

select coalesce(a.homeownerid,b.homeownerid) as homeownerid, cast(r5 as bigint) , cast(r4 as bigint), cast(r3 as bigint), cast(r2 as bigint), cast(r1 as bigint) from histogram a full join homeowner b on a.homeownerid = b.homeownerid order by r5 DESC, r4 DESC, r3 DESC, r2 DESC, r1 DESC, homeownerid ASC;
