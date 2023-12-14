-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-12-2023 a las 15:58:53
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `becas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `id` int(11) NOT NULL,
  `No_Domicilio` varchar(255) DEFAULT NULL,
  `Calle` varchar(255) DEFAULT NULL,
  `codigoPostal` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`id`, `No_Domicilio`, `Calle`, `codigoPostal`) VALUES
(1, '205', 'Calle azalea', '12345'),
(2, '204', 'San luis enrique', '20989'),
(3, '204', 'San luis enrique', '20989'),
(4, '200', 'Gremio lopes tardzo', '20989'),
(5, '200', 'San luis enrique', '20297');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escuela`
--

CREATE TABLE `escuela` (
  `id` int(11) NOT NULL,
  `NombreEscuela` varchar(255) DEFAULT NULL,
  `Calle` varchar(255) DEFAULT NULL,
  `NoCalle` varchar(10) DEFAULT NULL,
  `idLocalidad` int(11) DEFAULT NULL,
  `idEstado` int(11) DEFAULT NULL,
  `idMunicipio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `escuela`
--

INSERT INTO `escuela` (`id`, `NombreEscuela`, `Calle`, `NoCalle`, `idLocalidad`, `idEstado`, `idMunicipio`) VALUES
(11, 'San Ingnacio', 'Calle Principal', '123', 1, 1, 1),
(12, 'Mariano Jimenez', 'Avenida Central', '456', 2, 2, 2),
(13, 'Rodolfo Marquez', 'Calle Secundaria', '789', 3, 3, 3),
(14, 'Justo Sierra', 'Avenida Norte', '101', 4, 4, 4),
(15, 'La Paz', 'Calle Oeste', '202', 5, 5, 5),
(16, 'Moctezuma', 'Avenida Este', '303', 6, 6, 6),
(17, 'Benito Juarez', 'Calle Sur', '404', 7, 7, 7),
(18, 'Juan Escutia', 'Avenida Principal', '505', 8, 8, 8),
(19, 'Miguel Angel', 'Calle Principal', '606', 9, 9, 9),
(20, 'Corazon de niño', 'Avenida Norte', '707', 10, 10, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id` int(11) NOT NULL,
  `NombreEstado` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id`, `NombreEstado`) VALUES
(1, 'Aguascalientes'),
(2, 'Baja California'),
(3, 'Baja California Sur'),
(4, 'Campeche'),
(5, 'Chiapas'),
(6, 'Chihuahua'),
(7, 'Coahuila'),
(8, 'Colima'),
(9, 'Durango'),
(10, 'Guanajuato');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_beca`
--

CREATE TABLE `estado_beca` (
  `id` int(11) NOT NULL,
  `Estado` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado_beca`
--

INSERT INTO `estado_beca` (`id`, `Estado`) VALUES
(1, 'Aprobada'),
(2, 'En revision'),
(3, 'No Aprobada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grados_academico`
--

CREATE TABLE `grados_academico` (
  `id_grado` int(11) NOT NULL,
  `nombre_grado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `grados_academico`
--

INSERT INTO `grados_academico` (`id_grado`, `nombre_grado`) VALUES
(1, 'Primaria'),
(2, 'Secundaria'),
(3, 'Preparatoria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidad`
--

CREATE TABLE `localidad` (
  `id` int(11) NOT NULL,
  `NombreLocalidad` varchar(255) DEFAULT NULL,
  `idEstado` int(11) DEFAULT NULL,
  `idMunicipio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `localidad`
--

INSERT INTO `localidad` (`id`, `NombreLocalidad`, `idEstado`, `idMunicipio`) VALUES
(1, 'Centro', 1, 1),
(2, 'Zona Centro', 2, 2),
(3, 'Colonia del Centro', 3, 3),
(4, 'Barrio Centro', 4, 4),
(5, 'Centro Histórico', 5, 5),
(6, 'Zona Centro', 6, 6),
(7, 'Downtown', 7, 7),
(8, 'Barrio Central', 8, 8),
(9, 'Área Central', 9, 9),
(10, 'Centro Histórico', 10, 10),
(11, 'Centro', 1, 1),
(12, 'Villasunción', 1, 1),
(13, 'Ojocaliente', 1, 1),
(14, 'Rincón de Romos Centro', 1, 11),
(15, 'Lomas de Romos', 1, 11),
(16, 'Las Palomas', 1, 11),
(17, 'Calvillo Centro', 1, 12),
(18, 'La Labor', 1, 12),
(19, 'La Panadera', 1, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE `municipio` (
  `id` int(11) NOT NULL,
  `NombreMunicipio` varchar(255) DEFAULT NULL,
  `idEstado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `municipio`
--

INSERT INTO `municipio` (`id`, `NombreMunicipio`, `idEstado`) VALUES
(1, 'Aguascalientes', 1),
(2, 'Ensenada', 2),
(3, 'La Paz', 3),
(4, 'Campeche', 4),
(5, 'Tuxtla Gutiérrez', 5),
(6, 'Ciudad Juárez', 6),
(7, 'Saltillo', 7),
(8, 'Colima', 8),
(9, 'Gómez Palacio', 9),
(10, 'León', 10),
(11, 'Rincón de Romos', 1),
(12, 'Calvillo', 1),
(13, 'Jesús María', 1),
(14, 'San Francisco de los Romo', 1),
(15, 'Tepezalá', 1),
(16, 'El Llano', 1),
(17, 'Pabellón de Arteaga', 1),
(18, 'Asientos', 1),
(19, 'Cosío', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud_beca`
--

CREATE TABLE `solicitud_beca` (
  `id` int(11) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `idGradoAcademico` int(11) DEFAULT NULL,
  `idEscuela` int(11) DEFAULT NULL,
  `NombreTutor` varchar(255) DEFAULT NULL,
  `ApellidosTutor` varchar(255) DEFAULT NULL,
  `idTipoBeca` int(11) DEFAULT NULL,
  `Boleta` varchar(255) DEFAULT NULL,
  `idEstadoBeca` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Disparadores `solicitud_beca`
--
DELIMITER $$
CREATE TRIGGER `Trigger_Solicitud` BEFORE INSERT ON `solicitud_beca` FOR EACH ROW BEGIN
    DECLARE edad_usuario INT;
    SELECT Edad INTO edad_usuario FROM usuarios WHERE id = NEW.idUsuario;

    IF edad_usuario > 12 && edad_usuario < 18 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El usuario debe tener al menos 18 años para solicitar una beca.';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_insert_solicitud_beca` BEFORE INSERT ON `solicitud_beca` FOR EACH ROW BEGIN
    DECLARE edad_usuario INT;
    SELECT Edad INTO edad_usuario FROM usuarios WHERE id = NEW.idUsuario;

    IF edad_usuario < 18 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El usuario debe tener al menos 18 años para solicitar una beca.';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_beca`
--

CREATE TABLE `tipo_beca` (
  `id` int(11) NOT NULL,
  `Tipo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_beca`
--

INSERT INTO `tipo_beca` (`id`, `Tipo`) VALUES
(1, 'Beca Académica'),
(2, 'Beca Deportiva'),
(3, 'Beca Cultural'),
(4, 'Beca de Investigación'),
(5, 'Beca de Apoyo Socioeconómico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Apellidos` varchar(255) DEFAULT NULL,
  `Fecha_Nacimiento` date DEFAULT NULL,
  `Sexo` char(20) DEFAULT NULL,
  `Edad` int(11) DEFAULT NULL,
  `Curp` varchar(18) DEFAULT NULL,
  `Correo` varchar(255) DEFAULT NULL,
  `Contraseña` varchar(255) DEFAULT NULL,
  `id_domicilio` int(11) DEFAULT NULL,
  `Saldo` decimal(10,2) DEFAULT NULL,
  `idLocalidad` int(11) DEFAULT NULL,
  `idMunicipio` int(11) DEFAULT NULL,
  `idEstado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_estado_beca`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_estado_beca` (
`id_estado_beca` int(11)
,`Estado` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_solicitud_beca_usuario`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_solicitud_beca_usuario` (
`solicitud_id` int(11)
,`idUsuario` int(11)
,`Nombre` varchar(255)
,`Apellidos` varchar(255)
,`Fecha_Nacimiento` date
,`Sexo` char(20)
,`Edad` int(11)
,`Curp` varchar(18)
,`Correo` varchar(255)
,`Contraseña` varchar(255)
,`No_Domicilio` varchar(255)
,`Calle` varchar(255)
,`codigoPostal` varchar(10)
,`Saldo` decimal(10,2)
,`NombreLocalidad` varchar(255)
,`NombreMunicipio` varchar(255)
,`NombreEstado` varchar(255)
,`nombre_grado` varchar(255)
,`NombreEscuela` varchar(255)
,`EscuelaCalle` varchar(255)
,`EscuelaNumero` varchar(10)
,`NombreTutor` varchar(255)
,`ApellidosTutor` varchar(255)
,`Boleta` varchar(255)
,`Tipo` varchar(255)
,`Estado` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_usuario_domicilio`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_usuario_domicilio` (
`id_usuario` int(11)
,`Nombre` varchar(255)
,`Apellidos` varchar(255)
,`Fecha_Nacimiento` date
,`Sexo` char(20)
,`Edad` int(11)
,`Curp` varchar(18)
,`Correo` varchar(255)
,`Saldo` decimal(10,2)
,`id_domicilio` int(11)
,`No_Domicilio` varchar(255)
,`Calle` varchar(255)
,`CodigoPostal` varchar(10)
,`NombreLocalidad` varchar(255)
,`NombreMunicipio` varchar(255)
,`NombreEstado` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_estado_beca`
--
DROP TABLE IF EXISTS `vista_estado_beca`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_estado_beca`  AS SELECT `estado_beca`.`id` AS `id_estado_beca`, `estado_beca`.`Estado` AS `Estado` FROM `estado_beca` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_solicitud_beca_usuario`
--
DROP TABLE IF EXISTS `vista_solicitud_beca_usuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_solicitud_beca_usuario`  AS SELECT `sb`.`id` AS `solicitud_id`, `u`.`id` AS `idUsuario`, `u`.`Nombre` AS `Nombre`, `u`.`Apellidos` AS `Apellidos`, `u`.`Fecha_Nacimiento` AS `Fecha_Nacimiento`, `u`.`Sexo` AS `Sexo`, `u`.`Edad` AS `Edad`, `u`.`Curp` AS `Curp`, `u`.`Correo` AS `Correo`, `u`.`Contraseña` AS `Contraseña`, `d`.`No_Domicilio` AS `No_Domicilio`, `d`.`Calle` AS `Calle`, `d`.`codigoPostal` AS `codigoPostal`, `u`.`Saldo` AS `Saldo`, `loc`.`NombreLocalidad` AS `NombreLocalidad`, `mun`.`NombreMunicipio` AS `NombreMunicipio`, `est`.`NombreEstado` AS `NombreEstado`, `ga`.`nombre_grado` AS `nombre_grado`, `e`.`NombreEscuela` AS `NombreEscuela`, `e`.`Calle` AS `EscuelaCalle`, `e`.`NoCalle` AS `EscuelaNumero`, `sb`.`NombreTutor` AS `NombreTutor`, `sb`.`ApellidosTutor` AS `ApellidosTutor`, `sb`.`Boleta` AS `Boleta`, `tb`.`Tipo` AS `Tipo`, `eb`.`Estado` AS `Estado` FROM (((((((((`solicitud_beca` `sb` join `usuarios` `u` on(`sb`.`idUsuario` = `u`.`id`)) join `grados_academico` `ga` on(`sb`.`idGradoAcademico` = `ga`.`id_grado`)) join `escuela` `e` on(`sb`.`idEscuela` = `e`.`id`)) join `tipo_beca` `tb` on(`sb`.`idTipoBeca` = `tb`.`id`)) join `estado_beca` `eb` on(`sb`.`idEstadoBeca` = `eb`.`id`)) join `localidad` `loc` on(`u`.`idLocalidad` = `loc`.`id`)) join `municipio` `mun` on(`u`.`idMunicipio` = `mun`.`id`)) join `estado` `est` on(`u`.`idEstado` = `est`.`id`)) join `direccion` `d` on(`u`.`id_domicilio` = `d`.`id`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_usuario_domicilio`
--
DROP TABLE IF EXISTS `vista_usuario_domicilio`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_usuario_domicilio`  AS SELECT `u`.`id` AS `id_usuario`, `u`.`Nombre` AS `Nombre`, `u`.`Apellidos` AS `Apellidos`, `u`.`Fecha_Nacimiento` AS `Fecha_Nacimiento`, `u`.`Sexo` AS `Sexo`, `u`.`Edad` AS `Edad`, `u`.`Curp` AS `Curp`, `u`.`Correo` AS `Correo`, `u`.`Saldo` AS `Saldo`, `d`.`id` AS `id_domicilio`, `d`.`No_Domicilio` AS `No_Domicilio`, `d`.`Calle` AS `Calle`, `d`.`codigoPostal` AS `CodigoPostal`, `l`.`NombreLocalidad` AS `NombreLocalidad`, `m`.`NombreMunicipio` AS `NombreMunicipio`, `e`.`NombreEstado` AS `NombreEstado` FROM ((((`usuarios` `u` join `direccion` `d` on(`u`.`id_domicilio` = `d`.`id`)) join `localidad` `l` on(`u`.`idLocalidad` = `l`.`id`)) join `municipio` `m` on(`u`.`idMunicipio` = `m`.`id`)) join `estado` `e` on(`u`.`idEstado` = `e`.`id`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_direccion_id` (`id`);

--
-- Indices de la tabla `escuela`
--
ALTER TABLE `escuela`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_escuela_id` (`id`),
  ADD KEY `fk_localidad` (`idLocalidad`),
  ADD KEY `fk_estado` (`idEstado`),
  ADD KEY `fk_municipio` (`idMunicipio`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_estado_id` (`id`);

--
-- Indices de la tabla `estado_beca`
--
ALTER TABLE `estado_beca`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_estado_beca_id` (`id`);

--
-- Indices de la tabla `grados_academico`
--
ALTER TABLE `grados_academico`
  ADD PRIMARY KEY (`id_grado`);

--
-- Indices de la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idEstado` (`idEstado`),
  ADD KEY `idMunicipio` (`idMunicipio`),
  ADD KEY `idx_localidad_id` (`id`);

--
-- Indices de la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idEstado` (`idEstado`),
  ADD KEY `idx_municipio_id` (`id`);

--
-- Indices de la tabla `solicitud_beca`
--
ALTER TABLE `solicitud_beca`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idEscuela` (`idEscuela`),
  ADD KEY `idTipoBeca` (`idTipoBeca`),
  ADD KEY `idEstadoBeca` (`idEstadoBeca`),
  ADD KEY `fk_gradoAcademico` (`idGradoAcademico`);

--
-- Indices de la tabla `tipo_beca`
--
ALTER TABLE `tipo_beca`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_domicilio` (`id_domicilio`),
  ADD KEY `idLocalidad` (`idLocalidad`),
  ADD KEY `idMunicipio` (`idMunicipio`),
  ADD KEY `idEstado` (`idEstado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `escuela`
--
ALTER TABLE `escuela`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `estado_beca`
--
ALTER TABLE `estado_beca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `grados_academico`
--
ALTER TABLE `grados_academico`
  MODIFY `id_grado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `localidad`
--
ALTER TABLE `localidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `municipio`
--
ALTER TABLE `municipio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `solicitud_beca`
--
ALTER TABLE `solicitud_beca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipo_beca`
--
ALTER TABLE `tipo_beca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `escuela`
--
ALTER TABLE `escuela`
  ADD CONSTRAINT `fk_estado` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`id`),
  ADD CONSTRAINT `fk_localidad` FOREIGN KEY (`idLocalidad`) REFERENCES `localidad` (`id`),
  ADD CONSTRAINT `fk_municipio` FOREIGN KEY (`idMunicipio`) REFERENCES `municipio` (`id`);

--
-- Filtros para la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD CONSTRAINT `localidad_ibfk_1` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`id`),
  ADD CONSTRAINT `localidad_ibfk_2` FOREIGN KEY (`idMunicipio`) REFERENCES `municipio` (`id`);

--
-- Filtros para la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD CONSTRAINT `municipio_ibfk_1` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`id`);

--
-- Filtros para la tabla `solicitud_beca`
--
ALTER TABLE `solicitud_beca`
  ADD CONSTRAINT `fk_gradoAcademico` FOREIGN KEY (`idGradoAcademico`) REFERENCES `grados_academico` (`id_grado`) ON DELETE NO ACTION,
  ADD CONSTRAINT `solicitud_beca_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `solicitud_beca_ibfk_2` FOREIGN KEY (`idEscuela`) REFERENCES `escuela` (`id`),
  ADD CONSTRAINT `solicitud_beca_ibfk_3` FOREIGN KEY (`idTipoBeca`) REFERENCES `tipo_beca` (`id`),
  ADD CONSTRAINT `solicitud_beca_ibfk_4` FOREIGN KEY (`idEstadoBeca`) REFERENCES `estado_beca` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_domicilio`) REFERENCES `direccion` (`id`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`idLocalidad`) REFERENCES `localidad` (`id`),
  ADD CONSTRAINT `usuarios_ibfk_3` FOREIGN KEY (`idMunicipio`) REFERENCES `municipio` (`id`),
  ADD CONSTRAINT `usuarios_ibfk_4` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
