var express = require('express');
var router = express.Router();

const { Pool } = require('pg');

const pool = new Pool({
    connectionString: process.env.DATABASE_URL
});

//To Check if User is Logged in, Else redirect to login page
function isLoggedIn(req, res, next) {
    if (req.isAuthenticated()) {
        return next();
    }
    res.redirect('/login');
}

sql_dummy = "SELECT * FROM Passengers;"
//sql_query = "INSERT INTO Passengers (uid) VALUES ("
// GET
router.get('/', isLoggedIn, function(req, res, next) {
	pool.query(sql_dummy, (err, data) => {
	//pool.query(sql_query + req.user.uid + ") ON CONFLICT DO NOTHING;", (err, data) => {
		if (err) {
			next(err);
		}
		else{
			res.render('passenger', {
				title: 'Success',
				user : req.user,
			});
		}
	});
});

// POST (happens upon submit)
router.post('/', function(req, res, next) {
	// Retrieve Information
    var sql_insert = "INSERT INTO Passengers (uid) VALUES (";
	pool.query(sql_insert + req.user.uid + ") ON CONFLICT DO NOTHING;", (err, data) => {
        if (err) {
            next(err);
        }
        else {
            res.redirect('/profile')
        }
    });
});


module.exports = router;
