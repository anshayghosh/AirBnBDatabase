create view pricepernight as select listingid, price/numnights as pricepernight from booking;

create view avgprice as  select listingid, avg(pricepernight) from pricepernight group by listingid;

create view minpricebooked as select travelerid,listingid,min(price) from booking group by travelerid,listingid;

create view goodbargainers as select * from avgprice natural join minpricebooked where min <= 0.75*avg;

create view goodbargainers3 as select travelerid from goodbargainers group by travelerid having count(listingid)>=3;

create view goodbdetails as select travelerid,listingid,price/numnights as pricepernight,avg from goodbargainers3 natural join booking natural join avgprice;

create view goodbminprices as select travelerid, min(pricepernight) as min from goodbdetails group by travelerid;

create view goodblowestprice as select DISTINCT(goodbdetails.travelerid), listingid, pricepernight 
from goodbminprices inner join goodbdetails ON goodbdetails.travelerid = goodbminprices.travelerid and goodbminprices.min = goodbdetails.pricepernight;

create view goodblowestpercentage as select travelerid,listingid, (((avg-pricepernight)/avg)*100) as largestBargainPercentage from avgprice natural join goodblowestprice;

create view goodbavgprice as select travelerid,avg(pricepernight) from goodbdetails group by travelerid;


select * from goodbavgprice natural join goodblowestpercentage order by largestbargainpercentage DESC, travelerid ASC;
