-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-03-2022 a las 01:00:36
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `estudiante`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `id_asignatura` int(11) NOT NULL,
  `nombre_asignatura` varchar(50) DEFAULT NULL,
  `profesor` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`id_asignatura`, `nombre_asignatura`, `profesor`) VALUES
(111, 'sociales', 'samuel'),
(112, 'matematicas', 'maria'),
(1112, 'bilogia', 'casianis');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `numero_matricula` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`id`, `nombre`, `numero_matricula`) VALUES
(1, 'juan', 1223),
(2, 'andres', 1343),
(3, 'maria', 1324);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facultad`
--

CREATE TABLE `facultad` (
  `id_facultad` int(11) NOT NULL,
  `nombre_facultad` varchar(50) DEFAULT NULL,
  `id_asignatura` int(11) DEFAULT NULL,
  `id_estudiantes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `facultad`
--

INSERT INTO `facultad` (`id_facultad`, `nombre_facultad`, `id_asignatura`, `id_estudiantes`) VALUES
(1123, 'ingeneria informatica', 111, 1),
(6545, 'ingeneria industrial', 1112, 3),
(11235, 'ingeneria civil', 112, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matricula`
--

CREATE TABLE `matricula` (
  `id` int(11) NOT NULL,
  `fecha_matricula` date DEFAULT NULL,
  `id_estudiante` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `matricula`
--

INSERT INTO `matricula` (`id`, `fecha_matricula`, `id_estudiante`) VALUES
(10, '0000-00-00', 1),
(11, '2020-05-15', 2),
(12, '1994-04-05', 1),
(13, '2020-02-01', 2),
(14, '2029-03-06', 3),
(15, '2022-08-07', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`id_asignatura`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `facultad`
--
ALTER TABLE `facultad`
  ADD PRIMARY KEY (`id_facultad`),
  ADD KEY `asignatura` (`id_asignatura`),
  ADD KEY `estudiante` (`id_estudiantes`);

--
-- Indices de la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relacion` (`id_estudiante`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `facultad`
--
ALTER TABLE `facultad`
  ADD CONSTRAINT `asignatura` FOREIGN KEY (`id_asignatura`) REFERENCES `asignatura` (`id_asignatura`),
  ADD CONSTRAINT `estudiante` FOREIGN KEY (`id_estudiantes`) REFERENCES `estudiante` (`id`);

--
-- Filtros para la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD CONSTRAINT `relacion` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
