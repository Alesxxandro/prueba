-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 25-03-2022 a las 02:26:45
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
-- Base de datos: `empresa sis`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes`
--

CREATE TABLE `ingredientes` (
  `id` int(11) NOT NULL,
  `calorias` int(11) DEFAULT NULL,
  `propiedades` varchar(50) DEFAULT NULL,
  `nombreingredientes` varchar(50) DEFAULT NULL,
  `id_plato` int(11) DEFAULT NULL,
  `id_pasoreceta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `ingredientes`
--

INSERT INTO `ingredientes` (`id`, `calorias`, `propiedades`, `nombreingredientes`, `id_plato`, `id_pasoreceta`) VALUES
(637, 34, '8 personas ya cocinaron este platillo\r\nTotal: 76mi', '\r\n\r\n    PASO 1: Cocina la carne\r\n\r\n    Adiciona a ', 2, 1324),
(1236, 12, 'personas ya cocinaron este platillo\r\nTotal: 39min\r', 'Paso 1: Sofríe la pasta Coloca en una olla donde n', 1, 143),
(1654, 205, '13 personas ya cocinaron este platillo\r\nTotal: 77m', '2 tazas de leche (500 ml)\r\n10 cucharadas de LECHE ', 3, 145);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `precio` int(11) DEFAULT NULL,
  `tipomenu` varchar(50) DEFAULT NULL,
  `id_plato` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id`, `precio`, `tipomenu`, `id_plato`) VALUES
(11, 1012, 'ejecutivo', 1),
(12, 1222, 'gastronimico', 2),
(13, 20210, 'fijo', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasoreceta`
--

CREATE TABLE `pasoreceta` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `numpaso` int(11) DEFAULT NULL,
  `operacion` varchar(50) DEFAULT NULL,
  `tiempototal` int(11) DEFAULT NULL,
  `utencilios` varchar(50) DEFAULT NULL,
  `id_receta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `pasoreceta`
--

INSERT INTO `pasoreceta` (`id`, `descripcion`, `numpaso`, `operacion`, `tiempototal`, `utencilios`, `id_receta`) VALUES
(143, 'Un clásico que nunca falla El marisco con el puntito salado del jamón es una delicia para el paladar', 7, 'Vieiras con crujiente de jamón serrano', 12, 'Cuchillos Tabla de picar Ollas y Sarten es', 123),
(145, 'plato tipico de aguas caliente', 5, 'pudin abano', 5, 'Batidor cuenco Plato de hornear Cuchara Cuchara', 323),
(1324, 'plato delicioso que sule gustar por su primoroso sabor a campo', 5, 'carne desmechada con muritos', 10, 'Olla a presión sartén Tenedor Cuchara', 223);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plato`
--

CREATE TABLE `plato` (
  `id` int(11) NOT NULL,
  `nombreplato` varchar(50) DEFAULT NULL,
  `tipoplato` varchar(50) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `comentario` varchar(50) DEFAULT NULL,
  `id_menu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `plato`
--

INSERT INTO `plato` (`id`, `nombreplato`, `tipoplato`, `precio`, `comentario`, `id_menu`) VALUES
(1, 'pescadofrito', 'entrada', 100, 'muy rico', 11),
(2, 'paella', 'postre', 500, 'bueno', 12),
(3, 'pizza', 'merienda', 200, 'deliciosa', 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta`
--

CREATE TABLE `receta` (
  `id` int(11) NOT NULL,
  `ubicacion` varchar(50) DEFAULT NULL,
  `fuente` varchar(50) DEFAULT NULL,
  `tiemporeal` int(11) DEFAULT NULL,
  `id_plato` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `receta`
--

INSERT INTO `receta` (`id`, `ubicacion`, `fuente`, `tiemporeal`, `id_plato`) VALUES
(123, 'francia', 'Grandes chefs mexicanos', 7, 1),
(223, 'ecuador', 'Tras las viñas', 8, 2),
(323, 'marsella', 'Pastry School de Le Cordon Bleu', 9, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pasoreceta` (`id_pasoreceta`),
  ADD KEY `pto` (`id_plato`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pasoreceta`
--
ALTER TABLE `pasoreceta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `receta` (`id_receta`);

--
-- Indices de la tabla `plato`
--
ALTER TABLE `plato`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu` (`id_menu`);

--
-- Indices de la tabla `receta`
--
ALTER TABLE `receta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plato` (`id_plato`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  ADD CONSTRAINT `pasoreceta` FOREIGN KEY (`id_pasoreceta`) REFERENCES `pasoreceta` (`id`),
  ADD CONSTRAINT `pto` FOREIGN KEY (`id_plato`) REFERENCES `plato` (`id`);

--
-- Filtros para la tabla `pasoreceta`
--
ALTER TABLE `pasoreceta`
  ADD CONSTRAINT `receta` FOREIGN KEY (`id_receta`) REFERENCES `receta` (`id`);

--
-- Filtros para la tabla `plato`
--
ALTER TABLE `plato`
  ADD CONSTRAINT `menu` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id`);

--
-- Filtros para la tabla `receta`
--
ALTER TABLE `receta`
  ADD CONSTRAINT `plato` FOREIGN KEY (`id_plato`) REFERENCES `plato` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
