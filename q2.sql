create view totalreqs as select travelerid, count(requestid) from bookingrequest group by travelerid;

create view average as select avg(count) from totalreqs;

create view totalaboveavg as select travelerid from (select * from totalreqs cross join average) as temp where count>avg;

create view reqWObooking as (select DISTINCT(travelerid) from bookingrequest) EXCEPT (select DISTINCT(travelerid) from booking);

create view scrapers as select totalaboveavg.travelerid from totalaboveavg natural join reqWObooking;

create view scrapersrequests as select listingid, travelerid, city from scrapers natural join bookingrequest natural join listing;

create view countscrapercities as select count(city) as numrequests,travelerid,city from scrapersrequests group by city,travelerid;

