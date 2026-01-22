var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Home' });
});

router.get('/vscode', function(req, res, next) {
  res.render('vscode', { title: 'VS Code' });
});
router.get('/eduvpn', function(req, res, next) {
  res.render('eduVPN', { title: 'eduVPN' });
}); 

router.get('/docker', function(req, res, next) {
  res.render('docker', { title: 'Docker' });
});
module.exports = router;
