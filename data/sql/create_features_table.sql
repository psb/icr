-- Table: public.features

-- DROP TABLE public.features;

CREATE TABLE public.features
(
    id integer NOT NULL DEFAULT nextval('features_id_seq'::regclass),
    is_druggable boolean NOT NULL,
    is_enzyme boolean NOT NULL,
    gene_id character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT unique_feature_id UNIQUE (id)
,
    CONSTRAINT gene_id FOREIGN KEY (gene_id)
        REFERENCES public.genes (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.features
    OWNER to postgres;