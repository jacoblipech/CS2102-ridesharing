CREATE TABLE drivers(
	email varchar(20) PRIMARY KEY,
	password varchar(20) NOT NULL,
	name varchar(20) NOT NULL
);

INSERT INTO drivers (email, password, name)
VALUES ('driver1@example.com', 'password1', 'driver1');

INSERT INTO drivers (email, password, name)
VALUES ('driver2@example.com', 'password2', 'driver2');

INSERT INTO drivers (email, password, name)
VALUES ('driver3@example.com', 'password3', 'driver3');

INSERT INTO drivers (email, password, name)
VALUES ('driver4@example.com', 'password4', 'driver4');

INSERT INTO drivers (email, password, name)
VALUES ('driver5@example.com', 'password5', 'driver5');

INSERT INTO drivers (email, password, name)
VALUES ('driver6@example.com', 'password6', 'driver6');

CREATE TABLE cars(
	cid varchar(20) PRIMARY KEY,
	model varchar(25) NOT NULL
);

INSERT INTO cars (cid, model)
VALUES ('123', 'toyota1');
