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
	description VARCHAR(200),
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
	code VARCHAR(20) UNIQUE,
	expirydate TIMESTAMP NOT NULL,
	discount INTEGER NOT NULL
);

CREATE TABLE Address(
	aid INTEGER PRIMARY KEY,
	postalcode INTEGER NOT NULL,
	fulladdress varchar(100)
);

--100 Users
INSERT INTO Users (uid,name,email,password,phonenum) VALUES (1,'Keith Lane','ac.risus.Morbi@enimSuspendissealiquet.edu','DYO82HEK4KU','90551035'),(2,'Lucian Hodge','nibh.Quisque@nibh.edu','KXI13UZM9SX','98204338'),(3,'Lana Snider','pharetra.nibh@ategestas.edu','LAX19VFB8CY','98502571'),(4,'Grant Mccarty','euismod@cursus.co.uk','CEA01SPK5OK','98910780'),(5,'Geoffrey Whitehead','Vivamus.euismod.urna@accumsannequeet.co.uk','AJE93JZM0NT','99182791'),(6,'Trevor Marquez','aliquet.odio@sem.co.uk','SHW19GFX5TH','91894310'),(7,'Leonard Park','ante.ipsum@liberodui.ca','XST64PJE6PG','97492895'),(8,'Mia Nixon','eu.tellus.eu@posuereenim.com','FVK37KQD2RN','95225356'),(9,'Kato Hooper','vel@mi.edu','FST91QRP8LS','90468365'),(10,'Mariam Cunningham','dolor@ut.ca','EUO15GTO8II','92419806'),(11,'Tasha Vance','nunc.interdum.feugiat@ultriciesadipiscing.org','MBB67XKV2MR','94240734'),(12,'Gillian Livingston','malesuada@malesuadafamesac.org','ZVJ52CSR4FV','99011561'),(13,'Julie Cooley','erat@blandit.com','MQD44LJK9HK','91411555'),(14,'Harding Clarke','est.Mauris.eu@consectetueradipiscing.net','MOV33RUN4TK','96603484'),(15,'Jenette Harrison','ac@scelerisque.co.uk','DKJ42PYW4RM','91110529'),(16,'Dorothy Hubbard','sit.amet.consectetuer@adipiscing.net','CZG46CSV5DS','97187221'),(17,'Brenda Holloway','ipsum.ac.mi@nibhlacinia.org','JGN47JRY4XV','93383443'),(18,'Oscar Robles','sit@magnatellus.edu','DGT13CUR8FA','95640479'),(19,'Audrey Torres','at.lacus@Aliquamultricesiaculis.org','UQY55LBE5SY','95768480'),(20,'Abraham Rogers','nunc@lectusrutrumurna.com','SAX18CPV5AF','91061716');
INSERT INTO Users (uid,name,email,password,phonenum) VALUES (21,'Margaret Vance','lacus.Quisque.imperdiet@diam.edu','RVM17YYL8FK','95201280'),(22,'Kieran Donovan','ornare.sagittis@ipsum.com','XZX46JTP6KI','90562139'),(23,'Callum Bender','ac.falsea@libero.net','XEE98HGZ8YV','94921455'),(24,'Cade Dennis','id@tempus.co.uk','PWD98CZP7RR','91571963'),(25,'Remedios Drake','orci@egestasblandit.com','VGX61ELR2CF','90310710'),(26,'Hunter Townsend','porttitor.interdum.Sed@falsea.ca','EGI80NAC9DZ','98654979'),(27,'Marah Abbott','Morbi.accumsan@sociis.org','RHL42OUK2IV','97661053'),(28,'Kevyn Patel','a.tortor.Nunc@anteNunc.com','DRI34OPR0HF','96830205'),(29,'Paloma Becker','eget.magna@quamvel.com','FOT62HVQ8ZT','93649395'),(30,'Danielle Armstrong','Ut.semper@justo.org','NWT43AQQ3FD','91473227'),(31,'Nehru Bright','egestas@eu.com','XTH95BLV9JH','93617338'),(32,'Caldwell Stephenson','ultrices@InloremDonec.com','GHZ93KHP5SF','95973687'),(33,'Rhonda Dixon','ac.arcu.Nunc@acmattis.net','MKI08JLU2FQ','90130742'),(34,'Leo Jacobs','velit@ornarelectusjusto.com','TLA71EHS8YZ','98342503'),(35,'Cailin Wallace','facilisis.non@sagittisfalseamvitae.co.uk','AXE14ZUZ1EO','94052813'),(36,'Amelia Hardy','lacinia@ametultricies.co.uk','SUX28DZY8ZF','97886244'),(37,'Geraldine Lowe','placerat@uteratSed.net','UWY92TMA3GR','94009718'),(38,'Ivory Hernandez','eleifend.Cras.sed@eget.co.uk','PYO76WEJ4YF','93382205'),(39,'Brent Michael','felis.purus@neccursus.edu','HSB38DST7DQ','96313336'),(40,'Cathleen Castaneda','Duis@aliquet.edu','KJD64YYQ0LW','99090266');

--First 5 users are admins, may also be drivers or passengers
insert into Admin (uid) values (1),(2),(3),(4),(5);

--20 Users are Passengers, May also be drivers
insert into Passengers (uid) values (5);
insert into Passengers (uid) values (6);
insert into Passengers (uid) values (7);
insert into Passengers (uid) values (8);
insert into Passengers (uid) values (9);
insert into Passengers (uid) values (10);
insert into Passengers (uid) values (11);
insert into Passengers (uid) values (12);
insert into Passengers (uid) values (13);
insert into Passengers (uid) values (14);
insert into Passengers (uid) values (15);
insert into Passengers (uid) values (16);
insert into Passengers (uid) values (17);
insert into Passengers (uid) values (18);
insert into Passengers (uid) values (19);
insert into Passengers (uid) values (20);
insert into Passengers (uid) values (21);
insert into Passengers (uid) values (22);
insert into Passengers (uid) values (23);
insert into Passengers (uid) values (24);

