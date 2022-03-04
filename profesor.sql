-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 04-03-2022 a las 21:00:29
-- Versión del servidor: 8.0.17
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `parcial`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `Id_P` int(11) NOT NULL,
  `NIF_P` varchar(10) NOT NULL,
  `Código_Asignatura` int(11) NOT NULL,
  `Nombre_profe` varchar(50) NOT NULL,
  `Especialidad` varchar(225) NOT NULL,
  `Teléfono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`Id_P`, `NIF_P`, `Código_Asignatura`, `Nombre_profe`, `Especialidad`, `Teléfono`) VALUES
(1, 'QII001', 1, 'William Insignares', 'bilingüe, informático y Químico ', 35884129),
(1, 'QII001', 2, 'William Insignares', 'bilingüe, Informático y Químico.', 35884129),
(1, 'QII001', 3, 'William Insignares', 'bilingüe, informático y químico', 35884129);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD KEY `Código_Asignatura` (`Código_Asignatura`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD CONSTRAINT `profesor_ibfk_1` FOREIGN KEY (`Código_Asignatura`) REFERENCES `asignatura` (`Código_Asignatura`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
