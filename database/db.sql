-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-07-2021 a las 06:13:19
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_tpe`
--
DROP DATABASE IF EXISTS `db_tpe`;
CREATE DATABASE IF NOT EXISTS `db_tpe` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_tpe`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `name_category` varchar(20) NOT NULL,
  `id_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`name_category`, `id_category`) VALUES
('Policiales', 17),
('Entretenimiento', 18),
('Economía', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

CREATE TABLE `comments` (
  `id_comment` int(11) NOT NULL,
  `id_new_fk` int(11) NOT NULL,
  `author` varchar(30) NOT NULL,
  `comment` text NOT NULL,
  `score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `news`
--

CREATE TABLE `news` (
  `title` varchar(100) NOT NULL,
  `details` varchar(5000) NOT NULL,
  `category_pk` int(11) NOT NULL,
  `author` varchar(30) NOT NULL,
  `image` varchar(255) NOT NULL,
  `id_news` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(20) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `email`, `admin`) VALUES
(53, 'gus', '$2y$10$4CtZ64qL.XBGO/tNxwdO4.qobkv2ZlpuC2pweH0RDYbTyPKP4aBR6', 'gustavo@asd.com', 1),
(54, 'admin', '$2y$10$aW0dJ/FhaWc/8keX2Rqi4O50jEDhqnbgmjGgVDlSxzWwpY8qY5FlG', 'admin@admin.com', 1),
(56, 'prueba', '$2y$10$b2c4UEptB6/sHVWw7scnduprLmzReP8qGml3B0cLebhgRrnPte.AS', 'prueba@asd.com', 1),
(57, 'user', '$2y$10$NwfGwxiTXS3Khc8w9zZHOOxAa/cf0PvelvbHDr8nwEjMKE5vb0ztu', 'user@user.com', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_category`);

--
-- Indices de la tabla `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id_comment`),
  ADD KEY `comment_fk_news` (`id_new_fk`);

--
-- Indices de la tabla `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id_news`),
  ADD KEY `fk` (`category_pk`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `comments`
--
ALTER TABLE `comments`
  MODIFY `id_comment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT de la tabla `news`
--
ALTER TABLE `news`
  MODIFY `id_news` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comment_fk_news` FOREIGN KEY (`id_new_fk`) REFERENCES `news` (`id_news`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `foreign_id_category` FOREIGN KEY (`category_pk`) REFERENCES `categories` (`id_category`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
