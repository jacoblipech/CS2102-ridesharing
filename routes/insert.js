var express = require('express');
var router = express.Router();
/*
const { Pool } = require('pg')
const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'postgres',
  password: 's9473808c',
  port: 5432,
})
*/

const pool = new Pool({
	connectionString: process.env.DATABASE_URL
});

/* SQL Query */
var sql_query = 'INSERT INTO student_info VALUES';

// GET
router.get('/', function(req, res, next) {
	res.render('insert', { title: 'Modifying Database' });
});

// POST (happens upon submit)
router.post('/', function(req, res, next) {
	// Retrieve Information
	var matric  = req.body.matric;
	var name    = req.body.name;
	var faculty = req.body.faculty;

	// Construct Specific SQL Query
	var insert_query = sql_query + "('" + matric + "','" + name + "','" + faculty + "')";

	pool.query(insert_query, (err, data) => {
    if (err) {
      next(err);
    }
    else {
      res.redirect('/select')
    }
	});
});

module.exports = router;
