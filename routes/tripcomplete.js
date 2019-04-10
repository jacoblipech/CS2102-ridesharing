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

/* SQL Query */
var sql_query = 'SELECT * FROM Trips T INNER JOIN Creates C using (tid) WHERE (uid = ';
router.get('/', isLoggedIn, function(req, res, next) {
	pool.query(sql_query + req.user.uid + ');', (err, data) => {
	    console.log(router.stack);
		if (err) {
			next(err);
		}
		else{
			res.render('tripComplete', {
				title: 'Complete Trips',
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
	var userId = req.user.uid;

	// Construct Specific SQL Query
	var update_query = "UPDATE Trips SET iscomplete = TRUE WHERE (tid = " + tid + ");";
	//var update_query = "SELECT * from Trips";
	pool.query(update_query, (err, data) => {
    if (err) {
      next(err);
    }
    else {
      res.redirect('/tripcomplete')
    }
	});
});

module.exports = router;
