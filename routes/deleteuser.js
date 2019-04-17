var express = require('express');
var router = express.Router();

const { Pool } = require('pg')
const pool = new Pool({
	connectionString: process.env.DATABASE_URL
});

var delete_query = "delete from users where email = '"
router.post('/', function(req, res, next) {
	const email = req.body.email
	pool.query(delete_query + email + "';", (err, data) => {
		if (err) {
			next(err);
		}
		else {
			res.redirect('/admin')
		}
	});
});

module.exports = router;
