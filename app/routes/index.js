const express = require("express");
const Router = require("express-promise-router");
const db = require("database");

const router = new Router();

/* GET home page. */
router.get("/", function (req, res, next) {
  res.render("index", { title: "Express" });
});

module.exports = router;
