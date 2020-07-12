-- Table: public.publications

-- DROP TABLE public.publications;

CREATE TABLE public.publications
(
    id serial PRIMARY KEY NOT NULL UNIQUE,
    year integer NOT NULL,
    number_of_publications integer NOT NULL,
    gene_id character varying(255) NOT NULL,
    CONSTRAINT gene_id FOREIGN KEY (gene_id)
        REFERENCES public.genes (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)