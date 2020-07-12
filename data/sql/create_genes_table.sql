-- Table: public.genes

-- DROP TABLE public.genes;

CREATE TABLE public.genes
(
    id character varying(255) COLLATE pg_catalog."default" NOT NULL,
    num_structures integer NOT NULL,
    num_compounds integer NOT NULL,
    description text COLLATE pg_catalog."default" NOT NULL,
    full_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    short_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    image text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT genes_pkey PRIMARY KEY (id),
    CONSTRAINT unique_gene_id UNIQUE (id)

)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.genes
    OWNER to postgres;