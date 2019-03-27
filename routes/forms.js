var express = require('express');
var router = express.Router();

const { Pool } = require('pg')

const pool = new Pool({
	connectionString: process.env.DATABASE_URL
});

/* SQL Query */
var sql_query = 'INSERT INTO users VALUES';

// GET
router.get('/', function(req, res, next) {
	res.render('forms', { title: 'Admin Form' });
});

// POST (happens upon submit)
router.post('/', function(req, res, next) {
	// Retrieve Information
	var newUid = 51; // TODO: need to implement auto increment here
	var name = req.body.name;
	var email = req.body.email;
	var password = req.body.password;
	var phoneNumber = req.body.phoneNumber;

	// Construct Specific SQL Query
	var insert_query = sql_query + "(" + newUid.toString() + ",'" + name + "','" + email + "','" + password + "','" + phoneNumber + "');";
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
