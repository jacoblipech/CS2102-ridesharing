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
  res.redirect('/login');
}

// GET
router.get('/', isLoggedIn, function(req, res, next) {
	res.render('driver', {
		title: 'Sign up as driver',
		user : req.user
	});
});

// POST (happens upon submit)
router.post('/', function(req, res, next) {
	// Retrieve Information
	var carModel = req.body.car-model;
	var numSeats = req.body.num-seats;
	var carDescription = req.body.car-description;
	var carPlate = req.body.car-plate;

	/* SQL Query */
	// var currCarID = "INSERT into Cars(dummy) VALUES('NULL') RETURNING cid";
	// var sql_insert_carspecs = "INSERT into Carspecs (currCarID, numSeats, carModel, carDescription, carPlate) VALUES";

	var sql_insert_first = 'with first_insert as (' +
						'INSERT into Cars(carPlate)' +
						'VALUES ';
	var sql_insert_second = 'RETURNING cid ' +
							'),' +
							'second_insert as (' +
								'INSERT into Carspecs(cid, numSeats, carModel, carDescription)' +
								'VALUES (SELECT cid from first_insert, '

	// Construct Specific SQL Query
	var insert_query = sql_insert + "('" + currCarID + "','" + numSeats + "','" + carModel + "','" + carDescription + "','" + carPlate + "');";

	var insert_query = sql_insert_first + "('" + carPlate + "')" + sql_insert_second + "('" + numSeats + "','" + carModel + "','" + carDescription + "','" + carPlate + "');";

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
