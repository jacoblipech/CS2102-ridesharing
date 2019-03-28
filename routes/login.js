var express = require('express');
var router = express.Router();
var passport = require('passport');
var flash = require('connect-flash');

router.get('/', function(req, res) {
  // render the page and pass in any flash data if it exists
  res.render('login', { 'message': req.flash('message') });
});

router.post('/', passport.authenticate('local-login', {
  failureRedirect: '/login',
  failureFlash: true
}), function(req, res, info) {
  res.render('profile', { 'message' : req.flash('message') });
});

module.exports = router;
// DYO82HEK4KU
