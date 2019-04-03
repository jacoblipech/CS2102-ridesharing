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

function isLoggedIn(req, res, next) {
  if (req.isAuthenticated()) {
    return next();
  }
  res.redirect('/login');
}

/* SQL Query */
var sql_query = 'SELECT * FROM users';
router.get('/', isLoggedIn, function(req, res, next) {
	pool.query(sql_query, (err, data) => {
		if (err) {
			next(err);
		}
		else{
			res.render('select', {
				title: 'Users List',
				user : req.user,
				data: data.rows
			});
		}
	});
});

module.exports = router;
