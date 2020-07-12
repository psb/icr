const { Pool } = require("pg");

const getAllGenesQueryText = `
SELECT
	genes.id,
  genes.short_name,
  genes.image,
	features.is_druggable,
  features.is_enzyme
FROM genes
INNER JOIN features
ON genes.id = features.gene_id;
`;

const getGeneInfoByIdQueryText = `
SELECT
	genes.id,
  genes.family,
  genes.num_structures,
  genes.num_compounds,
  genes.description,
  genes.full_name,
  genes.short_name,
  genes.image,
	features.is_druggable,
  features.is_enzyme,
	publications
FROM genes
INNER JOIN features
ON genes.id = features.gene_id
INNER JOIN (
	SELECT
		gene_id,
		ARRAY_AGG (year || ' ' || number_of_publications) publications
	FROM
		publications
	GROUP BY
		gene_id
	) AS publications
ON genes.id = publications.gene_id
WHERE genes.id = $1;
`;

const pool = new Pool({
  user: "paulbacchus",
  host: "localhost",
  database: "icr_psb_genedb",
  port: 5432,
});

module.exports = {
  getAllGenes: () => pool.query(getAllGenesQueryText),
  getGeneInfoById: (id) => pool.query(getGeneInfoByIdQueryText, [id]),
};
