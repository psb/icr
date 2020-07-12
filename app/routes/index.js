const express = require("express");
const Router = require("express-promise-router");

const router = new Router();

/* GET home page. */
router.get("/", function (req, res, next) {
  res.render("index", { title: "PSB | ICR GenesDB" });
});

module.exports = router;
