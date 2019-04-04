var express = require('express');
var router = express.Router();

const { Pool } = require('pg');

const pool = new Pool({
    connectionString: process.env.DATABASE_URL
});

/* SQL Query */
var sql_createTrip = 'INSERT INTO trip VALUES';
/* SQL Query */
var sql_createDriver = 'INSERT INTO driver VALUES';

// GET
router.get('/', function(req, res, next) {
    res.render('createTrip', { title: 'Create Trip' });
});

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
