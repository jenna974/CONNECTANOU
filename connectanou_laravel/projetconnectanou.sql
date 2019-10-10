-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le :  mer. 09 oct. 2019 à 16:50
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projetconnectanou`
--

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `entreprise_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id`, `entreprise_id`, `name`, `email`, `status`, `created_at`, `updated_at`, `image`) VALUES
(3, 48, 'Clint Ritchie', 'caesar.gorczany@example.net', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(4, 49, 'Savanna Green', 'marlin03@example.org', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(5, 50, 'Kellen Beier', 'qjakubowski@example.org', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(6, 51, 'Hiram Gulgowski', 'demetris21@example.org', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(7, 52, 'Mr. Werner Hegmann IV', 'altenwerth.imogene@example.org', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(8, 53, 'Justina Kunde DVM', 'homenick.neal@example.net', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(9, 54, 'Nicholas Hirthe', 'nshields@example.com', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(10, 55, 'Adolph Schmeler', 'orobel@example.net', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(11, 56, 'Mr. Gennaro Wolff MD', 'cremin.aurelio@example.com', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(12, 57, 'Jett Marks', 'freda94@example.org', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(13, 58, 'Leon Jerde', 'chaim67@example.org', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(14, 59, 'Miss Bernadine Rau IV', 'dkessler@example.com', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(15, 60, 'Ally Casper', 'jeffry.altenwerth@example.com', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(16, 61, 'Dr. Broderick Dare II', 'margot67@example.com', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(17, 62, 'Lorenz Wilkinson', 'tromp.letitia@example.net', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(18, 63, 'Bettie Kozey', 'langosh.cristal@example.org', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(19, 64, 'Alexandrine Gulgowski PhD', 'hill.meghan@example.org', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(20, 65, 'Jalyn Bergstrom', 'desiree32@example.net', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(21, 66, 'Omari Ebert', 'willa.jacobson@example.org', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(22, 67, 'Dr. Kamryn Jenkins', 'hermiston.carmelo@example.net', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(23, 68, 'King Waelchi', 'auer.celestine@example.com', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(24, 69, 'Gus Stanton', 'mccullough.dorothea@example.com', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(25, 70, 'Dr. Fern Kuhlman V', 'dewayne05@example.net', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(26, 71, 'Prof. Jeffrey Kling DDS', 'loy57@example.net', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(27, 72, 'Ms. Shemar Smitham', 'dorcas44@example.com', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(28, 73, 'Randi Wiza', 'dubuque.maverick@example.net', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(29, 74, 'Larissa Larson', 'claire59@example.net', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(30, 75, 'Prof. Jess Grimes', 'ruthe30@example.net', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(31, 76, 'Maia Yundt', 'wromaguera@example.net', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(32, 77, 'Okey Nikolaus', 'ykovacek@example.net', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(33, 78, 'Dr. Mac Cremin Jr.', 'meaghan84@example.com', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(34, 79, 'Jody Schultz', 'luettgen.bette@example.com', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(35, 80, 'Sandra Brown IV', 'leuschke.lucas@example.net', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(36, 81, 'Neil Hilpert', 'caden33@example.org', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(37, 82, 'Bradford McKenzie IV', 'javonte.wiegand@example.org', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(38, 83, 'Fanny Volkman PhD', 'qokon@example.net', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(39, 84, 'Reva Swaniawski', 'gibson.gordon@example.com', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(40, 85, 'Kira Cummings Jr.', 'luciano69@example.org', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(41, 86, 'Ora Fisher', 'baumbach.jade@example.org', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(42, 87, 'Alicia Powlowski Jr.', 'stefanie.jerde@example.org', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(43, 88, 'Gideon Lowe', 'izaiah.nicolas@example.org', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(44, 89, 'Prof. Logan Von DVM', 'bashirian.thaddeus@example.com', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(45, 90, 'Mr. Will Swaniawski DVM', 'oconner.jaden@example.net', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(46, 91, 'Miss Leda Herzog Jr.', 'yparisian@example.org', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(47, 92, 'Agustin Weber', 'ocremin@example.org', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(48, 93, 'Prof. Jody Hodkiewicz', 'reinhold96@example.net', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(49, 94, 'Mr. Christ O\'Keefe', 'hayes.jerod@example.com', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL),
(50, 95, 'Jannie Weimann', 'denesik.braeden@example.com', 1, '2019-10-04 03:22:29', '2019-10-04 03:22:29', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `commentable_id` int(11) NOT NULL,
  `commentable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`id`, `content`, `user_id`, `commentable_id`, `commentable_type`, `created_at`, `updated_at`) VALUES
