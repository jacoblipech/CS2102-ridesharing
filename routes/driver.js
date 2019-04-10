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

sql_query = "SELECT * FROM Owns o INNER JOIN Cars c using (cid) INNER JOIN Carspecs using (cid) WHERE (o.uid = "
// GET
router.get('/', isLoggedIn, function(req, res, next) {
	pool.query(sql_query + req.user.uid + ");", (err, data) => {
		if (err) {
			next(err);
		}
		else{
			res.render('driver', {
				title: 'Add a car to sign up as a driver',
				user : req.user,
				data: data.rows
			});
		}
	});
});

// POST (happens upon submit)
router.post('/', function(req, res, next) {
	// Retrieve Information
	var carModel = req.body.carModel;
	var numSeats = req.body.numSeats;
	var carDescription = req.body.carDescription;
	var carPlate = req.body.carPlate;

    // Construct Specific SQL Query
    var insert_newCar = "DO $$ DECLARE newCid integer; BEGIN " + "INSERT into Cars (carplate) VALUES ('" + carPlate + "') RETURNING cid INTO newCid;"
    + "INSERT INTO Carspecs (cid, seats, model, description) values (newCid, " + numSeats + ",'" + carModel + "','" + carDescription + "');" +
    " INSERT INTO Drivers (uid) VALUES (" + req.user.uid + ") ON CONFLICT DO NOTHING; INSERT INTO Owns (uid,cid) VALUES (" + req.user.uid + ",newCid); END $$;";
    //var insert_newCar = "SELECT * from Cars;";

	pool.query(insert_newCar, (err, data) => {
        if (err) {
            next(err);
        }
        else {
            res.redirect('/select')
        }
    });
});

module.exports = router;
