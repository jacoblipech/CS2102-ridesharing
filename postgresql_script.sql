DROP TABLE car;
DROP TABLE driver;

CREATE TABLE car(
	cid varchar(20) PRIMARY KEY,
	model varchar(25) NOT NULL
);

CREATE TABLE driver(
	did varchar(20) PRIMARY KEY,
	email varchar(20) NOT NULL,
	password varchar(20) NOT NULL,
	name varchar(20) NOT NULL,
	car varchar(10),
	FOREIGN KEY (car) REFERENCES car(cid)
);

INSERT INTO driver (did, email, password, name)
VALUES ('d1', 'driver1@example.com', 'password1', 'driver1');

INSERT INTO driver (did, email, password, name)
VALUES ('d2', 'driver2@example.com', 'password2', 'driver2');

INSERT INTO driver (did, email, password, name)
VALUES ('d3', 'driver3@example.com', 'password3', 'driver3');

INSERT INTO driver (did, email, password, name)
VALUES ('d4', 'driver4@example.com', 'password4', 'driver4');

INSERT INTO driver (did, email, password, name)
VALUES ('d5', 'driver5@example.com', 'password5', 'driver5');

INSERT INTO driver (did, email, password, name)
VALUES ('d6', 'driver6@example.com', 'password6', 'driver6');

INSERT INTO car (cid, model)
VALUES ('123', 'toyota1');
