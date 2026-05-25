CREATE TABLE lieux2 (
    id serial PRIMARY KEY,
    nom text,
    geom geometry(Point, 4326)
);
INSERT INTO lieux2 (nom, geom)
VALUES (
    'Parc',
    ST_SetSRID(ST_MakePoint(4.87, 45.76), 4326)
);