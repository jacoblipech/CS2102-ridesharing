var express = require('express');
var router = express.Router();

const { Pool } = require('pg')

const pool = new Pool({
	connectionString: process.env.DATABASE_URL
});

var sql_insert = "INSERT into Users (name, email, password, phonenum) VALUES";

function isLoggedIn(req, res, next) {
  if (req.isAuthenticated()) {
    return next();
  }
  res.redirect('/login');
}

// GET
router.get('/', isLoggedIn, function(req, res, next) {
	res.render('forms', {
		title: 'Admin Form',
		user : req.user
	});
});

// POST (happens upon submit)
router.post('/', function(req, res, next) {
	// Retrieve Information
	var name = req.body.name;
	var email = req.body.email;
	var password = req.body.password;
	var phoneNumber = req.body.phoneNumber;

	// Construct Specific SQL Query
	var insert_query = sql_insert + "('" + name + "','" + email + "','" + password + "','" + phoneNumber + "');";
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
