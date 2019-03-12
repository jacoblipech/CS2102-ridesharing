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

/* SQL Query */
var sql_query = 'SELECT * FROM driver';

router.get('/', function(req, res, next) {
	pool.query(sql_query, (err, data) => {
		if (err) {
			next(err);
		}
		else{
			res.render('select', { title: 'Driver List', data: data.rows });
		}
	});
});

module.exports = router;
