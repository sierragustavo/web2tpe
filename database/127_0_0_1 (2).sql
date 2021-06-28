-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-06-2021 a las 22:42:56
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
-- Estructura de tabla para la tabla `news`
--

CREATE TABLE `news` (
  `title` varchar(100) NOT NULL,
  `details` varchar(5000) NOT NULL,
  `category_pk` int(11) NOT NULL,
  `author` varchar(30) NOT NULL,
  `seen` tinyint(1) NOT NULL,
  `id_news` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `news`
--

INSERT INTO `news` (`title`, `details`, `category_pk`, `author`, `seen`, `id_news`) VALUES
('Laporta, en manos de Messi', 'El presidente del Barça se muestra optimista sobre la renovación del 10, pese a que las pérdidas obligan a que sea a la baja, pero es ambiguo con la continuidad de Koeman\r\n\r\n', 18, 'admin', 1, 43),
('Jasikevicius: “Con esta defensa no haremos nada en la final”', 'Calathes sufre un esguince de tobillo y es duda para enfrentarse al Anadolu Efes', 18, 'admin', 1, 45),
('Guardiola y Tuchel juegan al ajedrez', 'El ídolo, al frente del City, enfrenta a su admirador, a cargo del Chelsea, en un duelo de banquillos que comenzó en 2014, en una mesa del café Schumann’s, en Múnich', 18, 'admin', 0, 46),
('Un ‘Batman’ de internet que odia perder', 'Gay Talese, viejo maestro del nuevo periodismo, escribió que lo que las personas dudaban en contar podía decir mucho de ellas. Hugo Arévalo Álvarez-Arenas, emprendedor e inversor detrás de proyectos como ThePowerMBA o Tuenti, está a punto de decir que no le importa perder, por ejemplo, al ajedrez, al pádel o al tenis, algunas de sus aficiones: “Te iba a mentir, pero… sí, sí, soy mal perdedor”. Se reconoce competitivo y su asistenta ejecutiva, Paula Llodrá, ve en él una especie de adicción a la adrenalina asociada a nuevos retos.', 20, 'admin', 0, 47),
('El nuevo presidente de Indra ganará una quinta parte que sus dos principales subordinados', 'Marc Murtra, el nuevo presidente de Indra, ganará cinco veces menos que sus principales subordinados, los dos consejeros delegados que ha nombrado la firma tecnológica para que se ocupen de la gestión de la compañía. Murtra recibirá 550.000 euros al año, frente a los 2,5 millones que ganarán cada uno Ignacio Mataix y Cristina Ruiz, responsables de las divisiones de Transporte y Defensa y Minsait y nombrados consejeros delegados, con carácter solidario.\r\n\r\n', 20, 'admin', 0, 48),
('Adif contratará a 6.170 trabajadores en los próximos cuatro años', 'Adif ha aprobado su Plan Plurianual de Empleo, que prevé ofertar hasta 6.170 plazas de empleo público en el periodo 2021-2025 para atender la creciente demanda del servicio ferroviario con la entrada de competidores de Renfe y las nuevas líneas de Alta Velocidad (AVE) y cubrir las bajas por jubilación.\r\n\r\nEl gestor de infraestructuras ferroviarias tiene actualmente una plantilla en torno a las 11.500 personas, con una media de edad de 54 años, frente a la fuerza laboral de 14.000 trabajadores que tenía en 2020. En estos últimos años se ha producido un alto número de jubilaciones y este ritmo se mantendrá en los próximos ejercicios, ya que casi el 80% de la plantilla tiene 50 años o más.', 20, 'admin', 0, 50),
('Comprar casa por un puñado de bitcoins', 'Por casi 3,5 bitcoins se vende un piso en L’Hospitalet de Llobregat (Barcelona) de 57 metros cuadrados construidos, cuyo valor en euros es de 105.000 (a media tarde del viernes un bitcoin equivalía a 30.332 euros). Por 31 bitcoins se comercializa un chalé en Playa Paraíso, en Tenerife Sur, que cuesta 950.000 euros. Sus propietarios aceptan el pago en monedas digitales: la mayoría en bitcoin, la más popular, y algunos en ether.\r\n\r\nAnuncios como estos pueden encontrarse en portales inmobiliarios y en unas pocas agencias, aunque de momento es un mercado bastante marginal. Lo es porque se trata de operaciones de alto riesgo por la tremenda volatilidad de las criptomonedas. De hecho, hay alguna inmobiliaria como Tomás Casas que esta misma semana ha decidido dejar de admitirlas como medio de pago tras desplomarse el domingo el bitcoin casi un 50% desde su máximo del año.\r\n\r\n', 20, 'admin', 0, 51),
(' Los escalofriantes audios que revelan cómo se planificó el femicidio de Agostina Gisfman', 'Una serie de audios que revelan parte del plan para matar a Agostina Gisfman, la joven de 22 años apuñalada y quemada en la ciudad neuquina de Centenario, llevaron este viernes a que la Justicia ratificara los cargos contra uno de los acusados y extendiera su prisión preventiva.\r\n\r\n\"Estuve tirando unas líneas a ver cómo puedo encontrar a esta persona... como te dije anoche, esto lleva un tiempo, un proceso... Tengo que estar muy seguro, no voy a perder mi libertad, comerme 15 o 20 años por dos pesos con 50, por lo que vos quieras hacer...\", dice Gustavo Chianese (56), en el primer audio incorporado a la causa. Fue enviado el 10 de mayo, cuatro días antes del femicidio.\r\n\r\n', 17, 'admin', 0, 54),
('docpdskc', 'ftyuft', 17, 'admin', 0, 56);

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
(53, 'gus', '$2y$10$4CtZ64qL.XBGO/tNxwdO4.qobkv2ZlpuC2pweH0RDYbTyPKP4aBR6', 'gustavo@asd.com', 0),
(54, 'admin', '$2y$10$aW0dJ/FhaWc/8keX2Rqi4O50jEDhqnbgmjGgVDlSxzWwpY8qY5FlG', 'admin@admin.com', 1),
(55, 'prueba1', '$2y$10$9UbQNAdMzTkFO6ZEEj5OO.SUXizT0X1JypXWnb8ucV29WuJEkp32G', 'prueba1@asd.com', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_category`);

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
-- AUTO_INCREMENT de la tabla `news`
--
ALTER TABLE `news`
  MODIFY `id_news` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `foreign_id_category` FOREIGN KEY (`category_pk`) REFERENCES `categories` (`id_category`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
