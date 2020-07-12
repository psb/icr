const fs = require("fs");
const { Pool, Client } = require("pg");

const data = JSON.parse(fs.readFileSync("data.json", "utf8"));

const insertIntoGenesQueryText = `
INSERT INTO genes(
  id,
  family,
  num_structures,
  num_compounds,
  description,
  full_name,
  short_name,
  image) VALUES($1, $2, $3, $4, $5, $6, $7, $8)
`;

const insertIntoFeaturesQueryText = `
INSERT INTO features(
  is_druggable,
  is_enzyme,
  gene_id) VALUES($1, $2, $3)
`;

const insertIntoPublicationsQueryText = `
INSERT INTO publications(
  year,
  number_of_publications,
  gene_id) VALUES($1, $2, $3)
`;

const pool = new Pool({
  user: "paulbacchus",
  host: "localhost",
  database: "icr_psb_genedb",
  port: 5432,
});

// Transaction to insert the data for one gene.
async function insertData(gene) {
  const client = await pool.connect();

  try {
    await client.query("BEGIN");

    await client.query(insertIntoGenesQueryText, [
      gene.id,
      gene.family,
      gene.num_structures,
      gene.num_compounds,
      gene.description,
      gene.full_name,
      gene.short_name,
      gene.image,
    ]);

    await client.query(insertIntoFeaturesQueryText, [
      gene.features.is_druggable,
      gene.features.is_enzyme,
      gene.id,
    ]);

    gene.publications.forEach(async (publication) => {
      let year = parseInt(publication[0]);
      let number_of_publications = publication[1];

      await client.query(insertIntoPublicationsQueryText, [
        year,
        number_of_publications,
        gene.id,
      ]);
    });

    await client.query("COMMIT");
  } catch (e) {
    console.log(e);
    await client.query("ROLLBACK");
    throw e;
  } finally {
    client.release();
  }
}

data.forEach((geneData) => {
  insertData(geneData).catch((e) => console.error(e.stack));
});
console.log("Data inserted successfully.");
