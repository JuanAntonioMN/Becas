// db.js

const mysql = require('mysql');

const conexion = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'becas',
});

// Exporta la conexión para que pueda ser utilizada en otros archivos
module.exports = conexion;

