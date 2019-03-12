# CS2102-ridesharing
Ride sharing website for NUS database module.

## Setting up
Ensure that you have Express JS installed on your computer. 
To install Express JS, run `npm install ejs`.

After that run `npm install` to install dependency node packages.

Before initializing the server, please copy paste the sql code in postgresql_script.sql to set up the database on your local server. (This is a one time setup for your database, preferably to change into a bash script to make it easier to run).

Ensure you change the line below in .env file to successfully connect to your psql database server. Please remember to change the password to your psql password.

`DATABASE_URL=postgres://postgres:password@localhost:5432/postgres`

To start the server:
Run `npm start` for Macbook to start the server.

Or

Run `node bin\www` for non Mac-book users.

Go to "localhost/3000" to view the pages.
