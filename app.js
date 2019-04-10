var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

// used to store user data between HTTP requests
var session = require('express-session');

/* --- V7: Using dotenv     --- */
require('dotenv').load();

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');

/* --- V2: Adding Web Pages --- */
var aboutRouter = require('./routes/about');
/* ---------------------------- */

/* --- V4: Database Connect --- */
var selectRouter = require('./routes/select');
/* ---------------------------- */

/* --- V5: Adding Admin Form to add users --- */
var formsRouter = require('./routes/forms');
/* ---------------------------- */



/* --- V6: Create Trip Form for drivers --- */
var createTripRouter = require('./routes/createTrip');
/* ---------------------------- */

/* --- V7: Bidding System --- */
var tripsRouter = require('./routes/trips');
var bidsRouter = require('./routes/bids');
var seeBidsRouter = require('./routes/seebids');
var tripCompleteRouter = require('./routes/tripcomplete');
var manypsgRouter = require('./routes/toomanypassengers');
/* ---------------------------- */

/* --- V8: Drivers and Passenger Sign up  --- */
var driverRouter = require('./routes/driver');
var carexistsRouter = require('./routes/carplateexists');
/* ---------------------------- */

/* --- Adding passport for user authentication --- */
var flash = require('connect-flash');
var passport = require('passport');
var loginRouter = require('./routes/login');
var signupRouter = require('./routes/signup');
var profileRouter = require('./routes/profile');

var bodyParser = require('body-parser');
var app = express();

app.use(session({
  secret: "cs2012isamazing",
  resave: true,
  saveUninitialized: true
})); // session secret

app.use(flash());
app.use(passport.initialize());
app.use(passport.session());
require('./config/passport.js');

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/users', usersRouter);

/* --- V2: Adding Web Pages --- */
app.use('/about', aboutRouter);

/* --- V4: Database Connect --- */
app.use('/select', selectRouter);

/* --- V5: Adding Forms     --- */
app.use('/forms', formsRouter);

/* --- V6: Adding Create Trip Form     --- */
app.use('/createTrip', createTripRouter);
/* ---------------------------- */
/* --- V7: Adding Trips     --- */
app.use('/trips', tripsRouter);
app.use('/bids', bidsRouter);
app.use('/seebids', seeBidsRouter);
app.use('/tripcomplete', tripCompleteRouter);
app.use('/toomanypassengers', manypsgRouter);

/* --- V6: Modify Database  --- */
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
/* ---------------------------- */

/* --- V8: Drivers and Passenger Sign up  --- */
app.use('/driver', driverRouter);
app.use('/carplateexists', carexistsRouter)
/* ---------------------------- */

/* --- Setting up passport  --- */
app.use('/login', loginRouter);
app.use('/signup', signupRouter);
app.use('/profile', profileRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
