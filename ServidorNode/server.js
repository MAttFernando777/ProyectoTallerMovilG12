const express = require('express');
const cors = require('cors');
const mysql = require('mysql');
const app = express();

app.use(cors());
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'realg4life',
  database: 'ejemplo'
});

connection.connect();

app.get('/convocatorias', (req, res) => {
    const query = `SELECT * FROM convocatoria`;
    
    connection.query(query, (error, results, fields) => {
      if (error) throw error;
  
      res.json(results);
    });
  });

app.get('/convocatoria/:id', (req, res) => {
  const convocatoriaId = req.params.id;
  const query = `SELECT * FROM convocatoria WHERE id = ${convocatoriaId}`;
  
  connection.query(query, (error, results, fields) => {
    if (error) throw error;

    if (results.length > 0) {
      res.json(results[0]);
    } else {
      res.status(404).send('Convocatoria no encontrada');
    }
  });
});

app.listen(3000, () => {
  console.log('Servidor API en ejecución en el puerto 3000');
});