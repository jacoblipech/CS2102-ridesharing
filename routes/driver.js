var express = require('express');
var router = express.Router();

const { Pool } = require('pg') // postgres database package

const pool = new Pool({
	connectionString: process.env.DATABASE_URL
});

function isLoggedIn(req, res, next) {
  if (req.isAuthenticated()) {
    return next();
  }
  res.redirect('/driver');
}

// GET
router.get('/', isLoggedIn, function(req, res, next) {
	res.render('driver', {
		title: 'Sign up as a driver',
		user : req.user
	});
});

// POST (happens upon submit)
router.post('/', function(req, res, next) {
	// Retrieve Information
	var carModel = req.body.carModel;
	var numSeats = req.body.numSeats;
	var carDescription = req.body.carDescription;
	var carPlate = req.body.carPlate;

	/* SQL Query */
	var currCarID = "INSERT into Cars(dummy) VALUES('NULL') RETURNING cid";
	var sql_insert_carspecs = "INSERT into Carspecs (currCarID, numSeats, carModel, carDescription, carPlate) VALUES";
	
	// Construct Specific SQL Query
	// this may not work. Unable to verify
	var insert_query = sql_insert_carspecs + "('" + currCarID + "','" + numSeats + "','" + carModel + "','" + carDescription + "','" + carPlate + "');";

	pool.query(insert_query, (err, data) => {
    if (err) {
      next(err);
    }
    else {
      res.redirect('/select')
    }
	});
});

module.exports = router;
