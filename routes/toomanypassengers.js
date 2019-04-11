var express = require('express');
var router = express.Router();

function isLoggedIn(req, res, next) {
  if (req.isAuthenticated()) {
    return next();
  }
  res.redirect('/login');
}

router.get('/', isLoggedIn, function(req, res) {
  res.render('toomanypassengers', {
    title: 'Oops',
    user : req.user // get the user out of session and pass to template
  });
});

module.exports = router;
