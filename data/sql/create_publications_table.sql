-- Table: public.publications

-- DROP TABLE public.publications;

CREATE TABLE public.publications
(
    id integer NOT NULL DEFAULT nextval('publications_id_seq'::regclass),
    year integer NOT NULL,
    gene_id character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT unique_publication_id PRIMARY KEY (id),
    CONSTRAINT gene_id FOREIGN KEY (gene_id)
        REFERENCES public.genes (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.publications
    OWNER to postgres;

-- Add 'number_of_publications' column:
ALTER TABLE public.publications
    ADD COLUMN number_of_publications integer;