var express = require('express');
var router = express.Router();

const { Pool } = require('pg');

const pool = new Pool({
    connectionString: process.env.DATABASE_URL
});


/* Query to link Trip to Driver? */
var sql_createDriver = 'INSERT INTO driver VALUES';

//To Check if User is Logged in, Else redirect to login page
function isLoggedIn(req, res, next) {
    if (req.isAuthenticated()) {
        return next();
    }
    res.redirect('/login');
}

/* SQL Query */
var sql_query = "SELECT * from Owns INNER JOIN Cars using (cid) where (uid = ";
router.get('/', isLoggedIn, function(req, res, next) {
	pool.query(sql_query + req.user.uid + ");", (err, data) => {
		if (err) {
			next(err);
		}
		else{
			res.render('createTrip', {
				title: 'Create Trip',
				user : req.user,
				data: data.rows
			});
		}
	});
});


// POST (happens upon submit)
/* Query to Create Trip */
var sql_createTrip = "insert into Trips (origin, destination, maxbid, minbid, starttime, cid, numpassengers) values ";
router.post('/', function(req, res, next) {
    // Retrieve Information
    var origin  = req.body.origin;
    var destination = req.body.destination;
    var maxBid = req.body.maxBid;
    var minBid = req.body.minBid;
    var startTime = req.body.startTime;
    // console.log(startTime);
    var numpassengers = req.body.numpassengers;
    var cid = req.body.cid;

    // Construct Specific SQL Query
    //var insert_queryTrip = sql_createTrip + "(" + origin + ", " + destination +  ", " + maxBid + ", " + minBid + ", '" + startTime + "', " + cid + ", " + numpassengers + ");";

    var insert_queryTrip = "DO $$ DECLARE newTid integer; BEGIN " + sql_createTrip + "(" + origin + ", " + destination
    + ", " + maxBid + ", " + minBid + ", '" + startTime + "', " + cid + ", " + numpassengers + ") RETURNING tid INTO newTid;"
    + "INSERT INTO Creates VALUES (" + req.user.uid + ", newTid); END $$;";

    //var insert_queryTrip = "SELECT * from Trips";
    //Finally Insert into Database
    // console.log(insert_queryTrip);
    pool.query(insert_queryTrip, (err, data) => {
        if (err) {
            if (err.code == 23502) {
                res.redirect('/toomanypassengers')
            }
            next(err);
        }
        else {
            //redirect to /allTrips later

            res.redirect("/tripcomplete")
        }
    });
});

module.exports = router;
