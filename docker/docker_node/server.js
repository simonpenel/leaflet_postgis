const express = require('express');
const { Pool } = require('pg');

const app = express();

const pool = new Pool({
  user: 'simon',
  host: 'postgis',
  database: 'chenes',
  password: 'simon',
  port: 5432,
});

const hostname = '127.0.0.1';
// const hostname = '0.0.0.0';
const port = 8080;


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

app.get('/api/arbres', async (req, res) => {

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
          'nom', nom,
          'nom_site',nom_site,
          'annee', annee
        )
      ) AS feature
      FROM arbres
    ) features;
  `;

  const result = await pool.query(query);

  res.json(result.rows[0].json_build_object);
});

app.listen(port, () => {
  console.log('API démarrée');
  console.log(`Serveur démarré sur http://${hostname}:${port}`);
});

// production error handler
// no stacktraces leaked to user
// app.use(function(err, req, res, next) {
//   res.status(err.status || 500);
//   res.render('error', {
//     message: err.message,
//     error: {}
//   });
// });
// module.exports = app;
// app.listen(port, hostname);
// console.log(`Running on http://${hostname}:${port}`);
