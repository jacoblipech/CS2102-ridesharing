var express = require('express');
var router = express.Router();

function isLoggedIn(req, res, next) {
  if (req.isAuthenticated()) {
    return next();
  }
  res.redirect('/login');
}

router.get('/', isLoggedIn, function(req, res, next) {
  res.render('about', {
    title: 'About',
    user : req.user
  });
});

module.exports = router;
