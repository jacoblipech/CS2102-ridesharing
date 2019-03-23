DROP TABLE Address;
DROP TABLE Promocodes;
DROP TABLE Bids;
DROP TABLE Creates;
DROP TABLE Trips;
DROP TABLE Owns;
DROP TABLE Carspecs;
DROP TABLE Cars;
DROP TABLE Profile;
DROP TABLE Drivers;
DROP TABLE Passengers;
DROP TABLE Admin;
DROP TABLE Users;



CREATE TABLE Users (
	uid INTEGER,
	name VARCHAR(80) NOT NULL,
	email VARCHAR(80) NOT NULL,
	password VARCHAR(500) NOT NULL,
	phonenum INTEGER NOT NULL,
	PRIMARY KEY(uid)
);

CREATE TABLE Admin(
	uid INTEGER,
	PRIMARY KEY (uid),
	FOREIGN KEY(uid) REFERENCES Users ON DELETE CASCADE
);

CREATE TABLE Passengers (
	uid INTEGER PRIMARY KEY,
    FOREIGN KEY(uid) REFERENCES Users ON DELETE CASCADE
);

CREATE TABLE Drivers (
	uid INTEGER PRIMARY KEY,
	FOREIGN KEY(uid) REFERENCES Users ON DELETE CASCADE
);

CREATE TABLE Profile (
	uid INTEGER,
	picurl VARCHAR(100),
	rating INTEGER,
    pid INTEGER PRIMARY KEY,
	FOREIGN KEY(uid) REFERENCES Users ON DELETE CASCADE
);

CREATE TABLE Cars (
	cid INTEGER PRIMARY KEY
);

CREATE TABLE Owns (
	uid INTEGER NOT NULL,
	cid INTEGER NOT NULL,
	PRIMARY KEY(uid, cid),
	FOREIGN KEY(uid) REFERENCES Drivers ON DELETE CASCADE,
	FOREIGN KEY(cid) REFERENCES Cars ON DELETE CASCADE
);


CREATE TABLE Carspecs (
	cid INTEGER PRIMARY KEY,
	seats INTEGER NOT NULL,
	model VARCHAR(50),
	description VARCHAR(50),
	FOREIGN KEY(cid) REFERENCES Cars ON DELETE CASCADE
);

CREATE TABLE Trips (
	tid INTEGER PRIMARY KEY,
	origin INTEGER NOT NULL,
	destination INTEGER NOT NULL,
	maxbid INTEGER NOT NULL,
	minbid INTEGER NOT NULL,
    starttime TIMESTAMP NOT NULL,
    cid INTEGER NOT NULL,
    numpassengers INTEGER,
    iscomplete BOOLEAN,
    FOREIGN KEY(cid) REFERENCES Cars ON DELETE CASCADE
);

CREATE TABLE Creates (
	uid INTEGER,
	tid INTEGER,
    created TIMESTAMP,
	PRIMARY KEY(uid, tid),
	FOREIGN KEY(uid) REFERENCES Drivers ON DELETE CASCADE,
	FOREIGN KEY(tid) REFERENCES Trips ON DELETE CASCADE
);


CREATE TABLE Bids (
	uid INTEGER NOT NULL,
	tid INTEGER NOT NULL,
	amount INTEGER NOT NULL,
    isconfirmed BOOLEAN,
    PRIMARY KEY(uid, tid),
	FOREIGN KEY(uid) REFERENCES Passengers ON DELETE CASCADE,
	FOREIGN KEY(tid) REFERENCES Trips ON DELETE CASCADE
);

CREATE TABLE Promocodes (
	prid INTEGER PRIMARY KEY,
	code VARCHAR(10) UNIQUE,
	expirydate TIMESTAMP NOT NULL,
	discount INTEGER NOT NULL
);

CREATE TABLE Address(
	aid INTEGER PRIMARY KEY,
	postalcode INTEGER NOT NULL,
	fulladdress varchar(100)
);