--20 Users are Drivers, May also be passengers
insert into Drivers (uid) values (5);
insert into Drivers (uid) values (22);
insert into Drivers (uid) values (23);
insert into Drivers (uid) values (24);
insert into Drivers (uid) values (25);
insert into Drivers (uid) values (26);
insert into Drivers (uid) values (27);
insert into Drivers (uid) values (28);
insert into Drivers (uid) values (29);
insert into Drivers (uid) values (30);
insert into Drivers (uid) values (31);
insert into Drivers (uid) values (32);
insert into Drivers (uid) values (33);
insert into Drivers (uid) values (34);
insert into Drivers (uid) values (35);
insert into Drivers (uid) values (36);
insert into Drivers (uid) values (37);
insert into Drivers (uid) values (38);
insert into Drivers (uid) values (39);
insert into Drivers (uid) values (40);

insert into Profile (uid, picurl, rating, pid) values (1, 'Mx3ObyFGXie1', 0.8, 1);
insert into Profile (uid, picurl, rating, pid) values (2, 'MzWp3p', 1.0, 2);
insert into Profile (uid, picurl, rating, pid) values (3, 'MkjUc6F4', 1.6, 3);
insert into Profile (uid, picurl, rating, pid) values (4, 'QXr80I78b', 3.3, 4);
insert into Profile (uid, picurl, rating, pid) values (5, 'FsShnQpgaR', 0.8, 5);
insert into Profile (uid, picurl, rating, pid) values (6, 'xVFsrl', 2.3, 6);
insert into Profile (uid, picurl, rating, pid) values (7, 'x59NvzUNgHc', 0.6, 7);
insert into Profile (uid, picurl, rating, pid) values (8, 'EeD9EDSfQ9R', 2.1, 8);
insert into Profile (uid, picurl, rating, pid) values (9, 'ouXIOu78I', 0.5, 9);
insert into Profile (uid, picurl, rating, pid) values (10, 'r9y68I8', 4.2, 10);
insert into Profile (uid, picurl, rating, pid) values (11, 'BDZkpjk', 4.1, 11);
insert into Profile (uid, picurl, rating, pid) values (12, '7EOICvCGPRGf', 2.3, 12);
insert into Profile (uid, picurl, rating, pid) values (13, 'bjsi7Qa974', 4.9, 13);
insert into Profile (uid, picurl, rating, pid) values (14, 'VeAKcA2XLw', 0.6, 14);
insert into Profile (uid, picurl, rating, pid) values (15, '3WjtzwvpZfZS', 0.9, 15);
insert into Profile (uid, picurl, rating, pid) values (16, 'kdYl759JAMp', 3.1, 16);
insert into Profile (uid, picurl, rating, pid) values (17, 'lTeEygN3', 1.7, 17);
insert into Profile (uid, picurl, rating, pid) values (18, '4GpkIOhDzR', 1.2, 18);
insert into Profile (uid, picurl, rating, pid) values (19, 'bxFKUdgku', 1.1, 19);
insert into Profile (uid, picurl, rating, pid) values (20, 'SYLDcfh', 1.3, 20);
insert into Profile (uid, picurl, rating, pid) values (21, 'RmrtmAjHGJz', 3.2, 21);
insert into Profile (uid, picurl, rating, pid) values (22, 'DrF7cm17ogvF', 2.4, 22);
insert into Profile (uid, picurl, rating, pid) values (23, 'F1mOC1ZHKA', 0.1, 23);
insert into Profile (uid, picurl, rating, pid) values (24, '2qzTGR', 4.1, 24);
insert into Profile (uid, picurl, rating, pid) values (25, 'CZd41BZ', 2.1, 25);
insert into Profile (uid, picurl, rating, pid) values (26, 'dUS6QXO6eu', 5.0, 26);
insert into Profile (uid, picurl, rating, pid) values (27, 'f7yls3FlPD', 2.9, 27);
insert into Profile (uid, picurl, rating, pid) values (28, 'vBnZEK', 3.2, 28);
insert into Profile (uid, picurl, rating, pid) values (29, '3N2aYEUp', 0.2, 29);
insert into Profile (uid, picurl, rating, pid) values (30, 'sUi9L2', 4.4, 30);
insert into Profile (uid, picurl, rating, pid) values (31, 'Mq1Q2or', 0.9, 31);
insert into Profile (uid, picurl, rating, pid) values (32, 'Pux9uyy', 1.5, 32);
insert into Profile (uid, picurl, rating, pid) values (33, 'IDtYEojvYPDK', 3.1, 33);
insert into Profile (uid, picurl, rating, pid) values (34, 'qvqPoWhx5', 0.3, 34);
insert into Profile (uid, picurl, rating, pid) values (35, 'UEzLJigL1jO', 3.0, 35);
insert into Profile (uid, picurl, rating, pid) values (36, 'tVhJ4N1', 1.0, 36);
insert into Profile (uid, picurl, rating, pid) values (37, '0z9E8AQMFcWt', 4.9, 37);
insert into Profile (uid, picurl, rating, pid) values (38, 'y2RXsY6', 3.0, 38);
insert into Profile (uid, picurl, rating, pid) values (39, '4JqMZxt3UAn', 1.7, 39);
insert into Profile (uid, picurl, rating, pid) values (40, 'BSmaG8OMxenk', 3.7, 40);

