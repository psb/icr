const express = require("express");
const Router = require("express-promise-router");
const db = require("../database");

const router = new Router();

/* GET all genes. */
router.get("/", async (req, res) => {
  const { rows } = await db.getAllGenes();
  res.send(rows);
});

/* GET gene information by ID. */
router.get("/:id", async (req, res) => {
  const { id } = req.params;
  const { rows } = await db.getGeneInfoById(id);
  res.send(rows[0]);
});

module.exports = router;
