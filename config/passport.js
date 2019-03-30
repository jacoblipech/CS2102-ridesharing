var passport = require('passport');
var LocalStrategy   = require('passport-local').Strategy;
var express = require('express');
var router = express.Router();
var flash = require('connect-flash');

const { Pool } = require('pg');
const pool = new Pool({
	connectionString: process.env.DATABASE_URL
});

passport.use('local-login', new LocalStrategy({
  usernameField: 'email',
  passwordField: 'password',
  passReqToCallback: true
}, function (req, email, password, done) {
    // var salt = '7fa73b47df808d36c5fe328546ddef8b9011b2c6';
    pool.query("SELECT * FROM users WHERE email = '" + email + "'", function(err, data) {
			if (err) {
				return done(req.flash('message', err));
			}
      if (!data.rows.length) {
        return done(null, false, req.flash('message', 'Invalid email entered.'));
      }
			// salt = salt + '' + password;
			// var encPassword = crypto.createHash('sha1').update(salt).digest('hex');
      var dbPassword  = data.rows[0].password;
      if (!(dbPassword == password)) {
        return done(null, false, req.flash('message','Invalid password entered.'));
      }
      return done(null, data.rows[0]);
    });
  }
));

passport.use('local-signup', new LocalStrategy({
  usernameField : 'email',
  passwordField : 'password',
  passReqToCallback : true
}, function(req, email, password, done) {
    // TODO: Add trigger to check if the user trying to login already exists
		// cannot use an SQL query as it happens async
		var sql_query = 'INSERT INTO users VALUES';
		var uid = req.body.uid;
		var name = req.body.name;
		var phonenum = req.body.phonenum;
		var user = {
			uid : uid,
			name : name,
			email : email,
			password : password,
			phonenum : phonenum
		};
		var insert_query = sql_query + "(" + uid + ",'" + name + "','" + email + "','" + password + "','" + phonenum + "');";
    // if there is no user with that email, create the user
		pool.query(insert_query, (err, data) => {
	    if (err) {
	      return done(err);
	    }
			return done(null, user);
		});
	}
));

passport.serializeUser(function(user, done) {
  done(null, user.uid);
});

passport.deserializeUser(function(uid, done) {
	pool.query("SELECT * FROM users WHERE uid = "+ uid, function (err, data){
    done(err, data.rows[0]);
  });
});

module.exports = router;