insert into Cars (cid) values (1);
insert into Cars (cid) values (2);
insert into Cars (cid) values (3);
insert into Cars (cid) values (4);
insert into Cars (cid) values (5);
insert into Cars (cid) values (6);
insert into Cars (cid) values (7);
insert into Cars (cid) values (8);
insert into Cars (cid) values (9);
insert into Cars (cid) values (10);
insert into Cars (cid) values (11);
insert into Cars (cid) values (12);
insert into Cars (cid) values (13);
insert into Cars (cid) values (14);
insert into Cars (cid) values (15);
insert into Cars (cid) values (16);
insert into Cars (cid) values (17);
insert into Cars (cid) values (18);
insert into Cars (cid) values (19);
insert into Cars (cid) values (20);

insert into Owns (uid, cid) values (5, 1);
insert into Owns (uid, cid) values (22, 2);
insert into Owns (uid, cid) values (23, 3);
insert into Owns (uid, cid) values (24, 4);
insert into Owns (uid, cid) values (25, 5);
insert into Owns (uid, cid) values (26, 6);
insert into Owns (uid, cid) values (27, 7);
insert into Owns (uid, cid) values (28, 8);
insert into Owns (uid, cid) values (29, 9);
insert into Owns (uid, cid) values (30, 10);
insert into Owns (uid, cid) values (31, 11);
insert into Owns (uid, cid) values (32, 12);
insert into Owns (uid, cid) values (33, 13);
insert into Owns (uid, cid) values (34, 14);
insert into Owns (uid, cid) values (35, 15);
insert into Owns (uid, cid) values (36, 16);
insert into Owns (uid, cid) values (37, 17);
insert into Owns (uid, cid) values (38, 18);
insert into Owns (uid, cid) values (39, 19);
insert into Owns (uid, cid) values (40, 20);

