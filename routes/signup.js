var express = require('express');
var router = express.Router();
var passport = require('passport');
var flash = require('connect-flash');

router.get('/', function(req, res) {
  res.render('signup', { 'message': req.flash('message') });
});

router.post('/', passport.authenticate('local-signup', {
  failureRedirect: '/signup',
  successRedirect: '/',
  failureFlash: true
}));

module.exports = router;