(11, 'un commentaire!!', 100, 1, 'App\\Topic', '2019-10-09 06:16:07', '2019-10-09 06:16:07'),
(12, 'la réponse à ce commentaire', 100, 11, 'App\\Comment', '2019-10-09 06:16:24', '2019-10-09 06:16:24'),
(14, 'ceci est une réponse', 100, 11, 'App\\Comment', '2019-10-09 06:26:37', '2019-10-09 06:26:37'),
(15, 'un autre commentaire', 100, 1, 'App\\Topic', '2019-10-09 07:14:33', '2019-10-09 07:14:33'),
(16, 'la réponse du commentaire', 100, 15, 'App\\Comment', '2019-10-09 07:14:52', '2019-10-09 07:14:52'),
(17, 'un 3eme commentaire', 100, 1, 'App\\Topic', '2019-10-09 07:18:49', '2019-10-09 07:18:49'),
(18, 'la réponse au 3eme commentaire', 100, 17, 'App\\Comment', '2019-10-09 07:19:04', '2019-10-09 07:19:04'),
(19, 'de nouveau un commentaire', 100, 1, 'App\\Topic', '2019-10-09 12:41:59', '2019-10-09 12:41:59'),
(20, 'voici la réponse', 100, 19, 'App\\Comment', '2019-10-09 12:42:20', '2019-10-09 12:42:20'),
(21, 'super ce site', 101, 52, 'App\\Topic', '2019-10-09 12:46:07', '2019-10-09 12:46:07'),
(22, 'merci', 100, 21, 'App\\Comment', '2019-10-09 12:46:58', '2019-10-09 12:46:58');

-- --------------------------------------------------------

--
-- Structure de la table `entreprises`
--

CREATE TABLE `entreprises` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `entreprises`
--