insert into Carspecs (cid, seats, model, description) values (1, 5, 'Mercury', 'In congue.');
insert into Carspecs (cid, seats, model, description) values (2, 5, 'Mitsubishi', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; falsea dapibus dolor vel est.');
insert into Carspecs (cid, seats, model, description) values (3, 5, 'Toyota', 'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.');
insert into Carspecs (cid, seats, model, description) values (4, 6, 'Honda', 'Proin leo odio, porttitor id, consequat in, consequat ut, falsea.');
insert into Carspecs (cid, seats, model, description) values (5, 5, 'Ford', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.');
insert into Carspecs (cid, seats, model, description) values (6, 4, 'Nissan', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.');
insert into Carspecs (cid, seats, model, description) values (7, 4, 'Chrysler', 'Sed ante.');
insert into Carspecs (cid, seats, model, description) values (8, 5, 'Volkswagen', 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.');
insert into Carspecs (cid, seats, model, description) values (9, 5, 'Audi', 'Mauris sit amet eros.');
insert into Carspecs (cid, seats, model, description) values (10, 6, 'GMC', 'In hac habitasse platea dictumst.');
insert into Carspecs (cid, seats, model, description) values (11, 4, 'Toyota', 'Duis bibendum.');
insert into Carspecs (cid, seats, model, description) values (12, 4, 'GMC', 'Vivamus tortor.');
insert into Carspecs (cid, seats, model, description) values (13, 6, 'Lincoln', 'In hac habitasse platea dictumst.');
insert into Carspecs (cid, seats, model, description) values (14, 5, 'Mercedes-Benz', 'Quisque erat eros, viverra eget, congue eget, semper rutrum, falsea.');
insert into Carspecs (cid, seats, model, description) values (15, 4, 'Lexus', 'In hac habitasse platea dictumst.');
insert into Carspecs (cid, seats, model, description) values (16, 6, 'Pontiac', 'Donec ut mauris eget massa tempor convallis.');
insert into Carspecs (cid, seats, model, description) values (17, 6, 'Mitsubishi', 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.');
insert into Carspecs (cid, seats, model, description) values (18, 5, 'Chrysler', 'Phasellus id sapien in sapien iaculis congue.');
insert into Carspecs (cid, seats, model, description) values (19, 4, 'GMC', 'Suspendisse potenti.');
insert into Carspecs (cid, seats, model, description) values (20, 5, 'Cadillac', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; falsea dapibus dolor vel est.');

insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (1, 751571, 488887, 806.96, 2.53, '2019-01-07 03:29:22', 17, 1, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (2, 981387, 700817, 721.41, 7.8, '2018-10-04 20:00:07', 16, 3, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (3, 561802, 129489, 578.53, 4.65, '2018-09-25 16:22:44', 4, 1, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (4, 573669, 317574, 37.36, 1.93, '2018-12-10 02:46:40', 14, 3, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (5, 870084, 942664, 152.76, 0.68, '2018-04-21 07:09:15', 20, 3, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (6, 208397, 766275, 26.69, 4.03, '2018-12-22 03:14:44', 20, 3, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (7, 454106, 494638, 639.56, 6.21, '2018-06-29 12:07:16', 4, 2, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (8, 434500, 113316, 496.61, 8.53, '2018-07-29 07:05:38', 8, 3, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (9, 672982, 820817, 653.19, 9.43, '2018-04-04 02:00:48', 12, 1, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (10, 132232, 368298, 17.19, 1.55, '2018-11-09 05:12:17', 7, 1, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (11, 264772, 928108, 829.12, 4.97, '2018-12-26 22:59:44', 4, 1, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (12, 898359, 848104, 192.17, 3.86, '2018-07-13 15:33:05', 1, 2, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (13, 512868, 102154, 149.07, 8.36, '2018-04-09 17:46:28', 10, 1, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (14, 290675, 952932, 415.15, 2.39, '2018-10-18 13:17:24', 18, 2, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (15, 495444, 885490, 140.88, 7.42, '2018-04-13 11:12:15', 3, 3, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (16, 653576, 182298, 154.52, 9.0, '2019-02-09 01:54:05', 19, 1, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (17, 588007, 927642, 470.17, 7.73, '2018-04-02 05:49:58', 8, 1, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (18, 415372, 344352, 226.45, 8.32, '2018-05-31 19:08:57', 12, 3, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (19, 298780, 521553, 512.28, 9.0, '2019-03-01 14:32:47', 15, 3, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (20, 883664, 128999, 39.32, 8.23, '2018-05-15 15:54:33', 14, 1, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (21, 106835, 673300, 972.31, 6.68, '2018-05-15 22:38:52', 1, 3, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (22, 279014, 657038, 122.55, 4.79, '2019-01-30 02:23:28', 12, 3, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (23, 535209, 477385, 649.11, 8.86, '2018-04-30 12:57:32', 7, 1, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (24, 563998, 253170, 580.43, 0.92, '2018-07-11 00:14:51', 7, 3, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (25, 238056, 774522, 770.97, 5.53, '2018-09-10 14:33:28', 15, 2, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (26, 298601, 858953, 290.51, 9.76, '2018-07-01 10:01:08', 6, 1, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (27, 132373, 906068, 153.06, 5.78, '2018-08-24 16:45:36', 8, 2, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (28, 268924, 155103, 136.94, 8.08, '2018-11-04 13:32:08', 1, 2, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (29, 772317, 358124, 641.42, 2.39, '2019-02-20 12:48:16', 13, 1, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (30, 408072, 607349, 583.84, 8.9, '2018-07-18 19:34:47', 5, 3, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (31, 572033, 675690, 653.06, 6.87, '2018-12-09 05:37:00', 7, 1, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (32, 231403, 403884, 832.17, 0.89, '2018-08-02 19:31:01', 5, 2, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (33, 621937, 330350, 700.68, 7.36, '2018-10-25 04:42:53', 18, 3, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (34, 398274, 377821, 25.42, 1.6, '2018-08-03 04:21:41', 11, 2, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (35, 388175, 500335, 137.74, 3.56, '2018-12-23 13:28:54', 4, 1, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (36, 664428, 201665, 200.15, 0.13, '2018-11-29 11:57:04', 2, 1, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (37, 280323, 963321, 432.27, 6.09, '2018-08-06 23:41:38', 15, 2, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (38, 470916, 631159, 633.71, 3.22, '2018-04-02 11:17:07', 10, 2, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (39, 237658, 601804, 717.39, 5.44, '2018-04-20 19:36:38', 9, 2, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (40, 611208, 561779, 825.13, 3.92, '2018-05-12 02:08:58', 10, 1, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (41, 569318, 988180, 905.25, 6.4, '2018-08-25 12:24:18', 8, 1, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (42, 218085, 734126, 776.46, 6.73, '2018-05-27 07:32:57', 8, 2, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (43, 704843, 681996, 617.49, 9.99, '2018-09-25 01:43:55', 12, 2, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (44, 824629, 946708, 461.29, 0.59, '2018-03-30 11:08:02', 14, 1, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (45, 796413, 204869, 612.93, 4.54, '2018-04-17 09:17:30', 20, 3, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (46, 730973, 222061, 467.08, 9.14, '2018-06-25 03:33:24', 10, 2, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (47, 995161, 713918, 684.67, 1.35, '2019-01-26 19:08:58', 13, 3, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (48, 968738, 793335, 118.32, 2.83, '2019-03-04 03:33:45', 4, 2, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (49, 161482, 600763, 506.22, 6.14, '2018-12-31 23:20:22', 5, 1, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (50, 757181, 165454, 745.54, 2.87, '2019-03-16 14:39:29', 7, 3, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (51, 580379, 705551, 794.19, 7.42, '2018-03-29 17:47:20', 9, 1, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (52, 140698, 890012, 979.66, 9.81, '2018-11-22 05:19:51', 18, 1, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (53, 658050, 473748, 270.79, 7.51, '2018-05-18 07:07:31', 12, 3, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (54, 825202, 880760, 95.74, 9.85, '2018-10-01 12:15:09', 6, 3, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (55, 428083, 989232, 672.17, 4.67, '2018-07-01 05:23:57', 1, 3, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (56, 612525, 278542, 185.74, 3.37, '2018-05-06 00:00:37', 14, 1, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (57, 575732, 876967, 33.5, 0.75, '2018-04-27 02:51:06', 12, 2, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (58, 197051, 732902, 474.8, 0.48, '2018-04-16 00:13:11', 16, 1, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (59, 858643, 187963, 239.56, 6.7, '2018-12-03 13:51:49', 13, 3, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (60, 330699, 522685, 952.53, 7.41, '2018-04-30 05:32:52', 13, 2, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (61, 824001, 427792, 577.05, 1.44, '2018-08-27 01:02:41', 2, 3, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (62, 503810, 755198, 338.99, 6.3, '2019-03-15 17:35:39', 17, 2, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (63, 318348, 358115, 815.67, 7.23, '2018-07-03 22:44:39', 16, 2, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (64, 937762, 582179, 649.34, 1.27, '2018-08-05 19:50:09', 8, 2, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (65, 386754, 324097, 155.33, 8.71, '2018-09-26 10:35:56', 1, 2, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (66, 973789, 169569, 920.51, 3.8, '2018-07-01 21:15:58', 1, 3, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (67, 478422, 631914, 934.07, 2.6, '2018-10-15 23:17:56', 10, 3, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (68, 660993, 236703, 906.84, 1.38, '2018-12-20 04:53:20', 9, 1, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (69, 458868, 543271, 911.05, 8.3, '2018-06-04 07:51:35', 12, 2, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (70, 811563, 713812, 715.28, 6.56, '2019-01-01 08:49:23', 13, 3, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (71, 304391, 306259, 954.72, 0.83, '2018-11-08 20:28:37', 15, 3, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (72, 320906, 818842, 781.84, 5.58, '2018-05-14 07:37:57', 15, 3, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (73, 640396, 928405, 571.3, 3.17, '2019-01-14 04:04:11', 20, 2, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (74, 571350, 222787, 317.26, 2.17, '2018-05-03 11:12:19', 16, 1, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (75, 735666, 390323, 249.98, 6.49, '2018-07-14 09:25:09', 11, 3, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (76, 190209, 825504, 653.81, 7.98, '2018-04-03 22:18:23', 13, 3, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (77, 792849, 631606, 324.17, 3.53, '2018-11-07 08:14:33', 4, 1, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (78, 144973, 622387, 762.37, 9.77, '2019-02-08 16:03:29', 12, 3, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (79, 639831, 393058, 758.92, 9.71, '2019-03-18 19:25:33', 16, 1, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (80, 611200, 506902, 863.96, 4.12, '2018-10-10 12:54:58', 13, 2, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (81, 534156, 671716, 183.93, 0.85, '2018-08-21 05:18:13', 15, 2, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (82, 427038, 766020, 729.05, 6.12, '2018-08-31 15:58:35', 12, 3, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (83, 304534, 453796, 932.19, 9.66, '2018-08-05 04:58:09', 12, 2, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (84, 616234, 572553, 307.49, 5.77, '2018-07-12 15:10:47', 1, 2, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (85, 783958, 461638, 717.53, 8.54, '2018-09-17 16:54:53', 17, 1, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (86, 763495, 729158, 266.19, 2.91, '2019-03-18 23:44:54', 6, 2, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (87, 949191, 403268, 368.14, 3.77, '2018-10-26 05:42:50', 10, 1, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (88, 637292, 438349, 483.23, 0.14, '2018-12-24 02:03:29', 10, 3, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (89, 934471, 553739, 68.12, 3.39, '2019-02-16 01:29:09', 6, 2, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (90, 907866, 986598, 749.82, 0.27, '2018-06-14 00:31:33', 14, 3, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (91, 923693, 382380, 302.03, 7.97, '2018-04-04 08:17:39', 12, 2, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (92, 243300, 193706, 365.31, 4.6, '2019-01-27 17:10:05', 12, 1, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (93, 310121, 524342, 711.97, 4.25, '2018-10-29 15:15:50', 20, 3, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (94, 687055, 422324, 466.11, 6.9, '2019-01-30 01:33:26', 7, 2, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (95, 810885, 432267, 479.3, 6.17, '2018-04-23 15:11:43', 18, 2, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (96, 985999, 436811, 580.75, 8.73, '2018-09-11 12:48:36', 13, 1, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (97, 465829, 752656, 408.86, 1.87, '2018-03-31 08:26:53', 3, 3, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (98, 717801, 247859, 749.74, 5.7, '2019-03-13 18:02:36', 7, 3, false);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (99, 185455, 880794, 784.02, 2.34, '2018-07-01 12:32:23', 5, 3, true);
insert into Trips (tid, origin, destination, maxbid, minbid, starttime, cid, numpassengers, iscomplete) values (100, 481424, 638913, 335.58, 9.85, '2018-04-30 16:32:21', 1, 1, false);

insert into creates (uid, tid, created) values (34, 1, '2018-03-22 08:02:17');
insert into creates (uid, tid, created) values (38, 2, '2018-03-22 11:09:30');
insert into creates (uid, tid, created) values (22, 3, '2018-03-22 08:21:24');
insert into creates (uid, tid, created) values (34, 4, '2018-03-22 00:52:12');
insert into creates (uid, tid, created) values (25, 5, '2018-03-22 00:17:04');
insert into creates (uid, tid, created) values (40, 6, '2018-03-22 02:35:45');
insert into creates (uid, tid, created) values (31, 7, '2018-03-22 16:18:01');
insert into creates (uid, tid, created) values (39, 8, '2018-03-22 10:19:34');
insert into creates (uid, tid, created) values (40, 9, '2018-03-22 09:36:39');
insert into creates (uid, tid, created) values (25, 10, '2018-03-22 08:51:41');
insert into creates (uid, tid, created) values (37, 11, '2018-03-22 15:48:33');
insert into creates (uid, tid, created) values (30, 12, '2018-03-22 02:02:50');
insert into creates (uid, tid, created) values (29, 13, '2018-03-22 23:00:35');
insert into creates (uid, tid, created) values (35, 14, '2018-03-22 18:26:02');
insert into creates (uid, tid, created) values (27, 15, '2018-03-22 09:21:54');
insert into creates (uid, tid, created) values (27, 16, '2018-03-22 02:47:15');
insert into creates (uid, tid, created) values (22, 17, '2018-03-22 03:07:17');
insert into creates (uid, tid, created) values (23, 18, '2018-03-22 14:50:17');
insert into creates (uid, tid, created) values (37, 19, '2018-03-22 07:02:40');
insert into creates (uid, tid, created) values (37, 20, '2018-03-22 18:49:56');
insert into creates (uid, tid, created) values (28, 21, '2018-03-22 08:02:22');
insert into creates (uid, tid, created) values (36, 22, '2018-03-22 14:37:53');
insert into creates (uid, tid, created) values (37, 23, '2018-03-22 13:23:28');
insert into creates (uid, tid, created) values (37, 24, '2018-03-22 00:13:36');
insert into creates (uid, tid, created) values (40, 25, '2018-03-22 15:04:51');
insert into creates (uid, tid, created) values (32, 26, '2018-03-22 15:46:06');
insert into creates (uid, tid, created) values (23, 27, '2018-03-22 15:28:41');
insert into creates (uid, tid, created) values (38, 28, '2018-03-22 17:53:56');
insert into creates (uid, tid, created) values (35, 29, '2018-03-22 13:08:28');
insert into creates (uid, tid, created) values (40, 30, '2018-03-22 00:51:02');
insert into creates (uid, tid, created) values (32, 31, '2018-03-22 07:39:24');
insert into creates (uid, tid, created) values (28, 32, '2018-03-22 12:12:04');
insert into creates (uid, tid, created) values (29, 33, '2018-03-22 17:10:40');
insert into creates (uid, tid, created) values (36, 34, '2018-03-22 08:14:40');
insert into creates (uid, tid, created) values (26, 35, '2018-03-22 17:53:24');
insert into creates (uid, tid, created) values (24, 36, '2018-03-22 18:49:32');
insert into creates (uid, tid, created) values (31, 37, '2018-03-22 15:34:57');
insert into creates (uid, tid, created) values (35, 38, '2018-03-22 12:18:30');
insert into creates (uid, tid, created) values (27, 39, '2018-03-22 12:51:34');
insert into creates (uid, tid, created) values (35, 40, '2018-03-22 04:54:11');
insert into creates (uid, tid, created) values (38, 41, '2018-03-22 11:49:50');
insert into creates (uid, tid, created) values (26, 42, '2018-03-22 01:38:25');
insert into creates (uid, tid, created) values (34, 43, '2018-03-22 21:21:37');
insert into creates (uid, tid, created) values (31, 44, '2018-03-22 23:16:11');
insert into creates (uid, tid, created) values (36, 45, '2018-03-22 07:35:45');
insert into creates (uid, tid, created) values (23, 46, '2018-03-22 19:08:43');
insert into creates (uid, tid, created) values (37, 47, '2018-03-22 21:24:52');
insert into creates (uid, tid, created) values (31, 48, '2018-03-22 00:28:44');
insert into creates (uid, tid, created) values (35, 49, '2018-03-22 03:52:42');
insert into creates (uid, tid, created) values (35, 50, '2018-03-22 22:42:40');
insert into creates (uid, tid, created) values (25, 51, '2018-03-22 10:48:37');
insert into creates (uid, tid, created) values (27, 52, '2018-03-22 01:20:35');
insert into creates (uid, tid, created) values (33, 53, '2018-03-22 19:25:56');
insert into creates (uid, tid, created) values (33, 54, '2018-03-22 13:20:26');
insert into creates (uid, tid, created) values (27, 55, '2018-03-22 11:07:33');
insert into creates (uid, tid, created) values (23, 56, '2018-03-22 08:43:28');
insert into creates (uid, tid, created) values (32, 57, '2018-03-22 23:44:47');
insert into creates (uid, tid, created) values (37, 58, '2018-03-22 21:12:55');
insert into creates (uid, tid, created) values (31, 59, '2018-03-22 15:19:21');
insert into creates (uid, tid, created) values (37, 60, '2018-03-22 15:25:17');
insert into creates (uid, tid, created) values (27, 61, '2018-03-22 02:06:00');
insert into creates (uid, tid, created) values (24, 62, '2018-03-22 14:28:13');
insert into creates (uid, tid, created) values (37, 63, '2018-03-22 12:08:12');
insert into creates (uid, tid, created) values (35, 64, '2018-03-22 20:55:42');
insert into creates (uid, tid, created) values (33, 65, '2018-03-22 17:39:16');
insert into creates (uid, tid, created) values (25, 66, '2018-03-22 12:57:45');
insert into creates (uid, tid, created) values (28, 67, '2018-03-22 07:58:27');
insert into creates (uid, tid, created) values (25, 68, '2018-03-22 03:27:19');
insert into creates (uid, tid, created) values (40, 69, '2018-03-22 04:11:31');
insert into creates (uid, tid, created) values (22, 70, '2018-03-22 11:00:21');
insert into creates (uid, tid, created) values (34, 71, '2018-03-22 17:01:50');
insert into creates (uid, tid, created) values (26, 72, '2018-03-22 07:56:42');
insert into creates (uid, tid, created) values (31, 73, '2018-03-22 18:03:37');
insert into creates (uid, tid, created) values (27, 74, '2018-03-22 11:40:29');
insert into creates (uid, tid, created) values (32, 75, '2018-03-22 15:33:50');
insert into creates (uid, tid, created) values (39, 76, '2018-03-22 13:27:14');
insert into creates (uid, tid, created) values (37, 77, '2018-03-22 12:36:27');
insert into creates (uid, tid, created) values (39, 78, '2018-03-22 22:31:37');
insert into creates (uid, tid, created) values (35, 79, '2018-03-22 11:28:18');
insert into creates (uid, tid, created) values (35, 80, '2018-03-22 03:21:00');
insert into creates (uid, tid, created) values (27, 81, '2018-03-22 18:56:44');
insert into creates (uid, tid, created) values (35, 82, '2018-03-22 22:15:20');
insert into creates (uid, tid, created) values (22, 83, '2018-03-22 14:29:45');
insert into creates (uid, tid, created) values (29, 84, '2018-03-22 06:02:09');
insert into creates (uid, tid, created) values (35, 85, '2018-03-22 06:17:29');
insert into creates (uid, tid, created) values (28, 86, '2018-03-22 06:09:14');
insert into creates (uid, tid, created) values (34, 87, '2018-03-22 06:46:06');
insert into creates (uid, tid, created) values (37, 88, '2018-03-22 10:49:17');
insert into creates (uid, tid, created) values (31, 89, '2018-03-22 11:38:39');
insert into creates (uid, tid, created) values (36, 90, '2018-03-22 07:05:12');
insert into creates (uid, tid, created) values (36, 91, '2018-03-22 16:44:21');
insert into creates (uid, tid, created) values (33, 92, '2018-03-22 19:50:24');
insert into creates (uid, tid, created) values (28, 93, '2018-03-22 10:53:24');
insert into creates (uid, tid, created) values (24, 94, '2018-03-22 08:57:54');
insert into creates (uid, tid, created) values (33, 95, '2018-03-22 03:36:33');
insert into creates (uid, tid, created) values (37, 96, '2018-03-22 19:39:27');
insert into creates (uid, tid, created) values (27, 97, '2018-03-22 22:50:09');
insert into creates (uid, tid, created) values (34, 98, '2018-03-22 21:47:55');
insert into creates (uid, tid, created) values (24, 99, '2018-03-22 22:17:55');
insert into creates (uid, tid, created) values (27, 100, '2018-03-22 08:39:55');


insert into Bids (uid, tid, amount, isconfirmed) values (20, 43, 28.49, false);
insert into Bids (uid, tid, amount, isconfirmed) values (5, 12, 13.74, false);
insert into Bids (uid, tid, amount, isconfirmed) values (5, 38, 29.51, false);
insert into Bids (uid, tid, amount, isconfirmed) values (17, 39, 27.96, false);
insert into Bids (uid, tid, amount, isconfirmed) values (17, 22, 40.8, false);
insert into Bids (uid, tid, amount, isconfirmed) values (17, 56, 22.36, false);
insert into Bids (uid, tid, amount, isconfirmed) values (7, 36, 51.77, false);
insert into Bids (uid, tid, amount, isconfirmed) values (15, 34, 13.32, false);
insert into Bids (uid, tid, amount, isconfirmed) values (5, 6, 29.67, false);
insert into Bids (uid, tid, amount, isconfirmed) values (20, 37, 18.43, false);
insert into Bids (uid, tid, amount, isconfirmed) values (10, 35, 43.9, false);
insert into Bids (uid, tid, amount, isconfirmed) values (5, 37, 59.77, false);
insert into Bids (uid, tid, amount, isconfirmed) values (11, 85, 27.17, false);
insert into Bids (uid, tid, amount, isconfirmed) values (11, 17, 30.09, false);
insert into Bids (uid, tid, amount, isconfirmed) values (14, 19, 19.55, false);
insert into Bids (uid, tid, amount, isconfirmed) values (18, 6, 54.62, false);
insert into Bids (uid, tid, amount, isconfirmed) values (7, 89, 65.91, false);
insert into Bids (uid, tid, amount, isconfirmed) values (19, 94, 13.5, false);
insert into Bids (uid, tid, amount, isconfirmed) values (15, 75, 48.93, false);
insert into Bids (uid, tid, amount, isconfirmed) values (12, 54, 32.54, false);
insert into Bids (uid, tid, amount, isconfirmed) values (16, 61, 57.27, false);
insert into Bids (uid, tid, amount, isconfirmed) values (6, 54, 63.47, false);
insert into Bids (uid, tid, amount, isconfirmed) values (14, 75, 55.27, false);
insert into Bids (uid, tid, amount, isconfirmed) values (10, 80, 48.72, false);
insert into Bids (uid, tid, amount, isconfirmed) values (20, 58, 30.36, false);
insert into Bids (uid, tid, amount, isconfirmed) values (7, 75, 31.24, false);
insert into Bids (uid, tid, amount, isconfirmed) values (9, 33, 14.62, false);
insert into Bids (uid, tid, amount, isconfirmed) values (16, 3, 29.33, false);
insert into Bids (uid, tid, amount, isconfirmed) values (20, 22, 42.02, false);
insert into Bids (uid, tid, amount, isconfirmed) values (5, 90, 58.15, false);
insert into Bids (uid, tid, amount, isconfirmed) values (9, 35, 54.33, false);
insert into Bids (uid, tid, amount, isconfirmed) values (19, 52, 60.6, false);
insert into Bids (uid, tid, amount, isconfirmed) values (20, 66, 20.39, false);
insert into Bids (uid, tid, amount, isconfirmed) values (6, 94, 69.66, false);
insert into Bids (uid, tid, amount, isconfirmed) values (16, 91, 29.49, false);
insert into Bids (uid, tid, amount, isconfirmed) values (5, 69, 69.59, false);
insert into Bids (uid, tid, amount, isconfirmed) values (19, 57, 37.81, false);
insert into Bids (uid, tid, amount, isconfirmed) values (13, 19, 55.48, false);
insert into Bids (uid, tid, amount, isconfirmed) values (8, 50, 26.53, false);
insert into Bids (uid, tid, amount, isconfirmed) values (5, 81, 32.33, false);
insert into Bids (uid, tid, amount, isconfirmed) values (19, 31, 18.51, false);
insert into Bids (uid, tid, amount, isconfirmed) values (12, 41, 46.48, false);
insert into Bids (uid, tid, amount, isconfirmed) values (18, 72, 23.32, false);
insert into Bids (uid, tid, amount, isconfirmed) values (13, 74, 15.07, false);
insert into Bids (uid, tid, amount, isconfirmed) values (11, 46, 57.3, false);
insert into Bids (uid, tid, amount, isconfirmed) values (5, 81, 35.16, false);
insert into Bids (uid, tid, amount, isconfirmed) values (10, 36, 34.07, false);
insert into Bids (uid, tid, amount, isconfirmed) values (11, 44, 45.29, false);
insert into Bids (uid, tid, amount, isconfirmed) values (20, 91, 15.19, false);
insert into Bids (uid, tid, amount, isconfirmed) values (11, 86, 16.3, false);
insert into Bids (uid, tid, amount, isconfirmed) values (18, 27, 61.9, false);
insert into Bids (uid, tid, amount, isconfirmed) values (19, 62, 50.18, false);
insert into Bids (uid, tid, amount, isconfirmed) values (17, 70, 29.17, false);
insert into Bids (uid, tid, amount, isconfirmed) values (10, 78, 59.59, false);
insert into Bids (uid, tid, amount, isconfirmed) values (15, 59, 43.21, false);
insert into Bids (uid, tid, amount, isconfirmed) values (18, 97, 45.01, false);
insert into Bids (uid, tid, amount, isconfirmed) values (6, 4, 48.66, false);
insert into Bids (uid, tid, amount, isconfirmed) values (14, 70, 26.65, false);
insert into Bids (uid, tid, amount, isconfirmed) values (19, 23, 56.3, false);
insert into Bids (uid, tid, amount, isconfirmed) values (15, 61, 64.93, false);
insert into Bids (uid, tid, amount, isconfirmed) values (10, 42, 54.33, false);
insert into Bids (uid, tid, amount, isconfirmed) values (6, 6, 31.05, false);
insert into Bids (uid, tid, amount, isconfirmed) values (19, 83, 31.04, false);
insert into Bids (uid, tid, amount, isconfirmed) values (21, 62, 55.17, false);
insert into Bids (uid, tid, amount, isconfirmed) values (21, 78, 55.62, false);
insert into Bids (uid, tid, amount, isconfirmed) values (14, 67, 52.17, false);
insert into Bids (uid, tid, amount, isconfirmed) values (9, 42, 53.04, false);
insert into Bids (uid, tid, amount, isconfirmed) values (18, 14, 32.73, false);
insert into Bids (uid, tid, amount, isconfirmed) values (21, 33, 41.44, false);
insert into Bids (uid, tid, amount, isconfirmed) values (12, 94, 66.85, false);
insert into Bids (uid, tid, amount, isconfirmed) values (12, 78, 45.49, false);
insert into Bids (uid, tid, amount, isconfirmed) values (18, 73, 37.68, false);
insert into Bids (uid, tid, amount, isconfirmed) values (21, 12, 34.19, false);
insert into Bids (uid, tid, amount, isconfirmed) values (5, 57, 11.05, false);
insert into Bids (uid, tid, amount, isconfirmed) values (6, 96, 26.99, false);
insert into Bids (uid, tid, amount, isconfirmed) values (11, 40, 58.04, false);
insert into Bids (uid, tid, amount, isconfirmed) values (5, 2, 51.91, false);
insert into Bids (uid, tid, amount, isconfirmed) values (19, 59, 69.39, false);
insert into Bids (uid, tid, amount, isconfirmed) values (7, 60, 15.81, false);
insert into Bids (uid, tid, amount, isconfirmed) values (8, 11, 18.81, false);
insert into Bids (uid, tid, amount, isconfirmed) values (11, 89, 45.01, false);
insert into Bids (uid, tid, amount, isconfirmed) values (13, 92, 28.06, false);
insert into Bids (uid, tid, amount, isconfirmed) values (19, 2, 15.12, false);
insert into Bids (uid, tid, amount, isconfirmed) values (14, 43, 30.85, false);
insert into Bids (uid, tid, amount, isconfirmed) values (21, 93, 37.53, false);
insert into Bids (uid, tid, amount, isconfirmed) values (17, 19, 21.15, false);
insert into Bids (uid, tid, amount, isconfirmed) values (8, 74, 63.08, false);
insert into Bids (uid, tid, amount, isconfirmed) values (12, 31, 68.49, false);
insert into Bids (uid, tid, amount, isconfirmed) values (18, 92, 66.71, false);
insert into Bids (uid, tid, amount, isconfirmed) values (14, 20, 12.1, false);
insert into Bids (uid, tid, amount, isconfirmed) values (5, 3, 18.86, false);
insert into Bids (uid, tid, amount, isconfirmed) values (18, 2, 17.1, false);
insert into Bids (uid, tid, amount, isconfirmed) values (18, 1, 20.97, false);
insert into Bids (uid, tid, amount, isconfirmed) values (12, 67, 45.53, false);
insert into Bids (uid, tid, amount, isconfirmed) values (9, 81, 57.69, false);
insert into Bids (uid, tid, amount, isconfirmed) values (17, 47, 23.03, false);
insert into Bids (uid, tid, amount, isconfirmed) values (15, 58, 18.16, false);
insert into Bids (uid, tid, amount, isconfirmed) values (20, 67, 50.91, false);
insert into Bids (uid, tid, amount, isconfirmed) values (5, 88, 13.19, false);
insert into Bids (uid, tid, amount, isconfirmed) values (17, 61, 36.51, false);


insert into Promocodes (prid, code, expirydate, discount) values (1, 'so00qWeI0r92', '2018-03-22 15:09:15', 91);
insert into Promocodes (prid, code, expirydate, discount) values (2, 'nvi1XAofavlr', '2018-03-22 22:39:02', 22);
insert into Promocodes (prid, code, expirydate, discount) values (3, 'XzJA6nZP93v', '2018-03-22 08:11:00', 70);
insert into Promocodes (prid, code, expirydate, discount) values (4, 'oDYHKBH0j', '2018-03-22 06:16:36', 8);
insert into Promocodes (prid, code, expirydate, discount) values (5, 'JWM4uJt4hXcr', '2018-03-22 07:25:38', 5);
insert into Promocodes (prid, code, expirydate, discount) values (6, '64KDg5Hc0kN', '2018-03-22 14:44:02', 23);
insert into Promocodes (prid, code, expirydate, discount) values (7, 'o3VNqY0U', '2018-03-22 10:49:00', 9);
insert into Promocodes (prid, code, expirydate, discount) values (8, '78wxzoK', '2018-03-22 17:23:40', 70);
insert into Promocodes (prid, code, expirydate, discount) values (9, 'rB2vfwhdMJJ', '2018-03-22 13:17:20', 66);
insert into Promocodes (prid, code, expirydate, discount) values (10, '2Tf9Azmea', '2018-03-22 07:02:30', 6);