var express = require('express');
var router = express.Router();

const { Pool } = require('pg') // postgres database package
/* --- V7: Using Dot Env ---
// change the password specifically for your own database
const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'postgres',
  password: '********',
  port: 5432,
})
*/
const pool = new Pool({
	connectionString: process.env.DATABASE_URL
});

var sql_insert = "INSERT into Bids (uid, tid, amount) VALUES";

function isLoggedIn(req, res, next) {
  if (req.isAuthenticated()) {
    return next();
  }
  res.redirect('/login');
}

/* SQL Query */
var sql_query = 'SELECT * FROM Trips';
router.get('/', isLoggedIn, function(req, res, next) {
	pool.query(sql_query, (err, data) => {
	    console.log(router.stack);
		if (err) {
			next(err);
		}
		else{
			res.render('seebids', {
				title: 'View bids on my trips',
				user : req.user,
				data: data.rows
			});
		}
	});
});

// POST (happens upon submit)
router.post('/', function(req, res, next) {
	// Retrieve Information
	var tid = req.body.tidHidden;
	var bidamount = req.body.bidamount;
	var userId = req.user.uid;

	// Construct Specific SQL Query
	var insert_query = sql_insert + "(" + userId + "," + tid + "," + bidamount + ") ON CONFLICT (uid,tid) DO UPDATE SET amount = " + bidamount + ";";
	//var insert_query = "SELECT * from Trips";
	pool.query(insert_query, (err, data) => {
    if (err) {
      next(err);
    }
    else {
      res.redirect('/trips')
    }
	});
});

module.exports = router;
