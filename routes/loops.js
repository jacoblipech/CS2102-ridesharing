var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
  // title and data are information passed to the page
  res.render('loops', { title: 'Loops', data: [
		{matric: 'A0000001A', name: 'Leslie Cole'   , faculty: 'SOC'},
		{matric: 'A0000002B', name: 'Myra Morgan'   , faculty: 'SOC'},
		{matric: 'A0000003C', name: 'Raymond Benson', faculty: 'SOC'},
	]});
});

module.exports = router;
