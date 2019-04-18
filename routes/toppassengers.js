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

const sql_query = "SELECT U.name, U.email, U.phonenum, SUM(B.paidamount) as totalPaid "
                + "FROM (Users U NATURAL JOIN Passengers P) JOIN (Bids B JOIN Trips T on B.tid = T.tid) on (U.uid = B.uid) "
                + "WHERE B.isconfirmed = true AND T.iscomplete = true "
                + "GROUP BY U.name, U.email, U.phonenum "
                + "ORDER BY totalPaid DESC "
                + "LIMIT 5; ";

router.get('/', isLoggedIn, function(req, res, next) {
	pool.query(sql_query, (err, data) => {
		if (err) {
			next(err);
		}
		else{
			res.render('toppassengers', {
        title: "Top Passengers List",
        user: req.user,
				data: data.rows
			});
		}
	});
});

const add_reward_query = "update users set balance = balance + ";
router.post('/', function(req, res, next) {
  var email = req.body.email;
	var reward = req.body.amount;
	pool.query(add_reward_query + reward + " where email = '" + email + "';", (err, data) => {
		if (err) {
			next(err);
		}
		else{
      res.redirect('/topdrivers');
		}
	});
});

module.exports = router;
