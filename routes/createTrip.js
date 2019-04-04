var express = require('express');
var router = express.Router();

const { Pool } = require('pg');

const pool = new Pool({
    connectionString: process.env.DATABASE_URL
});

/* Query to Create Trip */
var sql_createTrip = 'INSERT INTO trip VALUES';
/* Query to link Trip to Driver? */
var sql_createDriver = 'INSERT INTO driver VALUES';

//To Check if User is Logged in, Else redirect to login page
function isLoggedIn(req, res, next) {
    if (req.isAuthenticated()) {
        return next();
    }
    res.redirect('/login');
}
//If user is logged in, then render the Create Trip form
router.get('/', isLoggedIn, function(req, res, next) {
    res.render('createTrip', {
        title: 'Create Trip',
        user : req.user
    });
});

// GET
/*
router.get('/', function(req, res, next) {
    res.render('createTrip', { title: 'Create Trip' });
});
*/
// POST (happens upon submit)
router.post('/', function(req, res, next) {
    // Retrieve Information
    var origin  = req.body.origin;
    var destination = req.body.destination;
    var maxBid = req.body.maxBid;
    var minBid = req.body.minBid;
    var starttime = req.body.startTime;
    var numpassengers = req.body.numpassengers;
    var iscomplete = false;

    // Construct Specific SQL Query
    var insert_queryTrip = sql_createTrip + "('" + origin + "','" + destination + "','" + maxBid + "','"
        + minBid + "," + starttime + "," + numpassengers+ "," + iscomplete + "')";
    //Finally Insert into Database
    pool.query(insert_queryTrip, (err, data) => {
        if (err) {
            next(err);
        }
        else {
            //redirect to /allTrips later
            res.redirect('/select')
        }
    });
});

module.exports = router;
