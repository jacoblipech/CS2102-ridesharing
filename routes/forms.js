var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
	res.render('forms', { title: 'Admin Form' });
});

module.exports = router;
