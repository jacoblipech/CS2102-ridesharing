var express = require('express');
var router = express.Router();
var passport = require('passport');
var flash = require('connect-flash');
var app = express();
app.use(flash());

router.get('/', function(req, res) {
  // render the page and pass in any flash data if it exists
  // TODO: change to the flash part
  res.render('login', { message: req.flash('message') });
});

router.post('/', passport.authenticate('local-login', {
  successRedirect : '/profile',
  failureRedirect: '/login',
  failureFlash: true
}), function(req, res, info) {
    res.render('login/index',{'message' : req.flash('message')});
  }
);

module.exports = router;
