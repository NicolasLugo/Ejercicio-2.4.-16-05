-- --------------------------------------------------------
-- Host:                         10.68.0.251
-- Versión del servidor:         5.7.21 - MySQL Community Server (GPL)
-- SO del servidor:              Linux
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para 1605NL
CREATE DATABASE IF NOT EXISTS `1605NL` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `1605NL`;

-- Volcando estructura para tabla 1605NL.Clientes
CREATE TABLE IF NOT EXISTS `Clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `direccion_cliente` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contacto_cliente` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla 1605NL.Clientes: ~0 rows (aproximadamente)
INSERT INTO `Clientes` (`id_cliente`, `nombre_cliente`, `direccion_cliente`, `contacto_cliente`) VALUES
	(1, 'Miguel Zapata', 'Calle falsa 123', '3579512364'),
	(2, 'Matias Zepeda', 'calle verdadera 456', '325697412');

-- Volcando estructura para tabla 1605NL.Cursos
CREATE TABLE IF NOT EXISTS `Cursos` (
  `id_curso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_curso` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla 1605NL.Cursos: ~0 rows (aproximadamente)

-- Volcando estructura para tabla 1605NL.Cursos_estudiantes
CREATE TABLE IF NOT EXISTS `Cursos_estudiantes` (
  `id_curso` int(11) DEFAULT NULL,
  `id_estudiante` int(11) DEFAULT NULL,
  `id_profesor` int(11) DEFAULT NULL,
  KEY `id_curso` (`id_curso`),
  KEY `id_estudiante` (`id_estudiante`),
  KEY `id_profesor` (`id_profesor`),
  CONSTRAINT `Cursos_estudiantes_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `Cursos` (`id_curso`),
  CONSTRAINT `Cursos_estudiantes_ibfk_2` FOREIGN KEY (`id_estudiante`) REFERENCES `Estudiantes` (`id_estudiante`),
  CONSTRAINT `Cursos_estudiantes_ibfk_3` FOREIGN KEY (`id_profesor`) REFERENCES `Profesores` (`id_profesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla 1605NL.Cursos_estudiantes: ~0 rows (aproximadamente)

-- Volcando estructura para tabla 1605NL.Detalle_Pedidos
CREATE TABLE IF NOT EXISTS `Detalle_Pedidos` (
  `id_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) DEFAULT NULL,
  `id_articulo` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_articulo` (`id_articulo`),
  CONSTRAINT `Detalle_Pedidos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `Pedidos` (`id_pedido`),
  CONSTRAINT `Detalle_Pedidos_ibfk_2` FOREIGN KEY (`id_articulo`) REFERENCES `Menu` (`id_articulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla 1605NL.Detalle_Pedidos: ~0 rows (aproximadamente)

-- Volcando estructura para tabla 1605NL.Empleados
CREATE TABLE IF NOT EXISTS `Empleados` (
  `id_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `rut_empleado` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `nombre_empleado` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cargo_empleado` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contacto_empleado` int(11) DEFAULT NULL,
  `correo_empleado` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla 1605NL.Empleados: ~0 rows (aproximadamente)
INSERT INTO `Empleados` (`id_empleado`, `rut_empleado`, `nombre_empleado`, `cargo_empleado`, `contacto_empleado`, `correo_empleado`) VALUES
	(1, '123456789', 'Nicolás Lugo', 'Cocinero', 987654321, 'abc@gmail.com'),
	(2, '365987412', 'Mario Zepeda', 'Mesero', 325697412, 'def@gmail.com');

-- Volcando estructura para tabla 1605NL.Estudiantes
CREATE TABLE IF NOT EXISTS `Estudiantes` (
  `id_estudiante` int(11) NOT NULL AUTO_INCREMENT,
  `rut_estudiante` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `nombre_estudiante` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nacionalidad` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_estudiante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla 1605NL.Estudiantes: ~0 rows (aproximadamente)

-- Volcando estructura para tabla 1605NL.Inventario
CREATE TABLE IF NOT EXISTS `Inventario` (
  `id_articulo_inv` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_articulo_inv` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cantidad_en_stock` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_articulo_inv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla 1605NL.Inventario: ~0 rows (aproximadamente)

-- Volcando estructura para tabla 1605NL.Menu
CREATE TABLE IF NOT EXISTS `Menu` (
  `id_articulo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_articulo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `precio` int(11) NOT NULL,
  PRIMARY KEY (`id_articulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla 1605NL.Menu: ~0 rows (aproximadamente)

-- Volcando estructura para tabla 1605NL.Pedidos
CREATE TABLE IF NOT EXISTS `Pedidos` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `Pedidos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `Clientes` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla 1605NL.Pedidos: ~0 rows (aproximadamente)

-- Volcando estructura para tabla 1605NL.Profesores
CREATE TABLE IF NOT EXISTS `Profesores` (
  `id_profesor` int(11) NOT NULL AUTO_INCREMENT,
  `rut_profesor` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `nombre_profesor` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_profesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla 1605NL.Profesores: ~0 rows (aproximadamente)

-- Volcando estructura para tabla 1605NL.Sucursales
CREATE TABLE IF NOT EXISTS `Sucursales` (
  `id_sucursal` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_sucursal` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `contacto_sucursal` int(11) DEFAULT NULL,
  `direccion_sucursal` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla 1605NL.Sucursales: ~0 rows (aproximadamente)
INSERT INTO `Sucursales` (`id_sucursal`, `nombre_sucursal`, `contacto_sucursal`, `direccion_sucursal`) VALUES
	(1, 'Centro', 35795124, 'calle falsa 789'),
	(2, 'Sur', 325697412, 'calle falsa 3565');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
