var express = require('express');
var router = express.Router();

const { Pool } = require('pg')

const pool = new Pool({
	connectionString: process.env.DATABASE_URL
});

function isLoggedIn(req, res, next) {
  if (req.isAuthenticated()) {
    return next();
  }
  res.redirect('/login');
}

var sql_query = 'SELECT * FROM users';
var sql_insert = "INSERT into Users (name, email, password, phonenum) VALUES";
// GET
router.get('/', isLoggedIn, function(req, res, next) {
	pool.query(sql_query, (err, data) => {
		if (err) {
			next(err);
		}
		else{
			res.render('admin', {
				title: 'Admin Page',
				user : req.user,
				data: data.rows
			});
		}
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
      res.redirect('/admin')
    }
	});
});

// POST (happens upon submit)
var create_promo_query = "insert into Promocodes (prid, code, expirydate, discount) values (";
router.post('/promocode', function(req, res, next) {
	// Retrieve Information
	var prid = req.body.prid;
	var code = req.body.code;
	var expirydate = req.body.expirydate;
	var discount = req.body.discount;

	var query = create_promo_query + prid + ", '" + code + "', '" + expirydate + "', " + discount + ");";
	// console.log(query);
	pool.query(query, (err, data) => {
    if (err) {
      next(err);
    }
    else {
      res.redirect('/admin')
    }
	});
});

module.exports = router;