INSERT INTO `entreprises` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Schamberger PLC', '2019-10-04 03:21:18', '2019-10-04 03:21:18'),
(2, 'Reinger-Kreiger', '2019-10-04 03:21:18', '2019-10-04 03:21:18'),
(3, 'O\'Kon-Durgan', '2019-10-04 03:21:18', '2019-10-04 03:21:18'),
(4, 'Mertz, Kiehn and Wunsch', '2019-10-04 03:21:18', '2019-10-04 03:21:18'),
(5, 'Medhurst, Glover and Funk', '2019-10-04 03:21:18', '2019-10-04 03:21:18'),
(6, 'Kuvalis-Nicolas', '2019-10-04 03:21:18', '2019-10-04 03:21:18'),
(7, 'Gottlieb, Boehm and Bogisich', '2019-10-04 03:21:18', '2019-10-04 03:21:18'),
(8, 'Nitzsche LLC', '2019-10-04 03:21:18', '2019-10-04 03:21:18'),
(9, 'Waters-Graham', '2019-10-04 03:21:18', '2019-10-04 03:21:18'),
(10, 'Skiles, Parisian and Herman', '2019-10-04 03:21:18', '2019-10-04 03:21:18'),
(11, 'Hayes, Hand and Stehr', '2019-10-04 03:21:18', '2019-10-04 03:21:18'),
(12, 'Predovic, Cruickshank and Grady', '2019-10-04 03:21:18', '2019-10-04 03:21:18'),
(13, 'Weissnat, King and Funk', '2019-10-04 03:21:18', '2019-10-04 03:21:18'),
(14, 'Bradtke, Sanford and Wisoky', '2019-10-04 03:21:18', '2019-10-04 03:21:18'),
(15, 'Okuneva, Russel and Gutkowski', '2019-10-04 03:21:18', '2019-10-04 03:21:18'),
(16, 'Maggio-Macejkovic', '2019-10-04 03:22:04', '2019-10-04 03:22:04'),
(17, 'Monahan, Kunze and Mueller', '2019-10-04 03:22:04', '2019-10-04 03:22:04'),
(18, 'Lemke, Lehner and Glover', '2019-10-04 03:22:04', '2019-10-04 03:22:04'),
(19, 'King PLC', '2019-10-04 03:22:04', '2019-10-04 03:22:04'),
(20, 'Langworth PLC', '2019-10-04 03:22:04', '2019-10-04 03:22:04'),
(21, 'Pollich-Bernhard', '2019-10-04 03:22:04', '2019-10-04 03:22:04'),
(22, 'Renner, Howe and Kris', '2019-10-04 03:22:04', '2019-10-04 03:22:04'),
(23, 'Haley-Pfeffer', '2019-10-04 03:22:04', '2019-10-04 03:22:04'),
(24, 'Quitzon-McLaughlin', '2019-10-04 03:22:04', '2019-10-04 03:22:04'),
(25, 'Heller-Hauck', '2019-10-04 03:22:04', '2019-10-04 03:22:04'),
(26, 'Brekke Inc', '2019-10-04 03:22:04', '2019-10-04 03:22:04'),
(27, 'Stehr-Cruickshank', '2019-10-04 03:22:04', '2019-10-04 03:22:04'),
(28, 'Keebler Group', '2019-10-04 03:22:04', '2019-10-04 03:22:04'),
(29, 'Zemlak-Kautzer', '2019-10-04 03:22:04', '2019-10-04 03:22:04'),
(30, 'Bernier-Heller', '2019-10-04 03:22:04', '2019-10-04 03:22:04'),
(31, 'Yundt, McClure and Daniel', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(32, 'Daugherty-Predovic', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(33, 'Schumm, Bernhard and Vandervort', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(34, 'Grimes, Waelchi and Renner', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(35, 'Botsford, Jaskolski and Gislason', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(36, 'Raynor LLC', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(37, 'Yundt, Schuppe and Schumm', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(38, 'Gibson Inc', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(39, 'Cummerata, Ryan and Koelpin', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(40, 'Wehner Group', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(41, 'Effertz, Lubowitz and Johnston', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(42, 'McGlynn, Sauer and Johns', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(43, 'Kuvalis-Raynor', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(44, 'Mante, Schoen and Wolff', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(45, 'Considine-Jacobson', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(46, 'Rempel, Adams and Macejkovic', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(47, 'Waters, Heller and Boyle', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(48, 'Cummerata LLC', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(49, 'Okuneva-Spencer', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(50, 'Fay and Sons', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(51, 'Hirthe-Hill', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(52, 'Gusikowski-Cummerata', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(53, 'Quitzon-Lemke', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(54, 'Pouros, Hoeger and Terry', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(55, 'Bailey Inc', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(56, 'Schultz Inc', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(57, 'Dooley Ltd', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(58, 'Rau-Beatty', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(59, 'Schmitt Ltd', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(60, 'Kovacek, Kuhn and Klein', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(61, 'Walsh-Adams', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(62, 'Lockman Group', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(63, 'Ziemann Group', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(64, 'Littel LLC', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(65, 'Bayer, Volkman and Corkery', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(66, 'O\'Hara Ltd', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(67, 'Dickinson Ltd', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(68, 'Davis, Wintheiser and Little', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(69, 'Orn-Leffler', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(70, 'O\'Conner Ltd', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(71, 'Torphy, Strosin and Schmitt', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(72, 'Nikolaus LLC', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(73, 'Rice, Moore and Heathcote', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(74, 'Greenfelder, Jacobson and Treutel', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(75, 'Becker-Bogisich', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(76, 'Flatley PLC', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(77, 'Zboncak Group', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(78, 'Bode Group', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(79, 'Stamm-Simonis', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(80, 'Dicki-Kemmer', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(81, 'Wyman, Prosacco and Homenick', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(82, 'Dickens, Schmitt and Schneider', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(83, 'Labadie, Bosco and Mayert', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(84, 'Herman, Skiles and Beatty', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(85, 'Eichmann, Torphy and Ruecker', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(86, 'Turner PLC', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(87, 'Johns LLC', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(88, 'Dicki-Ernser', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(89, 'Treutel, Towne and Sporer', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(90, 'Blick, Tromp and Buckridge', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(91, 'Daugherty Ltd', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(92, 'Haag Group', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(93, 'Gulgowski-Marks', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(94, 'Collier, Goodwin and Gerlach', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(95, 'Considine-Dibbert', '2019-10-04 03:22:29', '2019-10-04 03:22:29');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_10_02_092658_create_clients_table', 1),
(4, '2019_10_02_120254_create_entreprises_table', 1),
(5, '2019_10_04_073444_add_image_to_clients', 2),
(6, '2019_10_07_072446_create_topics_table', 3),
(7, '2019_10_08_113639_create_comments_table', 4);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `topics`
--

CREATE TABLE `topics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `topics`
--

INSERT INTO `topics` (`id`, `title`, `content`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Tempora qui velit volup', 'Non quia aut et. Ut eos et magni reprehenderit e', 49, '2019-10-07 03:45:37', '2019-10-08 07:27:11'),
(2, 'Odio minus iste voluptatem.', 'Voluptatum nihil et doloribus omnis laborum eveniet nisi assumenda. Labore eum occaecati minima velit labore unde in. Sed nihil hic quaerat incidunt et. Quasi quae voluptas autem quibusdam qui dolore. Aperiam sed ab hic libero dolores sed ut.', 50, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(3, 'Iusto aut accusantium dolor cupiditate culpa ut atque.', 'Optio non eos inventore repellendus et suscipit suscipit facilis. Corrupti et aut eaque quia ullam. Quasi deserunt temporibus nam fugit quia blanditiis rerum cum. Esse qui ducimus at repellat error provident et.', 51, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(4, 'Voluptas voluptas ex sed laudantium alias qui repudiandae.', 'Rerum deleniti qui quis similique. Perspiciatis voluptatem iste ullam consequatur non dolorem iure illum. Vel eligendi repellendus harum odio praesentium.', 52, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(5, 'Aut totam nulla rem iure sunt autem magni harum.', 'Aliquid quo autem voluptate dolores ratione. Enim officiis exercitationem deserunt eos exercitationem ut. Adipisci beatae eum magni accusantium autem enim.', 53, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(6, 'Ex voluptatum ducimus ut sunt quo ea nemo.', 'Cupiditate id in ratione sint dolorem. In aperiam beatae dolores expedita qui ut. Asperiores ducimus magni dolorum est.', 54, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(7, 'Recusandae doloremque quia recusandae eveniet id.', 'Sed eum autem iste sit illum ullam. Deserunt veritatis doloremque fuga nostrum corrupti et odit. Harum deleniti beatae non impedit et quia commodi.', 55, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(8, 'Voluptatem illo dolores rerum accusantium.', 'Voluptatem eum recusandae beatae itaque et dolorem totam. Quasi perferendis et repellat temporibus et voluptas. Aliquam vero cupiditate quo minus et exercitationem quibusdam facere.', 56, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(9, 'Illum doloremque ut qui quidem error.', 'Eos expedita nobis sed qui aliquam. Et ratione et ut eveniet minus et eos. Odit nobis libero quia voluptatem beatae qui et. Enim aut voluptatibus odio qui.', 57, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(10, 'Recusandae laborum consectetur tenetur fugit sed tempore ipsa.', 'Esse vero vel ea quisquam. Occaecati laudantium hic eos est molestiae. Aut iste veritatis nam perspiciatis molestias qui incidunt.', 58, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(11, 'Est reiciendis voluptate aut quo et omnis corporis.', 'Aut nisi esse quam est architecto aut non. Dolor omnis facere tenetur quia itaque maiores. Atque corrupti quis omnis. Quos aut soluta rem voluptatibus voluptatem saepe. Aut quas sed ex est.', 59, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(12, 'Ut et reprehenderit eos dolores excepturi possimus.', 'Adipisci voluptate accusantium tempora sed cumque doloribus. Aspernatur eos nihil enim porro aperiam. Nesciunt quod saepe sequi tempora est. Quis ea ut minus voluptas. Modi reiciendis ut tempore qui vel eum.', 60, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(13, 'Eos voluptas velit quia sequi aspernatur rerum quod.', 'Hic illo ut illum commodi reprehenderit hic corporis. Dignissimos eum ut sed reprehenderit quam. Tempore qui veniam minus voluptatem sed aliquid atque.', 61, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(14, 'In quibusdam eius voluptatem officia soluta fugiat esse.', 'Et nesciunt earum cupiditate nobis dolor non est. Nisi est ad magnam eveniet. Quia temporibus voluptatibus consectetur nesciunt ipsa.', 62, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(15, 'Dolores voluptate nam deserunt dolores ut totam a.', 'Voluptas quidem voluptates dolores sunt blanditiis nostrum. Nihil in deserunt fugiat quam ut. Doloremque et harum sed sed exercitationem. Fugit debitis ut architecto dicta consequuntur eum officiis.', 63, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(16, 'Cupiditate necessitatibus deserunt enim iste expedita molestiae.', 'Porro sapiente sapiente nam ut aut. Qui in vero animi est eos repellat officia. Delectus quidem eos et eos et. Impedit voluptate libero optio dolorem ut vel natus.', 64, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(17, 'Consequatur quisquam sapiente nam aliquid quis sunt.', 'Debitis impedit et illum quis voluptas rerum. Sequi ea fuga eligendi earum ut nostrum. Molestiae error deserunt sed architecto ipsam.', 65, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(18, 'Adipisci ut velit et incidunt doloremque dolores modi sed.', 'Omnis laborum quidem molestias dolor. Quae similique sequi magnam exercitationem est. Reiciendis voluptas accusantium optio odio cupiditate voluptates magnam.', 66, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(19, 'Deserunt et asperiores voluptates quis fuga blanditiis.', 'Voluptates hic doloribus qui voluptatem voluptas culpa. Reprehenderit sunt doloribus earum nesciunt possimus officiis quia. Fugiat repellendus iusto id. Impedit quia similique at enim vitae hic.', 67, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(20, 'Consectetur similique maiores est quia.', 'Expedita molestiae ex dignissimos quas sit. Doloribus explicabo iusto cum voluptatum. Vero fugiat voluptates architecto.', 68, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(21, 'Velit qui et et dolorum.', 'Eum dolores id enim explicabo rem quasi sit. Veritatis molestias dolore consequatur aliquam labore ipsum nobis hic. Molestiae maiores occaecati numquam non a ex voluptatum praesentium. Nihil totam qui in ex accusamus optio.', 69, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(22, 'Vel repellendus perspiciatis voluptates distinctio est et.', 'Non sit voluptas quam dignissimos. Dicta deserunt enim perferendis est voluptatem id sit. Corporis aperiam omnis eligendi totam quas minima. Recusandae nostrum autem eum rerum porro aut omnis.', 70, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(23, 'Ut repellat eum mollitia aliquam voluptate quos odit.', 'Ut doloribus omnis eos qui voluptate. Fuga voluptas qui voluptatem alias dolores aut vitae. Neque culpa id sit amet dolorem ipsam nihil. Rerum omnis nemo perferendis sapiente vel ad dolores.', 71, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(24, 'Ut ea quidem impedit occaecati voluptas velit.', 'Iste molestiae et odio exercitationem commodi quod harum fugit. Id id dolorum voluptatibus quis. Cum officiis error beatae et modi.', 72, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(25, 'Perspiciatis ratione velit et perferendis occaecati.', 'Et at alias labore temporibus. Eligendi accusantium tempora provident praesentium. Corporis sint enim libero qui minima deleniti et natus.', 73, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(26, 'Eius qui similique eos beatae iusto aut sunt.', 'Iure dicta sapiente et eveniet. Doloribus hic qui et et.', 74, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(27, 'Quis voluptas deleniti aut nesciunt sit.', 'Eos consectetur soluta dolores architecto impedit similique nam. Neque rerum nihil magni sint neque. Iusto autem modi ab nemo ipsum temporibus esse.', 75, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(28, 'In ullam ut pariatur nemo.', 'Commodi vitae dolores maiores iste. Asperiores magnam alias voluptas neque. Perspiciatis est vitae omnis ipsam vero porro eos maxime. Laborum atque commodi nihil quae.', 76, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(29, 'Reprehenderit quibusdam vero debitis.', 'Blanditiis non ipsum a repudiandae ducimus soluta. Minus quos illum rerum aut neque eaque et. Soluta et voluptas soluta totam.', 77, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(30, 'Quia adipisci sit quod eos vel.', 'Explicabo totam placeat laboriosam eaque. Cumque nostrum expedita et ut officiis quia tempora delectus. Et ut laudantium et dolorum quo culpa in aliquam. Dolore sit rerum quasi nihil quasi.', 78, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(31, 'Delectus aut pariatur explicabo similique.', 'Suscipit voluptas aut vitae nemo ut. Doloremque vitae in et sunt culpa. Qui voluptatibus consectetur inventore id pariatur.', 79, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(32, 'Corrupti molestias ea minus.', 'Temporibus laboriosam et commodi atque dolorem corrupti accusamus. Soluta qui neque et rerum dolore eius. Debitis similique nemo molestias ex sint voluptatem numquam.', 80, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(33, 'Quia enim debitis modi repudiandae vel repellat.', 'Aliquid maiores perferendis sequi aut repellendus placeat. Dolores aliquid et et. Est aut reiciendis quibusdam quae et. Minima sit eos corrupti ut est laborum.', 81, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(34, 'Corporis dolore ut aut ab voluptatem consequatur.', 'Ut atque consequatur iure ipsum ex quod odit. Nostrum dolore vel dolorum ut. Ea eum qui porro cumque.', 82, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(35, 'Quisquam earum animi quam necessitatibus perspiciatis.', 'Illum repellat vel cumque aspernatur et nulla beatae. Eum ipsam vel atque et. Accusantium aperiam quod ipsum velit ratione aperiam.', 83, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(36, 'Sed qui hic voluptatem vel dolores qui sed.', 'Facere fugiat est ut sit rerum velit consequatur. Eum vitae omnis quo aliquam magni amet. Eligendi cum voluptas velit. Et hic eaque quibusdam qui qui.', 84, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(37, 'Laborum non vitae ipsa perferendis.', 'Dolor quo explicabo incidunt enim voluptate est vero. Non corporis sapiente sequi recusandae. Repellat voluptatem modi voluptatibus error perferendis ut. Est porro sed dolorum praesentium qui ea quia sit.', 85, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(38, 'Enim voluptatem quis ut ut.', 'Eos fuga nemo consequuntur repellat ipsam quis aut. Dolorem temporibus a velit doloribus qui ipsum sunt. Non quo quisquam non nostrum.', 86, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(39, 'Repudiandae nobis qui iure ab et enim voluptatem cum.', 'Et quaerat deserunt nisi fuga. Ut a tenetur sed ut. Itaque reprehenderit quibusdam molestiae dolores ab ut.', 87, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(40, 'Ipsum quisquam non voluptates quos optio laboriosam deleniti.', 'Voluptatum a quia iusto eveniet. Maiores voluptatem voluptatem nemo quas omnis et id. Officia velit minima nesciunt sed repellat.', 88, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(41, 'Itaque ipsum inventore sed et totam.', 'Id eum dolores saepe cupiditate quae iusto ducimus. Quibusdam sint vero excepturi laudantium quia.', 89, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(42, 'Enim enim dolorum sit qui.', 'Libero ipsum sunt rerum nesciunt qui. Non autem tempora nihil atque non. Unde sit debitis aut consequuntur eligendi tempore. Amet earum voluptate odio facilis temporibus consectetur minus. Molestiae iusto qui sed sed nam ipsa.', 90, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(43, 'Vel repellendus illo modi ullam quo.', 'Consectetur a voluptas veniam dolorem similique laborum nobis reiciendis. Necessitatibus quia placeat consequatur eos et et commodi et. Distinctio saepe dolor et voluptatem nulla.', 91, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(44, 'Fugiat dicta qui aut laborum voluptatum.', 'Corrupti nam eum quod provident qui. Quo voluptas natus beatae itaque ut dolorum. Omnis hic deserunt ea adipisci tempora laborum.', 92, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(45, 'Laboriosam corrupti molestiae ea molestiae esse expedita qui.', 'Perspiciatis id facere et et dolores eos. Qui ea recusandae facilis veritatis. Nihil et provident corporis. Ut et molestias quaerat repellendus.', 93, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(46, 'Rem sed recusandae recusandae quod voluptatem.', 'Natus eveniet delectus possimus ut sed. Sunt aut eos illum aspernatur magni. Dicta doloribus rerum eveniet provident.', 94, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(47, 'Nihil reiciendis consequatur dolor ex nihil.', 'Ipsum dolores porro excepturi aut velit voluptatem deleniti. Magni ea accusantium harum maxime expedita dignissimos ipsum. Ab et hic voluptate non enim non in at. Illum numquam expedita tenetur numquam.', 95, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(48, 'Quisquam ut quaerat ad excepturi consequatur aliquid architecto.', 'Voluptas consequuntur cum fugiat qui illum et deserunt. Modi quo aut facere unde dicta cum.', 96, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(49, 'Non consequatur provident necessitatibus quia quaerat nobis et.', 'Voluptatem molestias blanditiis voluptas qui. Rem voluptas eos placeat architecto qui. Aliquam aspernatur quo repellendus labore qui. Saepe nam ut velit est aut provident minus perspiciatis.', 97, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(50, 'Itaque aut earum qui non deserunt velit.', 'Et nihil sunt placeat vel eum molestias. Facere reiciendis odit et placeat quisquam. Sint molestiae id sapiente sit.', 98, '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(52, 'un topic !!', 'il est super ce site', 100, '2019-10-09 12:44:21', '2019-10-09 12:46:36');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Pierre Denesik', 'haag.royce@example.net', '2019-10-04 03:21:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '4dR0F1f4VDVDkMD0EyKHaesza9xOHZ5WWQtlRbBkKMhy6hvpzgRMlJtdP5UJ', '2019-10-04 03:21:18', '2019-10-04 03:21:18'),
(2, 'Dr. Nash Turcotte Jr.', 'aratke@example.net', '2019-10-04 03:21:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'g5NLGkV94j', '2019-10-04 03:21:18', '2019-10-04 03:21:18'),
(3, 'Justyn Grady', 'rick.blick@example.net', '2019-10-04 03:21:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'oYY2QXz2aF', '2019-10-04 03:21:18', '2019-10-04 03:21:18'),
(4, 'Adeline Thompson', 'karl.cole@example.net', '2019-10-04 03:21:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'rP5OzIzqa4', '2019-10-04 03:21:18', '2019-10-04 03:21:18'),
(5, 'Deondre Stanton', 'marie62@example.net', '2019-10-04 03:21:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'MIrKW0Qc1M', '2019-10-04 03:21:18', '2019-10-04 03:21:18'),
(6, 'Reba Abshire', 'wiza.dayne@example.com', '2019-10-04 03:21:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'z3suAB5Fsw', '2019-10-04 03:21:18', '2019-10-04 03:21:18'),
(7, 'Albina Spinka', 'dedrick84@example.org', '2019-10-04 03:21:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Cfp8FgTEH5', '2019-10-04 03:21:18', '2019-10-04 03:21:18'),
(8, 'Mrs. Kallie Schamberger PhD', 'tromp.larue@example.com', '2019-10-04 03:21:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'X9Zvw87aGc', '2019-10-04 03:21:18', '2019-10-04 03:21:18'),
(9, 'Harry Hane', 'tromp.jonathan@example.com', '2019-10-04 03:21:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'd6gqYbY2D4', '2019-10-04 03:21:18', '2019-10-04 03:21:18'),
(10, 'Mrs. Natasha Kirlin', 'nsawayn@example.net', '2019-10-04 03:21:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'tQhAiMGAOu', '2019-10-04 03:21:18', '2019-10-04 03:21:18'),
(11, 'Shanon Pfeffer', 'phartmann@example.com', '2019-10-04 03:21:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'cJxuAxZmpY', '2019-10-04 03:21:18', '2019-10-04 03:21:18'),
(12, 'Janice Rutherford', 'kilback.pinkie@example.net', '2019-10-04 03:21:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vS8Ujrel0u', '2019-10-04 03:21:18', '2019-10-04 03:21:18'),
(13, 'Jonathan Hyatt', 'kareem54@example.com', '2019-10-04 03:21:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'JRc3toyWmq', '2019-10-04 03:21:18', '2019-10-04 03:21:18'),
(14, 'Anissa Heaney V', 'kara.satterfield@example.net', '2019-10-04 03:21:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'FSmuMgyCgB', '2019-10-04 03:21:18', '2019-10-04 03:21:18'),
(15, 'Darius Kulas III', 'moen.angelina@example.com', '2019-10-04 03:21:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'XkFc6nIyHw', '2019-10-04 03:21:18', '2019-10-04 03:21:18'),
(16, 'Robin Bradtke', 'armstrong.anita@example.org', '2019-10-04 03:22:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '6IhFmP5Sws', '2019-10-04 03:22:04', '2019-10-04 03:22:04'),
(17, 'Prof. Darby Streich', 'bryon68@example.com', '2019-10-04 03:22:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '7qQqbh7LRS', '2019-10-04 03:22:04', '2019-10-04 03:22:04'),
(18, 'Elmore Bergstrom Sr.', 'aniya01@example.net', '2019-10-04 03:22:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'XeGvYQ4lVa', '2019-10-04 03:22:04', '2019-10-04 03:22:04'),
(19, 'Benny Pagac', 'angeline43@example.org', '2019-10-04 03:22:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'sVaLztb2py', '2019-10-04 03:22:04', '2019-10-04 03:22:04'),
(20, 'Ms. Tia Lakin', 'omclaughlin@example.net', '2019-10-04 03:22:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '4rr3JLdCBz', '2019-10-04 03:22:04', '2019-10-04 03:22:04'),
(21, 'Mary Zulauf', 'tremblay.alexie@example.net', '2019-10-04 03:22:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'aQkrHWfl7S', '2019-10-04 03:22:04', '2019-10-04 03:22:04'),
(22, 'Selina Adams DVM', 'johnson.jevon@example.net', '2019-10-04 03:22:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'luikVTRkhz', '2019-10-04 03:22:04', '2019-10-04 03:22:04'),
(23, 'Madonna Kuvalis', 'cummerata.sarina@example.com', '2019-10-04 03:22:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'DtkwUHV54K', '2019-10-04 03:22:04', '2019-10-04 03:22:04'),
(24, 'Ava Koss', 'ebert.eve@example.net', '2019-10-04 03:22:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'S1CWgSJyxk', '2019-10-04 03:22:04', '2019-10-04 03:22:04'),
(25, 'Neha Streich', 'pkunze@example.org', '2019-10-04 03:22:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'YW4ws0NBwn', '2019-10-04 03:22:04', '2019-10-04 03:22:04'),
(26, 'Prof. Newton Fisher', 'abdullah75@example.org', '2019-10-04 03:22:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'LWa8FIZ8QS', '2019-10-04 03:22:04', '2019-10-04 03:22:04'),
(27, 'Luciano Pfeffer', 'margarette.schinner@example.org', '2019-10-04 03:22:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'XMpmMUFSJW', '2019-10-04 03:22:04', '2019-10-04 03:22:04'),
(28, 'Adeline Spencer', 'deckow.oral@example.org', '2019-10-04 03:22:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '0kQ26zSD78', '2019-10-04 03:22:04', '2019-10-04 03:22:04'),
(29, 'Mr. Jeffery Stroman IV', 'devan08@example.org', '2019-10-04 03:22:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '44OfIMq0tn', '2019-10-04 03:22:04', '2019-10-04 03:22:04'),
(30, 'Kayla Greenfelder', 'wbrakus@example.com', '2019-10-04 03:22:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '5hKPue5Mnc', '2019-10-04 03:22:04', '2019-10-04 03:22:04'),
(31, 'Deontae Nader', 'idaniel@example.net', '2019-10-04 03:22:29', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'PiHXuvoqxS', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(32, 'Hollie Leuschke', 'pparker@example.net', '2019-10-04 03:22:29', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'nD5nCBXadB', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(33, 'Cortney Hirthe', 'sylvester.grimes@example.org', '2019-10-04 03:22:29', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'qo1FTeAILk', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(34, 'Anabelle Bartoletti DVM', 'ruecker.roma@example.org', '2019-10-04 03:22:29', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'eoP8eg58qm', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(35, 'Arjun Rice', 'tyrique.boehm@example.com', '2019-10-04 03:22:29', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'oc28M9IAc7', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(36, 'Dr. Emmanuel Barton Jr.', 'magnus.hills@example.net', '2019-10-04 03:22:29', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Gc2Jb2WNjp', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(37, 'Berneice Kessler', 'juana88@example.com', '2019-10-04 03:22:29', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1E8ZZBv78p', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(38, 'Mr. Dax King', 'rhoda42@example.net', '2019-10-04 03:22:29', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2exSXG2mem', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(39, 'Jorge Koelpin', 'dschneider@example.com', '2019-10-04 03:22:29', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'nafEscHNo8', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(40, 'Rosetta Schroeder', 'mosciski.lourdes@example.com', '2019-10-04 03:22:29', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'TzHWS7eyOZ', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(41, 'Germaine Konopelski', 'saul.heller@example.com', '2019-10-04 03:22:29', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '8K4dF2ZL0h', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(42, 'Amely Watsica', 'williamson.perry@example.com', '2019-10-04 03:22:29', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'rAmnzVTHZn', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(43, 'Vella Jacobson', 'kamille13@example.net', '2019-10-04 03:22:29', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'YSVgBEnkkZ', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(44, 'Scottie Lebsack Jr.', 'skiles.emmanuel@example.net', '2019-10-04 03:22:29', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'PGEMaKOR2g', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(45, 'Layla Schoen', 'gspinka@example.com', '2019-10-04 03:22:29', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'AeWkWzxUUr', '2019-10-04 03:22:29', '2019-10-04 03:22:29'),
(47, 'yann', 'yann.madelaine15@gmail.com', NULL, '$2y$10$di3.4hFGAr260JEdO9BNLOZ4g.mE.Vxym14OfqS4NEUUysByUyMaa', NULL, '2019-10-04 05:19:13', '2019-10-04 05:19:13'),
(48, 'mad', 'georges@gmail.com', NULL, '$2y$10$bfcstt.J9aFFgFSXDeMvqOMQ3VdJmvnVgYGAIuW7ERk0OkE/eZRnu', NULL, '2019-10-04 05:37:02', '2019-10-04 05:37:02'),
(49, 'Myah Kohler I', 'hickle.kiana@example.net', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'KXcq5oWkx6', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(50, 'Violet Quitzon', 'ukozey@example.org', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '0C5r7v79aW', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(51, 'Mrs. Corine Cormier PhD', 'lenna.mante@example.org', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'UGwP74nm4F', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(52, 'Prof. Jarret Graham', 'lew09@example.org', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'CLbtis2cC3', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(53, 'Lyda Goldner PhD', 'rblick@example.com', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'P84Hvtw3QT', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(54, 'Hardy Sawayn', 'rdouglas@example.org', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'kJ5Z1Tj2DC', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(55, 'Mr. Rory Rodriguez DDS', 'felipa73@example.org', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'gRSJdA2OwO', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(56, 'Jedidiah Beatty', 'okey45@example.org', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'PzBLoDXIEN', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(57, 'Darian Lindgren', 'arlo01@example.org', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'un7ynHwgiD', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(58, 'Mrs. Chelsie Green', 'waelchi.isadore@example.org', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ARxtCCF7Tr', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(59, 'Jeffery Wisoky', 'kkling@example.org', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'htvrb2Hy8F', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(60, 'Alana Doyle', 'schultz.dale@example.net', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'sZ8LEIqS0Z', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(61, 'Princess Terry', 'birdie32@example.com', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'b8Vw23OMjD', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(62, 'Ronny Pouros MD', 'boyle.ben@example.org', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'LVqER0BAAC', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(63, 'Prof. Gilberto Buckridge III', 'janis96@example.org', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'aKjvGA62AP', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(64, 'Morgan Thompson IV', 'zwunsch@example.org', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'u060Hyyjwn', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(65, 'Adam Herzog', 'genevieve68@example.org', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'gXlHpFnIIr', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(66, 'Liana Schaden', 'misael82@example.net', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2Ahh8Ouqxs', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(67, 'Rosanna Feest', 'noemie48@example.org', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'I3M4PnYKlB', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(68, 'Meghan Corkery II', 'elisabeth52@example.com', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 's72Jjkd6IS', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(69, 'Cole Stanton', 'xullrich@example.net', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ucfuBvPaJU', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(70, 'Dr. Brionna Lubowitz II', 'blick.armani@example.com', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'T0aHEJ1Fi5', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(71, 'Prof. Elmore Price Sr.', 'major91@example.org', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'yOmnjgySlG', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(72, 'Micheal Walter', 'ibrahim00@example.net', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '84zvqMrOqA', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(73, 'Golda Runolfsdottir II', 'garnet.kunde@example.net', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'XkfXtafnV0', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(74, 'Willis Streich II', 'dlynch@example.net', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Seqf1KhBrM', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(75, 'Mrs. Eliane Bahringer MD', 'waters.mekhi@example.org', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'k7dtFUqRus', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(76, 'Marlin Upton III', 'johns.cleveland@example.com', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '0Y8hWeTLqW', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(77, 'Marco Schumm II', 'shanahan.lance@example.org', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lxRNshhRaN', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(78, 'Shyann Schuppe', 'rath.weston@example.com', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'FQ0FrSiA7a', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(79, 'Lenora Keebler', 'schaefer.lea@example.com', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'wmm3aHUXT9', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(80, 'Dr. Bridgette Denesik', 'julia93@example.org', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'T025aTm1zw', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(81, 'Dr. Jarrod Stoltenberg Sr.', 'ylueilwitz@example.org', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'fSZDAQemfw', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(82, 'Flavio Zulauf', 'orval21@example.net', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ik95WL5st1', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(83, 'Marquise Hegmann', 'kylie.dubuque@example.net', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '6lVtbDK2rW', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(84, 'Miss Linnea Kiehn III', 'qmcglynn@example.org', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'YcEW3iC6vA', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(85, 'Myrl Aufderhar', 'schulist.phyllis@example.net', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'FIk9gmyBdh', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(86, 'Catalina Tromp V', 'yskiles@example.net', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'GLJB0meshi', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(87, 'Miss Alysson Schamberger', 'gianni91@example.com', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'USm8g3ivoF', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(88, 'Mr. Cleo Weber II', 'kautzer.daniella@example.net', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'thtzTn7PUy', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(89, 'Marlene Steuber', 'rferry@example.org', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'N93HSFIvtH', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(90, 'Miss Elyssa Hyatt DDS', 'kailyn37@example.net', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '8UpKFioc1C', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(91, 'Mrs. Elise Zieme', 'jewel.monahan@example.com', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '4rFNpi9y3F', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(92, 'Ava Boyle V', 'mae.schultz@example.org', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'bIMqseCY8L', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(93, 'Alena Haley IV', 'mccullough.cora@example.net', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '6WSsbHgVrY', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(94, 'Reid Fadel', 'fadel.matilda@example.com', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'HcUqj2iVjb', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(95, 'Fannie Russel', 'ernest.casper@example.net', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'o7LPN1hown', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(96, 'Bernadette Weber Sr.', 'heffertz@example.com', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'wwWcpDlekm', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(97, 'Dr. Axel Kub', 'abby33@example.net', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '3twwLiqejg', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(98, 'Ahmad Schmeler', 'jprice@example.net', '2019-10-07 03:45:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'DCm9M5WPc1', '2019-10-07 03:45:37', '2019-10-07 03:45:37'),
(99, 'georges', 'test@gmail.com', NULL, '$2y$10$xq0aR7BEE.oIFb6zsAnPpOg7NFPdRP1W/Hv0PdZnSj5eGWrNpo3F2', NULL, '2019-10-07 07:39:39', '2019-10-07 07:39:39'),
(100, 'ianndddd', 'mvadiian@gmail.com', NULL, '$2y$10$kkXpSRAbzgvxy/cuvpBmMeBkpb3v5B0F.Q7TgXgJZr63B7Ph5/.je', NULL, '2019-10-08 02:36:44', '2019-10-08 02:36:44'),
(101, 'bou', 'bou@gmail.com', NULL, '$2y$10$dGB5d1huDkjlWeNbSix2i.Zph6041zWergKTYu33gg9XrESy4Otn2', NULL, '2019-10-09 12:45:26', '2019-10-09 12:45:26');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `entreprises`
--
ALTER TABLE `entreprises`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topics_user_id_foreign` (`user_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `entreprises`
--
ALTER TABLE `entreprises`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `topics`
--
ALTER TABLE `topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `topics`
--
ALTER TABLE `topics`
  ADD CONSTRAINT `topics_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
