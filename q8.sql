create view HOratings as select booking.listingid,travelerid,booking.startdate,rating as homeownerrating from booking cross join homeownerrating where booking.listingid=homeownerrating.listingid and booking.startdate = homeownerrating.startdate;
 
create view reciprocalbookings as select t.listingid,t.startdate,travelerid,t.rating as travelerrating, homeownerrating from travelerrating as t cross join HOratings as h where t.listingid = h.listingid and t.startdate = h.startdate;

create view totalreciprocals as select travelerid,count(distinct(listingid,startdate)) as reciprocals from reciprocalbookings group by travelerid;

create view rangedreciprocalbookings as select * from reciprocalbookings where travelerrating<=homeownerrating+1 and travelerrating>=homeownerrating-1;

create view totalrangedreciprocals as select travelerid, count(distinct(listingid,startdate)) from rangedreciprocalbookings group by travelerid;

create view alltravelerreciprocals as select traveler.travelerid, coalesce(reciprocals,0) as reciprocals from traveler left join totalreciprocals on totalreciprocals.travelerid = traveler.travelerid;

create view allrangedreciprocals as select traveler.travelerid, coalesce(count,0) as backScratches from traveler left join totalrangedreciprocals on totalrangedreciprocals.travelerid = traveler.travelerid;

select allrangedreciprocals.travelerid,reciprocals,backScratches from alltravelerreciprocals natural join allrangedreciprocals order by reciprocals DESC, backscratches DESC;