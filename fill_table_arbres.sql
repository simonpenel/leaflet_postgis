INSERT INTO arbres (nom, nom_site, annee, prod_gland,geom)
VALUES (
    'Chene 1',
    'Parc',
    2001,
    100,
    ST_SetSRID(ST_MakePoint(4.87, 45.76), 4326)
);