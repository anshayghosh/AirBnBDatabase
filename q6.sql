create view noncommitted as  (select DISTINCT travelerid,listingid from bookingrequest) EXCEPT ALL (select DISTINCT travelerid,listingid from booking);

create view committed as (select distinct travelerid from bookingrequest) EXCEPT (select distinct travelerid from noncommitted);

create view committedbooked as select travelerid, listingid from booking natural join committed;

create view committedcount as select travelerid, count(listingid) from committedbooked group by travelerid;

select travelerid,surname,count as numListings from committedcount natural join traveler;