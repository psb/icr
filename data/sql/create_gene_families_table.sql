-- Table: public.gene_families

-- DROP TABLE public.gene_families;

CREATE TABLE public.gene_families
(
    family character varying(255) COLLATE pg_catalog."default" NOT NULL,
    id integer NOT NULL DEFAULT nextval('gene_families_id_seq'::regclass),
    gene_id character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT unique_family_id PRIMARY KEY (id),
    CONSTRAINT gene_id FOREIGN KEY (gene_id)
        REFERENCES public.genes (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.gene_families
    OWNER to postgres;

-- Made family name unique:
ALTER TABLE public.gene_families
    ADD CONSTRAINT unique_gene_family_name UNIQUE (family);