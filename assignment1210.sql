--TOUR(tourname, desc) PRIMARY KEY(tourname)
--EVENT(Eventyear, eventmonth, eventday, fee, tourname) COMPOSITE KEY(Eventyear, eventmonth, eventday, tourname) FOREIGN KEY(tourname) references TOUR 
--CLIENT(clientID, surname, GivenName, gender) PRIMAY KEY (clientID)
--BOOKING(datebooked, payment, clientid, eventyear, eventmonth, eventday, tourname) COMPOSITE KEY(ClientID, Tourname, eventyear, eventmonth, eventday, tourname)

--CREATE DATABASE TOURGUIDE
USE TOURGUIDE


IF OBJECT_ID('Tour') IS NOT NULL
DROP TABLE TOUR;
IF OBJECT_ID('Event') IS NOT NULL
DROP TABLE TOUREVENT;
IF OBJECT_ID('CLIENT') IS NOT NULL 
DROP TABLE CLIENT;
IF OBJECT_ID('BOOKING') IS NOT NULL
DROP TABLE BOOKING;



CREATE TABLE TOUR
(
    Tourname NVARCHAR(100) PRIMARY KEY,
    tourdesc NVARCHAR(500)
);
CREATE TABLE EVENT
(
    Eventyear INT,
    Eventmonth NVARCHAR(3),
    Eventday INT,
    Tourname NVARCHAR(100),
    Eventfee MONEY
    CONSTRAINT PK_event_ PRIMARY KEY(Eventyear, Eventmonth,Eventday, Tourname)
    CONSTRAINT FK_Tour_tourname FOREIGN KEY(tourname) REFERENCES TOUR(tourname)
);
CREATE TABLE CLIENT
(
    ClientID int PRIMARY KEY,
    Surname NVARCHAR(100),
    GivenName NVARCHAR(100),
    Gender NVARCHAR(1)
);
CREATE TABLE BOOKING
(
    Datebooked DATE,
    Payment MONEY,
    Tourname NVARCHAR(100),
    Eventyear int,
    Eventmonth nvarchar(3),
    Eventday INT,
    ClientID INT
    CONSTRAINT PK_BOOKING_ PRIMARY KEY(Tourname, eventyear, eventmonth, Eventday, clientID)
    CONSTRAINT FK_EVENT_ FOREIGN KEY(Eventyear, Eventmonth, Eventday, Tourname) REFERENCES Event,
    CONSTRAINT FK_CLIENT_ Foreign key(clientID) REFERENCES CLIENT(ClientID),

);

SELECT *
FROM TOUR, EVENT, CLIENT, BOOKING