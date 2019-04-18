var express = require('express');
var router = express.Router();

const { Pool } = require('pg')
const pool = new Pool({
	connectionString: process.env.DATABASE_URL
});

var sql_query = 'SELECT p.uid as ispassenger, d.uid as isdriver, a.uid as isadmin '
                + 'FROM Users U LEFT JOIN Passengers P USING (uid) LEFT JOIN Drivers D USING (uid) LEFT JOIN Admin A USING (uid) '
                + 'WHERE (uid = ';

router.get('/', function(req, res, next) {
  if (req.user) {
    res.render('index', {
      title: 'Home',
      user: req.user,
    })
  } else {
    res.render('index', {
      title: 'Home',
      user: false,
    })
  }
});

// POST (happens upon submit)
router.post('/passenger', function(req, res, next) {
	// Retrieve Information
  var sql_insert = "INSERT INTO Passengers (uid) VALUES (";
	pool.query(sql_insert + req.user.uid + ") ON CONFLICT DO NOTHING;", (err, data) => {
    if (err) {
      next(err);
    }
    else {
      res.redirect('/')
    }
  });
});

const add_balance_query = "update users set balance = balance + ";
router.post('/topup', function(req, res, next) {
  var email = req.body.email;
	var topup = req.body.amount;
	console.log(topup)
	pool.query(add_balance_query + topup + " where email = '" + email + "';", (err, data) => {
		if (err) {
			next(err);
		}
		else{
      res.redirect('/');
		}
	});
});

router.get('/logout', function(req, res){
  req.logout();
  res.redirect('/'); //Can fire before session is destroyed?
});

module.exports = router;
