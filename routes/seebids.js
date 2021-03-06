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
// var sql_query = 
// 'SELECT origin,destination,starttime,cid,amount,U.name AS bidder, isconfirmed, b.uid as uid, tid,  numpassengers, acceptedpassengers FROM Creates C INNER JOIN Trips T using (tid) INNER JOIN Bids B using (tid) INNER JOIN Users U ON (B.uid = U.uid) WHERE (iscomplete = FALSE AND C.uid = ';


var sql_query = "Select origin, destination, starttime, amount, U.name as bidder, isconfirmed, numpassengers, acceptedpassengers, B.uid as uid, T.tid as tid from Bids B Inner Join Users U on (B.uid = U.uid) Inner Join Trips T on (T.tid = B.tid) Inner Join Creates C on (C.tid = B.tid) WHERE (iscomplete = FALSE AND C.uid = ";


router.get('/', isLoggedIn, function(req, res, next) {
	pool.query(sql_query + req.user.uid + ');', (err, data) => {
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
	var uid = req.body.uidHidden;

	// Construct Specific SQL Query
	var update_query = "UPDATE Bids SET isconfirmed = TRUE WHERE (uid = " + uid + " AND tid = " + tid + ");";
	var dummy_query = "SELECT * FROM Users;"
	pool.query(update_query, (err, data) => {
    if (err) {
      next(err);
    }
    else {
      res.redirect('/seebids')
      //res.redirect('/' + update_query)
    }
	});
});

module.exports = router;
