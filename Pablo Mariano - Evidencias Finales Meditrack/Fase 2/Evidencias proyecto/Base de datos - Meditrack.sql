-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: mysql:3306
-- Tiempo de generación: 11-07-2025 a las 22:51:49
-- Versión del servidor: 8.0.32
-- Versión de PHP: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `laravel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administraciones`
--

CREATE TABLE `administraciones` (
  `id` bigint UNSIGNED NOT NULL,
  `medicamento_tratamiento_id` bigint UNSIGNED NOT NULL,
  `horario_programado_id` bigint UNSIGNED DEFAULT NULL COMMENT 'NULL para PRN',
  `paciente_id` bigint UNSIGNED NOT NULL,
  `cuidador_usuario_id` bigint UNSIGNED DEFAULT NULL,
  `fecha_hora_programada` timestamp NULL DEFAULT NULL COMMENT 'NULL para PRN',
  `fecha_hora_administrada` timestamp NULL DEFAULT NULL,
  `dosis_administrada` decimal(10,3) NOT NULL,
  `estado` enum('Pendiente','Administrada','Omitida','Tardía') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pendiente',
  `es_dentro_ventana_tolerancia` tinyint(1) NOT NULL DEFAULT '1',
  `minutos_diferencia` int DEFAULT NULL COMMENT 'Diferencia respecto al horario programado',
  `minutos_adelanto` int DEFAULT NULL COMMENT 'Minutos de adelanto (positivo si antes de tiempo)',
  `minutos_retraso` int DEFAULT NULL COMMENT 'Minutos de retraso (positivo si después de tiempo)',
  `score_puntualidad` decimal(5,2) DEFAULT NULL COMMENT 'Score de puntualidad 0-100',
  `categoria_temporal` enum('muy_temprano','temprano','puntual','tardio','muy_tardio') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sintoma_reportado_id` bigint UNSIGNED DEFAULT NULL COMMENT 'Síntoma que motivó la administración PRN',
  `intensidad_sintoma` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Escala del síntoma: leve, moderado, severo o valor numérico',
  `criterio_cumplido` text COLLATE utf8mb4_unicode_ci COMMENT 'Descripción del criterio cumplido para PRN',
  `observaciones` text COLLATE utf8mb4_unicode_ci,
  `efectos_adversos` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `administraciones`
--

INSERT INTO `administraciones` (`id`, `medicamento_tratamiento_id`, `horario_programado_id`, `paciente_id`, `cuidador_usuario_id`, `fecha_hora_programada`, `fecha_hora_administrada`, `dosis_administrada`, `estado`, `es_dentro_ventana_tolerancia`, `minutos_diferencia`, `minutos_adelanto`, `minutos_retraso`, `score_puntualidad`, `categoria_temporal`, `sintoma_reportado_id`, `intensidad_sintoma`, `criterio_cumplido`, `observaciones`, `efectos_adversos`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 3, '2025-07-08 08:00:00', '2025-07-08 07:56:00', 50.000, 'Administrada', 1, -4, 4, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Administrado en horario exacto', NULL, '2025-07-08 07:56:00', '2025-07-08 07:56:00'),
(2, 2, 2, 1, 3, '2025-07-08 08:00:00', '2025-07-08 08:16:00', 850.000, 'Administrada', 1, 16, 0, 16, 95.10, 'tardio', NULL, NULL, NULL, 'Olvido temporal, recordado posteriormente', NULL, '2025-07-08 08:16:00', '2025-07-08 08:16:00'),
(3, 2, 3, 1, 3, '2025-07-08 20:00:00', '2025-07-08 19:59:00', 850.000, 'Administrada', 1, -1, 1, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Administrado en horario exacto', NULL, '2025-07-08 19:59:00', '2025-07-08 19:59:00'),
(4, 5, 8, 1, NULL, '2025-07-08 08:00:00', NULL, 0.000, 'Omitida', 0, NULL, 0, 0, 0.00, NULL, NULL, NULL, NULL, 'Olvido del medicamento', NULL, '2025-07-08 08:00:00', '2025-07-08 08:00:00'),
(5, 5, 9, 1, 3, '2025-07-08 20:00:00', '2025-07-08 20:39:00', 1.000, 'Administrada', 1, 39, 0, 39, 30.10, 'tardio', NULL, NULL, NULL, 'Pequeño retraso por actividades diarias', NULL, '2025-07-08 20:39:00', '2025-07-08 20:39:00'),
(10, 6, 13, 1, NULL, '2025-06-24 08:00:00', '2025-06-24 07:30:00', 1.000, 'Administrada', 1, 30, 0, 30, 47.24, 'puntual', NULL, NULL, NULL, NULL, NULL, '2025-06-24 07:30:00', '2025-06-24 07:30:00'),
(11, 6, 14, 1, NULL, '2025-06-24 14:00:00', '2025-06-24 14:45:00', 1.000, 'Administrada', 1, -45, 45, 0, 22.31, 'temprano', NULL, NULL, NULL, NULL, NULL, '2025-06-24 14:45:00', '2025-06-24 14:45:00'),
(12, 6, 15, 1, NULL, '2025-06-24 20:00:00', '2025-06-24 20:35:00', 1.000, 'Administrada', 1, -35, 35, 0, 36.79, 'temprano', NULL, NULL, NULL, NULL, NULL, '2025-06-24 20:35:00', '2025-06-24 20:35:00'),
(13, 6, 16, 1, NULL, '2025-06-25 08:00:00', '2025-06-25 07:21:00', 1.000, 'Administrada', 1, 39, 0, 39, 30.12, 'tardio', NULL, NULL, NULL, NULL, NULL, '2025-06-25 07:21:00', '2025-06-25 07:21:00'),
(14, 6, 17, 1, NULL, '2025-06-25 20:00:00', '2025-06-25 20:06:00', 1.000, 'Administrada', 1, -6, 6, 0, 100.00, 'puntual', NULL, NULL, NULL, NULL, NULL, '2025-06-25 20:06:00', '2025-06-25 20:06:00'),
(15, 6, 18, 1, NULL, '2025-06-26 08:00:00', '2025-06-26 08:10:00', 1.000, 'Administrada', 1, -10, 10, 0, 100.00, 'puntual', NULL, NULL, NULL, NULL, NULL, '2025-06-26 08:10:00', '2025-06-26 08:10:00'),
(16, 6, 19, 1, NULL, '2025-06-27 08:00:00', '2025-06-27 08:06:00', 1.000, 'Administrada', 1, -6, 6, 0, 100.00, 'puntual', NULL, NULL, NULL, NULL, NULL, '2025-06-27 08:06:00', '2025-06-27 08:06:00'),
(17, 6, 20, 1, NULL, '2025-06-27 14:00:00', '2025-06-27 14:10:00', 1.000, 'Administrada', 1, -10, 10, 0, 100.00, 'puntual', NULL, NULL, NULL, NULL, NULL, '2025-06-27 14:10:00', '2025-06-27 14:10:00'),
(18, 6, 21, 1, NULL, '2025-06-28 08:00:00', '2025-06-28 08:09:00', 1.000, 'Administrada', 1, -9, 9, 0, 100.00, 'puntual', NULL, NULL, NULL, NULL, NULL, '2025-06-28 08:09:00', '2025-06-28 08:09:00'),
(19, 6, 22, 1, NULL, '2025-06-28 20:00:00', '2025-06-28 19:40:00', 1.000, 'Administrada', 1, 20, 0, 20, 77.88, 'puntual', NULL, NULL, NULL, NULL, NULL, '2025-06-28 19:40:00', '2025-06-28 19:40:00'),
(20, 6, 10, 1, NULL, '2025-06-29 08:00:00', '2025-06-29 08:11:00', 1.000, 'Administrada', 1, -11, 11, 0, 100.00, 'puntual', NULL, NULL, NULL, NULL, NULL, '2025-06-29 08:11:00', '2025-06-29 08:11:00'),
(21, 6, 11, 1, NULL, '2025-06-30 08:00:00', '2025-06-30 08:06:00', 1.000, 'Administrada', 1, -6, 6, 0, 100.00, 'puntual', NULL, NULL, NULL, NULL, NULL, '2025-06-30 08:06:00', '2025-06-30 08:06:00'),
(22, 6, 12, 1, NULL, '2025-06-30 20:00:00', '2025-06-30 19:41:00', 1.000, 'Administrada', 1, 19, 0, 19, 81.87, 'puntual', NULL, NULL, NULL, NULL, NULL, '2025-06-30 19:41:00', '2025-06-30 19:41:00'),
(23, 6, 13, 1, NULL, '2025-07-01 08:00:00', '2025-07-01 07:46:00', 1.000, 'Administrada', 1, 14, 0, 14, 100.00, 'puntual', NULL, NULL, NULL, NULL, NULL, '2025-07-01 07:46:00', '2025-07-01 07:46:00'),
(24, 6, 14, 1, NULL, '2025-07-01 14:00:00', '2025-07-01 14:23:00', 1.000, 'Administrada', 1, -23, 23, 0, 67.03, 'puntual', NULL, NULL, NULL, NULL, NULL, '2025-07-01 14:23:00', '2025-07-01 14:23:00'),
(25, 6, 15, 1, NULL, '2025-07-01 20:00:00', '2025-07-01 19:42:00', 1.000, 'Administrada', 1, 18, 0, 18, 86.07, 'puntual', NULL, NULL, NULL, NULL, NULL, '2025-07-01 19:42:00', '2025-07-01 19:42:00'),
(26, 6, 16, 1, NULL, '2025-07-02 08:00:00', '2025-07-02 07:48:00', 1.000, 'Administrada', 1, 12, 0, 12, 100.00, 'puntual', NULL, NULL, NULL, NULL, NULL, '2025-07-02 07:48:00', '2025-07-02 07:48:00'),
(27, 6, 17, 1, NULL, '2025-07-02 20:00:00', '2025-07-02 20:20:00', 1.000, 'Administrada', 1, -20, 20, 0, 77.88, 'puntual', NULL, NULL, NULL, NULL, NULL, '2025-07-02 20:20:00', '2025-07-02 20:20:00'),
(28, 6, 18, 1, NULL, '2025-07-03 08:00:00', '2025-07-03 07:52:00', 1.000, 'Administrada', 1, 8, 0, 8, 100.00, 'puntual', NULL, NULL, NULL, NULL, NULL, '2025-07-03 07:52:00', '2025-07-03 07:52:00'),
(29, 6, 19, 1, NULL, '2025-07-04 08:00:00', '2025-07-04 08:11:00', 1.000, 'Administrada', 1, -11, 11, 0, 100.00, 'puntual', NULL, NULL, NULL, NULL, NULL, '2025-07-04 08:11:00', '2025-07-04 08:11:00'),
(30, 6, 20, 1, NULL, '2025-07-04 14:00:00', '2025-07-04 13:48:00', 1.000, 'Administrada', 1, 12, 0, 12, 100.00, 'puntual', NULL, NULL, NULL, NULL, NULL, '2025-07-04 13:48:00', '2025-07-04 13:48:00'),
(31, 6, 21, 1, NULL, '2025-07-05 08:00:00', '2025-07-05 08:06:00', 1.000, 'Administrada', 1, -6, 6, 0, 100.00, 'puntual', NULL, NULL, NULL, NULL, NULL, '2025-07-05 08:06:00', '2025-07-05 08:06:00'),
(32, 6, 22, 1, NULL, '2025-07-05 20:00:00', '2025-07-05 19:53:00', 1.000, 'Administrada', 1, 7, 0, 7, 100.00, 'puntual', NULL, NULL, NULL, NULL, NULL, '2025-07-05 19:53:00', '2025-07-05 19:53:00'),
(33, 6, 10, 1, NULL, '2025-07-06 08:00:00', '2025-07-06 08:06:00', 1.000, 'Administrada', 1, -6, 6, 0, 100.00, 'puntual', NULL, NULL, NULL, NULL, NULL, '2025-07-06 08:06:00', '2025-07-06 08:06:00'),
(34, 6, 11, 1, NULL, '2025-07-07 08:00:00', '2025-07-07 08:08:00', 1.000, 'Administrada', 1, -8, 8, 0, 100.00, 'puntual', NULL, NULL, NULL, NULL, NULL, '2025-07-07 08:08:00', '2025-07-07 08:08:00'),
(35, 6, 12, 1, NULL, '2025-07-07 20:00:00', '2025-07-07 20:12:00', 1.000, 'Administrada', 1, -12, 12, 0, 100.00, 'puntual', NULL, NULL, NULL, NULL, NULL, '2025-07-07 20:12:00', '2025-07-07 20:12:00'),
(36, 7, 23, 2, NULL, '2025-06-24 09:00:00', '2025-06-24 09:05:00', 400.000, 'Administrada', 1, 5, 5, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Ligero retraso', NULL, '2025-06-24 09:05:00', '2025-06-24 09:05:00'),
(37, 7, 23, 2, NULL, '2025-06-25 09:00:00', '2025-06-25 09:06:00', 400.000, 'Administrada', 1, 6, 6, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Retraso moderado', NULL, '2025-06-25 09:06:00', '2025-06-25 09:06:00'),
(38, 7, 23, 2, NULL, '2025-06-26 09:00:00', '2025-06-26 09:09:00', 400.000, 'Administrada', 1, 9, 9, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Retraso moderado', NULL, '2025-06-26 09:09:00', '2025-06-26 09:09:00'),
(39, 7, 23, 2, NULL, '2025-06-27 09:00:00', '2025-06-27 09:11:00', 400.000, 'Administrada', 1, 11, 11, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Retraso moderado', NULL, '2025-06-27 09:11:00', '2025-06-27 09:11:00'),
(40, 7, 23, 2, NULL, '2025-06-28 09:00:00', '2025-06-28 09:00:00', 400.000, 'Administrada', 1, 0, 0, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Administrado puntualmente', NULL, '2025-06-28 09:00:00', '2025-06-28 09:00:00'),
(41, 7, 23, 2, NULL, '2025-06-29 09:00:00', '2025-06-29 09:18:00', 400.000, 'Administrada', 1, 18, 18, 0, 86.07, 'puntual', NULL, NULL, NULL, 'Retraso significativo', NULL, '2025-06-29 09:18:00', '2025-06-29 09:18:00'),
(42, 7, 23, 2, NULL, '2025-06-30 09:00:00', '2025-06-30 08:58:00', 400.000, 'Administrada', 1, -2, 0, 2, 100.00, 'puntual', NULL, NULL, NULL, 'Ligeramente adelantado', NULL, '2025-06-30 08:58:00', '2025-06-30 08:58:00'),
(43, 7, 23, 2, NULL, '2025-07-01 09:00:00', '2025-07-01 09:27:00', 400.000, 'Administrada', 1, 27, 27, 0, 54.88, 'puntual', NULL, NULL, NULL, 'Retraso significativo', NULL, '2025-07-01 09:27:00', '2025-07-01 09:27:00'),
(44, 7, 23, 2, NULL, '2025-07-02 09:00:00', '2025-07-02 08:53:00', 400.000, 'Administrada', 1, -7, 0, 7, 100.00, 'puntual', NULL, NULL, NULL, 'Moderadamente adelantado', NULL, '2025-07-02 08:53:00', '2025-07-02 08:53:00'),
(45, 7, 23, 2, NULL, '2025-07-03 09:00:00', '2025-07-03 09:04:00', 400.000, 'Administrada', 1, 4, 4, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Ligero retraso', NULL, '2025-07-03 09:04:00', '2025-07-03 09:04:00'),
(46, 7, 23, 2, NULL, '2025-07-04 09:00:00', '2025-07-04 09:04:00', 400.000, 'Administrada', 1, 4, 4, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Ligero retraso', NULL, '2025-07-04 09:04:00', '2025-07-04 09:04:00'),
(47, 7, 23, 2, NULL, '2025-07-05 09:00:00', '2025-07-05 08:58:00', 400.000, 'Administrada', 1, -2, 0, 2, 100.00, 'puntual', NULL, NULL, NULL, 'Ligeramente adelantado', NULL, '2025-07-05 08:58:00', '2025-07-05 08:58:00'),
(48, 7, 23, 2, NULL, '2025-07-06 09:00:00', '2025-07-06 09:19:00', 400.000, 'Administrada', 1, 19, 19, 0, 81.87, 'puntual', NULL, NULL, NULL, 'Retraso significativo', NULL, '2025-07-06 09:19:00', '2025-07-06 09:19:00'),
(49, 7, 23, 2, NULL, '2025-07-07 09:00:00', '2025-07-07 09:27:00', 400.000, 'Administrada', 1, 27, 27, 0, 54.88, 'puntual', NULL, NULL, NULL, 'Retraso significativo', NULL, '2025-07-07 09:27:00', '2025-07-07 09:27:00'),
(50, 7, 23, 2, NULL, '2025-07-08 09:00:00', '2025-07-08 09:30:00', 400.000, 'Administrada', 1, 30, 30, 0, 47.24, 'temprano', NULL, NULL, NULL, 'Retraso significativo', NULL, '2025-07-08 09:30:00', '2025-07-08 09:30:00'),
(51, 7, 24, 2, NULL, '2025-06-24 21:00:00', '2025-06-24 21:01:00', 400.000, 'Administrada', 1, 1, 1, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Ligero retraso', NULL, '2025-06-24 21:01:00', '2025-06-24 21:01:00'),
(52, 7, 24, 2, NULL, '2025-06-25 21:00:00', '2025-06-25 20:47:00', 400.000, 'Administrada', 1, -13, 0, 13, 100.00, 'puntual', NULL, NULL, NULL, 'Moderadamente adelantado', NULL, '2025-06-25 20:47:00', '2025-06-25 20:47:00'),
(53, 7, 24, 2, NULL, '2025-06-26 21:00:00', '2025-06-26 21:04:00', 400.000, 'Administrada', 1, 4, 4, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Ligero retraso', NULL, '2025-06-26 21:04:00', '2025-06-26 21:04:00'),
(54, 7, 24, 2, NULL, '2025-06-27 21:00:00', '2025-06-27 20:53:00', 400.000, 'Administrada', 1, -7, 0, 7, 100.00, 'puntual', NULL, NULL, NULL, 'Moderadamente adelantado', NULL, '2025-06-27 20:53:00', '2025-06-27 20:53:00'),
(55, 7, 24, 2, NULL, '2025-06-28 21:00:00', '2025-06-28 21:16:00', 400.000, 'Administrada', 1, 16, 16, 0, 95.12, 'puntual', NULL, NULL, NULL, 'Retraso significativo', NULL, '2025-06-28 21:16:00', '2025-06-28 21:16:00'),
(56, 7, 24, 2, NULL, '2025-06-29 21:00:00', '2025-06-29 21:25:00', 400.000, 'Administrada', 1, 25, 25, 0, 60.65, 'puntual', NULL, NULL, NULL, 'Retraso significativo', NULL, '2025-06-29 21:25:00', '2025-06-29 21:25:00'),
(57, 7, 24, 2, NULL, '2025-06-30 21:00:00', '2025-06-30 20:57:00', 400.000, 'Administrada', 1, -3, 0, 3, 100.00, 'puntual', NULL, NULL, NULL, 'Ligeramente adelantado', NULL, '2025-06-30 20:57:00', '2025-06-30 20:57:00'),
(58, 7, 24, 2, NULL, '2025-07-01 21:00:00', '2025-07-01 21:08:00', 400.000, 'Administrada', 1, 8, 8, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Retraso moderado', NULL, '2025-07-01 21:08:00', '2025-07-01 21:08:00'),
(59, 7, 24, 2, NULL, '2025-07-02 21:00:00', '2025-07-02 21:10:00', 400.000, 'Administrada', 1, 10, 10, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Retraso moderado', NULL, '2025-07-02 21:10:00', '2025-07-02 21:10:00'),
(60, 7, 24, 2, NULL, '2025-07-03 21:00:00', '2025-07-03 21:07:00', 400.000, 'Administrada', 1, 7, 7, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Retraso moderado', NULL, '2025-07-03 21:07:00', '2025-07-03 21:07:00'),
(61, 7, 24, 2, NULL, '2025-07-04 21:00:00', '2025-07-04 20:39:00', 400.000, 'Administrada', 1, -21, 0, 21, 74.08, 'puntual', NULL, NULL, NULL, 'Significativamente adelantado', NULL, '2025-07-04 20:39:00', '2025-07-04 20:39:00'),
(62, 7, 24, 2, NULL, '2025-07-05 21:00:00', '2025-07-05 21:11:00', 400.000, 'Administrada', 1, 11, 11, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Retraso moderado', NULL, '2025-07-05 21:11:00', '2025-07-05 21:11:00'),
(63, 7, 24, 2, NULL, '2025-07-06 21:00:00', '2025-07-06 21:16:00', 400.000, 'Administrada', 1, 16, 16, 0, 95.12, 'puntual', NULL, NULL, NULL, 'Retraso significativo', NULL, '2025-07-06 21:16:00', '2025-07-06 21:16:00'),
(64, 7, 24, 2, NULL, '2025-07-07 21:00:00', '2025-07-07 20:38:00', 400.000, 'Administrada', 1, -22, 0, 22, 70.47, 'puntual', NULL, NULL, NULL, 'Significativamente adelantado', NULL, '2025-07-07 20:38:00', '2025-07-07 20:38:00'),
(65, 7, 24, 2, NULL, '2025-07-08 21:00:00', '2025-07-08 21:07:00', 400.000, 'Administrada', 1, 7, 7, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Retraso moderado', NULL, '2025-07-08 21:07:00', '2025-07-08 21:07:00'),
(66, 8, 25, 2, NULL, '2025-06-24 08:00:00', '2025-06-24 08:02:00', 20.000, 'Administrada', 1, 2, 2, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Ligero retraso', NULL, '2025-06-24 08:02:00', '2025-06-24 08:02:00'),
(67, 8, 25, 2, NULL, '2025-06-25 08:00:00', '2025-06-25 08:07:00', 20.000, 'Administrada', 1, 7, 7, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Retraso moderado', NULL, '2025-06-25 08:07:00', '2025-06-25 08:07:00'),
(68, 8, 25, 2, NULL, '2025-06-26 08:00:00', '2025-06-26 07:57:00', 20.000, 'Administrada', 1, -3, 0, 3, 100.00, 'puntual', NULL, NULL, NULL, 'Ligeramente adelantado', NULL, '2025-06-26 07:57:00', '2025-06-26 07:57:00'),
(69, 8, 25, 2, NULL, '2025-06-27 08:00:00', '2025-06-27 07:59:00', 20.000, 'Administrada', 1, -1, 0, 1, 100.00, 'puntual', NULL, NULL, NULL, 'Ligeramente adelantado', NULL, '2025-06-27 07:59:00', '2025-06-27 07:59:00'),
(70, 8, 25, 2, NULL, '2025-06-28 08:00:00', '2025-06-28 08:02:00', 20.000, 'Administrada', 1, 2, 2, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Ligero retraso', NULL, '2025-06-28 08:02:00', '2025-06-28 08:02:00'),
(71, 8, 25, 2, NULL, '2025-06-29 08:00:00', '2025-06-29 08:05:00', 20.000, 'Administrada', 1, 5, 5, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Ligero retraso', NULL, '2025-06-29 08:05:00', '2025-06-29 08:05:00'),
(72, 8, 25, 2, NULL, '2025-06-30 08:00:00', '2025-06-30 07:59:00', 20.000, 'Administrada', 1, -1, 0, 1, 100.00, 'puntual', NULL, NULL, NULL, 'Ligeramente adelantado', NULL, '2025-06-30 07:59:00', '2025-06-30 07:59:00'),
(73, 8, 25, 2, NULL, '2025-07-01 08:00:00', '2025-07-01 08:14:00', 20.000, 'Administrada', 1, 14, 14, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Retraso moderado', NULL, '2025-07-01 08:14:00', '2025-07-01 08:14:00'),
(74, 8, 25, 2, NULL, '2025-07-02 08:00:00', '2025-07-02 08:09:00', 20.000, 'Administrada', 1, 9, 9, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Retraso moderado', NULL, '2025-07-02 08:09:00', '2025-07-02 08:09:00'),
(75, 8, 25, 2, NULL, '2025-07-03 08:00:00', '2025-07-03 08:17:00', 20.000, 'Administrada', 1, 17, 17, 0, 90.48, 'puntual', NULL, NULL, NULL, 'Retraso significativo', NULL, '2025-07-03 08:17:00', '2025-07-03 08:17:00'),
(76, 8, 25, 2, NULL, '2025-07-04 08:00:00', '2025-07-04 08:17:00', 20.000, 'Administrada', 1, 17, 17, 0, 90.48, 'puntual', NULL, NULL, NULL, 'Retraso significativo', NULL, '2025-07-04 08:17:00', '2025-07-04 08:17:00'),
(77, 8, 25, 2, NULL, '2025-07-05 08:00:00', '2025-07-05 08:14:00', 20.000, 'Administrada', 1, 14, 14, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Retraso moderado', NULL, '2025-07-05 08:14:00', '2025-07-05 08:14:00'),
(78, 8, 25, 2, NULL, '2025-07-06 08:00:00', '2025-07-06 08:16:00', 20.000, 'Administrada', 1, 16, 16, 0, 95.12, 'puntual', NULL, NULL, NULL, 'Retraso significativo', NULL, '2025-07-06 08:16:00', '2025-07-06 08:16:00'),
(79, 8, 25, 2, NULL, '2025-07-07 08:00:00', '2025-07-07 08:19:00', 20.000, 'Administrada', 1, 19, 19, 0, 81.87, 'puntual', NULL, NULL, NULL, 'Retraso significativo', NULL, '2025-07-07 08:19:00', '2025-07-07 08:19:00'),
(80, 8, 25, 2, NULL, '2025-07-08 08:00:00', '2025-07-08 08:26:00', 20.000, 'Administrada', 1, 26, 26, 0, 57.69, 'puntual', NULL, NULL, NULL, 'Retraso significativo', NULL, '2025-07-08 08:26:00', '2025-07-08 08:26:00'),
(81, 9, 26, 2, NULL, '2025-06-24 08:30:00', '2025-06-24 08:32:00', 850.000, 'Administrada', 1, 2, 2, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Ligero retraso', NULL, '2025-06-24 08:32:00', '2025-06-24 08:32:00'),
(82, 9, 26, 2, NULL, '2025-06-25 08:30:00', '2025-06-25 08:29:00', 850.000, 'Administrada', 1, -1, 0, 1, 100.00, 'puntual', NULL, NULL, NULL, 'Ligeramente adelantado', NULL, '2025-06-25 08:29:00', '2025-06-25 08:29:00'),
(83, 9, 26, 2, NULL, '2025-06-26 08:30:00', '2025-06-26 08:41:00', 850.000, 'Administrada', 1, 11, 11, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Retraso moderado', NULL, '2025-06-26 08:41:00', '2025-06-26 08:41:00'),
(84, 9, 26, 2, NULL, '2025-06-27 08:30:00', '2025-06-27 08:37:00', 850.000, 'Administrada', 1, 7, 7, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Retraso moderado', NULL, '2025-06-27 08:37:00', '2025-06-27 08:37:00'),
(85, 9, 26, 2, NULL, '2025-06-28 08:30:00', '2025-06-28 08:43:00', 850.000, 'Administrada', 1, 13, 13, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Retraso moderado', NULL, '2025-06-28 08:43:00', '2025-06-28 08:43:00'),
(86, 9, 26, 2, NULL, '2025-06-29 08:30:00', '2025-06-29 08:39:00', 850.000, 'Administrada', 1, 9, 9, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Retraso moderado', NULL, '2025-06-29 08:39:00', '2025-06-29 08:39:00'),
(87, 9, 26, 2, NULL, '2025-06-30 08:30:00', '2025-06-30 08:35:00', 850.000, 'Administrada', 1, 5, 5, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Ligero retraso', NULL, '2025-06-30 08:35:00', '2025-06-30 08:35:00'),
(88, 9, 26, 2, NULL, '2025-07-01 08:30:00', '2025-07-01 08:38:00', 850.000, 'Administrada', 1, 8, 8, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Retraso moderado', NULL, '2025-07-01 08:38:00', '2025-07-01 08:38:00'),
(89, 9, 26, 2, NULL, '2025-07-02 08:30:00', '2025-07-02 08:48:00', 850.000, 'Administrada', 1, 18, 18, 0, 86.07, 'puntual', NULL, NULL, NULL, 'Retraso significativo', NULL, '2025-07-02 08:48:00', '2025-07-02 08:48:00'),
(90, 9, 26, 2, NULL, '2025-07-03 08:30:00', '2025-07-03 08:37:00', 850.000, 'Administrada', 1, 7, 7, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Retraso moderado', NULL, '2025-07-03 08:37:00', '2025-07-03 08:37:00'),
(91, 9, 26, 2, NULL, '2025-07-04 08:30:00', '2025-07-04 08:27:00', 850.000, 'Administrada', 1, -3, 0, 3, 100.00, 'puntual', NULL, NULL, NULL, 'Ligeramente adelantado', NULL, '2025-07-04 08:27:00', '2025-07-04 08:27:00'),
(92, 9, 26, 2, NULL, '2025-07-05 08:30:00', '2025-07-05 08:39:00', 850.000, 'Administrada', 1, 9, 9, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Retraso moderado', NULL, '2025-07-05 08:39:00', '2025-07-05 08:39:00'),
(93, 9, 26, 2, NULL, '2025-07-06 08:30:00', '2025-07-06 08:46:00', 850.000, 'Administrada', 1, 16, 16, 0, 95.12, 'puntual', NULL, NULL, NULL, 'Retraso significativo', NULL, '2025-07-06 08:46:00', '2025-07-06 08:46:00'),
(94, 9, 26, 2, NULL, '2025-07-07 08:30:00', '2025-07-07 08:28:00', 850.000, 'Administrada', 1, -2, 0, 2, 100.00, 'puntual', NULL, NULL, NULL, 'Ligeramente adelantado', NULL, '2025-07-07 08:28:00', '2025-07-07 08:28:00'),
(95, 9, 26, 2, NULL, '2025-07-08 08:30:00', '2025-07-08 08:35:00', 850.000, 'Administrada', 1, 5, 5, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Ligero retraso', NULL, '2025-07-08 08:35:00', '2025-07-08 08:35:00'),
(96, 9, 27, 2, NULL, '2025-06-24 14:30:00', '2025-06-24 14:35:00', 850.000, 'Administrada', 1, 5, 5, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Ligero retraso', NULL, '2025-06-24 14:35:00', '2025-06-24 14:35:00'),
(97, 9, 27, 2, NULL, '2025-06-25 14:30:00', '2025-06-25 14:38:00', 850.000, 'Administrada', 1, 8, 8, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Retraso moderado', NULL, '2025-06-25 14:38:00', '2025-06-25 14:38:00'),
(98, 9, 27, 2, NULL, '2025-06-26 14:30:00', '2025-06-26 14:40:00', 850.000, 'Administrada', 1, 10, 10, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Retraso moderado', NULL, '2025-06-26 14:40:00', '2025-06-26 14:40:00'),
(99, 9, 27, 2, NULL, '2025-06-27 14:30:00', '2025-06-27 14:38:00', 850.000, 'Administrada', 1, 8, 8, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Retraso moderado', NULL, '2025-06-27 14:38:00', '2025-06-27 14:38:00'),
(100, 9, 27, 2, NULL, '2025-06-28 14:30:00', '2025-06-28 14:30:00', 850.000, 'Administrada', 1, 0, 0, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Administrado puntualmente', NULL, '2025-06-28 14:30:00', '2025-06-28 14:30:00'),
(101, 9, 27, 2, NULL, '2025-06-29 14:30:00', '2025-06-29 14:46:00', 850.000, 'Administrada', 1, 16, 16, 0, 95.12, 'puntual', NULL, NULL, NULL, 'Retraso significativo', NULL, '2025-06-29 14:46:00', '2025-06-29 14:46:00'),
(102, 9, 27, 2, NULL, '2025-06-30 14:30:00', '2025-06-30 14:37:00', 850.000, 'Administrada', 1, 7, 7, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Retraso moderado', NULL, '2025-06-30 14:37:00', '2025-06-30 14:37:00'),
(103, 9, 27, 2, NULL, '2025-07-01 14:30:00', '2025-07-01 14:53:00', 850.000, 'Administrada', 1, 23, 23, 0, 67.03, 'puntual', NULL, NULL, NULL, 'Retraso significativo', NULL, '2025-07-01 14:53:00', '2025-07-01 14:53:00'),
(104, 9, 27, 2, NULL, '2025-07-02 14:30:00', '2025-07-02 14:48:00', 850.000, 'Administrada', 1, 18, 18, 0, 86.07, 'puntual', NULL, NULL, NULL, 'Retraso significativo', NULL, '2025-07-02 14:48:00', '2025-07-02 14:48:00'),
(105, 9, 27, 2, NULL, '2025-07-03 14:30:00', '2025-07-03 14:46:00', 850.000, 'Administrada', 1, 16, 16, 0, 95.12, 'puntual', NULL, NULL, NULL, 'Retraso significativo', NULL, '2025-07-03 14:46:00', '2025-07-03 14:46:00'),
(106, 9, 27, 2, NULL, '2025-07-04 14:30:00', '2025-07-04 14:29:00', 850.000, 'Administrada', 1, -1, 0, 1, 100.00, 'puntual', NULL, NULL, NULL, 'Ligeramente adelantado', NULL, '2025-07-04 14:29:00', '2025-07-04 14:29:00'),
(107, 9, 27, 2, NULL, '2025-07-05 14:30:00', '2025-07-05 14:48:00', 850.000, 'Administrada', 1, 18, 18, 0, 86.07, 'puntual', NULL, NULL, NULL, 'Retraso significativo', NULL, '2025-07-05 14:48:00', '2025-07-05 14:48:00'),
(108, 9, 27, 2, NULL, '2025-07-06 14:30:00', '2025-07-06 14:41:00', 850.000, 'Administrada', 1, 11, 11, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Retraso moderado', NULL, '2025-07-06 14:41:00', '2025-07-06 14:41:00'),
(109, 9, 27, 2, NULL, '2025-07-07 14:30:00', '2025-07-07 14:49:00', 850.000, 'Administrada', 1, 19, 19, 0, 81.87, 'puntual', NULL, NULL, NULL, 'Retraso significativo', NULL, '2025-07-07 14:49:00', '2025-07-07 14:49:00'),
(110, 9, 27, 2, NULL, '2025-07-08 14:30:00', '2025-07-08 14:43:00', 850.000, 'Administrada', 1, 13, 13, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Retraso moderado', NULL, '2025-07-08 14:43:00', '2025-07-08 14:43:00'),
(111, 9, 28, 2, NULL, '2025-06-24 20:30:00', '2025-06-24 20:31:00', 850.000, 'Administrada', 1, 1, 1, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Ligero retraso', NULL, '2025-06-24 20:31:00', '2025-06-24 20:31:00'),
(112, 9, 28, 2, NULL, '2025-06-25 20:30:00', '2025-06-25 20:28:00', 850.000, 'Administrada', 1, -2, 0, 2, 100.00, 'puntual', NULL, NULL, NULL, 'Ligeramente adelantado', NULL, '2025-06-25 20:28:00', '2025-06-25 20:28:00'),
(113, 9, 28, 2, NULL, '2025-06-26 20:30:00', '2025-06-26 20:41:00', 850.000, 'Administrada', 1, 11, 11, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Retraso moderado', NULL, '2025-06-26 20:41:00', '2025-06-26 20:41:00'),
(114, 9, 28, 2, NULL, '2025-06-27 20:30:00', '2025-06-27 20:39:00', 850.000, 'Administrada', 1, 9, 9, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Retraso moderado', NULL, '2025-06-27 20:39:00', '2025-06-27 20:39:00'),
(115, 9, 28, 2, NULL, '2025-06-28 20:30:00', '2025-06-28 20:32:00', 850.000, 'Administrada', 1, 2, 2, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Ligero retraso', NULL, '2025-06-28 20:32:00', '2025-06-28 20:32:00'),
(116, 9, 28, 2, NULL, '2025-06-29 20:30:00', '2025-06-29 20:30:00', 850.000, 'Administrada', 1, 0, 0, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Administrado puntualmente', NULL, '2025-06-29 20:30:00', '2025-06-29 20:30:00'),
(117, 9, 28, 2, NULL, '2025-06-30 20:30:00', '2025-06-30 20:23:00', 850.000, 'Administrada', 1, -7, 0, 7, 100.00, 'puntual', NULL, NULL, NULL, 'Moderadamente adelantado', NULL, '2025-06-30 20:23:00', '2025-06-30 20:23:00'),
(118, 9, 28, 2, NULL, '2025-07-01 20:30:00', '2025-07-01 20:29:00', 850.000, 'Administrada', 1, -1, 0, 1, 100.00, 'puntual', NULL, NULL, NULL, 'Ligeramente adelantado', NULL, '2025-07-01 20:29:00', '2025-07-01 20:29:00'),
(119, 9, 28, 2, NULL, '2025-07-02 20:30:00', '2025-07-02 20:56:00', 850.000, 'Administrada', 1, 26, 26, 0, 57.69, 'puntual', NULL, NULL, NULL, 'Retraso significativo', NULL, '2025-07-02 20:56:00', '2025-07-02 20:56:00'),
(120, 9, 28, 2, NULL, '2025-07-03 20:30:00', '2025-07-03 20:31:00', 850.000, 'Administrada', 1, 1, 1, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Ligero retraso', NULL, '2025-07-03 20:31:00', '2025-07-03 20:31:00'),
(121, 9, 28, 2, NULL, '2025-07-04 20:30:00', '2025-07-04 20:36:00', 850.000, 'Administrada', 1, 6, 6, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Retraso moderado', NULL, '2025-07-04 20:36:00', '2025-07-04 20:36:00'),
(122, 9, 28, 2, NULL, '2025-07-05 20:30:00', '2025-07-05 20:54:00', 850.000, 'Administrada', 1, 24, 24, 0, 63.76, 'puntual', NULL, NULL, NULL, 'Retraso significativo', NULL, '2025-07-05 20:54:00', '2025-07-05 20:54:00'),
(123, 9, 28, 2, NULL, '2025-07-06 20:30:00', '2025-07-06 20:46:00', 850.000, 'Administrada', 1, 16, 16, 0, 95.12, 'puntual', NULL, NULL, NULL, 'Retraso significativo', NULL, '2025-07-06 20:46:00', '2025-07-06 20:46:00'),
(124, 9, 28, 2, NULL, '2025-07-07 20:30:00', '2025-07-07 20:52:00', 850.000, 'Administrada', 1, 22, 22, 0, 70.47, 'puntual', NULL, NULL, NULL, 'Retraso significativo', NULL, '2025-07-07 20:52:00', '2025-07-07 20:52:00'),
(125, 9, 28, 2, NULL, '2025-07-08 20:30:00', '2025-07-08 20:35:00', 850.000, 'Administrada', 1, 5, 5, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Ligero retraso', NULL, '2025-07-08 20:35:00', '2025-07-08 20:35:00'),
(126, 10, 29, 2, NULL, '2025-06-24 07:00:00', '2025-06-24 07:02:00', 50.000, 'Administrada', 1, 2, 2, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Ligero retraso', NULL, '2025-06-24 07:02:00', '2025-06-24 07:02:00'),
(127, 10, 29, 2, NULL, '2025-06-25 07:00:00', '2025-06-25 07:05:00', 50.000, 'Administrada', 1, 5, 5, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Ligero retraso', NULL, '2025-06-25 07:05:00', '2025-06-25 07:05:00'),
(128, 10, 29, 2, NULL, '2025-06-26 07:00:00', '2025-06-26 07:09:00', 50.000, 'Administrada', 1, 9, 9, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Retraso moderado', NULL, '2025-06-26 07:09:00', '2025-06-26 07:09:00'),
(129, 10, 29, 2, NULL, '2025-06-27 07:00:00', '2025-06-27 07:08:00', 50.000, 'Administrada', 1, 8, 8, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Retraso moderado', NULL, '2025-06-27 07:08:00', '2025-06-27 07:08:00'),
(130, 10, 29, 2, NULL, '2025-06-28 07:00:00', '2025-06-28 07:07:00', 50.000, 'Administrada', 1, 7, 7, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Retraso moderado', NULL, '2025-06-28 07:07:00', '2025-06-28 07:07:00'),
(131, 10, 29, 2, NULL, '2025-06-29 07:00:00', '2025-06-29 07:07:00', 50.000, 'Administrada', 1, 7, 7, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Retraso moderado', NULL, '2025-06-29 07:07:00', '2025-06-29 07:07:00'),
(132, 10, 29, 2, NULL, '2025-06-30 07:00:00', '2025-06-30 07:18:00', 50.000, 'Administrada', 1, 18, 18, 0, 86.07, 'puntual', NULL, NULL, NULL, 'Retraso significativo', NULL, '2025-06-30 07:18:00', '2025-06-30 07:18:00'),
(133, 10, 29, 2, NULL, '2025-07-01 07:00:00', '2025-07-01 06:57:00', 50.000, 'Administrada', 1, -3, 0, 3, 100.00, 'puntual', NULL, NULL, NULL, 'Ligeramente adelantado', NULL, '2025-07-01 06:57:00', '2025-07-01 06:57:00'),
(134, 10, 29, 2, NULL, '2025-07-02 07:00:00', '2025-07-02 07:13:00', 50.000, 'Administrada', 1, 13, 13, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Retraso moderado', NULL, '2025-07-02 07:13:00', '2025-07-02 07:13:00'),
(135, 10, 29, 2, NULL, '2025-07-03 07:00:00', '2025-07-03 07:14:00', 50.000, 'Administrada', 1, 14, 14, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Retraso moderado', NULL, '2025-07-03 07:14:00', '2025-07-03 07:14:00'),
(136, 10, 29, 2, NULL, '2025-07-04 07:00:00', '2025-07-04 07:04:00', 50.000, 'Administrada', 1, 4, 4, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Ligero retraso', NULL, '2025-07-04 07:04:00', '2025-07-04 07:04:00'),
(137, 10, 29, 2, NULL, '2025-07-05 07:00:00', '2025-07-05 07:10:00', 50.000, 'Administrada', 1, 10, 10, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Retraso moderado', NULL, '2025-07-05 07:10:00', '2025-07-05 07:10:00'),
(138, 10, 29, 2, NULL, '2025-07-06 07:00:00', '2025-07-06 07:02:00', 50.000, 'Administrada', 1, 2, 2, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Ligero retraso', NULL, '2025-07-06 07:02:00', '2025-07-06 07:02:00'),
(139, 10, 29, 2, NULL, '2025-07-07 07:00:00', '2025-07-07 07:15:00', 50.000, 'Administrada', 1, 15, 15, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Retraso moderado', NULL, '2025-07-07 07:15:00', '2025-07-07 07:15:00'),
(140, 10, 29, 2, NULL, '2025-07-08 07:00:00', '2025-07-08 07:02:00', 50.000, 'Administrada', 1, 2, 2, 0, 100.00, 'puntual', NULL, NULL, NULL, 'Ligero retraso', NULL, '2025-07-08 07:02:00', '2025-07-08 07:02:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alertas`
--

CREATE TABLE `alertas` (
  `id` bigint UNSIGNED NOT NULL,
  `paciente_id` bigint UNSIGNED NOT NULL,
  `tratamiento_id` bigint UNSIGNED DEFAULT NULL,
  `administracion_id` bigint UNSIGNED DEFAULT NULL,
  `tipo` enum('Dosis_Omitida','Fuera_Ventana','Exceso_PRN','Intervalo_Corto_PRN','Efecto_Adverso') COLLATE utf8mb4_unicode_ci NOT NULL,
  `nivel` enum('Info','Advertencia','Critica') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Info',
  `mensaje` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_generada` timestamp NOT NULL,
  `revisada` tinyint(1) NOT NULL DEFAULT '0',
  `revisada_por` bigint UNSIGNED DEFAULT NULL,
  `fecha_revision` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apoderados`
--

CREATE TABLE `apoderados` (
  `usuario_id` bigint UNSIGNED NOT NULL,
  `relacion_paciente` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `es_contacto_emergencia` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Información específica de apoderados/tutores';

--
-- Volcado de datos para la tabla `apoderados`
--

INSERT INTO `apoderados` (`usuario_id`, `relacion_paciente`, `es_contacto_emergencia`) VALUES
(4, 'padre', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `usuario_id` bigint UNSIGNED DEFAULT NULL,
  `accion` enum('create','update','delete','access','login','logout','permission_grant','permission_revoke') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tabla_afectada` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registro_id` bigint UNSIGNED DEFAULT NULL,
  `datos_anteriores` json DEFAULT NULL,
  `datos_nuevos` json DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `metodo_http` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ruta` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contexto_adicional` json DEFAULT NULL,
  `session_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `severidad` enum('low','medium','high','critical') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'medium',
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Registro de auditoría para todas las acciones críticas del sistema';

--
-- Volcado de datos para la tabla `audit_logs`
--

INSERT INTO `audit_logs` (`id`, `usuario_id`, `accion`, `tabla_afectada`, `registro_id`, `datos_anteriores`, `datos_nuevos`, `ip_address`, `user_agent`, `metodo_http`, `url`, `ruta`, `contexto_adicional`, `session_id`, `severidad`, `created_at`, `created_by_name`) VALUES
(1, NULL, 'create', 'roles', 1, NULL, '{\"id\": 1, \"activo\": true, \"nombre\": \"admin\", \"descripcion\": \"Administrador del sistema con acceso total\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Role\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(2, NULL, 'create', 'roles', 2, NULL, '{\"id\": 2, \"activo\": true, \"nombre\": \"medico\", \"descripcion\": \"Personal médico - gestión de pacientes y diagnósticos\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Role\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(3, NULL, 'create', 'roles', 3, NULL, '{\"id\": 3, \"activo\": true, \"nombre\": \"cuidador\", \"descripcion\": \"Cuidador de pacientes - acceso limitado a pacientes asignados\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Role\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(4, NULL, 'create', 'roles', 4, NULL, '{\"id\": 4, \"activo\": true, \"nombre\": \"apoderado\", \"descripcion\": \"Apoderado/tutor - acceso a información de pacientes a cargo\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Role\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(5, NULL, 'create', 'roles', 5, NULL, '{\"id\": 5, \"activo\": true, \"nombre\": \"paciente\", \"descripcion\": \"Paciente - acceso a su propia información médica\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Role\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(6, NULL, 'create', 'permisos', 1, NULL, '{\"id\": 1, \"modulo\": \"usuarios\", \"nombre\": \"usuarios.index\", \"descripcion\": \"Ver lista de usuarios\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Permiso\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(7, NULL, 'create', 'permisos', 2, NULL, '{\"id\": 2, \"modulo\": \"usuarios\", \"nombre\": \"usuarios.create\", \"descripcion\": \"Crear usuarios\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Permiso\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(8, NULL, 'create', 'permisos', 3, NULL, '{\"id\": 3, \"modulo\": \"usuarios\", \"nombre\": \"usuarios.edit\", \"descripcion\": \"Editar usuarios\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Permiso\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(9, NULL, 'create', 'permisos', 4, NULL, '{\"id\": 4, \"modulo\": \"usuarios\", \"nombre\": \"usuarios.delete\", \"descripcion\": \"Eliminar usuarios\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Permiso\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(10, NULL, 'create', 'permisos', 5, NULL, '{\"id\": 5, \"modulo\": \"roles\", \"nombre\": \"roles.index\", \"descripcion\": \"Ver lista de roles\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Permiso\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(11, NULL, 'create', 'permisos', 6, NULL, '{\"id\": 6, \"modulo\": \"roles\", \"nombre\": \"roles.create\", \"descripcion\": \"Crear roles\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Permiso\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(12, NULL, 'create', 'permisos', 7, NULL, '{\"id\": 7, \"modulo\": \"roles\", \"nombre\": \"roles.edit\", \"descripcion\": \"Editar roles\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Permiso\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(13, NULL, 'create', 'permisos', 8, NULL, '{\"id\": 8, \"modulo\": \"roles\", \"nombre\": \"roles.delete\", \"descripcion\": \"Eliminar roles\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Permiso\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(14, NULL, 'create', 'permisos', 9, NULL, '{\"id\": 9, \"modulo\": \"pacientes\", \"nombre\": \"pacientes.index\", \"descripcion\": \"Ver lista de pacientes\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Permiso\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(15, NULL, 'create', 'permisos', 10, NULL, '{\"id\": 10, \"modulo\": \"pacientes\", \"nombre\": \"pacientes.create\", \"descripcion\": \"Crear pacientes\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Permiso\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(16, NULL, 'create', 'permisos', 11, NULL, '{\"id\": 11, \"modulo\": \"pacientes\", \"nombre\": \"pacientes.edit\", \"descripcion\": \"Editar pacientes\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Permiso\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(17, NULL, 'create', 'permisos', 12, NULL, '{\"id\": 12, \"modulo\": \"pacientes\", \"nombre\": \"pacientes.delete\", \"descripcion\": \"Eliminar pacientes\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Permiso\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(18, NULL, 'create', 'permisos', 13, NULL, '{\"id\": 13, \"modulo\": \"pacientes\", \"nombre\": \"pacientes.own\", \"descripcion\": \"Ver solo sus propios datos\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Permiso\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(19, NULL, 'create', 'permisos', 14, NULL, '{\"id\": 14, \"modulo\": \"personal-medico\", \"nombre\": \"personal-medico.index\", \"descripcion\": \"Ver personal médico\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Permiso\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(20, NULL, 'create', 'permisos', 15, NULL, '{\"id\": 15, \"modulo\": \"personal-medico\", \"nombre\": \"personal-medico.create\", \"descripcion\": \"Crear personal médico\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Permiso\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(21, NULL, 'create', 'permisos', 16, NULL, '{\"id\": 16, \"modulo\": \"personal-medico\", \"nombre\": \"personal-medico.edit\", \"descripcion\": \"Editar personal médico\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Permiso\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(22, NULL, 'create', 'permisos', 17, NULL, '{\"id\": 17, \"modulo\": \"personal-medico\", \"nombre\": \"personal-medico.delete\", \"descripcion\": \"Eliminar personal médico\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Permiso\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(23, NULL, 'create', 'permisos', 18, NULL, '{\"id\": 18, \"modulo\": \"cuidadores\", \"nombre\": \"cuidadores.index\", \"descripcion\": \"Ver cuidadores\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Permiso\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(24, NULL, 'create', 'permisos', 19, NULL, '{\"id\": 19, \"modulo\": \"cuidadores\", \"nombre\": \"cuidadores.create\", \"descripcion\": \"Crear cuidadores\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Permiso\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(25, NULL, 'create', 'permisos', 20, NULL, '{\"id\": 20, \"modulo\": \"cuidadores\", \"nombre\": \"cuidadores.edit\", \"descripcion\": \"Editar cuidadores\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Permiso\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(26, NULL, 'create', 'permisos', 21, NULL, '{\"id\": 21, \"modulo\": \"cuidadores\", \"nombre\": \"cuidadores.delete\", \"descripcion\": \"Eliminar cuidadores\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Permiso\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(27, NULL, 'create', 'permisos', 22, NULL, '{\"id\": 22, \"modulo\": \"apoderados\", \"nombre\": \"apoderados.index\", \"descripcion\": \"Ver apoderados\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Permiso\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(28, NULL, 'create', 'permisos', 23, NULL, '{\"id\": 23, \"modulo\": \"apoderados\", \"nombre\": \"apoderados.create\", \"descripcion\": \"Crear apoderados\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Permiso\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(29, NULL, 'create', 'permisos', 24, NULL, '{\"id\": 24, \"modulo\": \"apoderados\", \"nombre\": \"apoderados.edit\", \"descripcion\": \"Editar apoderados\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Permiso\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(30, NULL, 'create', 'permisos', 25, NULL, '{\"id\": 25, \"modulo\": \"apoderados\", \"nombre\": \"apoderados.delete\", \"descripcion\": \"Eliminar apoderados\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Permiso\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(31, NULL, 'create', 'permisos', 26, NULL, '{\"id\": 26, \"modulo\": \"medicines\", \"nombre\": \"medicines.index\", \"descripcion\": \"Ver medicamentos\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Permiso\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(32, NULL, 'create', 'permisos', 27, NULL, '{\"id\": 27, \"modulo\": \"medicines\", \"nombre\": \"medicines.create\", \"descripcion\": \"Crear medicamentos\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Permiso\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(33, NULL, 'create', 'permisos', 28, NULL, '{\"id\": 28, \"modulo\": \"medicines\", \"nombre\": \"medicines.edit\", \"descripcion\": \"Editar medicamentos\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Permiso\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(34, NULL, 'create', 'permisos', 29, NULL, '{\"id\": 29, \"modulo\": \"medicines\", \"nombre\": \"medicines.delete\", \"descripcion\": \"Eliminar medicamentos\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Permiso\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(35, NULL, 'create', 'permisos', 30, NULL, '{\"id\": 30, \"modulo\": \"tratamientos\", \"nombre\": \"tratamientos.index\", \"descripcion\": \"Ver tratamientos\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Permiso\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(36, NULL, 'create', 'permisos', 31, NULL, '{\"id\": 31, \"modulo\": \"tratamientos\", \"nombre\": \"tratamientos.create\", \"descripcion\": \"Crear tratamientos\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Permiso\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(37, NULL, 'create', 'permisos', 32, NULL, '{\"id\": 32, \"modulo\": \"tratamientos\", \"nombre\": \"tratamientos.edit\", \"descripcion\": \"Editar tratamientos\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Permiso\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(38, NULL, 'create', 'permisos', 33, NULL, '{\"id\": 33, \"modulo\": \"tratamientos\", \"nombre\": \"tratamientos.delete\", \"descripcion\": \"Eliminar tratamientos\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Permiso\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(39, NULL, 'create', 'users', 1, NULL, '{\"id\": 1, \"name\": \"Administrador Sistema\", \"email\": \"admin@meditrack.com\", \"activo\": true, \"nombre\": \"Administrador\", \"rol_id\": 1, \"password\": \"[OCULTO]\", \"telefono\": \"+56 9 1111 1111\", \"created_at\": \"2025-07-08 22:17:33\", \"updated_at\": \"2025-07-08 22:17:33\", \"apellido_materno\": \"\", \"apellido_paterno\": \"Sistema\", \"email_verified_at\": \"2025-07-08 22:17:33\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\User\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(40, NULL, 'create', 'users', 2, NULL, '{\"id\": 2, \"name\": \"Dr. Juan Pérez\", \"email\": \"medico@meditrack.com\", \"activo\": true, \"nombre\": \"Dr.\", \"rol_id\": 2, \"password\": \"[OCULTO]\", \"telefono\": \"+56 9 2222 2222\", \"created_at\": \"2025-07-08 22:17:33\", \"updated_at\": \"2025-07-08 22:17:33\", \"apellido_materno\": \"Pérez\", \"apellido_paterno\": \"Juan\", \"email_verified_at\": \"2025-07-08 22:17:33\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\User\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:33', 'Sistema'),
(41, NULL, 'create', 'personal_medico', 2, NULL, '{\"usuario_id\": 2, \"institucion\": \"Hospital Central\", \"especialidad\": \"Medicina Interna\", \"anos_experiencia\": 10, \"numero_colegiatura\": \"MED-12345\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\PersonalMedico\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:33', 'Sistema'),
(42, NULL, 'create', 'users', 3, NULL, '{\"id\": 3, \"name\": \"María González\", \"email\": \"cuidador@meditrack.com\", \"activo\": true, \"nombre\": \"María\", \"rol_id\": 3, \"password\": \"[OCULTO]\", \"telefono\": \"+56 9 3333 3333\", \"created_at\": \"2025-07-08 22:17:34\", \"updated_at\": \"2025-07-08 22:17:34\", \"apellido_materno\": \"\", \"apellido_paterno\": \"González\", \"email_verified_at\": \"2025-07-08 22:17:34\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\User\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:34', 'Sistema'),
(43, NULL, 'create', 'cuidadores', 3, NULL, '{\"usuario_id\": 3, \"tarifa_hora\": 15000, \"certificaciones\": \"Certificado en primeros auxilios, Curso de cuidado de adultos mayores\", \"experiencia_anos\": 5, \"disponibilidad_horaria\": \"Lunes a Viernes 8:00-18:00\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Cuidador\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'low', '2025-07-08 22:17:34', 'Sistema'),
(44, NULL, 'create', 'users', 4, NULL, '{\"id\": 4, \"name\": \"Carlos Silva\", \"email\": \"apoderado@meditrack.com\", \"activo\": true, \"nombre\": \"Carlos\", \"rol_id\": 4, \"password\": \"[OCULTO]\", \"telefono\": \"+56 9 4444 4444\", \"created_at\": \"2025-07-08 22:17:34\", \"updated_at\": \"2025-07-08 22:17:34\", \"apellido_materno\": \"\", \"apellido_paterno\": \"Silva\", \"email_verified_at\": \"2025-07-08 22:17:34\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\User\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:34', 'Sistema'),
(45, NULL, 'create', 'apoderados', 4, NULL, '{\"usuario_id\": 4, \"relacion_paciente\": \"padre\", \"es_contacto_emergencia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Apoderado\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'low', '2025-07-08 22:17:34', 'Sistema'),
(46, NULL, 'create', 'users', 5, NULL, '{\"id\": 5, \"name\": \"Ana López\", \"email\": \"paciente@meditrack.com\", \"activo\": true, \"nombre\": \"Ana\", \"rol_id\": 5, \"password\": \"[OCULTO]\", \"telefono\": \"+56 9 5555 5555\", \"created_at\": \"2025-07-08 22:17:34\", \"updated_at\": \"2025-07-08 22:17:34\", \"apellido_materno\": \"\", \"apellido_paterno\": \"López\", \"email_verified_at\": \"2025-07-08 22:17:34\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\User\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'high', '2025-07-08 22:17:34', 'Sistema'),
(47, NULL, 'create', 'pacientes', 1, NULL, '{\"id\": 1, \"activo\": true, \"altura\": 165.5, \"nombre\": \"Ana López\", \"direccion\": \"Av. Principal 123, Santiago\", \"genero_id\": \"F\", \"usuario_id\": 5, \"tipo_sangre\": \"O+\", \"tipo_documento\": \"rut\", \"fecha_nacimiento\": \"1985-03-15 00:00:00\", \"numero_documento\": \"12.345.678-9\", \"telefono_emergencia\": \"+56 9 6666 6666\", \"observaciones_medicas\": \"Alérgica a la penicilina\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Paciente\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(48, NULL, 'create', 'pacientes', 2, NULL, '{\"id\": 2, \"activo\": true, \"altura\": 140, \"nombre\": \"Pedro Silva Menor\", \"direccion\": \"Calle Secundaria 456, Valparaíso\", \"genero_id\": \"M\", \"usuario_id\": null, \"tipo_sangre\": \"A+\", \"tipo_documento\": \"rut\", \"fecha_nacimiento\": \"2010-08-22 00:00:00\", \"numero_documento\": \"25.987.654-3\", \"telefono_emergencia\": \"+56 9 4444 4444\", \"observaciones_medicas\": \"Asma leve, inhalador de rescate\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Paciente\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(49, NULL, 'create', 'tratamientos', 7, NULL, '{\"id\": 7, \"estado\": \"Activo\", \"nombre\": \"Tratamiento Realista Seeder\", \"created_at\": \"2025-07-08 22:17:34\", \"updated_at\": \"2025-07-08 22:17:34\", \"paciente_id\": 1, \"fecha_inicio\": \"2025-06-24 00:00:00\", \"medico_usuario_id\": 2}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Tratamiento\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(50, NULL, 'create', 'medicamentos', 16, NULL, '{\"id\": 16, \"medida\": \"mg\", \"nombre\": \"Paracetamol Seeder\", \"created_at\": \"2025-07-08 22:17:34\", \"updated_at\": \"2025-07-08 22:17:34\", \"unidad_medida\": \"tableta\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Medicamento\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'low', '2025-07-08 22:17:34', 'Sistema'),
(51, NULL, 'create', 'medicamentos_tratamientos', 6, NULL, '{\"id\": 6, \"created_at\": \"2025-07-08 22:17:34\", \"updated_at\": \"2025-07-08 22:17:34\", \"unidad_dosis\": \"tableta\", \"duracion_dias\": 14, \"dosis_cantidad\": 1, \"medicamento_id\": 16, \"tratamiento_id\": 7, \"frecuencia_horas\": 8}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\MedicamentoTratamiento\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'low', '2025-07-08 22:17:34', 'Sistema'),
(52, NULL, 'create', 'administraciones', 10, NULL, '{\"id\": 10, \"estado\": \"administrada\", \"created_at\": \"2025-06-24 07:30:00\", \"updated_at\": \"2025-06-24 07:30:00\", \"paciente_id\": 1, \"minutos_retraso\": 30, \"minutos_adelanto\": 0, \"score_puntualidad\": 47.24, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": 1, \"minutos_diferencia\": 30, \"fecha_hora_programada\": \"2025-06-24 08:00:00\", \"horario_programado_id\": 13, \"fecha_hora_administrada\": \"2025-06-24 07:30:00\", \"medicamento_tratamiento_id\": 6}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(53, NULL, 'create', 'administraciones', 11, NULL, '{\"id\": 11, \"estado\": \"administrada\", \"created_at\": \"2025-06-24 14:45:00\", \"updated_at\": \"2025-06-24 14:45:00\", \"paciente_id\": 1, \"minutos_retraso\": 0, \"minutos_adelanto\": 45, \"score_puntualidad\": 22.31, \"categoria_temporal\": \"temprano\", \"dosis_administrada\": 1, \"minutos_diferencia\": -45, \"fecha_hora_programada\": \"2025-06-24 14:00:00\", \"horario_programado_id\": 14, \"fecha_hora_administrada\": \"2025-06-24 14:45:00\", \"medicamento_tratamiento_id\": 6}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(54, NULL, 'create', 'administraciones', 12, NULL, '{\"id\": 12, \"estado\": \"administrada\", \"created_at\": \"2025-06-24 20:35:00\", \"updated_at\": \"2025-06-24 20:35:00\", \"paciente_id\": 1, \"minutos_retraso\": 0, \"minutos_adelanto\": 35, \"score_puntualidad\": 36.79, \"categoria_temporal\": \"temprano\", \"dosis_administrada\": 1, \"minutos_diferencia\": -35, \"fecha_hora_programada\": \"2025-06-24 20:00:00\", \"horario_programado_id\": 15, \"fecha_hora_administrada\": \"2025-06-24 20:35:00\", \"medicamento_tratamiento_id\": 6}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(55, NULL, 'create', 'administraciones', 13, NULL, '{\"id\": 13, \"estado\": \"administrada\", \"created_at\": \"2025-06-25 07:21:00\", \"updated_at\": \"2025-06-25 07:21:00\", \"paciente_id\": 1, \"minutos_retraso\": 39, \"minutos_adelanto\": 0, \"score_puntualidad\": 30.12, \"categoria_temporal\": \"tardio\", \"dosis_administrada\": 1, \"minutos_diferencia\": 39, \"fecha_hora_programada\": \"2025-06-25 08:00:00\", \"horario_programado_id\": 16, \"fecha_hora_administrada\": \"2025-06-25 07:21:00\", \"medicamento_tratamiento_id\": 6}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(56, NULL, 'create', 'administraciones', 14, NULL, '{\"id\": 14, \"estado\": \"administrada\", \"created_at\": \"2025-06-25 20:06:00\", \"updated_at\": \"2025-06-25 20:06:00\", \"paciente_id\": 1, \"minutos_retraso\": 0, \"minutos_adelanto\": 6, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": 1, \"minutos_diferencia\": -6, \"fecha_hora_programada\": \"2025-06-25 20:00:00\", \"horario_programado_id\": 17, \"fecha_hora_administrada\": \"2025-06-25 20:06:00\", \"medicamento_tratamiento_id\": 6}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(57, NULL, 'create', 'administraciones', 15, NULL, '{\"id\": 15, \"estado\": \"administrada\", \"created_at\": \"2025-06-26 08:10:00\", \"updated_at\": \"2025-06-26 08:10:00\", \"paciente_id\": 1, \"minutos_retraso\": 0, \"minutos_adelanto\": 10, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": 1, \"minutos_diferencia\": -10, \"fecha_hora_programada\": \"2025-06-26 08:00:00\", \"horario_programado_id\": 18, \"fecha_hora_administrada\": \"2025-06-26 08:10:00\", \"medicamento_tratamiento_id\": 6}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(58, NULL, 'create', 'administraciones', 16, NULL, '{\"id\": 16, \"estado\": \"administrada\", \"created_at\": \"2025-06-27 08:06:00\", \"updated_at\": \"2025-06-27 08:06:00\", \"paciente_id\": 1, \"minutos_retraso\": 0, \"minutos_adelanto\": 6, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": 1, \"minutos_diferencia\": -6, \"fecha_hora_programada\": \"2025-06-27 08:00:00\", \"horario_programado_id\": 19, \"fecha_hora_administrada\": \"2025-06-27 08:06:00\", \"medicamento_tratamiento_id\": 6}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(59, NULL, 'create', 'administraciones', 17, NULL, '{\"id\": 17, \"estado\": \"administrada\", \"created_at\": \"2025-06-27 14:10:00\", \"updated_at\": \"2025-06-27 14:10:00\", \"paciente_id\": 1, \"minutos_retraso\": 0, \"minutos_adelanto\": 10, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": 1, \"minutos_diferencia\": -10, \"fecha_hora_programada\": \"2025-06-27 14:00:00\", \"horario_programado_id\": 20, \"fecha_hora_administrada\": \"2025-06-27 14:10:00\", \"medicamento_tratamiento_id\": 6}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(60, NULL, 'create', 'administraciones', 18, NULL, '{\"id\": 18, \"estado\": \"administrada\", \"created_at\": \"2025-06-28 08:09:00\", \"updated_at\": \"2025-06-28 08:09:00\", \"paciente_id\": 1, \"minutos_retraso\": 0, \"minutos_adelanto\": 9, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": 1, \"minutos_diferencia\": -9, \"fecha_hora_programada\": \"2025-06-28 08:00:00\", \"horario_programado_id\": 21, \"fecha_hora_administrada\": \"2025-06-28 08:09:00\", \"medicamento_tratamiento_id\": 6}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(61, NULL, 'create', 'administraciones', 19, NULL, '{\"id\": 19, \"estado\": \"administrada\", \"created_at\": \"2025-06-28 19:40:00\", \"updated_at\": \"2025-06-28 19:40:00\", \"paciente_id\": 1, \"minutos_retraso\": 20, \"minutos_adelanto\": 0, \"score_puntualidad\": 77.88, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": 1, \"minutos_diferencia\": 20, \"fecha_hora_programada\": \"2025-06-28 20:00:00\", \"horario_programado_id\": 22, \"fecha_hora_administrada\": \"2025-06-28 19:40:00\", \"medicamento_tratamiento_id\": 6}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(62, NULL, 'create', 'administraciones', 20, NULL, '{\"id\": 20, \"estado\": \"administrada\", \"created_at\": \"2025-06-29 08:11:00\", \"updated_at\": \"2025-06-29 08:11:00\", \"paciente_id\": 1, \"minutos_retraso\": 0, \"minutos_adelanto\": 11, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": 1, \"minutos_diferencia\": -11, \"fecha_hora_programada\": \"2025-06-29 08:00:00\", \"horario_programado_id\": 10, \"fecha_hora_administrada\": \"2025-06-29 08:11:00\", \"medicamento_tratamiento_id\": 6}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(63, NULL, 'create', 'administraciones', 21, NULL, '{\"id\": 21, \"estado\": \"administrada\", \"created_at\": \"2025-06-30 08:06:00\", \"updated_at\": \"2025-06-30 08:06:00\", \"paciente_id\": 1, \"minutos_retraso\": 0, \"minutos_adelanto\": 6, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": 1, \"minutos_diferencia\": -6, \"fecha_hora_programada\": \"2025-06-30 08:00:00\", \"horario_programado_id\": 11, \"fecha_hora_administrada\": \"2025-06-30 08:06:00\", \"medicamento_tratamiento_id\": 6}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(64, NULL, 'create', 'administraciones', 22, NULL, '{\"id\": 22, \"estado\": \"administrada\", \"created_at\": \"2025-06-30 19:41:00\", \"updated_at\": \"2025-06-30 19:41:00\", \"paciente_id\": 1, \"minutos_retraso\": 19, \"minutos_adelanto\": 0, \"score_puntualidad\": 81.87, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": 1, \"minutos_diferencia\": 19, \"fecha_hora_programada\": \"2025-06-30 20:00:00\", \"horario_programado_id\": 12, \"fecha_hora_administrada\": \"2025-06-30 19:41:00\", \"medicamento_tratamiento_id\": 6}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(65, NULL, 'create', 'administraciones', 23, NULL, '{\"id\": 23, \"estado\": \"administrada\", \"created_at\": \"2025-07-01 07:46:00\", \"updated_at\": \"2025-07-01 07:46:00\", \"paciente_id\": 1, \"minutos_retraso\": 14, \"minutos_adelanto\": 0, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": 1, \"minutos_diferencia\": 14, \"fecha_hora_programada\": \"2025-07-01 08:00:00\", \"horario_programado_id\": 13, \"fecha_hora_administrada\": \"2025-07-01 07:46:00\", \"medicamento_tratamiento_id\": 6}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(66, NULL, 'create', 'administraciones', 24, NULL, '{\"id\": 24, \"estado\": \"administrada\", \"created_at\": \"2025-07-01 14:23:00\", \"updated_at\": \"2025-07-01 14:23:00\", \"paciente_id\": 1, \"minutos_retraso\": 0, \"minutos_adelanto\": 23, \"score_puntualidad\": 67.03, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": 1, \"minutos_diferencia\": -23, \"fecha_hora_programada\": \"2025-07-01 14:00:00\", \"horario_programado_id\": 14, \"fecha_hora_administrada\": \"2025-07-01 14:23:00\", \"medicamento_tratamiento_id\": 6}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(67, NULL, 'create', 'administraciones', 25, NULL, '{\"id\": 25, \"estado\": \"administrada\", \"created_at\": \"2025-07-01 19:42:00\", \"updated_at\": \"2025-07-01 19:42:00\", \"paciente_id\": 1, \"minutos_retraso\": 18, \"minutos_adelanto\": 0, \"score_puntualidad\": 86.07, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": 1, \"minutos_diferencia\": 18, \"fecha_hora_programada\": \"2025-07-01 20:00:00\", \"horario_programado_id\": 15, \"fecha_hora_administrada\": \"2025-07-01 19:42:00\", \"medicamento_tratamiento_id\": 6}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(68, NULL, 'create', 'administraciones', 26, NULL, '{\"id\": 26, \"estado\": \"administrada\", \"created_at\": \"2025-07-02 07:48:00\", \"updated_at\": \"2025-07-02 07:48:00\", \"paciente_id\": 1, \"minutos_retraso\": 12, \"minutos_adelanto\": 0, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": 1, \"minutos_diferencia\": 12, \"fecha_hora_programada\": \"2025-07-02 08:00:00\", \"horario_programado_id\": 16, \"fecha_hora_administrada\": \"2025-07-02 07:48:00\", \"medicamento_tratamiento_id\": 6}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(69, NULL, 'create', 'administraciones', 27, NULL, '{\"id\": 27, \"estado\": \"administrada\", \"created_at\": \"2025-07-02 20:20:00\", \"updated_at\": \"2025-07-02 20:20:00\", \"paciente_id\": 1, \"minutos_retraso\": 0, \"minutos_adelanto\": 20, \"score_puntualidad\": 77.88, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": 1, \"minutos_diferencia\": -20, \"fecha_hora_programada\": \"2025-07-02 20:00:00\", \"horario_programado_id\": 17, \"fecha_hora_administrada\": \"2025-07-02 20:20:00\", \"medicamento_tratamiento_id\": 6}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(70, NULL, 'create', 'administraciones', 28, NULL, '{\"id\": 28, \"estado\": \"administrada\", \"created_at\": \"2025-07-03 07:52:00\", \"updated_at\": \"2025-07-03 07:52:00\", \"paciente_id\": 1, \"minutos_retraso\": 8, \"minutos_adelanto\": 0, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": 1, \"minutos_diferencia\": 8, \"fecha_hora_programada\": \"2025-07-03 08:00:00\", \"horario_programado_id\": 18, \"fecha_hora_administrada\": \"2025-07-03 07:52:00\", \"medicamento_tratamiento_id\": 6}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(71, NULL, 'create', 'administraciones', 29, NULL, '{\"id\": 29, \"estado\": \"administrada\", \"created_at\": \"2025-07-04 08:11:00\", \"updated_at\": \"2025-07-04 08:11:00\", \"paciente_id\": 1, \"minutos_retraso\": 0, \"minutos_adelanto\": 11, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": 1, \"minutos_diferencia\": -11, \"fecha_hora_programada\": \"2025-07-04 08:00:00\", \"horario_programado_id\": 19, \"fecha_hora_administrada\": \"2025-07-04 08:11:00\", \"medicamento_tratamiento_id\": 6}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(72, NULL, 'create', 'administraciones', 30, NULL, '{\"id\": 30, \"estado\": \"administrada\", \"created_at\": \"2025-07-04 13:48:00\", \"updated_at\": \"2025-07-04 13:48:00\", \"paciente_id\": 1, \"minutos_retraso\": 12, \"minutos_adelanto\": 0, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": 1, \"minutos_diferencia\": 12, \"fecha_hora_programada\": \"2025-07-04 14:00:00\", \"horario_programado_id\": 20, \"fecha_hora_administrada\": \"2025-07-04 13:48:00\", \"medicamento_tratamiento_id\": 6}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(73, NULL, 'create', 'administraciones', 31, NULL, '{\"id\": 31, \"estado\": \"administrada\", \"created_at\": \"2025-07-05 08:06:00\", \"updated_at\": \"2025-07-05 08:06:00\", \"paciente_id\": 1, \"minutos_retraso\": 0, \"minutos_adelanto\": 6, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": 1, \"minutos_diferencia\": -6, \"fecha_hora_programada\": \"2025-07-05 08:00:00\", \"horario_programado_id\": 21, \"fecha_hora_administrada\": \"2025-07-05 08:06:00\", \"medicamento_tratamiento_id\": 6}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(74, NULL, 'create', 'administraciones', 32, NULL, '{\"id\": 32, \"estado\": \"administrada\", \"created_at\": \"2025-07-05 19:53:00\", \"updated_at\": \"2025-07-05 19:53:00\", \"paciente_id\": 1, \"minutos_retraso\": 7, \"minutos_adelanto\": 0, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": 1, \"minutos_diferencia\": 7, \"fecha_hora_programada\": \"2025-07-05 20:00:00\", \"horario_programado_id\": 22, \"fecha_hora_administrada\": \"2025-07-05 19:53:00\", \"medicamento_tratamiento_id\": 6}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(75, NULL, 'create', 'administraciones', 33, NULL, '{\"id\": 33, \"estado\": \"administrada\", \"created_at\": \"2025-07-06 08:06:00\", \"updated_at\": \"2025-07-06 08:06:00\", \"paciente_id\": 1, \"minutos_retraso\": 0, \"minutos_adelanto\": 6, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": 1, \"minutos_diferencia\": -6, \"fecha_hora_programada\": \"2025-07-06 08:00:00\", \"horario_programado_id\": 10, \"fecha_hora_administrada\": \"2025-07-06 08:06:00\", \"medicamento_tratamiento_id\": 6}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(76, NULL, 'create', 'administraciones', 34, NULL, '{\"id\": 34, \"estado\": \"administrada\", \"created_at\": \"2025-07-07 08:08:00\", \"updated_at\": \"2025-07-07 08:08:00\", \"paciente_id\": 1, \"minutos_retraso\": 0, \"minutos_adelanto\": 8, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": 1, \"minutos_diferencia\": -8, \"fecha_hora_programada\": \"2025-07-07 08:00:00\", \"horario_programado_id\": 11, \"fecha_hora_administrada\": \"2025-07-07 08:08:00\", \"medicamento_tratamiento_id\": 6}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(77, NULL, 'create', 'administraciones', 35, NULL, '{\"id\": 35, \"estado\": \"administrada\", \"created_at\": \"2025-07-07 20:12:00\", \"updated_at\": \"2025-07-07 20:12:00\", \"paciente_id\": 1, \"minutos_retraso\": 0, \"minutos_adelanto\": 12, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": 1, \"minutos_diferencia\": -12, \"fecha_hora_programada\": \"2025-07-07 20:00:00\", \"horario_programado_id\": 12, \"fecha_hora_administrada\": \"2025-07-07 20:12:00\", \"medicamento_tratamiento_id\": 6}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(78, NULL, 'create', 'medicamentos', 17, NULL, '{\"id\": 17, \"medida\": \"400\", \"nombre\": \"Ibuprofeno\", \"created_at\": \"2025-06-24 00:00:00\", \"updated_at\": \"2025-06-24 00:00:00\", \"descripcion\": \"Antiinflamatorio no esteroideo\", \"unidad_medida\": \"mg\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Medicamento\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'low', '2025-07-08 22:17:34', 'Sistema'),
(79, NULL, 'create', 'tratamientos', 8, NULL, '{\"id\": 8, \"estado\": \"Activo\", \"nombre\": \"Tratamiento Ibuprofeno\", \"fecha_fin\": \"2025-10-08 23:59:59\", \"created_at\": \"2025-06-24 00:00:00\", \"updated_at\": \"2025-06-24 00:00:00\", \"diagnostico\": \"Tratamiento con Ibuprofeno\", \"paciente_id\": 2, \"fecha_inicio\": \"2025-06-24 00:00:00\", \"observaciones\": \"Antiinflamatorio no esteroideo\", \"medico_usuario_id\": 2}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Tratamiento\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(80, NULL, 'create', 'medicamentos_tratamientos', 7, NULL, '{\"id\": 7, \"activo\": true, \"created_at\": \"2025-06-24 00:00:00\", \"updated_at\": \"2025-06-24 00:00:00\", \"unidad_dosis\": \"mg\", \"duracion_dias\": 90, \"dosis_cantidad\": \"400\", \"medicamento_id\": 17, \"tratamiento_id\": 8, \"frecuencia_horas\": 12}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\MedicamentoTratamiento\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'low', '2025-07-08 22:17:34', 'Sistema'),
(81, NULL, 'create', 'administraciones', 36, NULL, '{\"id\": 36, \"estado\": \"Administrada\", \"created_at\": \"2025-06-24 09:05:00\", \"updated_at\": \"2025-06-24 09:05:00\", \"paciente_id\": 2, \"observaciones\": \"Ligero retraso\", \"minutos_retraso\": 0, \"minutos_adelanto\": 5, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"400\", \"minutos_diferencia\": 5, \"fecha_hora_programada\": \"2025-06-24 09:00:00\", \"horario_programado_id\": 23, \"fecha_hora_administrada\": \"2025-06-24 09:05:00\", \"medicamento_tratamiento_id\": 7, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema');
INSERT INTO `audit_logs` (`id`, `usuario_id`, `accion`, `tabla_afectada`, `registro_id`, `datos_anteriores`, `datos_nuevos`, `ip_address`, `user_agent`, `metodo_http`, `url`, `ruta`, `contexto_adicional`, `session_id`, `severidad`, `created_at`, `created_by_name`) VALUES
(82, NULL, 'create', 'administraciones', 37, NULL, '{\"id\": 37, \"estado\": \"Administrada\", \"created_at\": \"2025-06-25 09:06:00\", \"updated_at\": \"2025-06-25 09:06:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso moderado\", \"minutos_retraso\": 0, \"minutos_adelanto\": 6, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"400\", \"minutos_diferencia\": 6, \"fecha_hora_programada\": \"2025-06-25 09:00:00\", \"horario_programado_id\": 23, \"fecha_hora_administrada\": \"2025-06-25 09:06:00\", \"medicamento_tratamiento_id\": 7, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(83, NULL, 'create', 'administraciones', 38, NULL, '{\"id\": 38, \"estado\": \"Administrada\", \"created_at\": \"2025-06-26 09:09:00\", \"updated_at\": \"2025-06-26 09:09:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso moderado\", \"minutos_retraso\": 0, \"minutos_adelanto\": 9, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"400\", \"minutos_diferencia\": 9, \"fecha_hora_programada\": \"2025-06-26 09:00:00\", \"horario_programado_id\": 23, \"fecha_hora_administrada\": \"2025-06-26 09:09:00\", \"medicamento_tratamiento_id\": 7, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(84, NULL, 'create', 'administraciones', 39, NULL, '{\"id\": 39, \"estado\": \"Administrada\", \"created_at\": \"2025-06-27 09:11:00\", \"updated_at\": \"2025-06-27 09:11:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso moderado\", \"minutos_retraso\": 0, \"minutos_adelanto\": 11, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"400\", \"minutos_diferencia\": 11, \"fecha_hora_programada\": \"2025-06-27 09:00:00\", \"horario_programado_id\": 23, \"fecha_hora_administrada\": \"2025-06-27 09:11:00\", \"medicamento_tratamiento_id\": 7, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(85, NULL, 'create', 'administraciones', 40, NULL, '{\"id\": 40, \"estado\": \"Administrada\", \"created_at\": \"2025-06-28 09:00:00\", \"updated_at\": \"2025-06-28 09:00:00\", \"paciente_id\": 2, \"observaciones\": \"Administrado puntualmente\", \"minutos_retraso\": 0, \"minutos_adelanto\": 0, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"400\", \"minutos_diferencia\": 0, \"fecha_hora_programada\": \"2025-06-28 09:00:00\", \"horario_programado_id\": 23, \"fecha_hora_administrada\": \"2025-06-28 09:00:00\", \"medicamento_tratamiento_id\": 7, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(86, NULL, 'create', 'administraciones', 41, NULL, '{\"id\": 41, \"estado\": \"Administrada\", \"created_at\": \"2025-06-29 09:18:00\", \"updated_at\": \"2025-06-29 09:18:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso significativo\", \"minutos_retraso\": 0, \"minutos_adelanto\": 18, \"score_puntualidad\": 86.07, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"400\", \"minutos_diferencia\": 18, \"fecha_hora_programada\": \"2025-06-29 09:00:00\", \"horario_programado_id\": 23, \"fecha_hora_administrada\": \"2025-06-29 09:18:00\", \"medicamento_tratamiento_id\": 7, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(87, NULL, 'create', 'administraciones', 42, NULL, '{\"id\": 42, \"estado\": \"Administrada\", \"created_at\": \"2025-06-30 08:58:00\", \"updated_at\": \"2025-06-30 08:58:00\", \"paciente_id\": 2, \"observaciones\": \"Ligeramente adelantado\", \"minutos_retraso\": 2, \"minutos_adelanto\": 0, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"400\", \"minutos_diferencia\": -2, \"fecha_hora_programada\": \"2025-06-30 09:00:00\", \"horario_programado_id\": 23, \"fecha_hora_administrada\": \"2025-06-30 08:58:00\", \"medicamento_tratamiento_id\": 7, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(88, NULL, 'create', 'administraciones', 43, NULL, '{\"id\": 43, \"estado\": \"Administrada\", \"created_at\": \"2025-07-01 09:27:00\", \"updated_at\": \"2025-07-01 09:27:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso significativo\", \"minutos_retraso\": 0, \"minutos_adelanto\": 27, \"score_puntualidad\": 54.88, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"400\", \"minutos_diferencia\": 27, \"fecha_hora_programada\": \"2025-07-01 09:00:00\", \"horario_programado_id\": 23, \"fecha_hora_administrada\": \"2025-07-01 09:27:00\", \"medicamento_tratamiento_id\": 7, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(89, NULL, 'create', 'administraciones', 44, NULL, '{\"id\": 44, \"estado\": \"Administrada\", \"created_at\": \"2025-07-02 08:53:00\", \"updated_at\": \"2025-07-02 08:53:00\", \"paciente_id\": 2, \"observaciones\": \"Moderadamente adelantado\", \"minutos_retraso\": 7, \"minutos_adelanto\": 0, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"400\", \"minutos_diferencia\": -7, \"fecha_hora_programada\": \"2025-07-02 09:00:00\", \"horario_programado_id\": 23, \"fecha_hora_administrada\": \"2025-07-02 08:53:00\", \"medicamento_tratamiento_id\": 7, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(90, NULL, 'create', 'administraciones', 45, NULL, '{\"id\": 45, \"estado\": \"Administrada\", \"created_at\": \"2025-07-03 09:04:00\", \"updated_at\": \"2025-07-03 09:04:00\", \"paciente_id\": 2, \"observaciones\": \"Ligero retraso\", \"minutos_retraso\": 0, \"minutos_adelanto\": 4, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"400\", \"minutos_diferencia\": 4, \"fecha_hora_programada\": \"2025-07-03 09:00:00\", \"horario_programado_id\": 23, \"fecha_hora_administrada\": \"2025-07-03 09:04:00\", \"medicamento_tratamiento_id\": 7, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(91, NULL, 'create', 'administraciones', 46, NULL, '{\"id\": 46, \"estado\": \"Administrada\", \"created_at\": \"2025-07-04 09:04:00\", \"updated_at\": \"2025-07-04 09:04:00\", \"paciente_id\": 2, \"observaciones\": \"Ligero retraso\", \"minutos_retraso\": 0, \"minutos_adelanto\": 4, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"400\", \"minutos_diferencia\": 4, \"fecha_hora_programada\": \"2025-07-04 09:00:00\", \"horario_programado_id\": 23, \"fecha_hora_administrada\": \"2025-07-04 09:04:00\", \"medicamento_tratamiento_id\": 7, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(92, NULL, 'create', 'administraciones', 47, NULL, '{\"id\": 47, \"estado\": \"Administrada\", \"created_at\": \"2025-07-05 08:58:00\", \"updated_at\": \"2025-07-05 08:58:00\", \"paciente_id\": 2, \"observaciones\": \"Ligeramente adelantado\", \"minutos_retraso\": 2, \"minutos_adelanto\": 0, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"400\", \"minutos_diferencia\": -2, \"fecha_hora_programada\": \"2025-07-05 09:00:00\", \"horario_programado_id\": 23, \"fecha_hora_administrada\": \"2025-07-05 08:58:00\", \"medicamento_tratamiento_id\": 7, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(93, NULL, 'create', 'administraciones', 48, NULL, '{\"id\": 48, \"estado\": \"Administrada\", \"created_at\": \"2025-07-06 09:19:00\", \"updated_at\": \"2025-07-06 09:19:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso significativo\", \"minutos_retraso\": 0, \"minutos_adelanto\": 19, \"score_puntualidad\": 81.87, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"400\", \"minutos_diferencia\": 19, \"fecha_hora_programada\": \"2025-07-06 09:00:00\", \"horario_programado_id\": 23, \"fecha_hora_administrada\": \"2025-07-06 09:19:00\", \"medicamento_tratamiento_id\": 7, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(94, NULL, 'create', 'administraciones', 49, NULL, '{\"id\": 49, \"estado\": \"Administrada\", \"created_at\": \"2025-07-07 09:27:00\", \"updated_at\": \"2025-07-07 09:27:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso significativo\", \"minutos_retraso\": 0, \"minutos_adelanto\": 27, \"score_puntualidad\": 54.88, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"400\", \"minutos_diferencia\": 27, \"fecha_hora_programada\": \"2025-07-07 09:00:00\", \"horario_programado_id\": 23, \"fecha_hora_administrada\": \"2025-07-07 09:27:00\", \"medicamento_tratamiento_id\": 7, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(95, NULL, 'create', 'administraciones', 50, NULL, '{\"id\": 50, \"estado\": \"Administrada\", \"created_at\": \"2025-07-08 09:30:00\", \"updated_at\": \"2025-07-08 09:30:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso significativo\", \"minutos_retraso\": 0, \"minutos_adelanto\": 30, \"score_puntualidad\": 47.24, \"categoria_temporal\": \"temprano\", \"dosis_administrada\": \"400\", \"minutos_diferencia\": 30, \"fecha_hora_programada\": \"2025-07-08 09:00:00\", \"horario_programado_id\": 23, \"fecha_hora_administrada\": \"2025-07-08 09:30:00\", \"medicamento_tratamiento_id\": 7, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(96, NULL, 'create', 'administraciones', 51, NULL, '{\"id\": 51, \"estado\": \"Administrada\", \"created_at\": \"2025-06-24 21:01:00\", \"updated_at\": \"2025-06-24 21:01:00\", \"paciente_id\": 2, \"observaciones\": \"Ligero retraso\", \"minutos_retraso\": 0, \"minutos_adelanto\": 1, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"400\", \"minutos_diferencia\": 1, \"fecha_hora_programada\": \"2025-06-24 21:00:00\", \"horario_programado_id\": 24, \"fecha_hora_administrada\": \"2025-06-24 21:01:00\", \"medicamento_tratamiento_id\": 7, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(97, NULL, 'create', 'administraciones', 52, NULL, '{\"id\": 52, \"estado\": \"Administrada\", \"created_at\": \"2025-06-25 20:47:00\", \"updated_at\": \"2025-06-25 20:47:00\", \"paciente_id\": 2, \"observaciones\": \"Moderadamente adelantado\", \"minutos_retraso\": 13, \"minutos_adelanto\": 0, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"400\", \"minutos_diferencia\": -13, \"fecha_hora_programada\": \"2025-06-25 21:00:00\", \"horario_programado_id\": 24, \"fecha_hora_administrada\": \"2025-06-25 20:47:00\", \"medicamento_tratamiento_id\": 7, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(98, NULL, 'create', 'administraciones', 53, NULL, '{\"id\": 53, \"estado\": \"Administrada\", \"created_at\": \"2025-06-26 21:04:00\", \"updated_at\": \"2025-06-26 21:04:00\", \"paciente_id\": 2, \"observaciones\": \"Ligero retraso\", \"minutos_retraso\": 0, \"minutos_adelanto\": 4, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"400\", \"minutos_diferencia\": 4, \"fecha_hora_programada\": \"2025-06-26 21:00:00\", \"horario_programado_id\": 24, \"fecha_hora_administrada\": \"2025-06-26 21:04:00\", \"medicamento_tratamiento_id\": 7, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:34', 'Sistema'),
(99, NULL, 'create', 'administraciones', 54, NULL, '{\"id\": 54, \"estado\": \"Administrada\", \"created_at\": \"2025-06-27 20:53:00\", \"updated_at\": \"2025-06-27 20:53:00\", \"paciente_id\": 2, \"observaciones\": \"Moderadamente adelantado\", \"minutos_retraso\": 7, \"minutos_adelanto\": 0, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"400\", \"minutos_diferencia\": -7, \"fecha_hora_programada\": \"2025-06-27 21:00:00\", \"horario_programado_id\": 24, \"fecha_hora_administrada\": \"2025-06-27 20:53:00\", \"medicamento_tratamiento_id\": 7, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(100, NULL, 'create', 'administraciones', 55, NULL, '{\"id\": 55, \"estado\": \"Administrada\", \"created_at\": \"2025-06-28 21:16:00\", \"updated_at\": \"2025-06-28 21:16:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso significativo\", \"minutos_retraso\": 0, \"minutos_adelanto\": 16, \"score_puntualidad\": 95.12, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"400\", \"minutos_diferencia\": 16, \"fecha_hora_programada\": \"2025-06-28 21:00:00\", \"horario_programado_id\": 24, \"fecha_hora_administrada\": \"2025-06-28 21:16:00\", \"medicamento_tratamiento_id\": 7, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(101, NULL, 'create', 'administraciones', 56, NULL, '{\"id\": 56, \"estado\": \"Administrada\", \"created_at\": \"2025-06-29 21:25:00\", \"updated_at\": \"2025-06-29 21:25:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso significativo\", \"minutos_retraso\": 0, \"minutos_adelanto\": 25, \"score_puntualidad\": 60.65, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"400\", \"minutos_diferencia\": 25, \"fecha_hora_programada\": \"2025-06-29 21:00:00\", \"horario_programado_id\": 24, \"fecha_hora_administrada\": \"2025-06-29 21:25:00\", \"medicamento_tratamiento_id\": 7, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(102, NULL, 'create', 'administraciones', 57, NULL, '{\"id\": 57, \"estado\": \"Administrada\", \"created_at\": \"2025-06-30 20:57:00\", \"updated_at\": \"2025-06-30 20:57:00\", \"paciente_id\": 2, \"observaciones\": \"Ligeramente adelantado\", \"minutos_retraso\": 3, \"minutos_adelanto\": 0, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"400\", \"minutos_diferencia\": -3, \"fecha_hora_programada\": \"2025-06-30 21:00:00\", \"horario_programado_id\": 24, \"fecha_hora_administrada\": \"2025-06-30 20:57:00\", \"medicamento_tratamiento_id\": 7, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(103, NULL, 'create', 'administraciones', 58, NULL, '{\"id\": 58, \"estado\": \"Administrada\", \"created_at\": \"2025-07-01 21:08:00\", \"updated_at\": \"2025-07-01 21:08:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso moderado\", \"minutos_retraso\": 0, \"minutos_adelanto\": 8, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"400\", \"minutos_diferencia\": 8, \"fecha_hora_programada\": \"2025-07-01 21:00:00\", \"horario_programado_id\": 24, \"fecha_hora_administrada\": \"2025-07-01 21:08:00\", \"medicamento_tratamiento_id\": 7, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(104, NULL, 'create', 'administraciones', 59, NULL, '{\"id\": 59, \"estado\": \"Administrada\", \"created_at\": \"2025-07-02 21:10:00\", \"updated_at\": \"2025-07-02 21:10:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso moderado\", \"minutos_retraso\": 0, \"minutos_adelanto\": 10, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"400\", \"minutos_diferencia\": 10, \"fecha_hora_programada\": \"2025-07-02 21:00:00\", \"horario_programado_id\": 24, \"fecha_hora_administrada\": \"2025-07-02 21:10:00\", \"medicamento_tratamiento_id\": 7, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(105, NULL, 'create', 'administraciones', 60, NULL, '{\"id\": 60, \"estado\": \"Administrada\", \"created_at\": \"2025-07-03 21:07:00\", \"updated_at\": \"2025-07-03 21:07:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso moderado\", \"minutos_retraso\": 0, \"minutos_adelanto\": 7, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"400\", \"minutos_diferencia\": 7, \"fecha_hora_programada\": \"2025-07-03 21:00:00\", \"horario_programado_id\": 24, \"fecha_hora_administrada\": \"2025-07-03 21:07:00\", \"medicamento_tratamiento_id\": 7, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(106, NULL, 'create', 'administraciones', 61, NULL, '{\"id\": 61, \"estado\": \"Administrada\", \"created_at\": \"2025-07-04 20:39:00\", \"updated_at\": \"2025-07-04 20:39:00\", \"paciente_id\": 2, \"observaciones\": \"Significativamente adelantado\", \"minutos_retraso\": 21, \"minutos_adelanto\": 0, \"score_puntualidad\": 74.08, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"400\", \"minutos_diferencia\": -21, \"fecha_hora_programada\": \"2025-07-04 21:00:00\", \"horario_programado_id\": 24, \"fecha_hora_administrada\": \"2025-07-04 20:39:00\", \"medicamento_tratamiento_id\": 7, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(107, NULL, 'create', 'administraciones', 62, NULL, '{\"id\": 62, \"estado\": \"Administrada\", \"created_at\": \"2025-07-05 21:11:00\", \"updated_at\": \"2025-07-05 21:11:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso moderado\", \"minutos_retraso\": 0, \"minutos_adelanto\": 11, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"400\", \"minutos_diferencia\": 11, \"fecha_hora_programada\": \"2025-07-05 21:00:00\", \"horario_programado_id\": 24, \"fecha_hora_administrada\": \"2025-07-05 21:11:00\", \"medicamento_tratamiento_id\": 7, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(108, NULL, 'create', 'administraciones', 63, NULL, '{\"id\": 63, \"estado\": \"Administrada\", \"created_at\": \"2025-07-06 21:16:00\", \"updated_at\": \"2025-07-06 21:16:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso significativo\", \"minutos_retraso\": 0, \"minutos_adelanto\": 16, \"score_puntualidad\": 95.12, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"400\", \"minutos_diferencia\": 16, \"fecha_hora_programada\": \"2025-07-06 21:00:00\", \"horario_programado_id\": 24, \"fecha_hora_administrada\": \"2025-07-06 21:16:00\", \"medicamento_tratamiento_id\": 7, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(109, NULL, 'create', 'administraciones', 64, NULL, '{\"id\": 64, \"estado\": \"Administrada\", \"created_at\": \"2025-07-07 20:38:00\", \"updated_at\": \"2025-07-07 20:38:00\", \"paciente_id\": 2, \"observaciones\": \"Significativamente adelantado\", \"minutos_retraso\": 22, \"minutos_adelanto\": 0, \"score_puntualidad\": 70.47, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"400\", \"minutos_diferencia\": -22, \"fecha_hora_programada\": \"2025-07-07 21:00:00\", \"horario_programado_id\": 24, \"fecha_hora_administrada\": \"2025-07-07 20:38:00\", \"medicamento_tratamiento_id\": 7, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(110, NULL, 'create', 'administraciones', 65, NULL, '{\"id\": 65, \"estado\": \"Administrada\", \"created_at\": \"2025-07-08 21:07:00\", \"updated_at\": \"2025-07-08 21:07:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso moderado\", \"minutos_retraso\": 0, \"minutos_adelanto\": 7, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"400\", \"minutos_diferencia\": 7, \"fecha_hora_programada\": \"2025-07-08 21:00:00\", \"horario_programado_id\": 24, \"fecha_hora_administrada\": \"2025-07-08 21:07:00\", \"medicamento_tratamiento_id\": 7, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(111, NULL, 'create', 'medicamentos', 18, NULL, '{\"id\": 18, \"medida\": \"20\", \"nombre\": \"Omeprazol\", \"created_at\": \"2025-06-24 00:00:00\", \"updated_at\": \"2025-06-24 00:00:00\", \"descripcion\": \"Inhibidor de la bomba de protones\", \"unidad_medida\": \"mg\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Medicamento\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'low', '2025-07-08 22:17:35', 'Sistema'),
(112, NULL, 'create', 'tratamientos', 9, NULL, '{\"id\": 9, \"estado\": \"Activo\", \"nombre\": \"Tratamiento Omeprazol\", \"fecha_fin\": \"2025-10-08 23:59:59\", \"created_at\": \"2025-06-24 00:00:00\", \"updated_at\": \"2025-06-24 00:00:00\", \"diagnostico\": \"Tratamiento con Omeprazol\", \"paciente_id\": 2, \"fecha_inicio\": \"2025-06-24 00:00:00\", \"observaciones\": \"Inhibidor de la bomba de protones\", \"medico_usuario_id\": 2}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Tratamiento\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(113, NULL, 'create', 'medicamentos_tratamientos', 8, NULL, '{\"id\": 8, \"activo\": true, \"created_at\": \"2025-06-24 00:00:00\", \"updated_at\": \"2025-06-24 00:00:00\", \"unidad_dosis\": \"mg\", \"duracion_dias\": 90, \"dosis_cantidad\": \"20\", \"medicamento_id\": 18, \"tratamiento_id\": 9, \"frecuencia_horas\": 24}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\MedicamentoTratamiento\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'low', '2025-07-08 22:17:35', 'Sistema'),
(114, NULL, 'create', 'administraciones', 66, NULL, '{\"id\": 66, \"estado\": \"Administrada\", \"created_at\": \"2025-06-24 08:02:00\", \"updated_at\": \"2025-06-24 08:02:00\", \"paciente_id\": 2, \"observaciones\": \"Ligero retraso\", \"minutos_retraso\": 0, \"minutos_adelanto\": 2, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"20\", \"minutos_diferencia\": 2, \"fecha_hora_programada\": \"2025-06-24 08:00:00\", \"horario_programado_id\": 25, \"fecha_hora_administrada\": \"2025-06-24 08:02:00\", \"medicamento_tratamiento_id\": 8, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(115, NULL, 'create', 'administraciones', 67, NULL, '{\"id\": 67, \"estado\": \"Administrada\", \"created_at\": \"2025-06-25 08:07:00\", \"updated_at\": \"2025-06-25 08:07:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso moderado\", \"minutos_retraso\": 0, \"minutos_adelanto\": 7, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"20\", \"minutos_diferencia\": 7, \"fecha_hora_programada\": \"2025-06-25 08:00:00\", \"horario_programado_id\": 25, \"fecha_hora_administrada\": \"2025-06-25 08:07:00\", \"medicamento_tratamiento_id\": 8, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(116, NULL, 'create', 'administraciones', 68, NULL, '{\"id\": 68, \"estado\": \"Administrada\", \"created_at\": \"2025-06-26 07:57:00\", \"updated_at\": \"2025-06-26 07:57:00\", \"paciente_id\": 2, \"observaciones\": \"Ligeramente adelantado\", \"minutos_retraso\": 3, \"minutos_adelanto\": 0, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"20\", \"minutos_diferencia\": -3, \"fecha_hora_programada\": \"2025-06-26 08:00:00\", \"horario_programado_id\": 25, \"fecha_hora_administrada\": \"2025-06-26 07:57:00\", \"medicamento_tratamiento_id\": 8, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(117, NULL, 'create', 'administraciones', 69, NULL, '{\"id\": 69, \"estado\": \"Administrada\", \"created_at\": \"2025-06-27 07:59:00\", \"updated_at\": \"2025-06-27 07:59:00\", \"paciente_id\": 2, \"observaciones\": \"Ligeramente adelantado\", \"minutos_retraso\": 1, \"minutos_adelanto\": 0, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"20\", \"minutos_diferencia\": -1, \"fecha_hora_programada\": \"2025-06-27 08:00:00\", \"horario_programado_id\": 25, \"fecha_hora_administrada\": \"2025-06-27 07:59:00\", \"medicamento_tratamiento_id\": 8, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(118, NULL, 'create', 'administraciones', 70, NULL, '{\"id\": 70, \"estado\": \"Administrada\", \"created_at\": \"2025-06-28 08:02:00\", \"updated_at\": \"2025-06-28 08:02:00\", \"paciente_id\": 2, \"observaciones\": \"Ligero retraso\", \"minutos_retraso\": 0, \"minutos_adelanto\": 2, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"20\", \"minutos_diferencia\": 2, \"fecha_hora_programada\": \"2025-06-28 08:00:00\", \"horario_programado_id\": 25, \"fecha_hora_administrada\": \"2025-06-28 08:02:00\", \"medicamento_tratamiento_id\": 8, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(119, NULL, 'create', 'administraciones', 71, NULL, '{\"id\": 71, \"estado\": \"Administrada\", \"created_at\": \"2025-06-29 08:05:00\", \"updated_at\": \"2025-06-29 08:05:00\", \"paciente_id\": 2, \"observaciones\": \"Ligero retraso\", \"minutos_retraso\": 0, \"minutos_adelanto\": 5, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"20\", \"minutos_diferencia\": 5, \"fecha_hora_programada\": \"2025-06-29 08:00:00\", \"horario_programado_id\": 25, \"fecha_hora_administrada\": \"2025-06-29 08:05:00\", \"medicamento_tratamiento_id\": 8, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(120, NULL, 'create', 'administraciones', 72, NULL, '{\"id\": 72, \"estado\": \"Administrada\", \"created_at\": \"2025-06-30 07:59:00\", \"updated_at\": \"2025-06-30 07:59:00\", \"paciente_id\": 2, \"observaciones\": \"Ligeramente adelantado\", \"minutos_retraso\": 1, \"minutos_adelanto\": 0, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"20\", \"minutos_diferencia\": -1, \"fecha_hora_programada\": \"2025-06-30 08:00:00\", \"horario_programado_id\": 25, \"fecha_hora_administrada\": \"2025-06-30 07:59:00\", \"medicamento_tratamiento_id\": 8, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(121, NULL, 'create', 'administraciones', 73, NULL, '{\"id\": 73, \"estado\": \"Administrada\", \"created_at\": \"2025-07-01 08:14:00\", \"updated_at\": \"2025-07-01 08:14:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso moderado\", \"minutos_retraso\": 0, \"minutos_adelanto\": 14, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"20\", \"minutos_diferencia\": 14, \"fecha_hora_programada\": \"2025-07-01 08:00:00\", \"horario_programado_id\": 25, \"fecha_hora_administrada\": \"2025-07-01 08:14:00\", \"medicamento_tratamiento_id\": 8, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(122, NULL, 'create', 'administraciones', 74, NULL, '{\"id\": 74, \"estado\": \"Administrada\", \"created_at\": \"2025-07-02 08:09:00\", \"updated_at\": \"2025-07-02 08:09:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso moderado\", \"minutos_retraso\": 0, \"minutos_adelanto\": 9, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"20\", \"minutos_diferencia\": 9, \"fecha_hora_programada\": \"2025-07-02 08:00:00\", \"horario_programado_id\": 25, \"fecha_hora_administrada\": \"2025-07-02 08:09:00\", \"medicamento_tratamiento_id\": 8, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(123, NULL, 'create', 'administraciones', 75, NULL, '{\"id\": 75, \"estado\": \"Administrada\", \"created_at\": \"2025-07-03 08:17:00\", \"updated_at\": \"2025-07-03 08:17:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso significativo\", \"minutos_retraso\": 0, \"minutos_adelanto\": 17, \"score_puntualidad\": 90.48, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"20\", \"minutos_diferencia\": 17, \"fecha_hora_programada\": \"2025-07-03 08:00:00\", \"horario_programado_id\": 25, \"fecha_hora_administrada\": \"2025-07-03 08:17:00\", \"medicamento_tratamiento_id\": 8, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(124, NULL, 'create', 'administraciones', 76, NULL, '{\"id\": 76, \"estado\": \"Administrada\", \"created_at\": \"2025-07-04 08:17:00\", \"updated_at\": \"2025-07-04 08:17:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso significativo\", \"minutos_retraso\": 0, \"minutos_adelanto\": 17, \"score_puntualidad\": 90.48, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"20\", \"minutos_diferencia\": 17, \"fecha_hora_programada\": \"2025-07-04 08:00:00\", \"horario_programado_id\": 25, \"fecha_hora_administrada\": \"2025-07-04 08:17:00\", \"medicamento_tratamiento_id\": 8, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(125, NULL, 'create', 'administraciones', 77, NULL, '{\"id\": 77, \"estado\": \"Administrada\", \"created_at\": \"2025-07-05 08:14:00\", \"updated_at\": \"2025-07-05 08:14:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso moderado\", \"minutos_retraso\": 0, \"minutos_adelanto\": 14, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"20\", \"minutos_diferencia\": 14, \"fecha_hora_programada\": \"2025-07-05 08:00:00\", \"horario_programado_id\": 25, \"fecha_hora_administrada\": \"2025-07-05 08:14:00\", \"medicamento_tratamiento_id\": 8, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(126, NULL, 'create', 'administraciones', 78, NULL, '{\"id\": 78, \"estado\": \"Administrada\", \"created_at\": \"2025-07-06 08:16:00\", \"updated_at\": \"2025-07-06 08:16:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso significativo\", \"minutos_retraso\": 0, \"minutos_adelanto\": 16, \"score_puntualidad\": 95.12, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"20\", \"minutos_diferencia\": 16, \"fecha_hora_programada\": \"2025-07-06 08:00:00\", \"horario_programado_id\": 25, \"fecha_hora_administrada\": \"2025-07-06 08:16:00\", \"medicamento_tratamiento_id\": 8, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(127, NULL, 'create', 'administraciones', 79, NULL, '{\"id\": 79, \"estado\": \"Administrada\", \"created_at\": \"2025-07-07 08:19:00\", \"updated_at\": \"2025-07-07 08:19:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso significativo\", \"minutos_retraso\": 0, \"minutos_adelanto\": 19, \"score_puntualidad\": 81.87, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"20\", \"minutos_diferencia\": 19, \"fecha_hora_programada\": \"2025-07-07 08:00:00\", \"horario_programado_id\": 25, \"fecha_hora_administrada\": \"2025-07-07 08:19:00\", \"medicamento_tratamiento_id\": 8, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(128, NULL, 'create', 'administraciones', 80, NULL, '{\"id\": 80, \"estado\": \"Administrada\", \"created_at\": \"2025-07-08 08:26:00\", \"updated_at\": \"2025-07-08 08:26:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso significativo\", \"minutos_retraso\": 0, \"minutos_adelanto\": 26, \"score_puntualidad\": 57.69, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"20\", \"minutos_diferencia\": 26, \"fecha_hora_programada\": \"2025-07-08 08:00:00\", \"horario_programado_id\": 25, \"fecha_hora_administrada\": \"2025-07-08 08:26:00\", \"medicamento_tratamiento_id\": 8, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(129, NULL, 'create', 'medicamentos', 19, NULL, '{\"id\": 19, \"medida\": \"850\", \"nombre\": \"Metformina\", \"created_at\": \"2025-06-24 00:00:00\", \"updated_at\": \"2025-06-24 00:00:00\", \"descripcion\": \"Antidiabético oral\", \"unidad_medida\": \"mg\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Medicamento\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'low', '2025-07-08 22:17:35', 'Sistema'),
(130, NULL, 'create', 'tratamientos', 10, NULL, '{\"id\": 10, \"estado\": \"Activo\", \"nombre\": \"Tratamiento Metformina\", \"fecha_fin\": \"2025-10-08 23:59:59\", \"created_at\": \"2025-06-24 00:00:00\", \"updated_at\": \"2025-06-24 00:00:00\", \"diagnostico\": \"Tratamiento con Metformina\", \"paciente_id\": 2, \"fecha_inicio\": \"2025-06-24 00:00:00\", \"observaciones\": \"Antidiabético oral\", \"medico_usuario_id\": 2}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Tratamiento\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(131, NULL, 'create', 'medicamentos_tratamientos', 9, NULL, '{\"id\": 9, \"activo\": true, \"created_at\": \"2025-06-24 00:00:00\", \"updated_at\": \"2025-06-24 00:00:00\", \"unidad_dosis\": \"mg\", \"duracion_dias\": 90, \"dosis_cantidad\": \"850\", \"medicamento_id\": 19, \"tratamiento_id\": 10, \"frecuencia_horas\": 8}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\MedicamentoTratamiento\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'low', '2025-07-08 22:17:35', 'Sistema'),
(132, NULL, 'create', 'administraciones', 81, NULL, '{\"id\": 81, \"estado\": \"Administrada\", \"created_at\": \"2025-06-24 08:32:00\", \"updated_at\": \"2025-06-24 08:32:00\", \"paciente_id\": 2, \"observaciones\": \"Ligero retraso\", \"minutos_retraso\": 0, \"minutos_adelanto\": 2, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 2, \"fecha_hora_programada\": \"2025-06-24 08:30:00\", \"horario_programado_id\": 26, \"fecha_hora_administrada\": \"2025-06-24 08:32:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(133, NULL, 'create', 'administraciones', 82, NULL, '{\"id\": 82, \"estado\": \"Administrada\", \"created_at\": \"2025-06-25 08:29:00\", \"updated_at\": \"2025-06-25 08:29:00\", \"paciente_id\": 2, \"observaciones\": \"Ligeramente adelantado\", \"minutos_retraso\": 1, \"minutos_adelanto\": 0, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": -1, \"fecha_hora_programada\": \"2025-06-25 08:30:00\", \"horario_programado_id\": 26, \"fecha_hora_administrada\": \"2025-06-25 08:29:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(134, NULL, 'create', 'administraciones', 83, NULL, '{\"id\": 83, \"estado\": \"Administrada\", \"created_at\": \"2025-06-26 08:41:00\", \"updated_at\": \"2025-06-26 08:41:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso moderado\", \"minutos_retraso\": 0, \"minutos_adelanto\": 11, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 11, \"fecha_hora_programada\": \"2025-06-26 08:30:00\", \"horario_programado_id\": 26, \"fecha_hora_administrada\": \"2025-06-26 08:41:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(135, NULL, 'create', 'administraciones', 84, NULL, '{\"id\": 84, \"estado\": \"Administrada\", \"created_at\": \"2025-06-27 08:37:00\", \"updated_at\": \"2025-06-27 08:37:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso moderado\", \"minutos_retraso\": 0, \"minutos_adelanto\": 7, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 7, \"fecha_hora_programada\": \"2025-06-27 08:30:00\", \"horario_programado_id\": 26, \"fecha_hora_administrada\": \"2025-06-27 08:37:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(136, NULL, 'create', 'administraciones', 85, NULL, '{\"id\": 85, \"estado\": \"Administrada\", \"created_at\": \"2025-06-28 08:43:00\", \"updated_at\": \"2025-06-28 08:43:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso moderado\", \"minutos_retraso\": 0, \"minutos_adelanto\": 13, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 13, \"fecha_hora_programada\": \"2025-06-28 08:30:00\", \"horario_programado_id\": 26, \"fecha_hora_administrada\": \"2025-06-28 08:43:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema');
INSERT INTO `audit_logs` (`id`, `usuario_id`, `accion`, `tabla_afectada`, `registro_id`, `datos_anteriores`, `datos_nuevos`, `ip_address`, `user_agent`, `metodo_http`, `url`, `ruta`, `contexto_adicional`, `session_id`, `severidad`, `created_at`, `created_by_name`) VALUES
(137, NULL, 'create', 'administraciones', 86, NULL, '{\"id\": 86, \"estado\": \"Administrada\", \"created_at\": \"2025-06-29 08:39:00\", \"updated_at\": \"2025-06-29 08:39:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso moderado\", \"minutos_retraso\": 0, \"minutos_adelanto\": 9, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 9, \"fecha_hora_programada\": \"2025-06-29 08:30:00\", \"horario_programado_id\": 26, \"fecha_hora_administrada\": \"2025-06-29 08:39:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(138, NULL, 'create', 'administraciones', 87, NULL, '{\"id\": 87, \"estado\": \"Administrada\", \"created_at\": \"2025-06-30 08:35:00\", \"updated_at\": \"2025-06-30 08:35:00\", \"paciente_id\": 2, \"observaciones\": \"Ligero retraso\", \"minutos_retraso\": 0, \"minutos_adelanto\": 5, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 5, \"fecha_hora_programada\": \"2025-06-30 08:30:00\", \"horario_programado_id\": 26, \"fecha_hora_administrada\": \"2025-06-30 08:35:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(139, NULL, 'create', 'administraciones', 88, NULL, '{\"id\": 88, \"estado\": \"Administrada\", \"created_at\": \"2025-07-01 08:38:00\", \"updated_at\": \"2025-07-01 08:38:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso moderado\", \"minutos_retraso\": 0, \"minutos_adelanto\": 8, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 8, \"fecha_hora_programada\": \"2025-07-01 08:30:00\", \"horario_programado_id\": 26, \"fecha_hora_administrada\": \"2025-07-01 08:38:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(140, NULL, 'create', 'administraciones', 89, NULL, '{\"id\": 89, \"estado\": \"Administrada\", \"created_at\": \"2025-07-02 08:48:00\", \"updated_at\": \"2025-07-02 08:48:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso significativo\", \"minutos_retraso\": 0, \"minutos_adelanto\": 18, \"score_puntualidad\": 86.07, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 18, \"fecha_hora_programada\": \"2025-07-02 08:30:00\", \"horario_programado_id\": 26, \"fecha_hora_administrada\": \"2025-07-02 08:48:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(141, NULL, 'create', 'administraciones', 90, NULL, '{\"id\": 90, \"estado\": \"Administrada\", \"created_at\": \"2025-07-03 08:37:00\", \"updated_at\": \"2025-07-03 08:37:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso moderado\", \"minutos_retraso\": 0, \"minutos_adelanto\": 7, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 7, \"fecha_hora_programada\": \"2025-07-03 08:30:00\", \"horario_programado_id\": 26, \"fecha_hora_administrada\": \"2025-07-03 08:37:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(142, NULL, 'create', 'administraciones', 91, NULL, '{\"id\": 91, \"estado\": \"Administrada\", \"created_at\": \"2025-07-04 08:27:00\", \"updated_at\": \"2025-07-04 08:27:00\", \"paciente_id\": 2, \"observaciones\": \"Ligeramente adelantado\", \"minutos_retraso\": 3, \"minutos_adelanto\": 0, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": -3, \"fecha_hora_programada\": \"2025-07-04 08:30:00\", \"horario_programado_id\": 26, \"fecha_hora_administrada\": \"2025-07-04 08:27:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(143, NULL, 'create', 'administraciones', 92, NULL, '{\"id\": 92, \"estado\": \"Administrada\", \"created_at\": \"2025-07-05 08:39:00\", \"updated_at\": \"2025-07-05 08:39:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso moderado\", \"minutos_retraso\": 0, \"minutos_adelanto\": 9, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 9, \"fecha_hora_programada\": \"2025-07-05 08:30:00\", \"horario_programado_id\": 26, \"fecha_hora_administrada\": \"2025-07-05 08:39:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(144, NULL, 'create', 'administraciones', 93, NULL, '{\"id\": 93, \"estado\": \"Administrada\", \"created_at\": \"2025-07-06 08:46:00\", \"updated_at\": \"2025-07-06 08:46:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso significativo\", \"minutos_retraso\": 0, \"minutos_adelanto\": 16, \"score_puntualidad\": 95.12, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 16, \"fecha_hora_programada\": \"2025-07-06 08:30:00\", \"horario_programado_id\": 26, \"fecha_hora_administrada\": \"2025-07-06 08:46:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(145, NULL, 'create', 'administraciones', 94, NULL, '{\"id\": 94, \"estado\": \"Administrada\", \"created_at\": \"2025-07-07 08:28:00\", \"updated_at\": \"2025-07-07 08:28:00\", \"paciente_id\": 2, \"observaciones\": \"Ligeramente adelantado\", \"minutos_retraso\": 2, \"minutos_adelanto\": 0, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": -2, \"fecha_hora_programada\": \"2025-07-07 08:30:00\", \"horario_programado_id\": 26, \"fecha_hora_administrada\": \"2025-07-07 08:28:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(146, NULL, 'create', 'administraciones', 95, NULL, '{\"id\": 95, \"estado\": \"Administrada\", \"created_at\": \"2025-07-08 08:35:00\", \"updated_at\": \"2025-07-08 08:35:00\", \"paciente_id\": 2, \"observaciones\": \"Ligero retraso\", \"minutos_retraso\": 0, \"minutos_adelanto\": 5, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 5, \"fecha_hora_programada\": \"2025-07-08 08:30:00\", \"horario_programado_id\": 26, \"fecha_hora_administrada\": \"2025-07-08 08:35:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(147, NULL, 'create', 'administraciones', 96, NULL, '{\"id\": 96, \"estado\": \"Administrada\", \"created_at\": \"2025-06-24 14:35:00\", \"updated_at\": \"2025-06-24 14:35:00\", \"paciente_id\": 2, \"observaciones\": \"Ligero retraso\", \"minutos_retraso\": 0, \"minutos_adelanto\": 5, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 5, \"fecha_hora_programada\": \"2025-06-24 14:30:00\", \"horario_programado_id\": 27, \"fecha_hora_administrada\": \"2025-06-24 14:35:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(148, NULL, 'create', 'administraciones', 97, NULL, '{\"id\": 97, \"estado\": \"Administrada\", \"created_at\": \"2025-06-25 14:38:00\", \"updated_at\": \"2025-06-25 14:38:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso moderado\", \"minutos_retraso\": 0, \"minutos_adelanto\": 8, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 8, \"fecha_hora_programada\": \"2025-06-25 14:30:00\", \"horario_programado_id\": 27, \"fecha_hora_administrada\": \"2025-06-25 14:38:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(149, NULL, 'create', 'administraciones', 98, NULL, '{\"id\": 98, \"estado\": \"Administrada\", \"created_at\": \"2025-06-26 14:40:00\", \"updated_at\": \"2025-06-26 14:40:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso moderado\", \"minutos_retraso\": 0, \"minutos_adelanto\": 10, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 10, \"fecha_hora_programada\": \"2025-06-26 14:30:00\", \"horario_programado_id\": 27, \"fecha_hora_administrada\": \"2025-06-26 14:40:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(150, NULL, 'create', 'administraciones', 99, NULL, '{\"id\": 99, \"estado\": \"Administrada\", \"created_at\": \"2025-06-27 14:38:00\", \"updated_at\": \"2025-06-27 14:38:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso moderado\", \"minutos_retraso\": 0, \"minutos_adelanto\": 8, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 8, \"fecha_hora_programada\": \"2025-06-27 14:30:00\", \"horario_programado_id\": 27, \"fecha_hora_administrada\": \"2025-06-27 14:38:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(151, NULL, 'create', 'administraciones', 100, NULL, '{\"id\": 100, \"estado\": \"Administrada\", \"created_at\": \"2025-06-28 14:30:00\", \"updated_at\": \"2025-06-28 14:30:00\", \"paciente_id\": 2, \"observaciones\": \"Administrado puntualmente\", \"minutos_retraso\": 0, \"minutos_adelanto\": 0, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 0, \"fecha_hora_programada\": \"2025-06-28 14:30:00\", \"horario_programado_id\": 27, \"fecha_hora_administrada\": \"2025-06-28 14:30:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(152, NULL, 'create', 'administraciones', 101, NULL, '{\"id\": 101, \"estado\": \"Administrada\", \"created_at\": \"2025-06-29 14:46:00\", \"updated_at\": \"2025-06-29 14:46:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso significativo\", \"minutos_retraso\": 0, \"minutos_adelanto\": 16, \"score_puntualidad\": 95.12, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 16, \"fecha_hora_programada\": \"2025-06-29 14:30:00\", \"horario_programado_id\": 27, \"fecha_hora_administrada\": \"2025-06-29 14:46:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(153, NULL, 'create', 'administraciones', 102, NULL, '{\"id\": 102, \"estado\": \"Administrada\", \"created_at\": \"2025-06-30 14:37:00\", \"updated_at\": \"2025-06-30 14:37:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso moderado\", \"minutos_retraso\": 0, \"minutos_adelanto\": 7, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 7, \"fecha_hora_programada\": \"2025-06-30 14:30:00\", \"horario_programado_id\": 27, \"fecha_hora_administrada\": \"2025-06-30 14:37:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(154, NULL, 'create', 'administraciones', 103, NULL, '{\"id\": 103, \"estado\": \"Administrada\", \"created_at\": \"2025-07-01 14:53:00\", \"updated_at\": \"2025-07-01 14:53:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso significativo\", \"minutos_retraso\": 0, \"minutos_adelanto\": 23, \"score_puntualidad\": 67.03, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 23, \"fecha_hora_programada\": \"2025-07-01 14:30:00\", \"horario_programado_id\": 27, \"fecha_hora_administrada\": \"2025-07-01 14:53:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(155, NULL, 'create', 'administraciones', 104, NULL, '{\"id\": 104, \"estado\": \"Administrada\", \"created_at\": \"2025-07-02 14:48:00\", \"updated_at\": \"2025-07-02 14:48:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso significativo\", \"minutos_retraso\": 0, \"minutos_adelanto\": 18, \"score_puntualidad\": 86.07, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 18, \"fecha_hora_programada\": \"2025-07-02 14:30:00\", \"horario_programado_id\": 27, \"fecha_hora_administrada\": \"2025-07-02 14:48:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(156, NULL, 'create', 'administraciones', 105, NULL, '{\"id\": 105, \"estado\": \"Administrada\", \"created_at\": \"2025-07-03 14:46:00\", \"updated_at\": \"2025-07-03 14:46:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso significativo\", \"minutos_retraso\": 0, \"minutos_adelanto\": 16, \"score_puntualidad\": 95.12, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 16, \"fecha_hora_programada\": \"2025-07-03 14:30:00\", \"horario_programado_id\": 27, \"fecha_hora_administrada\": \"2025-07-03 14:46:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(157, NULL, 'create', 'administraciones', 106, NULL, '{\"id\": 106, \"estado\": \"Administrada\", \"created_at\": \"2025-07-04 14:29:00\", \"updated_at\": \"2025-07-04 14:29:00\", \"paciente_id\": 2, \"observaciones\": \"Ligeramente adelantado\", \"minutos_retraso\": 1, \"minutos_adelanto\": 0, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": -1, \"fecha_hora_programada\": \"2025-07-04 14:30:00\", \"horario_programado_id\": 27, \"fecha_hora_administrada\": \"2025-07-04 14:29:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(158, NULL, 'create', 'administraciones', 107, NULL, '{\"id\": 107, \"estado\": \"Administrada\", \"created_at\": \"2025-07-05 14:48:00\", \"updated_at\": \"2025-07-05 14:48:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso significativo\", \"minutos_retraso\": 0, \"minutos_adelanto\": 18, \"score_puntualidad\": 86.07, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 18, \"fecha_hora_programada\": \"2025-07-05 14:30:00\", \"horario_programado_id\": 27, \"fecha_hora_administrada\": \"2025-07-05 14:48:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(159, NULL, 'create', 'administraciones', 108, NULL, '{\"id\": 108, \"estado\": \"Administrada\", \"created_at\": \"2025-07-06 14:41:00\", \"updated_at\": \"2025-07-06 14:41:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso moderado\", \"minutos_retraso\": 0, \"minutos_adelanto\": 11, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 11, \"fecha_hora_programada\": \"2025-07-06 14:30:00\", \"horario_programado_id\": 27, \"fecha_hora_administrada\": \"2025-07-06 14:41:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(160, NULL, 'create', 'administraciones', 109, NULL, '{\"id\": 109, \"estado\": \"Administrada\", \"created_at\": \"2025-07-07 14:49:00\", \"updated_at\": \"2025-07-07 14:49:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso significativo\", \"minutos_retraso\": 0, \"minutos_adelanto\": 19, \"score_puntualidad\": 81.87, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 19, \"fecha_hora_programada\": \"2025-07-07 14:30:00\", \"horario_programado_id\": 27, \"fecha_hora_administrada\": \"2025-07-07 14:49:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(161, NULL, 'create', 'administraciones', 110, NULL, '{\"id\": 110, \"estado\": \"Administrada\", \"created_at\": \"2025-07-08 14:43:00\", \"updated_at\": \"2025-07-08 14:43:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso moderado\", \"minutos_retraso\": 0, \"minutos_adelanto\": 13, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 13, \"fecha_hora_programada\": \"2025-07-08 14:30:00\", \"horario_programado_id\": 27, \"fecha_hora_administrada\": \"2025-07-08 14:43:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(162, NULL, 'create', 'administraciones', 111, NULL, '{\"id\": 111, \"estado\": \"Administrada\", \"created_at\": \"2025-06-24 20:31:00\", \"updated_at\": \"2025-06-24 20:31:00\", \"paciente_id\": 2, \"observaciones\": \"Ligero retraso\", \"minutos_retraso\": 0, \"minutos_adelanto\": 1, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 1, \"fecha_hora_programada\": \"2025-06-24 20:30:00\", \"horario_programado_id\": 28, \"fecha_hora_administrada\": \"2025-06-24 20:31:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(163, NULL, 'create', 'administraciones', 112, NULL, '{\"id\": 112, \"estado\": \"Administrada\", \"created_at\": \"2025-06-25 20:28:00\", \"updated_at\": \"2025-06-25 20:28:00\", \"paciente_id\": 2, \"observaciones\": \"Ligeramente adelantado\", \"minutos_retraso\": 2, \"minutos_adelanto\": 0, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": -2, \"fecha_hora_programada\": \"2025-06-25 20:30:00\", \"horario_programado_id\": 28, \"fecha_hora_administrada\": \"2025-06-25 20:28:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(164, NULL, 'create', 'administraciones', 113, NULL, '{\"id\": 113, \"estado\": \"Administrada\", \"created_at\": \"2025-06-26 20:41:00\", \"updated_at\": \"2025-06-26 20:41:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso moderado\", \"minutos_retraso\": 0, \"minutos_adelanto\": 11, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 11, \"fecha_hora_programada\": \"2025-06-26 20:30:00\", \"horario_programado_id\": 28, \"fecha_hora_administrada\": \"2025-06-26 20:41:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(165, NULL, 'create', 'administraciones', 114, NULL, '{\"id\": 114, \"estado\": \"Administrada\", \"created_at\": \"2025-06-27 20:39:00\", \"updated_at\": \"2025-06-27 20:39:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso moderado\", \"minutos_retraso\": 0, \"minutos_adelanto\": 9, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 9, \"fecha_hora_programada\": \"2025-06-27 20:30:00\", \"horario_programado_id\": 28, \"fecha_hora_administrada\": \"2025-06-27 20:39:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(166, NULL, 'create', 'administraciones', 115, NULL, '{\"id\": 115, \"estado\": \"Administrada\", \"created_at\": \"2025-06-28 20:32:00\", \"updated_at\": \"2025-06-28 20:32:00\", \"paciente_id\": 2, \"observaciones\": \"Ligero retraso\", \"minutos_retraso\": 0, \"minutos_adelanto\": 2, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 2, \"fecha_hora_programada\": \"2025-06-28 20:30:00\", \"horario_programado_id\": 28, \"fecha_hora_administrada\": \"2025-06-28 20:32:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(167, NULL, 'create', 'administraciones', 116, NULL, '{\"id\": 116, \"estado\": \"Administrada\", \"created_at\": \"2025-06-29 20:30:00\", \"updated_at\": \"2025-06-29 20:30:00\", \"paciente_id\": 2, \"observaciones\": \"Administrado puntualmente\", \"minutos_retraso\": 0, \"minutos_adelanto\": 0, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 0, \"fecha_hora_programada\": \"2025-06-29 20:30:00\", \"horario_programado_id\": 28, \"fecha_hora_administrada\": \"2025-06-29 20:30:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(168, NULL, 'create', 'administraciones', 117, NULL, '{\"id\": 117, \"estado\": \"Administrada\", \"created_at\": \"2025-06-30 20:23:00\", \"updated_at\": \"2025-06-30 20:23:00\", \"paciente_id\": 2, \"observaciones\": \"Moderadamente adelantado\", \"minutos_retraso\": 7, \"minutos_adelanto\": 0, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": -7, \"fecha_hora_programada\": \"2025-06-30 20:30:00\", \"horario_programado_id\": 28, \"fecha_hora_administrada\": \"2025-06-30 20:23:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(169, NULL, 'create', 'administraciones', 118, NULL, '{\"id\": 118, \"estado\": \"Administrada\", \"created_at\": \"2025-07-01 20:29:00\", \"updated_at\": \"2025-07-01 20:29:00\", \"paciente_id\": 2, \"observaciones\": \"Ligeramente adelantado\", \"minutos_retraso\": 1, \"minutos_adelanto\": 0, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": -1, \"fecha_hora_programada\": \"2025-07-01 20:30:00\", \"horario_programado_id\": 28, \"fecha_hora_administrada\": \"2025-07-01 20:29:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(170, NULL, 'create', 'administraciones', 119, NULL, '{\"id\": 119, \"estado\": \"Administrada\", \"created_at\": \"2025-07-02 20:56:00\", \"updated_at\": \"2025-07-02 20:56:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso significativo\", \"minutos_retraso\": 0, \"minutos_adelanto\": 26, \"score_puntualidad\": 57.69, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 26, \"fecha_hora_programada\": \"2025-07-02 20:30:00\", \"horario_programado_id\": 28, \"fecha_hora_administrada\": \"2025-07-02 20:56:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(171, NULL, 'create', 'administraciones', 120, NULL, '{\"id\": 120, \"estado\": \"Administrada\", \"created_at\": \"2025-07-03 20:31:00\", \"updated_at\": \"2025-07-03 20:31:00\", \"paciente_id\": 2, \"observaciones\": \"Ligero retraso\", \"minutos_retraso\": 0, \"minutos_adelanto\": 1, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 1, \"fecha_hora_programada\": \"2025-07-03 20:30:00\", \"horario_programado_id\": 28, \"fecha_hora_administrada\": \"2025-07-03 20:31:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(172, NULL, 'create', 'administraciones', 121, NULL, '{\"id\": 121, \"estado\": \"Administrada\", \"created_at\": \"2025-07-04 20:36:00\", \"updated_at\": \"2025-07-04 20:36:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso moderado\", \"minutos_retraso\": 0, \"minutos_adelanto\": 6, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 6, \"fecha_hora_programada\": \"2025-07-04 20:30:00\", \"horario_programado_id\": 28, \"fecha_hora_administrada\": \"2025-07-04 20:36:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(173, NULL, 'create', 'administraciones', 122, NULL, '{\"id\": 122, \"estado\": \"Administrada\", \"created_at\": \"2025-07-05 20:54:00\", \"updated_at\": \"2025-07-05 20:54:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso significativo\", \"minutos_retraso\": 0, \"minutos_adelanto\": 24, \"score_puntualidad\": 63.76, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 24, \"fecha_hora_programada\": \"2025-07-05 20:30:00\", \"horario_programado_id\": 28, \"fecha_hora_administrada\": \"2025-07-05 20:54:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(174, NULL, 'create', 'administraciones', 123, NULL, '{\"id\": 123, \"estado\": \"Administrada\", \"created_at\": \"2025-07-06 20:46:00\", \"updated_at\": \"2025-07-06 20:46:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso significativo\", \"minutos_retraso\": 0, \"minutos_adelanto\": 16, \"score_puntualidad\": 95.12, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 16, \"fecha_hora_programada\": \"2025-07-06 20:30:00\", \"horario_programado_id\": 28, \"fecha_hora_administrada\": \"2025-07-06 20:46:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(175, NULL, 'create', 'administraciones', 124, NULL, '{\"id\": 124, \"estado\": \"Administrada\", \"created_at\": \"2025-07-07 20:52:00\", \"updated_at\": \"2025-07-07 20:52:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso significativo\", \"minutos_retraso\": 0, \"minutos_adelanto\": 22, \"score_puntualidad\": 70.47, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 22, \"fecha_hora_programada\": \"2025-07-07 20:30:00\", \"horario_programado_id\": 28, \"fecha_hora_administrada\": \"2025-07-07 20:52:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(176, NULL, 'create', 'administraciones', 125, NULL, '{\"id\": 125, \"estado\": \"Administrada\", \"created_at\": \"2025-07-08 20:35:00\", \"updated_at\": \"2025-07-08 20:35:00\", \"paciente_id\": 2, \"observaciones\": \"Ligero retraso\", \"minutos_retraso\": 0, \"minutos_adelanto\": 5, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"850\", \"minutos_diferencia\": 5, \"fecha_hora_programada\": \"2025-07-08 20:30:00\", \"horario_programado_id\": 28, \"fecha_hora_administrada\": \"2025-07-08 20:35:00\", \"medicamento_tratamiento_id\": 9, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(177, NULL, 'create', 'medicamentos', 20, NULL, '{\"id\": 20, \"medida\": \"50\", \"nombre\": \"Losartán\", \"created_at\": \"2025-06-24 00:00:00\", \"updated_at\": \"2025-06-24 00:00:00\", \"descripcion\": \"Antagonista de los receptores de angiotensina II\", \"unidad_medida\": \"mg\"}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Medicamento\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'low', '2025-07-08 22:17:35', 'Sistema'),
(178, NULL, 'create', 'tratamientos', 11, NULL, '{\"id\": 11, \"estado\": \"Activo\", \"nombre\": \"Tratamiento Losartán\", \"fecha_fin\": \"2025-10-08 23:59:59\", \"created_at\": \"2025-06-24 00:00:00\", \"updated_at\": \"2025-06-24 00:00:00\", \"diagnostico\": \"Tratamiento con Losartán\", \"paciente_id\": 2, \"fecha_inicio\": \"2025-06-24 00:00:00\", \"observaciones\": \"Antagonista de los receptores de angiotensina II\", \"medico_usuario_id\": 2}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Tratamiento\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(179, NULL, 'create', 'medicamentos_tratamientos', 10, NULL, '{\"id\": 10, \"activo\": true, \"created_at\": \"2025-06-24 00:00:00\", \"updated_at\": \"2025-06-24 00:00:00\", \"unidad_dosis\": \"mg\", \"duracion_dias\": 90, \"dosis_cantidad\": \"50\", \"medicamento_id\": 20, \"tratamiento_id\": 11, \"frecuencia_horas\": 24}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\MedicamentoTratamiento\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'low', '2025-07-08 22:17:35', 'Sistema'),
(180, NULL, 'create', 'administraciones', 126, NULL, '{\"id\": 126, \"estado\": \"Administrada\", \"created_at\": \"2025-06-24 07:02:00\", \"updated_at\": \"2025-06-24 07:02:00\", \"paciente_id\": 2, \"observaciones\": \"Ligero retraso\", \"minutos_retraso\": 0, \"minutos_adelanto\": 2, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"50\", \"minutos_diferencia\": 2, \"fecha_hora_programada\": \"2025-06-24 07:00:00\", \"horario_programado_id\": 29, \"fecha_hora_administrada\": \"2025-06-24 07:02:00\", \"medicamento_tratamiento_id\": 10, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(181, NULL, 'create', 'administraciones', 127, NULL, '{\"id\": 127, \"estado\": \"Administrada\", \"created_at\": \"2025-06-25 07:05:00\", \"updated_at\": \"2025-06-25 07:05:00\", \"paciente_id\": 2, \"observaciones\": \"Ligero retraso\", \"minutos_retraso\": 0, \"minutos_adelanto\": 5, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"50\", \"minutos_diferencia\": 5, \"fecha_hora_programada\": \"2025-06-25 07:00:00\", \"horario_programado_id\": 29, \"fecha_hora_administrada\": \"2025-06-25 07:05:00\", \"medicamento_tratamiento_id\": 10, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(182, NULL, 'create', 'administraciones', 128, NULL, '{\"id\": 128, \"estado\": \"Administrada\", \"created_at\": \"2025-06-26 07:09:00\", \"updated_at\": \"2025-06-26 07:09:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso moderado\", \"minutos_retraso\": 0, \"minutos_adelanto\": 9, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"50\", \"minutos_diferencia\": 9, \"fecha_hora_programada\": \"2025-06-26 07:00:00\", \"horario_programado_id\": 29, \"fecha_hora_administrada\": \"2025-06-26 07:09:00\", \"medicamento_tratamiento_id\": 10, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(183, NULL, 'create', 'administraciones', 129, NULL, '{\"id\": 129, \"estado\": \"Administrada\", \"created_at\": \"2025-06-27 07:08:00\", \"updated_at\": \"2025-06-27 07:08:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso moderado\", \"minutos_retraso\": 0, \"minutos_adelanto\": 8, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"50\", \"minutos_diferencia\": 8, \"fecha_hora_programada\": \"2025-06-27 07:00:00\", \"horario_programado_id\": 29, \"fecha_hora_administrada\": \"2025-06-27 07:08:00\", \"medicamento_tratamiento_id\": 10, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(184, NULL, 'create', 'administraciones', 130, NULL, '{\"id\": 130, \"estado\": \"Administrada\", \"created_at\": \"2025-06-28 07:07:00\", \"updated_at\": \"2025-06-28 07:07:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso moderado\", \"minutos_retraso\": 0, \"minutos_adelanto\": 7, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"50\", \"minutos_diferencia\": 7, \"fecha_hora_programada\": \"2025-06-28 07:00:00\", \"horario_programado_id\": 29, \"fecha_hora_administrada\": \"2025-06-28 07:07:00\", \"medicamento_tratamiento_id\": 10, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(185, NULL, 'create', 'administraciones', 131, NULL, '{\"id\": 131, \"estado\": \"Administrada\", \"created_at\": \"2025-06-29 07:07:00\", \"updated_at\": \"2025-06-29 07:07:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso moderado\", \"minutos_retraso\": 0, \"minutos_adelanto\": 7, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"50\", \"minutos_diferencia\": 7, \"fecha_hora_programada\": \"2025-06-29 07:00:00\", \"horario_programado_id\": 29, \"fecha_hora_administrada\": \"2025-06-29 07:07:00\", \"medicamento_tratamiento_id\": 10, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(186, NULL, 'create', 'administraciones', 132, NULL, '{\"id\": 132, \"estado\": \"Administrada\", \"created_at\": \"2025-06-30 07:18:00\", \"updated_at\": \"2025-06-30 07:18:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso significativo\", \"minutos_retraso\": 0, \"minutos_adelanto\": 18, \"score_puntualidad\": 86.07, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"50\", \"minutos_diferencia\": 18, \"fecha_hora_programada\": \"2025-06-30 07:00:00\", \"horario_programado_id\": 29, \"fecha_hora_administrada\": \"2025-06-30 07:18:00\", \"medicamento_tratamiento_id\": 10, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(187, NULL, 'create', 'administraciones', 133, NULL, '{\"id\": 133, \"estado\": \"Administrada\", \"created_at\": \"2025-07-01 06:57:00\", \"updated_at\": \"2025-07-01 06:57:00\", \"paciente_id\": 2, \"observaciones\": \"Ligeramente adelantado\", \"minutos_retraso\": 3, \"minutos_adelanto\": 0, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"50\", \"minutos_diferencia\": -3, \"fecha_hora_programada\": \"2025-07-01 07:00:00\", \"horario_programado_id\": 29, \"fecha_hora_administrada\": \"2025-07-01 06:57:00\", \"medicamento_tratamiento_id\": 10, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(188, NULL, 'create', 'administraciones', 134, NULL, '{\"id\": 134, \"estado\": \"Administrada\", \"created_at\": \"2025-07-02 07:13:00\", \"updated_at\": \"2025-07-02 07:13:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso moderado\", \"minutos_retraso\": 0, \"minutos_adelanto\": 13, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"50\", \"minutos_diferencia\": 13, \"fecha_hora_programada\": \"2025-07-02 07:00:00\", \"horario_programado_id\": 29, \"fecha_hora_administrada\": \"2025-07-02 07:13:00\", \"medicamento_tratamiento_id\": 10, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(189, NULL, 'create', 'administraciones', 135, NULL, '{\"id\": 135, \"estado\": \"Administrada\", \"created_at\": \"2025-07-03 07:14:00\", \"updated_at\": \"2025-07-03 07:14:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso moderado\", \"minutos_retraso\": 0, \"minutos_adelanto\": 14, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"50\", \"minutos_diferencia\": 14, \"fecha_hora_programada\": \"2025-07-03 07:00:00\", \"horario_programado_id\": 29, \"fecha_hora_administrada\": \"2025-07-03 07:14:00\", \"medicamento_tratamiento_id\": 10, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(190, NULL, 'create', 'administraciones', 136, NULL, '{\"id\": 136, \"estado\": \"Administrada\", \"created_at\": \"2025-07-04 07:04:00\", \"updated_at\": \"2025-07-04 07:04:00\", \"paciente_id\": 2, \"observaciones\": \"Ligero retraso\", \"minutos_retraso\": 0, \"minutos_adelanto\": 4, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"50\", \"minutos_diferencia\": 4, \"fecha_hora_programada\": \"2025-07-04 07:00:00\", \"horario_programado_id\": 29, \"fecha_hora_administrada\": \"2025-07-04 07:04:00\", \"medicamento_tratamiento_id\": 10, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema');
INSERT INTO `audit_logs` (`id`, `usuario_id`, `accion`, `tabla_afectada`, `registro_id`, `datos_anteriores`, `datos_nuevos`, `ip_address`, `user_agent`, `metodo_http`, `url`, `ruta`, `contexto_adicional`, `session_id`, `severidad`, `created_at`, `created_by_name`) VALUES
(191, NULL, 'create', 'administraciones', 137, NULL, '{\"id\": 137, \"estado\": \"Administrada\", \"created_at\": \"2025-07-05 07:10:00\", \"updated_at\": \"2025-07-05 07:10:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso moderado\", \"minutos_retraso\": 0, \"minutos_adelanto\": 10, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"50\", \"minutos_diferencia\": 10, \"fecha_hora_programada\": \"2025-07-05 07:00:00\", \"horario_programado_id\": 29, \"fecha_hora_administrada\": \"2025-07-05 07:10:00\", \"medicamento_tratamiento_id\": 10, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(192, NULL, 'create', 'administraciones', 138, NULL, '{\"id\": 138, \"estado\": \"Administrada\", \"created_at\": \"2025-07-06 07:02:00\", \"updated_at\": \"2025-07-06 07:02:00\", \"paciente_id\": 2, \"observaciones\": \"Ligero retraso\", \"minutos_retraso\": 0, \"minutos_adelanto\": 2, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"50\", \"minutos_diferencia\": 2, \"fecha_hora_programada\": \"2025-07-06 07:00:00\", \"horario_programado_id\": 29, \"fecha_hora_administrada\": \"2025-07-06 07:02:00\", \"medicamento_tratamiento_id\": 10, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(193, NULL, 'create', 'administraciones', 139, NULL, '{\"id\": 139, \"estado\": \"Administrada\", \"created_at\": \"2025-07-07 07:15:00\", \"updated_at\": \"2025-07-07 07:15:00\", \"paciente_id\": 2, \"observaciones\": \"Retraso moderado\", \"minutos_retraso\": 0, \"minutos_adelanto\": 15, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"50\", \"minutos_diferencia\": 15, \"fecha_hora_programada\": \"2025-07-07 07:00:00\", \"horario_programado_id\": 29, \"fecha_hora_administrada\": \"2025-07-07 07:15:00\", \"medicamento_tratamiento_id\": 10, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(194, NULL, 'create', 'administraciones', 140, NULL, '{\"id\": 140, \"estado\": \"Administrada\", \"created_at\": \"2025-07-08 07:02:00\", \"updated_at\": \"2025-07-08 07:02:00\", \"paciente_id\": 2, \"observaciones\": \"Ligero retraso\", \"minutos_retraso\": 0, \"minutos_adelanto\": 2, \"score_puntualidad\": 100, \"categoria_temporal\": \"puntual\", \"dosis_administrada\": \"50\", \"minutos_diferencia\": 2, \"fecha_hora_programada\": \"2025-07-08 07:00:00\", \"horario_programado_id\": 29, \"fecha_hora_administrada\": \"2025-07-08 07:02:00\", \"medicamento_tratamiento_id\": 10, \"es_dentro_ventana_tolerancia\": true}', '127.0.0.1', 'Symfony', 'GET', 'http://localhost', NULL, '{\"tipo\": \"crud\", \"evento\": \"model_created\", \"modelo_clase\": \"App\\\\Models\\\\Administracion\", \"usuario_actual\": {\"id\": null, \"rol\": null, \"nombre\": \"Sistema\"}}', NULL, 'medium', '2025-07-08 22:17:35', 'Sistema'),
(195, NULL, 'access', NULL, NULL, NULL, NULL, '192.168.65.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'GET', 'http://127.0.0.1:8000/login', 'login', '{\"path\": \"login\", \"metodo\": \"GET\", \"status_code\": 200, \"parametros_get\": [], \"tiempo_respuesta\": 60.3}', 'M80eDmUk4aMq5B3WJyxC8XSKy3MTRbtGRlAgEHbE', 'high', NULL, 'Sistema'),
(196, 1, 'login', NULL, NULL, NULL, NULL, '192.168.65.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'POST', 'http://127.0.0.1:8000/login', NULL, '{\"path\": \"login\", \"metodo\": \"POST\", \"status_code\": 302, \"parametros_get\": [], \"parametros_post\": {\"email\": \"admin@meditrack.com\", \"password\": \"[FILTRADO]\", \"remember\": false}, \"tiempo_respuesta\": 329.66}', 'g9jBNxe64jcv50Vg73tkf7dAWdxMF2pM50BCTEhH', 'high', NULL, 'Administrador Sistema'),
(197, NULL, 'access', NULL, NULL, NULL, NULL, '192.168.65.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'GET', 'http://127.0.0.1:8000/login', 'login', '{\"path\": \"login\", \"metodo\": \"GET\", \"status_code\": 200, \"parametros_get\": [], \"tiempo_respuesta\": 58.87}', 'fAC3Zr921NWWXG3qGvtDe7m1pwAtKQ1DP9qK04Oq', 'high', NULL, 'Sistema'),
(198, 1, 'login', NULL, NULL, NULL, NULL, '192.168.65.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'POST', 'http://127.0.0.1:8000/login', NULL, '{\"path\": \"login\", \"metodo\": \"POST\", \"status_code\": 302, \"parametros_get\": [], \"parametros_post\": {\"email\": \"admin@meditrack.com\", \"password\": \"[FILTRADO]\", \"remember\": false}, \"tiempo_respuesta\": 332.01}', 'xMBUFesXrQKEHReFTUzZjZbVzbT0fsEPbpROUX5f', 'high', NULL, 'Administrador Sistema'),
(199, NULL, 'access', NULL, NULL, NULL, NULL, '192.168.65.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'GET', 'http://127.0.0.1:8000/login', 'login', '{\"path\": \"login\", \"metodo\": \"GET\", \"status_code\": 200, \"parametros_get\": [], \"tiempo_respuesta\": 45.37}', 'PwZVZSyAW5iEFtELawveeIkAHE17aD8ar3yDwGJf', 'high', NULL, 'Sistema'),
(200, NULL, 'access', NULL, NULL, NULL, NULL, '192.168.65.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'GET', 'http://127.0.0.1:8000/login', 'login', '{\"path\": \"login\", \"metodo\": \"GET\", \"status_code\": 200, \"parametros_get\": [], \"tiempo_respuesta\": 35.74}', 'PwZVZSyAW5iEFtELawveeIkAHE17aD8ar3yDwGJf', 'high', NULL, 'Sistema'),
(201, 1, 'login', NULL, NULL, NULL, NULL, '192.168.65.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'POST', 'http://127.0.0.1:8000/login', NULL, '{\"path\": \"login\", \"metodo\": \"POST\", \"status_code\": 302, \"parametros_get\": [], \"parametros_post\": {\"email\": \"admin@meditrack.com\", \"password\": \"[FILTRADO]\", \"remember\": false}, \"tiempo_respuesta\": 360.65}', '9ha4WfJJoqPM0jjma93L1f4Ns7QWiqU7foLJoIoO', 'high', NULL, 'Administrador Sistema'),
(202, 1, 'access', NULL, NULL, NULL, NULL, '192.168.65.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'GET', 'http://127.0.0.1:8000/tratamientos', 'tratamientos.index', '{\"path\": \"tratamientos\", \"metodo\": \"GET\", \"status_code\": 200, \"parametros_get\": [], \"tiempo_respuesta\": 58.03}', '9ha4WfJJoqPM0jjma93L1f4Ns7QWiqU7foLJoIoO', 'medium', NULL, 'Administrador Sistema'),
(203, 1, 'access', NULL, NULL, NULL, NULL, '192.168.65.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'GET', 'http://127.0.0.1:8000/administraciones/pendientes', 'administraciones.pendientes', '{\"path\": \"administraciones/pendientes\", \"metodo\": \"GET\", \"status_code\": 200, \"parametros_get\": [], \"tiempo_respuesta\": 57.02}', '9ha4WfJJoqPM0jjma93L1f4Ns7QWiqU7foLJoIoO', 'medium', NULL, 'Administrador Sistema'),
(204, 1, 'access', NULL, NULL, NULL, NULL, '192.168.65.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'GET', 'http://127.0.0.1:8000/administraciones/historial', 'administraciones.historial', '{\"path\": \"administraciones/historial\", \"metodo\": \"GET\", \"status_code\": 200, \"parametros_get\": [], \"tiempo_respuesta\": 116.3}', '9ha4WfJJoqPM0jjma93L1f4Ns7QWiqU7foLJoIoO', 'medium', NULL, 'Administrador Sistema'),
(205, 1, 'access', NULL, NULL, NULL, NULL, '192.168.65.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'GET', 'http://127.0.0.1:8000/pacientes', 'pacientes.index', '{\"path\": \"pacientes\", \"metodo\": \"GET\", \"status_code\": 200, \"parametros_get\": [], \"tiempo_respuesta\": 60.18}', '9ha4WfJJoqPM0jjma93L1f4Ns7QWiqU7foLJoIoO', 'medium', NULL, 'Administrador Sistema'),
(206, 1, 'access', NULL, NULL, NULL, NULL, '192.168.65.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'GET', 'http://127.0.0.1:8000/personal-medico', 'personal-medico.index', '{\"path\": \"personal-medico\", \"metodo\": \"GET\", \"status_code\": 200, \"parametros_get\": [], \"tiempo_respuesta\": 56.07}', '9ha4WfJJoqPM0jjma93L1f4Ns7QWiqU7foLJoIoO', 'low', NULL, 'Administrador Sistema'),
(207, 1, 'access', NULL, NULL, NULL, NULL, '192.168.65.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'GET', 'http://127.0.0.1:8000/usuarios', 'usuarios.index', '{\"path\": \"usuarios\", \"metodo\": \"GET\", \"status_code\": 200, \"parametros_get\": [], \"tiempo_respuesta\": 58.55}', '9ha4WfJJoqPM0jjma93L1f4Ns7QWiqU7foLJoIoO', 'high', NULL, 'Administrador Sistema'),
(208, 1, 'access', NULL, NULL, NULL, NULL, '192.168.65.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'GET', 'http://127.0.0.1:8000/asignaciones-cuidadores', 'asignaciones-cuidadores.index', '{\"path\": \"asignaciones-cuidadores\", \"metodo\": \"GET\", \"status_code\": 200, \"parametros_get\": [], \"tiempo_respuesta\": 81.85}', '9ha4WfJJoqPM0jjma93L1f4Ns7QWiqU7foLJoIoO', 'medium', NULL, 'Administrador Sistema'),
(209, 1, 'access', NULL, NULL, NULL, NULL, '192.168.65.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'GET', 'http://127.0.0.1:8000/asignaciones-cuidadores/historial', 'asignaciones-cuidadores.historial', '{\"path\": \"asignaciones-cuidadores/historial\", \"metodo\": \"GET\", \"status_code\": 200, \"parametros_get\": [], \"tiempo_respuesta\": 56.7}', '9ha4WfJJoqPM0jjma93L1f4Ns7QWiqU7foLJoIoO', 'medium', NULL, 'Administrador Sistema'),
(210, 1, 'access', NULL, NULL, NULL, NULL, '192.168.65.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'GET', 'http://127.0.0.1:8000/roles', 'roles.index', '{\"path\": \"roles\", \"metodo\": \"GET\", \"status_code\": 200, \"parametros_get\": [], \"tiempo_respuesta\": 55.62}', '9ha4WfJJoqPM0jjma93L1f4Ns7QWiqU7foLJoIoO', 'high', NULL, 'Administrador Sistema'),
(211, NULL, 'access', NULL, NULL, NULL, NULL, '192.168.65.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'GET', 'http://127.0.0.1:8000/login', 'login', '{\"path\": \"login\", \"metodo\": \"GET\", \"status_code\": 200, \"parametros_get\": [], \"tiempo_respuesta\": 40.18}', 'mqRFSLYVTBynS4ltx7THAI0z6OCezWllu006RlL6', 'high', NULL, 'Sistema'),
(212, 1, 'login', NULL, NULL, NULL, NULL, '192.168.65.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'POST', 'http://127.0.0.1:8000/login', NULL, '{\"path\": \"login\", \"metodo\": \"POST\", \"status_code\": 302, \"parametros_get\": [], \"parametros_post\": {\"email\": \"admin@meditrack.com\", \"password\": \"[FILTRADO]\", \"remember\": false}, \"tiempo_respuesta\": 294.75}', 'CZHBcv1WjMf8eWS3uY9fkaUcBUYvvfySmO8O8WWA', 'high', NULL, 'Administrador Sistema'),
(213, 1, 'access', NULL, NULL, NULL, NULL, '192.168.65.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'GET', 'http://127.0.0.1:8000/administraciones/pendientes', 'administraciones.pendientes', '{\"path\": \"administraciones/pendientes\", \"metodo\": \"GET\", \"status_code\": 200, \"parametros_get\": [], \"tiempo_respuesta\": 62.99}', 'CZHBcv1WjMf8eWS3uY9fkaUcBUYvvfySmO8O8WWA', 'medium', NULL, 'Administrador Sistema'),
(214, 1, 'access', NULL, NULL, NULL, NULL, '192.168.65.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'GET', 'http://127.0.0.1:8000/administraciones/pendientes', 'administraciones.pendientes', '{\"path\": \"administraciones/pendientes\", \"metodo\": \"GET\", \"status_code\": 200, \"parametros_get\": [], \"tiempo_respuesta\": 70.26}', 'CZHBcv1WjMf8eWS3uY9fkaUcBUYvvfySmO8O8WWA', 'medium', NULL, 'Administrador Sistema'),
(215, 1, 'access', NULL, NULL, NULL, NULL, '192.168.65.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'GET', 'http://127.0.0.1:8000/administraciones/historial', 'administraciones.historial', '{\"path\": \"administraciones/historial\", \"metodo\": \"GET\", \"status_code\": 200, \"parametros_get\": [], \"tiempo_respuesta\": 164.34}', 'CZHBcv1WjMf8eWS3uY9fkaUcBUYvvfySmO8O8WWA', 'medium', NULL, 'Administrador Sistema'),
(216, 1, 'access', NULL, NULL, NULL, NULL, '192.168.65.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'GET', 'http://127.0.0.1:8000/tratamientos', 'tratamientos.index', '{\"path\": \"tratamientos\", \"metodo\": \"GET\", \"status_code\": 200, \"parametros_get\": [], \"tiempo_respuesta\": 73.17}', '9ha4WfJJoqPM0jjma93L1f4Ns7QWiqU7foLJoIoO', 'medium', NULL, 'Administrador Sistema'),
(217, 1, 'access', NULL, NULL, NULL, NULL, '192.168.65.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'GET', 'http://127.0.0.1:8000/administraciones/pendientes', 'administraciones.pendientes', '{\"path\": \"administraciones/pendientes\", \"metodo\": \"GET\", \"status_code\": 200, \"parametros_get\": [], \"tiempo_respuesta\": 58.88}', '9ha4WfJJoqPM0jjma93L1f4Ns7QWiqU7foLJoIoO', 'medium', NULL, 'Administrador Sistema'),
(218, 1, 'access', NULL, NULL, NULL, NULL, '192.168.65.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'GET', 'http://127.0.0.1:8000/administraciones/historial', 'administraciones.historial', '{\"path\": \"administraciones/historial\", \"metodo\": \"GET\", \"status_code\": 200, \"parametros_get\": [], \"tiempo_respuesta\": 118.45}', '9ha4WfJJoqPM0jjma93L1f4Ns7QWiqU7foLJoIoO', 'medium', NULL, 'Administrador Sistema'),
(219, 1, 'access', NULL, NULL, NULL, NULL, '192.168.65.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'GET', 'http://127.0.0.1:8000/pacientes', 'pacientes.index', '{\"path\": \"pacientes\", \"metodo\": \"GET\", \"status_code\": 200, \"parametros_get\": [], \"tiempo_respuesta\": 108.32}', '9ha4WfJJoqPM0jjma93L1f4Ns7QWiqU7foLJoIoO', 'medium', NULL, 'Administrador Sistema'),
(220, 1, 'access', NULL, NULL, NULL, NULL, '192.168.65.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'GET', 'http://127.0.0.1:8000/personal-medico', 'personal-medico.index', '{\"path\": \"personal-medico\", \"metodo\": \"GET\", \"status_code\": 200, \"parametros_get\": [], \"tiempo_respuesta\": 55.92}', '9ha4WfJJoqPM0jjma93L1f4Ns7QWiqU7foLJoIoO', 'low', NULL, 'Administrador Sistema'),
(221, 1, 'access', NULL, NULL, NULL, NULL, '192.168.65.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'GET', 'http://127.0.0.1:8000/usuarios', 'usuarios.index', '{\"path\": \"usuarios\", \"metodo\": \"GET\", \"status_code\": 200, \"parametros_get\": [], \"tiempo_respuesta\": 61.66}', '9ha4WfJJoqPM0jjma93L1f4Ns7QWiqU7foLJoIoO', 'high', NULL, 'Administrador Sistema'),
(222, 1, 'access', NULL, NULL, NULL, NULL, '192.168.65.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'GET', 'http://127.0.0.1:8000/asignaciones-cuidadores', 'asignaciones-cuidadores.index', '{\"path\": \"asignaciones-cuidadores\", \"metodo\": \"GET\", \"status_code\": 200, \"parametros_get\": [], \"tiempo_respuesta\": 53.01}', '9ha4WfJJoqPM0jjma93L1f4Ns7QWiqU7foLJoIoO', 'medium', NULL, 'Administrador Sistema'),
(223, 1, 'access', NULL, NULL, NULL, NULL, '192.168.65.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'GET', 'http://127.0.0.1:8000/asignaciones-cuidadores/historial', 'asignaciones-cuidadores.historial', '{\"path\": \"asignaciones-cuidadores/historial\", \"metodo\": \"GET\", \"status_code\": 200, \"parametros_get\": [], \"tiempo_respuesta\": 57.43}', '9ha4WfJJoqPM0jjma93L1f4Ns7QWiqU7foLJoIoO', 'medium', NULL, 'Administrador Sistema');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuidadores`
--

CREATE TABLE `cuidadores` (
  `usuario_id` bigint UNSIGNED NOT NULL,
  `certificaciones` text COLLATE utf8mb4_unicode_ci,
  `experiencia_anos` int DEFAULT NULL,
  `disponibilidad_horaria` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tarifa_hora` int DEFAULT NULL COMMENT 'Tarifa por hora en pesos chilenos'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Información específica de cuidadores';

--
-- Volcado de datos para la tabla `cuidadores`
--

INSERT INTO `cuidadores` (`usuario_id`, `certificaciones`, `experiencia_anos`, `disponibilidad_horaria`, `tarifa_hora`) VALUES
(3, 'Certificado en primeros auxilios, Curso de cuidado de adultos mayores', 5, 'Lunes a Viernes 8:00-18:00', 15000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadisticas_consumo`
--

CREATE TABLE `estadisticas_consumo` (
  `id` bigint UNSIGNED NOT NULL,
  `paciente_id` bigint UNSIGNED NOT NULL,
  `medicamento_id` bigint UNSIGNED NOT NULL,
  `periodo_inicio` date NOT NULL,
  `periodo_fin` date NOT NULL,
  `tipo_periodo` enum('Diario','Semanal','Mensual') COLLATE utf8mb4_unicode_ci NOT NULL,
  `dosis_programadas` int NOT NULL DEFAULT '0',
  `dosis_administradas` int NOT NULL DEFAULT '0',
  `dosis_omitidas` int NOT NULL DEFAULT '0',
  `dosis_tardias` int NOT NULL DEFAULT '0',
  `dosis_prn` int NOT NULL DEFAULT '0',
  `administraciones_prn_por_sintoma` json DEFAULT NULL COMMENT 'Contador por tipo de síntoma',
  `promedio_intensidad_sintomas` decimal(3,1) DEFAULT NULL COMMENT 'Intensidad promedio de síntomas PRN',
  `adherencia_porcentaje` decimal(5,2) DEFAULT NULL COMMENT 'administradas/programadas * 100',
  `puntualidad_porcentaje` decimal(5,2) DEFAULT NULL COMMENT 'dentro ventana/administradas * 100',
  `cantidad_total_administrada` decimal(10,3) NOT NULL DEFAULT '0.000',
  `unidad` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calculated_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE `generos` (
  `id` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='M: Masculino, F: Femenino, O: Otro';

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`id`, `nombre`) VALUES
('F', 'Femenino'),
('M', 'Masculino'),
('O', 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios_programados`
--

CREATE TABLE `horarios_programados` (
  `id` bigint UNSIGNED NOT NULL,
  `medicamento_tratamiento_id` bigint UNSIGNED NOT NULL,
  `paciente_id` bigint UNSIGNED NOT NULL,
  `hora_programada` time NOT NULL,
  `dias_semana` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'L,M,X,J,V,S,D o Daily',
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `horarios_programados`
--

INSERT INTO `horarios_programados` (`id`, `medicamento_tratamiento_id`, `paciente_id`, `hora_programada`, `dias_semana`, `fecha_inicio`, `fecha_fin`, `activo`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '08:00:00', 'Daily', '2025-07-08', '2025-10-06', 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(2, 2, 1, '08:00:00', 'Daily', '2025-07-08', '2026-01-04', 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(3, 2, 1, '20:00:00', 'Daily', '2025-07-08', '2026-01-04', 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(8, 5, 1, '08:00:00', 'Daily', '2025-07-08', '2025-08-07', 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(9, 5, 1, '20:00:00', 'Daily', '2025-07-08', '2025-08-07', 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(10, 6, 1, '08:00:00', '0', '2025-06-24', NULL, 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(11, 6, 1, '08:00:00', '1', '2025-06-24', NULL, 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(12, 6, 1, '20:00:00', '1', '2025-06-24', NULL, 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(13, 6, 1, '08:00:00', '2', '2025-06-24', NULL, 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(14, 6, 1, '14:00:00', '2', '2025-06-24', NULL, 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(15, 6, 1, '20:00:00', '2', '2025-06-24', NULL, 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(16, 6, 1, '08:00:00', '3', '2025-06-24', NULL, 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(17, 6, 1, '20:00:00', '3', '2025-06-24', NULL, 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(18, 6, 1, '08:00:00', '4', '2025-06-24', NULL, 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(19, 6, 1, '08:00:00', '5', '2025-06-24', NULL, 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(20, 6, 1, '14:00:00', '5', '2025-06-24', NULL, 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(21, 6, 1, '08:00:00', '6', '2025-06-24', NULL, 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(22, 6, 1, '20:00:00', '6', '2025-06-24', NULL, 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(23, 7, 2, '09:00:00', 'Daily', '2025-06-24', '2025-10-08', 1, '2025-06-24 00:00:00', '2025-06-24 00:00:00'),
(24, 7, 2, '21:00:00', 'Daily', '2025-06-24', '2025-10-08', 1, '2025-06-24 00:00:00', '2025-06-24 00:00:00'),
(25, 8, 2, '08:00:00', 'Daily', '2025-06-24', '2025-10-08', 1, '2025-06-24 00:00:00', '2025-06-24 00:00:00'),
(26, 9, 2, '08:30:00', 'Daily', '2025-06-24', '2025-10-08', 1, '2025-06-24 00:00:00', '2025-06-24 00:00:00'),
(27, 9, 2, '14:30:00', 'Daily', '2025-06-24', '2025-10-08', 1, '2025-06-24 00:00:00', '2025-06-24 00:00:00'),
(28, 9, 2, '20:30:00', 'Daily', '2025-06-24', '2025-10-08', 1, '2025-06-24 00:00:00', '2025-06-24 00:00:00'),
(29, 10, 2, '07:00:00', 'Daily', '2025-06-24', '2025-10-08', 1, '2025-06-24 00:00:00', '2025-06-24 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos`
--

CREATE TABLE `medicamentos` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `principio_activo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forma_farmaceutica` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `via_administracion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medida` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unidad_medida` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `medicamentos`
--

INSERT INTO `medicamentos` (`id`, `nombre`, `principio_activo`, `forma_farmaceutica`, `via_administracion`, `medida`, `unidad_medida`, `descripcion`, `activo`, `created_at`, `updated_at`) VALUES
(1, 'Paracetamol 500mg', 'Paracetamol', 'Comprimido', 'Oral', '0', 'mg', 'Analgésico y antipirético para dolor y fiebre', 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(2, 'Ibuprofeno 400mg', 'Ibuprofeno', 'Comprimido', 'Oral', '0', 'mg', 'Antiinflamatorio no esteroideo para dolor e inflamación', 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(3, 'Ketorolaco 10mg', 'Ketorolaco', 'Comprimido', 'Oral', '10', 'mg', 'Analgésico potente para dolor moderado a severo', 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(4, 'Ondansetrón 4mg', 'Ondansetrón', 'Comprimido', 'Oral', '4', 'mg', 'Antiemético para náuseas y vómitos', 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(5, 'Metoclopramida 10mg', 'Metoclopramida', 'Comprimido', 'Oral', '10', 'mg', 'Procinético y antiemético', 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(6, 'Lorazepam 1mg', 'Lorazepam', 'Comprimido', 'Oral', '1', 'mg', 'Ansiolítico para crisis de ansiedad', 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(7, 'Zolpidem 10mg', 'Zolpidem', 'Comprimido', 'Oral', '10', 'mg', 'Hipnótico para insomnio', 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(8, 'Losartán 50mg', 'Losartán', 'Comprimido', 'Oral', '50', 'mg', 'Antihipertensivo para control de presión arterial', 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(9, 'Metformina 850mg', 'Metformina', 'Comprimido', 'Oral', '850', 'mg', 'Antidiabético para control de glucemia', 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(10, 'Amoxicilina 500mg', 'Amoxicilina', 'Cápsula', 'Oral', '500', 'mg', 'Antibiótico betalactámico', 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(11, 'Omeprazol 20mg', 'Omeprazol', 'Cápsula', 'Oral', '20', 'mg', 'Inhibidor de bomba de protones', 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(12, 'Simvastatina 20mg', 'Simvastatina', 'Comprimido', 'Oral', '20', 'mg', 'Estatina para control de colesterol', 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(13, 'Salbutamol 100mcg', 'Salbutamol', 'Inhalador', 'Inhalatoria', '0.1', 'mcg', 'Broncodilatador para crisis asmáticas', 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(14, 'Captopril 25mg sublingual', 'Captopril', 'Comprimido sublingual', 'Sublingual', '25', 'mg', 'Para crisis hipertensivas', 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(15, 'Hidrocortisona 1% crema', 'Hidrocortisona', 'Crema', 'Tópica', '10', 'mg', 'Corticoide tópico para inflamación cutánea', 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(16, 'Paracetamol Seeder', NULL, NULL, NULL, 'mg', 'tableta', NULL, 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(17, 'Ibuprofeno', NULL, NULL, NULL, '400', 'mg', 'Antiinflamatorio no esteroideo', 1, '2025-06-24 00:00:00', '2025-06-24 00:00:00'),
(18, 'Omeprazol', NULL, NULL, NULL, '20', 'mg', 'Inhibidor de la bomba de protones', 1, '2025-06-24 00:00:00', '2025-06-24 00:00:00'),
(19, 'Metformina', NULL, NULL, NULL, '850', 'mg', 'Antidiabético oral', 1, '2025-06-24 00:00:00', '2025-06-24 00:00:00'),
(20, 'Losartán', NULL, NULL, NULL, '50', 'mg', 'Antagonista de los receptores de angiotensina II', 1, '2025-06-24 00:00:00', '2025-06-24 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos_tratamientos`
--

CREATE TABLE `medicamentos_tratamientos` (
  `id` bigint UNSIGNED NOT NULL,
  `medicamento_id` bigint UNSIGNED NOT NULL,
  `tratamiento_id` bigint UNSIGNED NOT NULL,
  `dosis_cantidad` decimal(10,3) NOT NULL,
  `unidad_dosis` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `frecuencia_horas` int NOT NULL,
  `tolerancia_antes_minutos` int NOT NULL DEFAULT '30' COMMENT 'Ventana antes del horario',
  `tolerancia_despues_minutos` int NOT NULL DEFAULT '60' COMMENT 'Ventana después del horario',
  `duracion_dias` int DEFAULT NULL COMMENT 'Duración del tratamiento en días',
  `instrucciones_especiales` text COLLATE utf8mb4_unicode_ci,
  `estado` enum('Activo','Pausado','Suspendido') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Activo',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `motivo_suspension` text COLLATE utf8mb4_unicode_ci,
  `orden` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `medicamentos_tratamientos`
--

INSERT INTO `medicamentos_tratamientos` (`id`, `medicamento_id`, `tratamiento_id`, `dosis_cantidad`, `unidad_dosis`, `frecuencia_horas`, `tolerancia_antes_minutos`, `tolerancia_despues_minutos`, `duracion_dias`, `instrucciones_especiales`, `estado`, `activo`, `motivo_suspension`, `orden`, `created_at`, `updated_at`) VALUES
(1, 8, 1, 50.000, 'mg', 24, 60, 60, 90, 'Tomar una vez al día por la mañana', 'Activo', 1, NULL, 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(2, 9, 2, 850.000, 'mg', 12, 60, 60, 180, 'Tomar con las comidas principales (desayuno y cena)', 'Activo', 1, NULL, 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(5, 6, 5, 1.000, 'mg', 12, 60, 60, 30, 'Tomar cada 12 horas con las comidas', 'Activo', 1, NULL, 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(6, 16, 7, 1.000, 'tableta', 8, 30, 60, 14, NULL, 'Activo', 1, NULL, 1, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(7, 17, 8, 400.000, 'mg', 12, 30, 60, 90, NULL, 'Activo', 1, NULL, 1, '2025-06-24 00:00:00', '2025-06-24 00:00:00'),
(8, 18, 9, 20.000, 'mg', 24, 30, 60, 90, NULL, 'Activo', 1, NULL, 1, '2025-06-24 00:00:00', '2025-06-24 00:00:00'),
(9, 19, 10, 850.000, 'mg', 8, 30, 60, 90, NULL, 'Activo', 1, NULL, 1, '2025-06-24 00:00:00', '2025-06-24 00:00:00'),
(10, 20, 11, 50.000, 'mg', 24, 30, 60, 90, NULL, 'Activo', 1, NULL, 1, '2025-06-24 00:00:00', '2025-06-24 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metricas_adherencia_temporal`
--

CREATE TABLE `metricas_adherencia_temporal` (
  `id` bigint UNSIGNED NOT NULL,
  `paciente_id` bigint UNSIGNED NOT NULL,
  `medicamento_id` bigint UNSIGNED DEFAULT NULL,
  `tratamiento_id` bigint UNSIGNED DEFAULT NULL,
  `periodo_inicio` date NOT NULL,
  `periodo_fin` date NOT NULL,
  `tipo_periodo` enum('diario','semanal','mensual') COLLATE utf8mb4_unicode_ci NOT NULL,
  `puntualidad_promedio` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT 'Score promedio de puntualidad',
  `dosis_puntuales` int NOT NULL DEFAULT '0' COMMENT 'Dosis dentro de ventana ideal',
  `dosis_tempranas` int NOT NULL DEFAULT '0' COMMENT 'Dosis tomadas antes de tiempo',
  `dosis_tardias` int NOT NULL DEFAULT '0' COMMENT 'Dosis tomadas tarde',
  `tiempo_promedio_adelanto` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT 'Promedio minutos de adelanto',
  `tiempo_promedio_retraso` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT 'Promedio minutos de retraso',
  `variabilidad_horaria` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT 'Desviación estándar de tiempos',
  `distribucion_por_horas` json DEFAULT NULL COMMENT 'Distribución de tomas por hora del día',
  `patrones_semanales` json DEFAULT NULL COMMENT 'Patrones de adherencia por día de semana',
  `calculated_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_03_21_000000_create_medicamentos_table', 1),
(5, '2025_01_15_100002_update_medicamentos_table', 1),
(6, '2025_01_15_100003_create_tratamientos_table', 1),
(7, '2025_01_15_100004_create_medicamentos_tratamientos_table', 1),
(8, '2025_01_15_100006_create_horarios_programados_table', 1),
(9, '2025_01_15_100007_create_administraciones_table', 1),
(10, '2025_01_15_100008_create_alertas_table', 1),
(11, '2025_01_15_100009_create_estadisticas_consumo_table', 1),
(12, '2025_01_15_100010_create_resumen_adherencia_paciente_table', 1),
(13, '2025_01_20_000000_add_temporal_adherence_metrics', 1),
(14, '2025_06_04_160747_create_roles_table', 1),
(15, '2025_06_04_160748_create_personal_medico_table', 1),
(16, '2025_06_04_160748_create_usuarios_table', 1),
(17, '2025_06_04_160749_create_apoderados_table', 1),
(18, '2025_06_04_160749_create_cuidadores_table', 1),
(19, '2025_06_04_160750_create_generos_table', 1),
(20, '2025_06_04_160751_create_pacientes_table', 1),
(21, '2025_06_04_160752_create_paciente_apoderados_table', 1),
(22, '2025_06_04_160753_create_paciente_cuidadores_table', 1),
(23, '2025_06_04_160753_create_permisos_table', 1),
(24, '2025_06_04_160753_create_rol_permisos_table', 1),
(25, '2025_06_04_160754_create_paciente_medicos_table', 1),
(26, '2025_06_04_160755_create_sesiones_usuario_table', 1),
(27, '2025_06_04_203852_alter_cuidadores_tarifa_hora_to_integer', 1),
(28, '2025_06_11_210255_add_medico_usuario_id_to_tratamientos_table', 1),
(29, '2025_06_13_053721_add_missing_columns_to_medicamentos_table', 1),
(30, '2025_06_18_164506_create_audit_logs_table', 1),
(31, '2025_06_25_203926_remove_prn_system_from_database', 1),
(32, '2025_06_25_205946_drop_permisos_temporales_table', 1),
(33, '2025_06_26_171000_add_nombres_separados_to_users_table', 1),
(34, '2025_06_27_000000_add_missing_foreign_keys', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id` bigint UNSIGNED NOT NULL,
  `usuario_id` bigint UNSIGNED DEFAULT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `genero_id` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_documento` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_documento` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_sangre` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `altura` decimal(5,2) DEFAULT NULL,
  `direccion` text COLLATE utf8mb4_unicode_ci,
  `telefono_emergencia` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observaciones_medicas` text COLLATE utf8mb4_unicode_ci,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Pacientes del sistema - pueden o no tener cuenta de usuario';

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id`, `usuario_id`, `nombre`, `fecha_nacimiento`, `genero_id`, `numero_documento`, `tipo_documento`, `tipo_sangre`, `altura`, `direccion`, `telefono_emergencia`, `observaciones_medicas`, `activo`, `created_at`) VALUES
(1, 5, 'Ana López', '1985-03-15', 'F', '12.345.678-9', 'rut', 'O+', 165.50, 'Av. Principal 123, Santiago', '+56 9 6666 6666', 'Alérgica a la penicilina', 1, '2025-07-08 22:17:34'),
(2, NULL, 'Pedro Silva Menor', '2010-08-22', 'M', '25.987.654-3', 'rut', 'A+', 140.00, 'Calle Secundaria 456, Valparaíso', '+56 9 4444 4444', 'Asma leve, inhalador de rescate', 1, '2025-07-08 22:17:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente_apoderados`
--

CREATE TABLE `paciente_apoderados` (
  `paciente_id` bigint UNSIGNED NOT NULL,
  `apoderado_usuario_id` bigint UNSIGNED NOT NULL,
  `es_principal` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Un paciente puede tener múltiples apoderados';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente_cuidadores`
--

CREATE TABLE `paciente_cuidadores` (
  `paciente_id` bigint UNSIGNED NOT NULL,
  `cuidador_usuario_id` bigint UNSIGNED NOT NULL,
  `fecha_asignacion` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Asignación de cuidadores a pacientes';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente_medicos`
--

CREATE TABLE `paciente_medicos` (
  `paciente_id` bigint UNSIGNED NOT NULL,
  `medico_usuario_id` bigint UNSIGNED NOT NULL,
  `es_medico_principal` tinyint(1) NOT NULL DEFAULT '0',
  `fecha_asignacion` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `especialidad_tratamiento` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Asignación de médicos a pacientes';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `modulo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Permisos específicos del sistema';

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id`, `nombre`, `descripcion`, `modulo`) VALUES
(1, 'usuarios.index', 'Ver lista de usuarios', 'usuarios'),
(2, 'usuarios.create', 'Crear usuarios', 'usuarios'),
(3, 'usuarios.edit', 'Editar usuarios', 'usuarios'),
(4, 'usuarios.delete', 'Eliminar usuarios', 'usuarios'),
(5, 'roles.index', 'Ver lista de roles', 'roles'),
(6, 'roles.create', 'Crear roles', 'roles'),
(7, 'roles.edit', 'Editar roles', 'roles'),
(8, 'roles.delete', 'Eliminar roles', 'roles'),
(9, 'pacientes.index', 'Ver lista de pacientes', 'pacientes'),
(10, 'pacientes.create', 'Crear pacientes', 'pacientes'),
(11, 'pacientes.edit', 'Editar pacientes', 'pacientes'),
(12, 'pacientes.delete', 'Eliminar pacientes', 'pacientes'),
(13, 'pacientes.own', 'Ver solo sus propios datos', 'pacientes'),
(14, 'personal-medico.index', 'Ver personal médico', 'personal-medico'),
(15, 'personal-medico.create', 'Crear personal médico', 'personal-medico'),
(16, 'personal-medico.edit', 'Editar personal médico', 'personal-medico'),
(17, 'personal-medico.delete', 'Eliminar personal médico', 'personal-medico'),
(18, 'cuidadores.index', 'Ver cuidadores', 'cuidadores'),
(19, 'cuidadores.create', 'Crear cuidadores', 'cuidadores'),
(20, 'cuidadores.edit', 'Editar cuidadores', 'cuidadores'),
(21, 'cuidadores.delete', 'Eliminar cuidadores', 'cuidadores'),
(22, 'apoderados.index', 'Ver apoderados', 'apoderados'),
(23, 'apoderados.create', 'Crear apoderados', 'apoderados'),
(24, 'apoderados.edit', 'Editar apoderados', 'apoderados'),
(25, 'apoderados.delete', 'Eliminar apoderados', 'apoderados'),
(26, 'medicines.index', 'Ver medicamentos', 'medicines'),
(27, 'medicines.create', 'Crear medicamentos', 'medicines'),
(28, 'medicines.edit', 'Editar medicamentos', 'medicines'),
(29, 'medicines.delete', 'Eliminar medicamentos', 'medicines'),
(30, 'tratamientos.index', 'Ver tratamientos', 'tratamientos'),
(31, 'tratamientos.create', 'Crear tratamientos', 'tratamientos'),
(32, 'tratamientos.edit', 'Editar tratamientos', 'tratamientos'),
(33, 'tratamientos.delete', 'Eliminar tratamientos', 'tratamientos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_medico`
--

CREATE TABLE `personal_medico` (
  `usuario_id` bigint UNSIGNED NOT NULL,
  `especialidad` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_colegiatura` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `institucion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `anos_experiencia` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Información específica del personal médico';

--
-- Volcado de datos para la tabla `personal_medico`
--

INSERT INTO `personal_medico` (`usuario_id`, `especialidad`, `numero_colegiatura`, `institucion`, `anos_experiencia`) VALUES
(2, 'Medicina Interna', 'MED-12345', 'Hospital Central', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resumen_adherencia_paciente`
--

CREATE TABLE `resumen_adherencia_paciente` (
  `id` bigint UNSIGNED NOT NULL,
  `paciente_id` bigint UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `total_medicamentos_activos` int NOT NULL DEFAULT '0',
  `total_dosis_programadas` int NOT NULL DEFAULT '0',
  `total_dosis_administradas` int NOT NULL DEFAULT '0',
  `total_dosis_omitidas` int NOT NULL DEFAULT '0',
  `total_dosis_prn` int NOT NULL DEFAULT '0',
  `sintomas_mas_frecuentes` json DEFAULT NULL COMMENT 'Top 3 síntomas del día',
  `total_medicamentos_prn_activos` int NOT NULL DEFAULT '0',
  `adherencia_general_porcentaje` decimal(5,2) DEFAULT NULL,
  `puntualidad_general_porcentaje` decimal(5,2) DEFAULT NULL,
  `calculated_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Roles del sistema: admin, medico, cuidador, apoderado, paciente';

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`, `descripcion`, `activo`, `created_at`) VALUES
(1, 'admin', 'Administrador del sistema con acceso total', 1, '2025-07-08 22:17:33'),
(2, 'medico', 'Personal médico - gestión de pacientes y diagnósticos', 1, '2025-07-08 22:17:33'),
(3, 'cuidador', 'Cuidador de pacientes - acceso limitado a pacientes asignados', 1, '2025-07-08 22:17:33'),
(4, 'apoderado', 'Apoderado/tutor - acceso a información de pacientes a cargo', 1, '2025-07-08 22:17:33'),
(5, 'paciente', 'Paciente - acceso a su propia información médica', 1, '2025-07-08 22:17:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_permisos`
--

CREATE TABLE `rol_permisos` (
  `rol_id` bigint UNSIGNED NOT NULL,
  `permiso_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Permisos asignados a cada rol';

--
-- Volcado de datos para la tabla `rol_permisos`
--

INSERT INTO `rol_permisos` (`rol_id`, `permiso_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(2, 9),
(3, 9),
(4, 9),
(1, 10),
(2, 10),
(1, 11),
(2, 11),
(3, 11),
(1, 12),
(2, 12),
(1, 13),
(5, 13),
(1, 14),
(2, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(2, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(2, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(2, 26),
(3, 26),
(4, 26),
(5, 26),
(1, 27),
(2, 27),
(5, 27),
(1, 28),
(2, 28),
(5, 28),
(1, 29),
(2, 29),
(1, 30),
(5, 30),
(1, 31),
(5, 31),
(1, 32),
(5, 32),
(1, 33);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesiones_usuario`
--

CREATE TABLE `sesiones_usuario` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('9ha4WfJJoqPM0jjma93L1f4Ns7QWiqU7foLJoIoO', 1, '192.168.65.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiaGJoSlZjb2EyZjBnR3BzR0ljc2lvV2NNb0V0aHU5Zks3UGdDaTNKZiI7czozOiJ1cmwiO2E6MDp7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjEwNjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FwaS90ZW1wb3JhbC1hZGhlcmVuY2UvcGF0aWVudC8yL3RyZW5kcz9mZWNoYV9maW49MjAyNS0wNy0xMyZmZWNoYV9pbmljaW89MjAyNS0wNy0wMiI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1752033002),
('CZHBcv1WjMf8eWS3uY9fkaUcBUYvvfySmO8O8WWA', 1, '192.168.65.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiY0hsZGRXY0RrZEZYU1Z6MXdROGRxQVUxc05LOG53bGM4SmlWQlJPeCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXVkaXQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1752033691);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamientos`
--

CREATE TABLE `tratamientos` (
  `id` bigint UNSIGNED NOT NULL,
  `paciente_id` bigint UNSIGNED NOT NULL,
  `medico_usuario_id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `objetivo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diagnostico` text COLLATE utf8mb4_unicode_ci,
  `tipo` enum('Programado') COLLATE utf8mb4_unicode_ci DEFAULT 'Programado',
  `estado` enum('Activo','Pausado','Completado','Suspendido') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Activo',
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `observaciones` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tratamientos`
--

INSERT INTO `tratamientos` (`id`, `paciente_id`, `medico_usuario_id`, `nombre`, `objetivo`, `diagnostico`, `tipo`, `estado`, `fecha_inicio`, `fecha_fin`, `observaciones`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Control Hipertensión', NULL, 'Hipertensión arterial esencial', 'Programado', 'Activo', '2025-07-08', '2025-10-08', 'Control estricto de presión arterial. Monitoreo diario.', '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(2, 1, 2, 'Control Diabetes', NULL, 'Diabetes mellitus tipo 2', 'Programado', 'Activo', '2025-07-08', '2026-01-08', 'Control glicémico con metformina. Dieta y ejercicio.', '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(5, 1, 2, 'Control de Ansiedad', NULL, 'Trastorno de ansiedad generalizada', 'Programado', 'Activo', '2025-07-08', '2025-08-08', 'Tratamiento ansiolítico programado. Seguimiento semanal.', '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(6, 1, 2, 'Suplementación Vitamínica', NULL, 'Deficiencia de vitaminas del complejo B', 'Programado', 'Activo', '2025-07-08', '2025-10-08', 'Suplemento vitamínico diario con las comidas.', '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(7, 1, 2, 'Tratamiento Realista Seeder', NULL, NULL, 'Programado', 'Activo', '2025-06-24', NULL, NULL, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(8, 2, 2, 'Tratamiento Ibuprofeno', NULL, 'Tratamiento con Ibuprofeno', 'Programado', 'Activo', '2025-06-24', '2025-10-08', 'Antiinflamatorio no esteroideo', '2025-06-24 00:00:00', '2025-06-24 00:00:00'),
(9, 2, 2, 'Tratamiento Omeprazol', NULL, 'Tratamiento con Omeprazol', 'Programado', 'Activo', '2025-06-24', '2025-10-08', 'Inhibidor de la bomba de protones', '2025-06-24 00:00:00', '2025-06-24 00:00:00'),
(10, 2, 2, 'Tratamiento Metformina', NULL, 'Tratamiento con Metformina', 'Programado', 'Activo', '2025-06-24', '2025-10-08', 'Antidiabético oral', '2025-06-24 00:00:00', '2025-06-24 00:00:00'),
(11, 2, 2, 'Tratamiento Losartán', NULL, 'Tratamiento con Losartán', 'Programado', 'Activo', '2025-06-24', '2025-10-08', 'Antagonista de los receptores de angiotensina II', '2025-06-24 00:00:00', '2025-06-24 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido_paterno` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido_materno` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rol_id` bigint UNSIGNED DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `email_verificado` tinyint(1) NOT NULL DEFAULT '0',
  `ultimo_acceso` timestamp NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Tabla central de usuarios del sistema';

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `nombre`, `apellido_paterno`, `apellido_materno`, `email`, `telefono`, `rol_id`, `activo`, `email_verificado`, `ultimo_acceso`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrador Sistema', 'Administrador', 'Sistema', '', 'admin@meditrack.com', '+56 9 1111 1111', 1, 1, 0, NULL, '2025-07-08 22:17:33', '$2y$12$j6SPVo3anOB71PA5AhE3bebcuGnqZQ/MPxIGX9Js3Z5pDp3CnY0Oe', NULL, '2025-07-08 22:17:33', '2025-07-08 22:17:33'),
(2, 'Dr. Juan Pérez', 'Dr.', 'Juan', 'Pérez', 'medico@meditrack.com', '+56 9 2222 2222', 2, 1, 0, NULL, '2025-07-08 22:17:33', '$2y$12$ymjW.d07CnfpN4nwUPQwS.DcAIrqHfEPYhNtNwOCHJ9FaOyIQm0GO', NULL, '2025-07-08 22:17:33', '2025-07-08 22:17:33'),
(3, 'María González', 'María', 'González', '', 'cuidador@meditrack.com', '+56 9 3333 3333', 3, 1, 0, NULL, '2025-07-08 22:17:34', '$2y$12$tn.mLkO/zqe52ZXW7qUp3.UouGVYqs7BtayejaIXzzrg41SFHJDIm', NULL, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(4, 'Carlos Silva', 'Carlos', 'Silva', '', 'apoderado@meditrack.com', '+56 9 4444 4444', 4, 1, 0, NULL, '2025-07-08 22:17:34', '$2y$12$fgcjU93oA6dZgnd45IFkZ.yuOWt.zqf1yE2bkyIW1vG5EaNGQ0WFS', NULL, '2025-07-08 22:17:34', '2025-07-08 22:17:34'),
(5, 'Ana López', 'Ana', 'López', '', 'paciente@meditrack.com', '+56 9 5555 5555', 5, 1, 0, NULL, '2025-07-08 22:17:34', '$2y$12$2c.cSi.SExypM9gcEoL9uuZDi/oHFI.R98inKeerKi8/cna8Tnjq2', NULL, '2025-07-08 22:17:34', '2025-07-08 22:17:34');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administraciones`
--
ALTER TABLE `administraciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `administraciones_paciente_id_fecha_hora_administrada_index` (`paciente_id`,`fecha_hora_administrada`),
  ADD KEY `administraciones_medicamento_tratamiento_id_estado_index` (`medicamento_tratamiento_id`,`estado`),
  ADD KEY `administraciones_cuidador_usuario_id_index` (`cuidador_usuario_id`),
  ADD KEY `administraciones_sintoma_reportado_id_index` (`sintoma_reportado_id`),
  ADD KEY `idx_admin_temporal_metrics` (`paciente_id`,`fecha_hora_programada`,`score_puntualidad`),
  ADD KEY `idx_admin_categoria_temporal` (`categoria_temporal`,`paciente_id`),
  ADD KEY `administraciones_horario_programado_id_foreign` (`horario_programado_id`);

--
-- Indices de la tabla `alertas`
--
ALTER TABLE `alertas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alertas_paciente_id_revisada_index` (`paciente_id`,`revisada`),
  ADD KEY `alertas_tipo_nivel_index` (`tipo`,`nivel`),
  ADD KEY `alertas_fecha_generada_index` (`fecha_generada`),
  ADD KEY `alertas_tratamiento_id_foreign` (`tratamiento_id`),
  ADD KEY `alertas_administracion_id_foreign` (`administracion_id`),
  ADD KEY `alertas_revisada_por_foreign` (`revisada_por`);

--
-- Indices de la tabla `apoderados`
--
ALTER TABLE `apoderados`
  ADD PRIMARY KEY (`usuario_id`);

--
-- Indices de la tabla `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audit_logs_usuario_id_created_at_index` (`usuario_id`,`created_at`),
  ADD KEY `audit_logs_tabla_afectada_registro_id_index` (`tabla_afectada`,`registro_id`),
  ADD KEY `audit_logs_accion_created_at_index` (`accion`,`created_at`),
  ADD KEY `audit_logs_severidad_created_at_index` (`severidad`,`created_at`),
  ADD KEY `audit_logs_session_id_index` (`session_id`);

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cuidadores`
--
ALTER TABLE `cuidadores`
  ADD PRIMARY KEY (`usuario_id`);

--
-- Indices de la tabla `estadisticas_consumo`
--
ALTER TABLE `estadisticas_consumo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_estadistica` (`paciente_id`,`medicamento_id`,`periodo_inicio`,`tipo_periodo`),
  ADD KEY `estadisticas_consumo_tipo_periodo_periodo_inicio_index` (`tipo_periodo`,`periodo_inicio`),
  ADD KEY `estadisticas_consumo_medicamento_id_foreign` (`medicamento_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `generos_nombre_unique` (`nombre`);

--
-- Indices de la tabla `horarios_programados`
--
ALTER TABLE `horarios_programados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `horarios_programados_paciente_id_activo_index` (`paciente_id`,`activo`),
  ADD KEY `horarios_programados_medicamento_tratamiento_id_activo_index` (`medicamento_tratamiento_id`,`activo`),
  ADD KEY `horarios_programados_fecha_inicio_fecha_fin_index` (`fecha_inicio`,`fecha_fin`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medicamentos_activo_index` (`activo`);

--
-- Indices de la tabla `medicamentos_tratamientos`
--
ALTER TABLE `medicamentos_tratamientos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medicamentos_tratamientos_medicamento_id_tratamiento_id_index` (`medicamento_id`,`tratamiento_id`),
  ADD KEY `medicamentos_tratamientos_tratamiento_id_estado_index` (`tratamiento_id`,`estado`);

--
-- Indices de la tabla `metricas_adherencia_temporal`
--
ALTER TABLE `metricas_adherencia_temporal`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_metrica_temporal` (`paciente_id`,`medicamento_id`,`tratamiento_id`,`periodo_inicio`,`tipo_periodo`),
  ADD KEY `metricas_adherencia_temporal_paciente_id_periodo_inicio_index` (`paciente_id`,`periodo_inicio`),
  ADD KEY `metricas_adherencia_temporal_puntualidad_promedio_index` (`puntualidad_promedio`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pacientes_numero_documento_unique` (`numero_documento`),
  ADD KEY `pacientes_usuario_id_foreign` (`usuario_id`),
  ADD KEY `pacientes_genero_id_foreign` (`genero_id`);

--
-- Indices de la tabla `paciente_apoderados`
--
ALTER TABLE `paciente_apoderados`
  ADD PRIMARY KEY (`paciente_id`,`apoderado_usuario_id`),
  ADD KEY `paciente_apoderados_apoderado_usuario_id_foreign` (`apoderado_usuario_id`);

--
-- Indices de la tabla `paciente_cuidadores`
--
ALTER TABLE `paciente_cuidadores`
  ADD PRIMARY KEY (`paciente_id`,`cuidador_usuario_id`),
  ADD KEY `paciente_cuidadores_cuidador_usuario_id_foreign` (`cuidador_usuario_id`);

--
-- Indices de la tabla `paciente_medicos`
--
ALTER TABLE `paciente_medicos`
  ADD PRIMARY KEY (`paciente_id`,`medico_usuario_id`),
  ADD KEY `paciente_medicos_medico_usuario_id_foreign` (`medico_usuario_id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permisos_nombre_unique` (`nombre`);

--
-- Indices de la tabla `personal_medico`
--
ALTER TABLE `personal_medico`
  ADD PRIMARY KEY (`usuario_id`),
  ADD UNIQUE KEY `personal_medico_numero_colegiatura_unique` (`numero_colegiatura`);

--
-- Indices de la tabla `resumen_adherencia_paciente`
--
ALTER TABLE `resumen_adherencia_paciente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `resumen_adherencia_paciente_paciente_id_fecha_unique` (`paciente_id`,`fecha`),
  ADD KEY `resumen_adherencia_paciente_fecha_index` (`fecha`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_nombre_unique` (`nombre`);

--
-- Indices de la tabla `rol_permisos`
--
ALTER TABLE `rol_permisos`
  ADD PRIMARY KEY (`rol_id`,`permiso_id`),
  ADD KEY `rol_permisos_permiso_id_foreign` (`permiso_id`);

--
-- Indices de la tabla `sesiones_usuario`
--
ALTER TABLE `sesiones_usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `tratamientos`
--
ALTER TABLE `tratamientos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tratamientos_paciente_id_estado_index` (`paciente_id`,`estado`),
  ADD KEY `tratamientos_tipo_estado_index` (`tipo`,`estado`),
  ADD KEY `tratamientos_medico_usuario_id_index` (`medico_usuario_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_rol_id_foreign` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administraciones`
--
ALTER TABLE `administraciones`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT de la tabla `alertas`
--
ALTER TABLE `alertas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=224;

--
-- AUTO_INCREMENT de la tabla `estadisticas_consumo`
--
ALTER TABLE `estadisticas_consumo`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `horarios_programados`
--
ALTER TABLE `horarios_programados`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `medicamentos_tratamientos`
--
ALTER TABLE `medicamentos_tratamientos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `metricas_adherencia_temporal`
--
ALTER TABLE `metricas_adherencia_temporal`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `resumen_adherencia_paciente`
--
ALTER TABLE `resumen_adherencia_paciente`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `sesiones_usuario`
--
ALTER TABLE `sesiones_usuario`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tratamientos`
--
ALTER TABLE `tratamientos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administraciones`
--
ALTER TABLE `administraciones`
  ADD CONSTRAINT `administraciones_cuidador_usuario_id_foreign` FOREIGN KEY (`cuidador_usuario_id`) REFERENCES `cuidadores` (`usuario_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `administraciones_horario_programado_id_foreign` FOREIGN KEY (`horario_programado_id`) REFERENCES `horarios_programados` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `administraciones_medicamento_tratamiento_id_foreign` FOREIGN KEY (`medicamento_tratamiento_id`) REFERENCES `medicamentos_tratamientos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `administraciones_paciente_id_foreign` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `alertas`
--
ALTER TABLE `alertas`
  ADD CONSTRAINT `alertas_administracion_id_foreign` FOREIGN KEY (`administracion_id`) REFERENCES `administraciones` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `alertas_paciente_id_foreign` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `alertas_revisada_por_foreign` FOREIGN KEY (`revisada_por`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `alertas_tratamiento_id_foreign` FOREIGN KEY (`tratamiento_id`) REFERENCES `tratamientos` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `apoderados`
--
ALTER TABLE `apoderados`
  ADD CONSTRAINT `apoderados_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD CONSTRAINT `audit_logs_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `cuidadores`
--
ALTER TABLE `cuidadores`
  ADD CONSTRAINT `cuidadores_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `estadisticas_consumo`
--
ALTER TABLE `estadisticas_consumo`
  ADD CONSTRAINT `estadisticas_consumo_medicamento_id_foreign` FOREIGN KEY (`medicamento_id`) REFERENCES `medicamentos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `estadisticas_consumo_paciente_id_foreign` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `horarios_programados`
--
ALTER TABLE `horarios_programados`
  ADD CONSTRAINT `horarios_programados_medicamento_tratamiento_id_foreign` FOREIGN KEY (`medicamento_tratamiento_id`) REFERENCES `medicamentos_tratamientos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `horarios_programados_paciente_id_foreign` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `medicamentos_tratamientos`
--
ALTER TABLE `medicamentos_tratamientos`
  ADD CONSTRAINT `medicamentos_tratamientos_medicamento_id_foreign` FOREIGN KEY (`medicamento_id`) REFERENCES `medicamentos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `medicamentos_tratamientos_tratamiento_id_foreign` FOREIGN KEY (`tratamiento_id`) REFERENCES `tratamientos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `pacientes_genero_id_foreign` FOREIGN KEY (`genero_id`) REFERENCES `generos` (`id`),
  ADD CONSTRAINT `pacientes_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `paciente_apoderados`
--
ALTER TABLE `paciente_apoderados`
  ADD CONSTRAINT `paciente_apoderados_apoderado_usuario_id_foreign` FOREIGN KEY (`apoderado_usuario_id`) REFERENCES `apoderados` (`usuario_id`),
  ADD CONSTRAINT `paciente_apoderados_paciente_id_foreign` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`);

--
-- Filtros para la tabla `paciente_cuidadores`
--
ALTER TABLE `paciente_cuidadores`
  ADD CONSTRAINT `paciente_cuidadores_cuidador_usuario_id_foreign` FOREIGN KEY (`cuidador_usuario_id`) REFERENCES `cuidadores` (`usuario_id`),
  ADD CONSTRAINT `paciente_cuidadores_paciente_id_foreign` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`);

--
-- Filtros para la tabla `paciente_medicos`
--
ALTER TABLE `paciente_medicos`
  ADD CONSTRAINT `paciente_medicos_medico_usuario_id_foreign` FOREIGN KEY (`medico_usuario_id`) REFERENCES `personal_medico` (`usuario_id`),
  ADD CONSTRAINT `paciente_medicos_paciente_id_foreign` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`);

--
-- Filtros para la tabla `personal_medico`
--
ALTER TABLE `personal_medico`
  ADD CONSTRAINT `personal_medico_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `resumen_adherencia_paciente`
--
ALTER TABLE `resumen_adherencia_paciente`
  ADD CONSTRAINT `resumen_adherencia_paciente_paciente_id_foreign` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `rol_permisos`
--
ALTER TABLE `rol_permisos`
  ADD CONSTRAINT `rol_permisos_permiso_id_foreign` FOREIGN KEY (`permiso_id`) REFERENCES `permisos` (`id`),
  ADD CONSTRAINT `rol_permisos_rol_id_foreign` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `tratamientos`
--
ALTER TABLE `tratamientos`
  ADD CONSTRAINT `tratamientos_medico_usuario_id_foreign` FOREIGN KEY (`medico_usuario_id`) REFERENCES `personal_medico` (`usuario_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `tratamientos_paciente_id_foreign` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_rol_id_foreign` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
