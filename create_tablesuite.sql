INSERT INTO lieux (nom, geom)
VALUES (
    'Jardin',
    ST_SetSRID(ST_MakePoint(4.77, 45.76), 4326)
);
