// index.js (o app.js)
const puerto = 3000;
const express = require('express');
const app = express();
const conexion = require('./conexion');
const bodyParser = require('body-parser');
const cors = require('cors');
const multer = require('multer');
const path = require('path');
app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));




// Rutas y lógica de la aplicación
app.get('/vista_solicitud_beca_usuario', (req, res) => {
  // Realiza alguna operación en la base de datos, por ejemplo, una consulta SELECT
  conexion.query('SELECT * FROM vista_solicitud_beca_usuario	', (err, resultados) => {
    if (err) {
      console.error('Error al ejecutar la consulta:', err);
      return res.status(500).send('Error en el servidor');
    }
    else{
      console.log("conexion estable");
    }

    // Envía los resultados como respuesta
    res.json(resultados);
  });
});

app.get('/vista_solicitud_beca_usuario/:idUsuario', (req, res) => {
  
  const idUsuario = parseInt(req.params.idUsuario, 10);
  // Realiza la consulta con un filtro WHERE para el ID de usuario
  conexion.query('SELECT * FROM vista_solicitud_beca_usuario WHERE idUsuario= ?', [idUsuario], (err, resultados) => {
    if (err) {
      console.error('Error al ejecutar la consulta:', err);
      return res.status(500).send('Error en el servidor');
    }

    // Envía los resultados como respuesta
    console.log(resultados);
    res.json(resultados);
  });
});


// Rutas y lógica de la aplicación
app.get('/Estado-Beca', (req, res) => {
  // Realiza alguna operación en la base de datos, por ejemplo, una consulta SELECT
  conexion.query('SELECT * FROM vista_estado_beca	', (err, resultados) => {
    if (err) {
      console.error('Error al ejecutar la consulta:', err);
      return res.status(500).send('Error en el servidor');
    }
    else{
      console.log("conexion estable");
    }

    // Envía los resultados como respuesta
    res.json(resultados);
  });
});

// Ruta para obtener la suma del saldo total
app.get('/saldo-total', (req, res) => {
  // Realiza la operación de suma en la base de datos
  conexion.query('SELECT SUM(Saldo) AS SaldoTotal FROM usuarios', (err, resultados) => {
    if (err) {
      console.error('Error al ejecutar la consulta:', err);
      return res.status(500).send('Error en el servidor');
    }

    // Envía el resultado como respuesta
    res.json(resultados[0]);
  });
});

// Ruta para obtener la suma del saldo total
app.get('/Edad-Promedio', (req, res) => {
  // Realiza la operación de suma en la base de datos
  conexion.query('SELECT AVG(Edad) AS EdadPromedio FROM usuarios', (err, resultados) => {
    if (err) {
      console.error('Error al ejecutar la consulta:', err);
      return res.status(500).send('Error en el servidor');
    }

    // Envía el resultado como respuesta
    res.json(resultados[0]);
  });
});

// Ruta para obtener la suma del saldo total
app.get('/Total-Solicitudes', (req, res) => {
  // Realiza la operación de suma en la base de datos
  conexion.query('SELECT COUNT(*) AS TotalSolicitudes FROM solicitud_beca', (err, resultados) => {
    if (err) {
      console.error('Error al ejecutar la consulta:', err);
      return res.status(500).send('Error en el servidor');
    }

    // Envía el resultado como respuesta
    res.json(resultados[0]);
  });
});



// Ruta para obtener una lista combinada de usuarios y escuelas
app.get('/usuarios-y-escuelas', (req, res) => {
  // Realiza la operación de combinación usando UNION
  const query = `
    SELECT Nombre AS NombreUsuario, Apellidos AS ApellidosUsuario FROM usuarios
    UNION
    SELECT NombreEscuela AS NombreUsuario, '' AS ApellidosUsuario FROM escuela
  `;

  conexion.query(query, (err, resultados) => {
    if (err) {
      console.error('Error al ejecutar la consulta:', err);
      return res.status(500).send('Error en el servidor');
    }

    // Envía el resultado como respuesta
    res.json(resultados);
  });
});

app.get('/consulta-escuelas', (req, res) => {
  // Define tu consulta
  const sqlQuery = `
    SELECT
      e.id AS id_escuela,
      e.NombreEscuela,
      COUNT(u.id) AS total_usuarios,
      AVG(u.Saldo) AS saldo_promedio
    FROM
      escuela e
    JOIN
      usuarios u ON e.id = u.id
    GROUP BY
      e.id, e.NombreEscuela
    HAVING
      AVG(u.Saldo) > 1000;
  `;

  // Ejecuta la consulta
  conexion.query(sqlQuery, (error, results, fields) => {
    if (error) {
      console.error('Error al ejecutar la consulta:', error);
      res.status(500).json({ error: 'Error al ejecutar la consulta' });
      return;
    }

    // Devuelve los resultados como JSON
    res.json(results);
  });
});


