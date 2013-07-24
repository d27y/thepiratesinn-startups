'use strict';

var statik = require('statik');
var connect = require('connect');
var app = statik({
  port: process.env.PORT,
  root: __dirname
});

// hackish mod_rewrite for html5mode
app.use(function(req, res, next) {
  req.url = "/";
  next();
});
var compress = connect.compress();
var statik = connect.static(__dirname, {
  port: process.env.PORT,
  maxAge: 0,
  hidden: false,
  redirect: true,
  compress: true
});
app.use(compress);
app.use(statik);
