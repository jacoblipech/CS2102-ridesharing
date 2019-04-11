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
    pool.query(sql_query + req.user.uid + ');', (err, data) => {
      if (err) {
        next(err)
      }
      else {
        res.render('index', {
          title: 'Home',
          user: req.user,
          isdriver: data.rows[0].isdriver,
          ispassenger: data.rows[0].ispassenger
        })
      }
    })
  } else {
    res.render('index', {
      title: 'Home',
      user: undefined,
      ispassenger: undefined,
      isdriver: undefined,
      isadmin: undefined
    })
  }
});

router.get('/logout', function(req, res){
  req.logout();
  res.redirect('/'); //Can fire before session is destroyed?
});

module.exports = router;
