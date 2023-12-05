CREATE TABLE `Equipo` (
  `id_equipo` int(11) NOT NULL,
  `nombre_equipo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Equipo`
--

INSERT INTO `Equipo` (`id_equipo`, `nombre_equipo`) VALUES
(9, 'Leon'),
(19, 'test'),
(21, 'America'),
(29, 'Toluca'),
(31, 'Cruz Azul');

--
-- Disparadores `Equipo`
--
DELIMITER $$
CREATE TRIGGER `equipo_AI` AFTER INSERT ON `Equipo` FOR EACH ROW INSERT INTO reg_equipo (id_equipo, nombre_equipo, registro) VALUES 
(NEW.id_equipo, new.nombre_equipo, now())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EstadisticasEquipo`
--

CREATE TABLE `EstadisticasEquipo` (
  `id_estadisticasEquipo` int(11) NOT NULL,
  `id_equipo` int(11) DEFAULT NULL,
  `resultados_partidos` varchar(100) DEFAULT NULL,
  `posesion_balón` float DEFAULT NULL,
  `eficacia_tiros` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EstadisticasJugadores`
--

CREATE TABLE `EstadisticasJugadores` (
  `id_estadisticasJugadores` int(11) NOT NULL,
  `id_jugador` int(11) DEFAULT NULL,
  `goles` int(11) DEFAULT NULL,
  `asistencias` int(11) DEFAULT NULL,
  `tarjetas_amarillas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `HistorialPartidos`
--

CREATE TABLE `HistorialPartidos` (
  `id_partido` int(11) NOT NULL,
  `id_equipo_local` int(11) DEFAULT NULL,
  `id_equipo_visitante` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `resultado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Jugadores`
--

CREATE TABLE `Jugadores` (
  `id_jugador` int(11) NOT NULL,
  `id_equipo` int(11) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido_paterno` varchar(50) DEFAULT NULL,
  `apellido_materno` varchar(50) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `estatura` decimal(10,2) DEFAULT NULL,
  `posicion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `LesionesJugadores`
--

CREATE TABLE `LesionesJugadores` (
  `id_lesion` int(11) NOT NULL,
  `id_jugador` int(11) DEFAULT NULL,
  `tipo_lesion` varchar(100) DEFAULT NULL,
  `gravedad` varchar(50) DEFAULT NULL,
  `tiempo_recuperacion_estimado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PlanificacionEntrenamientos`
--

CREATE TABLE `PlanificacionEntrenamientos` (
  `id_entrenamiento` int(11) NOT NULL,
  `id_equipo` int(11) DEFAULT NULL,
  `fecha_entrenamiento` date DEFAULT NULL,
  `rendimiento_fisico` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PresupuestoEquipo`
--

CREATE TABLE `PresupuestoEquipo` (
  `id_presupuesto` int(11) NOT NULL,
  `id_equipo` int(11) DEFAULT NULL,
  `gastos_salarios` float DEFAULT NULL,
  `gastos_instalaciones` float DEFAULT NULL,
  `gastos_equipos_medicos` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reg_equipo`
--

CREATE TABLE `reg_equipo` (
  `id_equipo` int(11) DEFAULT NULL,
  `nombre_equipo` varchar(50) DEFAULT NULL,
  `registro` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reg_equipo`
--

INSERT INTO `reg_equipo` (`id_equipo`, `nombre_equipo`, `registro`) VALUES
(17, 'hola mundo dos', '2023-11-07 07:02:05'),
(18, 'hdhd', '2023-11-07 09:13:04'),
(19, 'asddiodiodoisd', '2023-11-07 09:22:49'),
(20, 'test', '2023-11-07 09:34:27'),
(21, 'test2', '2023-11-07 12:22:24'),
(22, 'Pumas', '2023-11-07 12:51:22'),
(23, 'America', '2023-11-07 12:52:03'),
(29, 'Toluca', '2023-11-08 09:28:20'),
(31, 'Cruz Azul', '2023-11-08 10:58:45');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Equipo`
--
ALTER TABLE `Equipo`
  ADD PRIMARY KEY (`id_equipo`);

--
-- Indices de la tabla `EstadisticasEquipo`
--
ALTER TABLE `EstadisticasEquipo`
  ADD PRIMARY KEY (`id_estadisticasEquipo`),
  ADD KEY `id_equipo` (`id_equipo`);

--
-- Indices de la tabla `EstadisticasJugadores`
--
ALTER TABLE `EstadisticasJugadores`
  ADD PRIMARY KEY (`id_estadisticasJugadores`),
  ADD KEY `id_jugador` (`id_jugador`);

--
-- Indices de la tabla `HistorialPartidos`
--
ALTER TABLE `HistorialPartidos`
  ADD PRIMARY KEY (`id_partido`),
  ADD KEY `id_equipo_local` (`id_equipo_local`),
  ADD KEY `id_equipo_visitante` (`id_equipo_visitante`);

--
-- Indices de la tabla `Jugadores`
--
ALTER TABLE `Jugadores`
  ADD PRIMARY KEY (`id_jugador`),
  ADD KEY `id_equipo` (`id_equipo`);

--
-- Indices de la tabla `LesionesJugadores`
--
ALTER TABLE `LesionesJugadores`
  ADD PRIMARY KEY (`id_lesion`),
  ADD KEY `id_jugador` (`id_jugador`);

--
-- Indices de la tabla `PlanificacionEntrenamientos`
--
ALTER TABLE `PlanificacionEntrenamientos`
  ADD PRIMARY KEY (`id_entrenamiento`),
  ADD KEY `id_equipo` (`id_equipo`);

--
-- Indices de la tabla `PresupuestoEquipo`
--
ALTER TABLE `PresupuestoEquipo`
  ADD PRIMARY KEY (`id_presupuesto`),
  ADD KEY `id_equipo` (`id_equipo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Equipo`
--
ALTER TABLE `Equipo`
  MODIFY `id_equipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `EstadisticasEquipo`
--
ALTER TABLE `EstadisticasEquipo`
  MODIFY `id_estadisticasEquipo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `EstadisticasJugadores`
--
ALTER TABLE `EstadisticasJugadores`
  MODIFY `id_estadisticasJugadores` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `HistorialPartidos`
--
ALTER TABLE `HistorialPartidos`
  MODIFY `id_partido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Jugadores`
--
ALTER TABLE `Jugadores`
  MODIFY `id_jugador` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `LesionesJugadores`
--
ALTER TABLE `LesionesJugadores`
  MODIFY `id_lesion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `PlanificacionEntrenamientos`
--
ALTER TABLE `PlanificacionEntrenamientos`
  MODIFY `id_entrenamiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `PresupuestoEquipo`
--
ALTER TABLE `PresupuestoEquipo`
  MODIFY `id_presupuesto` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `EstadisticasEquipo`
--
ALTER TABLE `EstadisticasEquipo`
  ADD CONSTRAINT `estadisticasequipo_ibfk_1` FOREIGN KEY (`id_equipo`) REFERENCES `Equipo` (`id_equipo`);

--
-- Filtros para la tabla `EstadisticasJugadores`
--
ALTER TABLE `EstadisticasJugadores`
  ADD CONSTRAINT `estadisticasjugadores_ibfk_1` FOREIGN KEY (`id_jugador`) REFERENCES `Jugadores` (`id_jugador`);

--
-- Filtros para la tabla `HistorialPartidos`
--
ALTER TABLE `HistorialPartidos`
  ADD CONSTRAINT `historialpartidos_ibfk_1` FOREIGN KEY (`id_equipo_local`) REFERENCES `Equipo` (`id_equipo`),
  ADD CONSTRAINT `historialpartidos_ibfk_2` FOREIGN KEY (`id_equipo_visitante`) REFERENCES `Equipo` (`id_equipo`);

--
-- Filtros para la tabla `Jugadores`
--
ALTER TABLE `Jugadores`
  ADD CONSTRAINT `jugadores_ibfk_1` FOREIGN KEY (`id_equipo`) REFERENCES `Equipo` (`id_equipo`);

--
-- Filtros para la tabla `LesionesJugadores`
--
ALTER TABLE `LesionesJugadores`
  ADD CONSTRAINT `lesionesjugadores_ibfk_1` FOREIGN KEY (`id_jugador`) REFERENCES `Jugadores` (`id_jugador`);

--
-- Filtros para la tabla `PlanificacionEntrenamientos`
--
ALTER TABLE `PlanificacionEntrenamientos`
  ADD CONSTRAINT `planificacionentrenamientos_ibfk_1` FOREIGN KEY (`id_equipo`) REFERENCES `Equipo` (`id_equipo`);

--
-- Filtros para la tabla `PresupuestoEquipo`
--
ALTER TABLE `PresupuestoEquipo`
  ADD CONSTRAINT `presupuestoequipo_ibfk_1` FOREIGN KEY (`id_equipo`) REFERENCES `Equipo` (`id_equipo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