// Ruta para ejecutar la consulta
app.get('/consulta', (req, res) => {
  const consulta = `
  SELECT
  e.id AS id_escuela,
  e.NombreEscuela,
  COUNT(u.id) AS total_usuarios,
  AVG(u.Saldo) AS saldo_promedio
FROM
  escuela e
JOIN
  usuarios u ON e.id = u.id
GROUP BY
  e.id, e.NombreEscuela WITH ROLLUP;

  `;

  // Ejecuta la consulta
  conexion.query(consulta, (error, resultados) => {
    if (error) {
      console.error('Error al ejecutar la consulta: ', error);
      res.status(500).json({ error: 'Error al ejecutar la consulta' });
    } else {
      // Envia los resultados como respuesta
      res.json(resultados);
    }
  });
});




app.post('/registrar', (req, res) => {
  const usuarioData = req.body;
  console.log('Datos recibidos del formulario:', usuarioData);

  const {
    Nombre,
    Apellidos,
    Fecha_Nacimiento,
    Sexo,
    Edad,
    Curp,
    Calle,
    NoDomicilio,
    CodigoPostal,
    Correo,
    Contrasena,
    idLocalidad,
    idMunicipio,
    idEstado
    // ... otros campos de domicilio ...
  } = usuarioData;

  // Insertar la nueva dirección en la tabla domicilio
  const insertDomicilioQuery = `
    INSERT INTO direccion (No_Domicilio,Calle, codigoPostal) 
    VALUES (?, ?, ?);
  `;
  const valuesDomicilio = [
    NoDomicilio,
    Calle,
    CodigoPostal
  ];

  conexion.query(insertDomicilioQuery, valuesDomicilio, (error, resultsDomicilio) => {
    if (error) {
      console.error('Error al insertar datos en MySQL (domicilio):', error);
      res.status(500).json({ mensaje: 'Error al procesar la solicitud' });
      return;
    }

   
    const id_domicilio = resultsDomicilio.insertId;

    // Insertar datos del usuario con la referencia al domicilio
    const insertUsuarioQuery = `
      INSERT INTO usuarios
      (Nombre, Apellidos, Fecha_Nacimiento, Sexo, Edad, Curp, Correo, Contraseña, id_domicilio, Saldo, idLocalidad, idMunicipio, idEstado) 
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 0, ?, ?, ?);
    `;

    const valuesUsuario = [
      Nombre,
      Apellidos,
      Fecha_Nacimiento,
      Sexo,
      Edad,
      Curp,
      Correo,
      Contrasena,
      id_domicilio,
      idLocalidad,
      idMunicipio,
      idEstado,
    ];

    conexion.query(insertUsuarioQuery, valuesUsuario, (error, resultsUsuario) => {
      if (error) {
        console.error('Error al insertar datos en MySQL (usuario):', error);
        res.status(500).json({ mensaje: 'Error al procesar la solicitud' });
      } else {
        console.log('Datos insertados correctamente en MySQL:', resultsUsuario);
        res.status(200).json({ mensaje: 'Datos insertados correctamente' });
      }
    });
  });
});


// Ruta para obtener una lista combinada de usuarios y escuelas
app.get('/estado', (req, res) => {
  
  conexion.query(`SELECT * FROM estado`, (err, resultados) => {
    if (err) {
      console.error('Error al ejecutar la consulta:', err);
      return res.status(500).send('Error en el servidor');
    }
    // Envía el resultado como respuesta
    res.json(resultados);
  });
});

app.get('/municipios/:idEstado', (req, res) => {
  const idEstado = req.params.idEstado;
  // Obtener municipios filtrados por el estado seleccionado
  const query = 'SELECT * FROM municipio WHERE idEstado = ?';
  conexion.query(query, [idEstado], (error, results) => {
    if (error) {
      console.error('Error al obtener municipios filtrados:', error);
      res.status(500).json({ mensaje: 'Error al procesar la solicitud' });
    } else {
      res.status(200).json(results);
    }
  });
});

app.get('/localidades/:idEstado', (req, res) => {
  const idEstado = req.params.idEstado;
  // Obtener localidades filtradas por el estado seleccionado
  const query = 'SELECT * FROM localidad WHERE idEstado = ?';
  conexion.query(query, [idEstado], (error, results) => {
    if (error) {
      console.error('Error al obtener localidades filtradas:', error);
      res.status(500).json({ mensaje: 'Error al procesar la solicitud' });
    } else {
      res.status(200).json(results);
    }
  });
});




