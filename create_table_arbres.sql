CREATE TABLE arbres (
    id serial PRIMARY KEY,
    nom text,
    nom_site text,
    annee int,
    prod_gland int,
    geom geometry(Point, 4326)
);