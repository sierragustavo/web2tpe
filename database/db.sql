-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-05-2021 a las 01:13:19
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
CREATE DATABASE IF NOT EXISTS `db_tpe` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_tpe`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `news`
--

CREATE TABLE `news` (
  `title` varchar(30) NOT NULL,
  `details` varchar(5000) NOT NULL,
  `author` varchar(30) NOT NULL,
  `seen` tinyint(1) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `news`
--

INSERT INTO `news` (`title`, `details`, `author`, `seen`, `id`) VALUES
('drtydyrt', 'trdyd', 'drytdtry', 1, 16),
('drtdrtyd', 'drytdrtyd', 'iyugiuybiuybiuyb', 1, 17),
('sersyesys', 'tuftfutyjf', 'buyhbiyubuy', 1, 19),
('hola', 'hola', 'hola', 0, 20),
('hola', 'hola', 'hola', 1, 21),
('hola', 'hola', 'hola', 1, 22),
('hola', 'hola', 'hola', 1, 23);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`) VALUES
(3, 'asdasda', '$2y$10$7aZ0iPnvs.cUyWruIyfOBO6ouxmyzmNvtPYO1HLvVkNxpd/fyKczu', 'sadasdasdad'),
(4, 'fytftyfytf', '$2y$10$y5oxhtVOR7/r..9uHKuIqOak86eiSV.GDmshjfSTRYZDTscXLp02S', 'ytfytfyt'),
(5, 'fytftyfytf', '$2y$10$IZ3ucLm6oPO9Qkra9d3BEuJOee3vg2bSLhR844q4WmcvSCf6Vpu2i', 'ytfytfyt'),
(6, 'jiofjvoi', '$2y$10$Bmile5/yT43.XbW1v3f1NOzuLNNIKpGZLn5eZMPqL2VoVeztx5hIm', 'cjdsiojcosdicj'),
(7, 'guyguy', '$2y$10$x6q8yB4yGxnw7TSVF.36e.hJ2DvP9EX1yznlgk9RRRHHb6Xj/gOom', 'chdsuihcidsu'),
(8, 'guyguy', '$2y$10$tYcdyOYsYELh2wW2l8mkk.8dEwOAqI8ailFSW/ZkWWm.8NQi1L81S', 'chdsuihcidsu'),
(9, 'guyguy', '$2y$10$HIDaNi.um1eQhiAPhRoT4.tscOSKKcDA3AdK939p5MSjJf75tyi9W', 'chdsuihcidsu'),
(10, 'sersers', '$2y$10$8pi9TVIkVknCAYcQjANrwOpL.OFKVLfYSfbENv40DNxzPGAnoFueq', 'dyrtd'),
(11, 'sersers', '$2y$10$MWAy/bb8cmezypUoQxB0P.0bj8FViFJU5bWT8RmYaQ9zpjrUYGmQi', 'dyrtd'),
(12, 'sersers', '$2y$10$c01Ti.3fYegMuEnlDQhiBu72LW1yJWAoI4dQcKxdE8aqFt4LZxADO', 'dyrtd'),
(13, 'areareat', '$2y$10$8e24lTa.djQcV6a3nbcQWebPqAfhbhLxuPNaitd35TCaLsm4lu60.', 'yrtdrytd'),
(14, 'areareat', '$2y$10$ll5vLXMK4qgaJtmynqFUR.um5/L/VVMprd96DuBynFaWNrMoRT6c2', 'yrtdrytd'),
(15, 'areareat', '$2y$10$mbZsaevWzjeKJB.aYwQNVO6L99xk6klCI2KYymCoWHaXk6xljcrPm', 'yrtdrytd'),
(16, 'areareat', '$2y$10$fITd7AIRADuwrgKuYJkdu..mZ9sIYa6lELg7O7cSzMjxmovYU6wGW', 'yrtdrytd'),
(17, 'duytdytrdy', '$2y$10$rNcsy6WfYjLHR9d6qhGJvuXJIB8ZX/beP6u6eIStsx7y0TIOHQXNa', 'dyrdyrtdy'),
(18, 'duytdytrdy', '$2y$10$u.iFnY6KFTDdk33Mw8Pn1uAFKWo.rL4HYMA6latU.Xs4OznZBWM.a', 'dyrdyrtdy'),
(19, 'duytdytrdy', '$2y$10$qk59VFPE9R6vpSPwSGRU4uBUmiH5a07gFcFDF/LIBgytrPW29OzdG', 'dyrdyrtdy'),
(20, 'duytdytrdy', '$2y$10$XxXCdU5nRB54amqc/0lK5OSSCEaWmf4bR2pW9wSLJCH7cMpknJBKy', 'dyrdyrtdy'),
(21, 'gustavito', '$2y$10$PqCvy1E97XvbJOpGYQmE.ujVH8Dwoy8Z2S9/l4KiCXLCvG7HMX77G', 'jeje@asd.com'),
(22, 'gustavito', '$2y$10$ooO3vzguRfHdGb8L8DVJ8OamZIw94wuzy5iqbkAFDlQzX8jPuLwmG', 'jeje@asd.com'),
(23, 'jeje', '$2y$10$ENERZh7w95wHImyBkHz1R.H3kgXsbDT05a0ppvFNTrH8NpfLcz5DK', 'jejejejejeje'),
(24, 'jeje', '$2y$10$7EJfV1RJfY1BUDV2eotLqeFLsHwST.5zDcO4LdKQIrhzIoibS1RZa', 'jejejejejeje'),
(25, 'asddsa', '$2y$10$pfiY/W4C3IHZFxJSBN9XI.ROrXvvS0DkdHvAMKonQ.O298HNgLrW2', 'dsaasddsa'),
(26, 'asdaweraxd', '$2y$10$8LJzZOirxT9SGqU/ZmzpY.G0nrX6jMS2aqh6bJXGhe40QquJtVRzq', 'cyrtcycy'),
(27, 'asd', '$2y$10$VDgC.cFsMV6ixmtDGipLS.TDdktC6cNydD6Hm24w3ofMauvUFuPdK', 'dsa'),
(28, 'prueba1', '$2y$10$2fHEz.PY1XvIPDa6uMaDm.wp01p19v34xbkMmFfaVfQHR3Xrcg4/S', 'asd'),
(29, 'probando', '$2y$10$6Ps1XTS4naoNJko4khddPec/QMfGKKe4KANRpthP2LbC8nsAsZ32a', 'probando');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
