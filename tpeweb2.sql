-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-10-2023 a las 00:48:32
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tpeweb2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `desarrolladores`
--

CREATE TABLE `desarrolladores` (
  `id_desarrollador` int(11) NOT NULL,
  `company` varchar(100) NOT NULL,
  `texto` text NOT NULL,
  `imagen` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `desarrolladores`
--

INSERT INTO `desarrolladores` (`id_desarrollador`, `company`, `texto`, `imagen`) VALUES
(1, 'capcom', 'A finales de los años 1980, Yoshiki Okamoto se unió a Capcom tras abandonar Nintendo. En 1987 Capcom comercializó el juego Street Fighter y ese mismo año también publicó el juego de plataformas Mega Man (Rockman en Japón) para la consola Nintendo Entertainment System. Final Fight, un beat\'em up, fue publicado en 1989. En 1991, Street Fighter II, de Yoshiki Okamoto, llegó a los salones recreativos. Resident Evil (Biohazard en Japón), un exitoso terror y supervivencia, se estrenó para PlayStation en 1996.\r\n\r\nDos empresas desarrolladoras dependientes de Capcom, Clover Studio y Flagship, también han creado exitosos juegos, incluyendo la serie Viewtiful Joe y cuatro juegos de The Legend of Zelda realizados bajo la supervisión de Shigeru Miyamoto. Oracle of Ages, Oracle of Seasons, A Link to the Past & Four Swords y The Legend of Zelda The Minish Cap.', 'images/company/capcom2.jpg'),
(2, 'konami', 'El 19 de marzo de 1973, Kozuki transformó el buen negocio a Konami Industry Co. Ltd. y comenzó a trabajar en la manufactura de máquinas arcade. Su primera máquina de juegos fue creada en 1978. La empresa comenzó a tener éxito con juegos tales como Frogger, Scramble, y Super Cobra.\r\n\r\nEntre 1982 y 1985, Konami desarrolló y vendió juegos para PC produciendo juegos para el ordenador MSX y la consola Family Computer (\"Famicom\") de Nintendo. Konami de América Inc. fue establecida en Torrance, California en 1982 pero desplazada a Illinois en 1984. Además en 1984, Konami se expandió al Reino Unido estableciendo Konami Limited.', 'images/company/konami.jpg'),
(3, 'bandai', 'En 1947, Naoharu Yamashina trabajaba para la compañía de su cuñado, un mayorista textil. A medida que ese segmento del mercado se debilitaba en ese momento, se dio cuenta del potencial de la industria de los juguetes. Con éxito convenció a su cuñado para que dedicara una parte de las actividades de la compañía en esa industria y se encargara de ello.2​ Paso a paso, Yamashina desarrolló un imperio de distribución de juguetes dentro de la empresa. En julio de 1950, Yamashina tomó el control total del negocio de distribución de juguetes, lo renombró y fundó la compañía Bandai-ya cuyo nombre finalmente se acortó a Bandai en 1961.3​4​\r\n\r\nEn su primer año, Bandai produjo su primer juego interno, el Rhythm Ball,1​ y su primer juguete metálico, una reproducción del B-26.4​ También comenzó la exportación de juguetes. ', 'images/company/bandai.jpg'),
(4, 'riot', 'Los fundadores de Riot Games, Brandon \"Ryze\" Beck y Marc \"Tryndamere\" Merrill, se conocieron mientras eran estudiantes de negocios y compañeros de habitación en la Universidad del Sur de California, donde se hicieron amigos gracias a los videojuegos.2​ Beck y Merrill creían que muchos desarrolladores se movian de juego en juego demasiado rápido, y pensaban que el éxito de Defense of the Ancients indicaba que los juegos podían ser monetizados y apoyarlos a largo plazo.2​3​ También se inspiraron en los diseñadores de videojuegos asiáticos que cobraban por beneficios adicionales.4​\r\n\r\nBeck y Merrill buscaron financiación en sus familias e inversores ángeles, recaudando 1,5 millones de dólares para lanzar su empresa.', 'images/company/riot.jpg'),
(5, 'naughtydog', 'Hay muchos estudios ligados a una saga o un juego en concreto porque fue aquel pelotazo el que dio a conocer la desarrolladora al gran público. Naughty Dog para una gran mayoría de jugadores se asocia a Crash Bandicoot, o quizás Uncharted en el caso de las generaciones más jóvenes, pero el equipo tenía un historial de más de una década antes de la aparición del famoso marsupial.\r\nCon un inicio plagado de juegos prácticamente desconocidos, la compañía fundada por Andy Gavin y Jason Rubin ha mantenido un crecimiento constante con el paso de cada generación hasta convertirse en la actualidad en uno de los equipos referencia dentro de PlayStation y toda la industria. De trabajar en Apple II y 3DO a liderar la creación de herramientas que utilizan Worldwide Studios y las third party, de clonar Punch-Out!! en ratos libres a crear algunas de las mascotas y personajes más importantes del mercado, la historia de Naughty Dog es casi tan apasionante como sus juegos.', 'images/company/naughtydog.jpg'),
(6, 'compañia para borrar', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel egestas dolor, nec dignissim metus. Donec augue elit, rhoncus ac sodales id, porttitor vitae est. Donec laoreet rutrum libero sed pharetra.\r\n\r\n Donec vel egestas dolor, nec dignissim metus. Donec augue elit, rhoncus ac sodales id, porttitor vitae est. Donec laoreet rutrum libero sed pharetra. Duis a arcu convallis, gravida purus eget, mollis diam.', 'images/company/borrar.jpg'),
(7, 'zuzuki', 'desde china', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juegos`
--

CREATE TABLE `juegos` (
  `id` int(11) NOT NULL,
  `juego` varchar(100) NOT NULL,
  `texto` text NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `desarrollador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `juegos`
--

INSERT INTO `juegos` (`id`, `juego`, `texto`, `imagen`, `desarrollador`) VALUES
(27, 'Resident Evil 4 Remake', 'La nueva versión de Resident Evil 4 presenta una jugabilidad similar a su inmediato predecesor Resident Evil 3 (videojuego de 2020), siendo que el nuevo videojuego se lleva a cabo en una perspectiva en tercera persona con la cámara sobre el hombro muy similar a la cámara de Resident Evil 2 (videojuego de 2019); los lugares del videojuego original también han sido rediseñados, alterando o reimaginando parcialmente varias zonas, y agregando nuevos lugares, utilizando un sistema de mapa similar pero más detallado. También se mantiene el sistema de curación por hierbas y el estado de salud original, el sistema de administración de recursos en maletín se mantiene al igual que la mayoría de objetos y recursos, ajustados en un sistema de inventario idéntico al ya visto en Resident Evil Village y Resident Evil 4.4​\r\n\r\nEl nuevo videojuego utiliza el motor de juego de Capcom, llamado RE Engine (Motor RE) originalmente utilizado en el videojuego Resident Evil 7, además de ello se alteró la mecánica de pelea para incluir más elementos de combate cuerpo a cuerpo, el comportamiento de los enemigos ha sido actualizado, siendo los ganados capaces de actuar inteligentemente. Además, con el nuevo motor de juego, el daño de los enemigos se vuelve acumulativo y progresivo, siendo afectados visualmente por los distintos golpes y disparos del jugador.', 'images/games/residentevil4.jpg', 1),
(29, 'Monster Hunter: World', 'Monster Hunter: World es un videojuego de rol y acción, ambientado en un entorno de mundo abierto, y jugado desde una perspectiva en tercera persona. Al igual que en los juegos anteriores de la serie, el jugador toma el papel de un \"Cazador\" que tiene la tarea de la \"Comisión de Investigación\", para perseguir y matar (o capturar) a grandes monstruos, que deambulan fuera de su base central de Astera para que estudien.5​ El personaje del jugador no tiene ningún atributo intrínseco, sino que está determinado por el equipo con el que está equipado el personaje. Esto incluye un arma que proviene de uno de los catorce arquetipos (como espada larga, arco o martillo), que luego define los tipos de movimientos de combate y las habilidades de las que el jugador se puede ver beneficiado. El jugador también puede equiparse con una armadura (a este equipamiento se le pueden añadir adornos que son objetos que aportan distintas habilidades) que tienen beneficios o habilidades base y que se pueden potenciar con adornos y ciguas, que son elementos de equipo con la misma función de los adornos a excepción de que solo es posible equiparse con una cigua a la vez. Mientras que algunos equipos básicos se pueden comprar con dinero del juego, la mayoría de los equipos se construyen a partir de materiales obtenidos al matar o atrapar monstruos, en recompensas por completar misiones, o artículos recolectados en el campo. Esto crea un bucle central de la jugabilidad que tiene el jugador para luchar contra los monstruos a los que pueden vencer, para obtener el botín correcto para crear armas y armaduras mejoradas que les permitan enfrentarse a monstruos más poderosos y la posibilidad de contar con un equipo aún mejor.', 'images/games/monsterhunter.jpg\r\n', 1),
(30, 'E football', 'eFootball (versión actual: eFootball 2024) es un videojuego de simulación de fútbol desarrollado por Konami Digital Entertainment y publicado por Konami. El juego es la 21ª entrega de la serie, y fue lanzado para Microsoft Windows, PlayStation 4, PlayStation 5, Xbox One, Xbox Series X y Series S el 30 de septiembre de 2021, y para Android e iOS el 2 de junio de 2022.4​5​6​7​\r\n\r\nEl juego es el final de la serie Pro Evolution Soccer, y cambiará su nombre, debido a que se actualizará gratis anualmente. Será un videojuego gratuito con microtransacciones, actualizaciones futuras y contenidos descargables de pago opcionales,para poder tener más funciones y modos de juego offline como la Liga Máster.​El videojuego tendrá juego cruzado entre las distintas plataformas.', 'images/games/efootball.jpg', 2),
(31, 'Silent Hill:Shattered Memories', 'Durante el desarrollo, el jugador será observado y evaluado por el juego, y sus acciones tendrán un efecto en varios aspectos de este, incluidos el carácter, actitudes y prendas de vestir del personaje. Diferentes áreas pueden ser desbloqueadas y los enemigos que se encuentran en Silent Hill también pueden cambiar su apariencia.\r\n\r\nEsta vez Harry sólo está equipado con un teléfono móvil, con el cual puede ver todo el mapa con una interfaz GPS, recibir SMS y mensajes de voz, tomar fotografías, recibir y hacer llamadas. El jugador puede hacer uso del zoom de la cámara.\r\n\r\nEn la versión de Wii, el Wii Remote se utiliza para resolver rompecabezas y para controlar elementos como la linterna, el teléfono celular con GPS y la cámara.\r\n\r\nSegún el productor Tomm Hulett, la forma en la que se cuenta la historia dependerá de cómo interactúa el jugador con el juego. Además, ya que la lucha contra los enemigos se ha eliminado de la partida a favor de evitar los monstruos, no disponemos de armas.', 'images/games/silenthill.jpg', 2),
(32, 'Metal Gear Solid V: The Phantom Pain\r\n', 'El videojuego incorpora un sistema de mundo abierto, en el cual el jugador tiene la posibilidad de realizar misiones de forma no-lineal, con un total de 50 misiones principales y 157 secundarias.23​ Para poder cumplirlas él debe de recolectar los recursos necesarios para poder fabricar armas, municiones e implementación diversa dependiendo su elección, como así también la posibilidad de capturar soldados que se encuentran en los escenarios con la idea de reclutarlos para su \'Base Madre\'.\r\n\r\nEl jugador posee la libertad de efectuar las misiones utilizando técnicas de sigilo con el objetivo de poder superar los obstáculos que propone el videojuego en cada una de las misiones, pudiendo combinar esta con técnicas de combate, pudiendo ser estas: Combate a cuerpo cercano, utilizando armas no letales, como también letales.\r\n\r\nEl jugador debe interactuar con su \'Base Madre\' la cual le permite almacenar diversos tipos de recursos, como así también de soldados que voluntariamente se enrolan o bien los que son extraídos por el jugador desde los escenarios. Estos pueden ser asignados a los diferentes departamentos que se encuentran en esta Base, ya sea de forma automática o sea por acción del jugador.\r\n', 'images/games/metalgearsolid.jpg', 2),
(33, 'Naruto Shippuden: Ultimate Ninja Storm 4', 'La jugabilidad del Ultimate Ninja Storm 4 es similar a la de los juegos anteriores de la serie, en los que los jugadores luchan entre sí en escenarios 3D. Una característica recurrente, omitida desde el Ultimate Ninja Storm original, es la capacidad de correr por las paredes; los jugadores pueden luchar en los lados (paredes) de cada escenario. Un cambio importante en la función es la capacidad de tener un personaje en la pared y el otro en el campo; el segundo jugador también puede moverse por la pared para mantener la batalla fluida y el sistema bajo control.1​ El juego tiene la mayor cantidad de luchadores en la historia de la serie. Su lista incluye 106 luchadores del universo de Naruto, incluidos duplicados de los mismos personajes, como Naruto (Parte 1) y Naruto (Modo Sabio de los Seis Caminos).2​ También incluye personajes de las películas The Last: Naruto the Movie (2014) y Boruto: Naruto the Movie (2015).3​ Hay un total de más de cien personajes en el juego.4​\r\n\r\nSe eliminó la opción de seleccionar uno de los tres tipos de lucha; cuya opción se introdujo en Naruto Shippūden: Ultimate Ninja Storm Revolution, restaurando el resto de los ataques más fuertes de la serie como los jutsus definitivos y el sistema de despertar que mejora las capacidades de lucha del luchador por un tiempo limitado', 'images/games/naruto.jpg', 3),
(36, 'Dark Souls 3', 'El sistema de armadura y estabilidad (estadística que permite resistir golpes sin perder el balance) ha sido completamente cambiado en comparación de los otros 2 juegos, reduciendo sus capacidades defensivas y volviéndola más efectiva al tomar roles ofensivos en peleas, lo que resulta en una jugabilidad similar a Bloodborne.\r\n\r\nLos gráficos y diseño artístico son notablemente mejores que los anteriores juegos, y cada jefe tiene una melodía de fondo diferente.', 'images/games/darksouls.jpg', 3),
(37, 'Dragon ball Z Kakarot', 'Kakarot es principalmente un juego de rol de acción con elementos de juegos de lucha. El jugador puede luchar contra oponentes y realizar actividades como pescar, recolectar orbes Z, comer, conducir un auto flotante, entrenar y poner personajes en emblemas del alma. La trama del juego sigue la progresión de la serie de anime, ya que el jugador interactúa con el mundo circundante como los diferentes personajes jugables. Los jugadores pueden explorar el mundo y completar misiones secundarias para progresar en la historia. El juego se divide en cuatro historias: Saiyan Saga, Namek Saga, continúa con Android Saga (donde el jugador adquiere su auto flotante) y Buu Saga.\r\n\r\nLas historias de bonificación se pueden comprar como contenido descargable; incluyendo un recuento de las historias de la Batalla de los Dioses y la Resurrección \'F\' vistas en Dragon Ball Super. ', 'images/games/dragonballz.jpg', 3),
(38, 'League of Legends', 'League of Legends es un juego de arena de batalla multijugador en línea (MOBA) en el que el jugador controla un personaje (\"campeón\") con un conjunto de habilidades únicas desde una perspectiva isométrica.2​3​ A julio de 2022 había más de 150 campeones disponibles para jugar.4​ En el transcurso de una partida, los campeones ganan niveles al acumular puntos de experiencia (XP) al matar enemigos o personajes no jugadores (NPC\'s)5​ Los elementos se pueden adquirir para aumentar la fuerza de los campeones,6​ y se compran con oro, que los jugadores acumulan pasivamente con el tiempo y ganan activamente al derrotar a los súbditos,2​ campeones o estructuras defensivas del equipo contrario.5​6​ En los modos principales de juego los artículos se compran a través de un menú de tienda disponible para los participantes únicamente cuando su campeón está en la base del equipo.2​ Cada partida es única, de modo que los niveles y los elementos comprados no se transfieren de una partida a otra.7​', 'images/games/lol.jpg', 4),
(39, 'Valorant', 'Valorant es un hero shooter en primera persona ambientado en un futuro próximo.1​2​3​4​ Los jugadores asumen el control de agentes, personajes que provienen de una gran cantidad de países y culturas de todo el mundo. En el modo de juego principal, los jugadores se unen al equipo atacante o defensor con cada equipo que tiene cinco jugadores. Los agentes tienen habilidades únicas y usan un sistema económico para comprar sus habilidades y armas. El videojuego tiene una variedad de armas que incluyen pistolas, subfusiles, escopetas, ametralladoras, fusiles de asalto y fusiles de francotirador y makul.5​6​ Cada arma tiene un patrón de retroceso que debe ser controlado por el jugador para poder disparar con precisión. El equipo atacante tiene una bomba, llamada Spike, que necesitan plantar en un sitio. Si el equipo atacante protege con éxito la Spike durante 40 segundos y detona, obtendrán un punto. Si el equipo defensor desactiva con éxito la Spike, o el temporizador de la ronda de 100 segundos expira, el equipo defensor obtiene un punto. Si se eliminan todos los miembros de un equipo, el equipo contrario gana un punto. Después de doce rondas, el equipo atacante cambia al equipo defensor y viceversa. El primer equipo en ganar 13 rondas gana la partida. Exceptuando el tiempo extra, donde deberás conseguir 2 victorias/rondas seguidas.', 'images/games/valorant.jpg', 4),
(40, 'Uncharted 4: El desenlace del ladrón\r\n', 'Uncharted 4: El desenlace del ladrón (en inglés Uncharted 4: A Thief\'s End), es un videojuego de acción-aventura en tercera persona, lanzado el 10 de mayo de 2016, distribuido por Sony Computer Entertainment y desarrollado por Naughty Dog exclusivamente para PlayStation 4.1​ Es la secuela de Uncharted 3: La traición de Drake, y la cuarta entrega de la serie Uncharted. El videojuego fue confirmado con su primer teaser tráiler en noviembre del 2013 y luego fue mostrado en el PlayStation E3 de 2014. En diciembre del mismo año, se mostró el primer gameplay del juego en el evento PlayStation Experience; meses después, en el E3 2015, se presentó una demostración del juego.', 'images/games/uncharted4.jpg', 5),
(41, 'The Last Of Us 2', 'The Last of Us Part II es un videojuego de terror y de acción y aventuras de 2020 desarrollado por Naughty Dog y publicado por Sony Interactive Entertainment para PlayStation 4.1​ Ambientado cinco años después de The Last of Us (2013), el juego se centra en dos personajes jugables en un Estados Unidos post-apocalíptico cuyas vidas se entrelazan: Ellie, que busca venganza después de sufrir una tragedia, y Abby, una soldado que se ve envuelta en un conflicto entre su milicia y un culto religioso. El juego se juega desde la perspectiva de la tercera persona y le permite al jugador luchar contra enemigos humanos e infectados con armas de fuego, armas improvisadas y sigilo.\r\n\r\nEl desarrollo de The Last of Us Part II comenzó en 2014, poco después del lanzamiento de The Last of Us Remastered. Neil Druckmann regresó como director creativo, coescribiendo la historia con Halley Gross. Los temas de venganza y retribución del juego se inspiraron en las experiencias de Druckmann al crecer en Israel. Ashley Johnson repite su papel de Ellie, mientras que Laura Bailey fue elegida como Abby.', 'images/games/thelastofus2.jpg', 5),
(42, 'Crash Bandicoot', 'Crash Bandicoot es un videojuego de plataformas desarrollado por Naughty Dog y publicado por Sony Computer Entertainment para PlayStation en 1996. El jugador controla a Crash, un bandicut mejorado genéticamente creado por el científico loco Doctor Neo Cortex. La trama sigue al bandicut Crash en su intento por rescatar a su novia Tawna, y frustrar los planes del científico Neo Cortex para dominar el mundo. Si bien el título cuenta principalmente con un sistema de perspectiva en tercera persona, algunos de sus niveles muestran ya sea una vista lateral o hacia adelante.\r\n\r\nDespués de aceptar un contrato de publicación de Universal Interactive Studios, los cofundadores de Naughty Dog, Andy Gavin y Jason Rubin, emprendieron un viaje por carretera a través del país desde Boston a Los Ángeles. Durante este tiempo, decidieron crear un juego de plataformas de acción basado en personajes desde una perspectiva tridimensional, los desarrolladores decidieron crear un juego de ese tipo porque les pareció que era lo más popular en ese entonces en los dispositivos arcade o máquinas recreativas.', 'images/games/crash.jpg', 5),
(43, 'Juego Para Borrar', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel egestas dolor, nec dignissim metus. Donec augue elit, rhoncus ac sodales id, porttitor vitae est. Donec laoreet rutrum libero sed pharetra.\r\n\r\n Donec vel egestas dolor, nec dignissim metus. Donec augue elit, rhoncus ac sodales id, porttitor vitae est. Donec laoreet rutrum libero sed pharetra. Duis a arcu convallis, gravida purus eget, mollis diam.', 'images/games/borrar.jpg', 6),
(59, 'mortalcombat', 'combate', '', 4),
(62, 'mateloco', 'elmatelocoooooooo', 'logo.jpg', 3),
(63, 'perito malvado', 'que perro', 'logo.jpg', 3),
(64, 'lala', 'lalala', 'lala.jpg', 3),
(65, 'princesas', 'se cambio de mortalcombat', 'princesas.jpg', 2),
(67, 'perra linda', 'SE MODIFICO???', 'logo.jpg', 3),
(68, 'pa', 'papappa', 'pa.jpg', 2),
(69, 'pepa', 'pepa pig', 'logo.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `mail` varchar(50) NOT NULL,
  `clave` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`mail`, `clave`) VALUES
('webadmin', '$2y$10$K1Qvg9IHlxOW3NzF.HLRfOauEdpkQ24EW1tNi0pABmxbnf7XFppRi');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `desarrolladores`
--
ALTER TABLE `desarrolladores`
  ADD PRIMARY KEY (`id_desarrollador`);

--
-- Indices de la tabla `juegos`
--
ALTER TABLE `juegos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `desarrollador` (`desarrollador`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`mail`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `desarrolladores`
--
ALTER TABLE `desarrolladores`
  MODIFY `id_desarrollador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `juegos`
--
ALTER TABLE `juegos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `juegos`
--
ALTER TABLE `juegos`
  ADD CONSTRAINT `juegos_ibfk_1` FOREIGN KEY (`desarrollador`) REFERENCES `desarrolladores` (`id_desarrollador`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
