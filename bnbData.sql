TRUNCATE TABLE Traveler CASCADE;
TRUNCATE TABLE Homeowner CASCADE;
TRUNCATE TABLE Listing CASCADE;
TRUNCATE TABLE BookingRequest CASCADE;
TRUNCATE TABLE Booking CASCADE;
TRUNCATE TABLE HomeownerRating CASCADE;
TRUNCATE TABLE CityRegulation CASCADE;
TRUNCATE TABLE TravelerRating CASCADE;

INSERT INTO Traveler VALUES (1000, 'n1', 'f1', 'fn1@domain.com');
INSERT INTO Traveler VALUES (1001, 'n2', 'f2', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1002, 'n3', 'f3', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1003, 'n4', 'f4', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1004, 'n5', 'f5', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1005, 'n6', 'f6', 'fn2@domain.com');
INSERT INTO Traveler VALUES (1006, 'n7', 'f7', 'fn2@domain.com');

INSERT INTO Homeowner VALUES (4000, 'hn1', 'hf1', 'hfn1@domain.com');
INSERT INTO Homeowner VALUES (4001, 'hn2', 'hf2', 'hfn2@domain.com');

INSERT INTO Listing VALUES (3000, 'condo', 2, 4, 'gym', 'c1', 4000);
INSERT INTO Listing VALUES (3001, 'house', 2, 4, 'gym', 'c2', 4001);
INSERT INTO Listing VALUES (3002, 'house', 2, 4, 'gym', 'c2', 4001);
INSERT INTO Listing VALUES (3003, 'house', 2, 4, 'gym', 'c2', 4001);
INSERT INTO Listing VALUES (3004, 'house', 2, 4, 'gym', 'c2', 4001);
INSERT INTO Listing VALUES (3005, 'house', 2, 4, 'gym', 'c2', 4001);
INSERT INTO Listing VALUES (3006, 'house', 2, 4, 'gym', 'c2', 4001);
INSERT INTO Listing VALUES (3007, 'house', 2, 4, 'gym', 'c3', 4001);
INSERT INTO Listing VALUES (3008, 'house', 2, 4, 'gym', 'c2', 4001);
INSERT INTO Listing VALUES (3009, 'house', 2, 4, 'gym', 'c2', 4001);
INSERT INTO Listing VALUES (3010, 'house', 2, 4, 'gym', 'c2', 4001);
INSERT INTO Listing VALUES (3011, 'house', 2, 4, 'gym', 'c2', 4001);

INSERT INTO BookingRequest VALUES (6000, 1000, 3000, '2016-10-05', 2, 1, 100);
INSERT INTO BookingRequest VALUES (6001, 1001, 3000, '2016-10-16', 4, 1, 120);
INSERT INTO BookingRequest VALUES (6003, 1002, 3001, '2014-01-05', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6004, 1003, 3002, '2015-01-05', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6005, 1004, 3003, '2013-01-05', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6006, 1006, 3004, '2012-01-05', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6007, 1002, 3005, '2005-01-05', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6008, 1004, 3006, '2014-01-05', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6009, 1006, 3007, '2007-01-05', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6010, 1006, 3008, '2008-01-05', 10, 1, 75);
INSERT INTO BookingRequest VALUES (6011, 1003, 3009, '2003-01-05', 10, 1, 75);

INSERT INTO Booking VALUES (3000, '2016-10-05', 1000, 2, 1, 90);
INSERT INTO Booking VALUES (3000, '2016-10-06', 1000, 2, 1, 60);
INSERT INTO Booking VALUES (3000, '2016-10-07', 1000, 2, 1, 10);
INSERT INTO Booking VALUES (3008, '2016-10-07', 1000, 2, 1, 1);
INSERT INTO Booking VALUES (3009, '2016-10-07', 1000, 2, 1, 5);
INSERT INTO Booking VALUES (3000, '2016-10-08', 1000, 2, 1, 30);
INSERT INTO Booking VALUES (3001, '2016-01-05', 1000, 2, 1, 90);
INSERT INTO Booking VALUES (3002, '2016-10-05', 1001, 2, 1, 90);
INSERT INTO Booking VALUES (3003, '2016-10-05', 1002, 2, 1, 90);
INSERT INTO Booking VALUES (3003, '2016-10-06', 1002, 2, 1, 10);
INSERT INTO Booking VALUES (3004, '2016-10-06', 1002, 2, 1, 10);
INSERT INTO Booking VALUES (3005, '2016-10-06', 1002, 2, 1, 10);
INSERT INTO Booking VALUES (3003, '2016-10-07', 1002, 2, 1, 180);
INSERT INTO Booking VALUES (3003, '2016-10-08', 1002, 2, 1, 90);
INSERT INTO Booking VALUES (3004, '2016-10-05', 1002, 2, 1, 90);
INSERT INTO Booking VALUES (3006, '2015-01-05', 1004, 5, 1, 120);
INSERT INTO Booking VALUES (3006, '2015-01-06', 1004, 5, 1, 160);
INSERT INTO Booking VALUES (3006, '2015-01-07', 1004, 5, 1, 120);
INSERT INTO Booking VALUES (3007, '2015-01-05', 1004, 5, 1, 120);
INSERT INTO Booking VALUES (3008, '2007-01-05', 1005, 5, 1, 100);
INSERT INTO Booking VALUES (3010, '2007-01-05', 1005, 5, 1, 5);
INSERT INTO Booking VALUES (3009, '2004-01-05', 1005, 5, 1, 120);
INSERT INTO Booking VALUES (3010, '2008-01-05', 1005, 5, 1, 120);
INSERT INTO Booking VALUES (3006, '2015-01-10', 1004, 5, 1, 120);
INSERT INTO HomeownerRating VALUES (3000, '2016-10-05', 5, 'cmt1');
INSERT INTO HomeownerRating VALUES (3001, '2016-01-05', 3, 'cmt2');

INSERT INTO CityRegulation VALUES ('c1', 'condo', 'min', 30);
INSERT INTO CityRegulation VALUES ('c2', 'house', 'max', 90);

INSERT INTO TravelerRating VALUES (3000, '2016-10-05', 5, 'cmt3');






