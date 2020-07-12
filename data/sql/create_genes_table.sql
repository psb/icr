-- Table: public.genes

-- DROP TABLE public.genes;

CREATE TABLE public.genes
(
    id character varying(255) PRIMARY KEY NOT NULL UNIQUE,
    family character varying(255)  NOT NULL,
    num_structures integer NOT NULL,
    num_compounds integer NOT NULL,
    description text NOT NULL,
    full_name character varying(255) NOT NULL,
    short_name character varying(255) NOT NULL,
    image text NOT NULL
)