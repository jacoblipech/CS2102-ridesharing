// load all the things we need
var passport = require('passport');
var LocalStrategy   = require('passport-local').Strategy;
var express = require('express');
var app = express();
var router = express.Router();
var flash = require('connect-flash');
app.use(flash());

const { Pool } = require('pg');
const pool = new Pool({
	connectionString: process.env.DATABASE_URL
});

passport.use('local-login', new LocalStrategy({
  usernameField: 'username',
  passwordField: 'password',
  passReqToCallback: true //passback entire req to call back
}, function (req, username, password, done){
    if(!username || !password ) {
      return done(null, false, req.flash('message','All fields are required.'));
    }
    // var salt = '7fa73b47df808d36c5fe328546ddef8b9011b2c6';
    pool.query("SELECT * FROM users WHERE name = '" + username + "'", function(err, rows) {
      if (err) return done(req.flash('message', err));
      if(!rows.length) {
        return done(null, false, req.flash('message','Invalid username or password.'));
      }
      // salt = salt +'' +password;
      // var encPassword = crypto.createHash('sha1').update(salt).digest('hex');
      var dbPassword  = rows[0].password;
      console.log(dbPassword);

      if(!(dbPassword == password)){
        return done(null, false, req.flash('message','Invalid username or password.'));
      }
      return done(null, rows[0]);
    });
  }
));

module.exports = router;


// =========================================================================
// LOCAL LOGIN =============================================================
// =========================================================================
// we are using named strategies since we have one for login and one for signup
// by default, if there was no name, it would just be called 'local'
//
//   passport.use('local-login', new LocalStrategy({
//     // by default, local strategy uses username and password, we will override with email
//     usernameField : 'email',
//     passwordField : 'password',
//     passReqToCallback : true // allows us to pass back the entire request to the callback
//   },
//   function(req, email, password, done) { // callback with email and password from our form
//     // find a user whose email is the same as the forms email
//     // we are checking to see if the user trying to login already exists
//     User.findOne({ 'local.email' :  email }, function(err, user) {
//           // if there are any errors, return the error before anything else
//           if (err)
//               return done(err);
//
//           // if no user is found, return the message
//           if (!user)
//               return done(null, false, req.flash('loginMessage', 'No user found.')); // req.flash is the way to set flashdata using connect-flash
//
//           // if the user is found but the password is wrong
//           if (!user.validPassword(password))
//               return done(null, false, req.flash('loginMessage', 'Oops! Wrong password.')); // create the loginMessage and save it to session as flashdata
//
//           // all is well, return successful user
//           return done(null, user);
//       });
//
//   }));
//
// };


// // expose this function to our app using module.exports
// module.exports = function(passport) {
//
//     // required for persistent login sessions
//     // passport needs ability to serialize and unserialize users out of session
//     // used to serialize the user for the session
//     passport.serializeUser(function(user, done) {
//         done(null, user.id);
//     });
//     // used to deserialize the user
//     passport.deserializeUser(function(id, done) {
//         User.findById(id, function(err, user) {
//             done(err, user);
//         });
//     });
//
//     // LOCAL SIGNUP ============================================================
//     // we are using named strategies since we have one for login and one for signup
//     // by default, if there was no name, it would just be called 'local'
//
//     passport.use('local-signup', new LocalStrategy({
//         // by default, local strategy uses username and password, we will override with email
//         usernameField : 'email',
//         passwordField : 'password',
//         passReqToCallback : true // allows us to pass back the entire request to the callback
//     },
//     function(req, email, password, done) {
//
//         // asynchronous
//         // User.findOne wont fire unless data is sent back
//         process.nextTick(function() {
//
//         // find a user whose email is the same as the forms email
//         // we are checking to see if the user trying to login already exists
//         User.findOne({ 'local.email' :  email }, function(err, user) {
//             // if there are any errors, return the error
//             if (err)
//                 return done(err);
//
//             // check to see if theres already a user with that email
//             if (user) {
//                 return done(null, false, req.flash('signupMessage', 'That email is already taken.'));
//             } else {
//
//                 // if there is no user with that email
//                 // create the user
//                 var newUser            = new User();
//
//                 // set the user's local credentials
//                 newUser.local.email    = email;
//                 newUser.local.password = newUser.generateHash(password);
//
//                 // save the user
//                 newUser.save(function(err) {
//                     if (err)
//                         throw err;
//                     return done(null, newUser);
//                 });
//             }
//         });
//         });
//     }));
// };