// Ruta de inicio de sesión
app.post('/login', (req, res) => {
  const { Correo, Contraseña } = req.body;

  // Consulta a la base de datos para verificar las credenciales
  const sql = 'SELECT id FROM usuarios WHERE Correo = ? AND Contraseña = ?';
  conexion.query(sql, [Correo, Contraseña], (err, result) => {
    if (err) {
      console.error('Error al ejecutar la consulta:', err);
      return res.status(500).send('Error en el servidor');
    }

    if (result.length > 0) {
      const userId = result[0].id;
      
      res.json({
        success: true,
        message: 'Inicio de sesión exitoso',
        userId: userId
      });
      console.log("Inicio de sesión exitoso para el usuario con ID:", userId);
    } else {
      res.json({ success: false, message: 'Credenciales incorrectas' });
      console.log("Credenciales incorrectas");
    }
  });
});

// Ruta de perfil de estudiante protegida
app.get('/Perfil-Estudiante/:userId', (req, res) => {
  // Obtiene el id del usuario desde los parámetros de la URL
  const userId = parseInt(req.params.userId, 10);

  // Realiza alguna operación en la base de datos, por ejemplo, una consulta SELECT
  conexion.query('SELECT * FROM vista_usuario_domicilio WHERE id_usuario = ?', [userId], (err, resultados) => {
    if (err) {
      console.error('Error al ejecutar la consulta:', err);
      return res.status(500).send('Error en el servidor');
    }

    console.log("Consulta exitosa para el usuario con ID:", userId);
    

    // Envía los resultados como respuesta
    res.json(resultados);
    console.log(resultados);
  });
});









// Rutas para obtener datos de diferentes tablas
app.get('/escuelas', (req, res) => {
  conexion.query('SELECT * FROM escuela', (error, results) => {
    if (error) {
      console.error('Error al realizar la consulta:', error);
      return res.status(500).json({ error: 'Error en el servidor' });
    }
    res.json(results);
  });
});

app.get('/becas', (req, res) => {
  conexion.query('SELECT * FROM tipo_beca', (error, results) => {
    if (error) {
      console.error('Error al realizar la consulta:', error);
      return res.status(500).json({ error: 'Error en el servidor' });
    }
    res.json(results);
  });
});

app.get('/grados-academicos', (req, res) => {
  conexion.query('SELECT * FROM grados_academico', (error, results) => {
    if (error) {
      console.error('Error al realizar la consulta:', error);
      return res.status(500).json({ error: 'Error en el servidor' });
    }
    res.json(results);
  });
});



// Ruta para manejar las solicitudes POST de Angular
app.post('/solicitudes', (req, res) => {
  const solicitud = req.body;
  console.log(solicitud);

  // Realiza la lógica necesaria para guardar la solicitud en la base de datos
  const insertQuery = `
    INSERT INTO solicitud_beca 
    (idUsuario, idGradoAcademico, idEscuela, NombreTutor, ApellidosTutor, idTipoBeca,Boleta, idEstadoBeca) 
    VALUES (?, ?, ?, ?, ?, ?,?, 2);
  `;

  const values = [
    solicitud.idUsuario,
    solicitud.idgradoAcademico,
    solicitud.idEscuela,
    solicitud.nombreTutor,
    solicitud.apellidosTutor,
    solicitud.idTipoBeca,
    solicitud.boleta,
  ];

  // Ejecuta la consulta
  conexion.query(insertQuery, values, (error, results) => {
    if (error) {
      console.error('Error al insertar datos en MySQL (solicitud_beca):', error);
      res.status(500).json({ mensaje: 'Error al procesar la solicitud' });
    } else {
      console.log('Datos insertados correctamente en MySQL:', results);
      res.status(200).json({ mensaje: 'Datos insertados correctamente' });
    }
  });
});



// Middleware para manejar la conexión a la base de datos en cada solicitud
app.use((req, res, next) => {
  if (conexion.state === 'disconnected') {
    conexion.connect((error) => {
      if (error) {
        console.error('Error al conectar a la base de datos:', error);
        return res.status(500).json({ error: 'Error en el servidor' });
      }
      next();
    });
  } else {
    next();
  }
});


app.use((req, res, next) => {
  if (req.mysql) {
    req.mysql.release();
  }
  next();
});


app.listen(puerto, () => {
  console.log(`Servidor escuchando en el puerto ${puerto}`);
});
