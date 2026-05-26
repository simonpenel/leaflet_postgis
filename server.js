const express = require('express');
const { Pool } = require('pg');

const app = express();

const pool = new Pool({
  user: 'simon',
  host: 'localhost',
  database: 'base_chenes',
  password: 'simon',
  port: 5432,
});

const hostname = '127.0.0.1';
const port = 3000;


app.get('/api/lieux', async (req, res) => {

  const query = `
    SELECT json_build_object(
      'type', 'FeatureCollection',
      'features', json_agg(feature)
    )
    FROM (
      SELECT json_build_object(
        'type', 'Feature',
        'geometry', ST_AsGeoJSON(geom)::json,
        'properties', json_build_object(
          'id', id,
          'nom', nom
        )
      ) AS feature
      FROM lieux
    ) features;
  `;

  const result = await pool.query(query);

  res.json(result.rows[0].json_build_object);
});

app.listen(3000, () => {
  console.log('API démarrée');
  console.log(`Serveur démarré sur http://${hostname}:${port}`);
});