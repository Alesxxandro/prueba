-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 15-05-2022 a las 20:57:59
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
-- Base de datos: `ingreso`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `c_estado` (IN `nid` INT(11))  BEGIN

  DECLARE listo boolean DEFAULT false;
  DECLARE v_id int;
  DECLARE v_estado VARCHAR(120);  
  
DECLARE c_universidad CURSOR for SELECT id, estado 
                                FROM usuario;
DECLARE CONTINUE HANDLER for SQLSTATE '02000' SET listo = true;
OPEN c_universidad;
c_universidadLoop:LOOP
FETCH c_universidad INTO v_id, v_estado;
  if listo THEN LEAVE c_universidadLoop;
  END if;
  UPDATE usuario set estado = 'inactivo' WHERE id = v_id and id =nid;
END Loop c_universidadLoop;
CLOSE c_universidad;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `cargo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `estado`, `cargo`) VALUES
(1, 'manuel', 'inactivo', 'estudiante'),
(2, 'felipe', 'activo', 'estudiante'),
(3, 'hector', 'inactivo', 'docente'),
(4, 'daniel', 'activo', 'docente');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
