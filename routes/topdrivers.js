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

const sql_query = "select U.name, U.email, U.balance, U.phonenum, count(C.tid) as numTrips "
                + "from (users U natural join drivers) natural join (creates C natural join Trips T) "
                + "where T.iscomplete = TRUE "
                + "group by U.name, U.email, U.balance, U.phonenum "
                + "order by numTrips DESC "
                + "limit 10; ";

router.get('/', isLoggedIn, function(req, res, next) {
	pool.query(sql_query, (err, data) => {
		if (err) {
			next(err);
		}
		else{
			res.render('topdrivers', {
        title: "Top Drivers List",
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
