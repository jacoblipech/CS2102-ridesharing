var express = require('express');
var router = express.Router();

const { Pool } = require('pg') // postgres database package

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
var sql_query = "SELECT * FROM Creates C INNER JOIN Trips T using (tid) WHERE (iscomplete = False AND NOT uid = ";
router.get('/', isLoggedIn, function(req, res, next) {
	pool.query(sql_query + req.user.uid + ") ORDER BY starttime;", (err, data) => {
	    console.log(router.stack);
		if (err) {
			next(err);
		}
		else{
			res.render('trips', {
				title: 'Trips List',
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
	//var dummy_query = "SELECT * from Trips";
	pool.query(insert_query, (err, data) => {
    if (err) {
      next(err);
    }
    else {
      res.redirect('/trips')
      //res.redirect('/' + dummy_query)
    }
	});
});

module.exports = router;
