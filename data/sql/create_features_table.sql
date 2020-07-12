-- Table: public.features

-- DROP TABLE public.features;

CREATE TABLE public.features
(
    id serial PRIMARY KEY NOT NULL UNIQUE,
    is_druggable boolean NOT NULL,
    is_enzyme boolean NOT NULL,
    gene_id character varying(255) NOT NULL,
    CONSTRAINT gene_id FOREIGN KEY (gene_id)
        REFERENCES public.genes (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)