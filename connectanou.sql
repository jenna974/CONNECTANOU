-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 23 oct. 2019 à 11:08
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `connectanou`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

DROP TABLE IF EXISTS `administrateur`;
CREATE TABLE IF NOT EXISTS `administrateur` (
  `id_admin` int(255) NOT NULL AUTO_INCREMENT,
  `login_admin` varchar(50) NOT NULL,
  `mdp_admin` varchar(50) NOT NULL,
  `tel_admin` int(10) NOT NULL,
  `email_admin` varchar(200) NOT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `code_postal`
--

DROP TABLE IF EXISTS `code_postal`;
CREATE TABLE IF NOT EXISTS `code_postal` (
  `id_cp` int(11) NOT NULL AUTO_INCREMENT,
  `cp` int(5) NOT NULL,
  `ville` varchar(100) NOT NULL,
  PRIMARY KEY (`id_cp`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `code_postal`
--

INSERT INTO `code_postal` (`id_cp`, `cp`, `ville`) VALUES
(1, 97400, 'Saint-Denis'),
(2, 97410, 'Saint-Pierre'),
(3, 97412, 'Bras-Panon'),
(4, 97413, 'Cilaos'),
(5, 97414, 'Entre-Deux'),
(6, 97419, 'La Possession'),
(7, 97420, 'Le Port'),
(8, 97425, 'Les Avirons'),
(9, 97426, 'Les Trois-Bassins'),
(10, 97427, 'Etang-salé'),
(11, 97429, 'La Petite île'),
(12, 97430, 'Le Tampon'),
(13, 97431, 'La Plaine des Palmistes'),
(14, 97433, 'Salazie'),
(15, 97436, 'Saint-Leu'),
(16, 97438, 'Saint-Marie'),
(17, 97439, 'Saint-Rose'),
(18, 97440, 'Saint-André'),
(19, 97441, 'Saint-Suzanne'),
(20, 97442, 'Saint-Philippe '),
(21, 97450, 'Saint-Louis'),
(22, 97460, 'Saint-Paul'),
(23, 97470, 'Saint-Benoît'),
(24, 97480, 'Saint-Joseph');

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `commentable_id` int(11) NOT NULL,
  `commentable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `id_real` int(11) NOT NULL,
  `id_etat_projet` int(11) NOT NULL,
  `date_contact` datetime NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id_real`,`id_etat_projet`),
  KEY `id_etat_projet` (`id_etat_projet`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `diplomes`
--

DROP TABLE IF EXISTS `diplomes`;
CREATE TABLE IF NOT EXISTS `diplomes` (
  `id_real` int(11) NOT NULL AUTO_INCREMENT,
  `id_niveau_diplome` int(11) DEFAULT NULL,
  `annee_obtention` date DEFAULT NULL,
  `desc_diplome` text,
  PRIMARY KEY (`id_real`),
  KEY `diplome_ibfk_2` (`id_niveau_diplome`),
  KEY `id_niveau_diplome` (`id_niveau_diplome`)
) ENGINE=MyISAM AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `diplomes`
--

INSERT INTO `diplomes` (`id_real`, `id_niveau_diplome`, `annee_obtention`, `desc_diplome`) VALUES
(97, NULL, NULL, NULL),
(96, NULL, NULL, NULL),
(95, NULL, NULL, NULL),
(94, NULL, NULL, NULL),
(93, NULL, NULL, NULL),
(91, NULL, NULL, NULL),
(92, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `domaine`
--

DROP TABLE IF EXISTS `domaine`;
CREATE TABLE IF NOT EXISTS `domaine` (
  `id_domaine` int(11) NOT NULL AUTO_INCREMENT,
  `label_domaine` varchar(100) NOT NULL,
  `desc_domaine` text,
  PRIMARY KEY (`id_domaine`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `domaine`
--

INSERT INTO `domaine` (`id_domaine`, `label_domaine`, `desc_domaine`) VALUES
(1, 'Informatique - Réseau - Télécom - ', NULL),
(2, 'Économie - Droit juridique - Politique', NULL),
(3, 'Électricité - Électronique - Robotique - Mécanique', NULL),
(4, 'Agriculture - Agroalimentaire - Environnement', NULL),
(5, 'Mode - Esthétique - Beauté ', NULL),
(6, 'Banque - Assurance - Immobilier', NULL),
(7, 'Construction - Architecture - Travaux publics ', NULL),
(8, 'Comptabilité - Finance - Gestion', NULL),
(9, 'Tourisme - Hôtellerie - Restauration', NULL),
(10, 'Transport - Logistique', NULL),
(11, 'Arts - Lettres - Langues - Culture - Sciences humaines et sociales', NULL),
(12, 'Édition - Presse - Médias - Journalisme', NULL),
(13, 'Commerce - Vente - Marketing', NULL),
(14, 'Sport - Loisir', NULL),
(15, 'Santé - Social', NULL),
(16, 'Audiovisuel - Graphisme', NULL),
(17, 'Autre', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `ecole`
--

DROP TABLE IF EXISTS `ecole`;
CREATE TABLE IF NOT EXISTS `ecole` (
  `id_ecole` int(11) NOT NULL AUTO_INCREMENT,
  `nom_ecole` varchar(30) NOT NULL,
  `adresse_ecole` text,
  `tel_ecole` int(11) DEFAULT NULL,
  `email_ecole` varchar(200) DEFAULT NULL,
  `site_internet_ecole` varchar(200) DEFAULT NULL,
  `id_cp` int(11) NOT NULL,
  PRIMARY KEY (`id_ecole`),
  KEY `id_cp` (`id_cp`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ecole`
--

INSERT INTO `ecole` (`id_ecole`, `nom_ecole`, `adresse_ecole`, `tel_ecole`, `email_ecole`, `site_internet_ecole`, `id_cp`) VALUES
(1, 'Supinfo', NULL, NULL, NULL, NULL, 1),
(2, 'HESIP', NULL, NULL, NULL, NULL, 1),
(3, 'ESRN', NULL, NULL, NULL, NULL, 18),
(4, 'ILOI', NULL, NULL, NULL, NULL, 7),
(5, 'AFPAR', NULL, NULL, NULL, NULL, 1),
(6, 'Université de la Réunion', NULL, NULL, NULL, NULL, 1),
(7, 'Autre', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `etat_projet`
--

DROP TABLE IF EXISTS `etat_projet`;
CREATE TABLE IF NOT EXISTS `etat_projet` (
  `id_etat_projet` int(11) NOT NULL AUTO_INCREMENT,
  `label_etat` varchar(50) NOT NULL,
  `id_real` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_etat_projet`),
  KEY `IdReal` (`id_real`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `etat_projet`
--

INSERT INTO `etat_projet` (`id_etat_projet`, `label_etat`, `id_real`) VALUES
(1, 'Brouillon', NULL),
(2, 'Validé', NULL),
(3, 'Publié', NULL),
(4, 'En négociation', NULL),
(5, 'En cours de réalisation', NULL),
(6, 'Recette', NULL),
(7, 'Payé-Clôturé', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `formations`
--

DROP TABLE IF EXISTS `formations`;
CREATE TABLE IF NOT EXISTS `formations` (
  `id_formation` int(11) NOT NULL AUTO_INCREMENT,
  `titre_formation` varchar(200) DEFAULT NULL,
  `date_debut_formation` date DEFAULT NULL,
  `date_fin_formation` date DEFAULT NULL,
  `specialisation_formation` varchar(200) DEFAULT NULL,
  `id_domaine` int(11) DEFAULT NULL,
  `id_niveau_diplome` int(11) DEFAULT NULL,
  `id_ecole` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_formation`),
  KEY `IdDomaine` (`id_domaine`),
  KEY `IdNiveau_diplome` (`id_niveau_diplome`),
  KEY `IdEcole` (`id_ecole`)
) ENGINE=MyISAM AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `formations`
--

INSERT INTO `formations` (`id_formation`, `titre_formation`, `date_debut_formation`, `date_fin_formation`, `specialisation_formation`, `id_domaine`, `id_niveau_diplome`, `id_ecole`) VALUES
(114, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(113, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(111, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(112, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(109, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(110, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(108, 'lol_ mdrrrrrrrrrrrrrrrrr', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `form_contact`
--

DROP TABLE IF EXISTS `form_contact`;
CREATE TABLE IF NOT EXISTS `form_contact` (
  `id_contact` int(11) NOT NULL AUTO_INCREMENT,
  `nom_contact` varchar(100) NOT NULL,
  `prenom_contact` varchar(100) NOT NULL,
  `email_contact` varchar(100) NOT NULL,
  `tel_contact` int(11) NOT NULL,
  `message_contact` text NOT NULL,
  PRIMARY KEY (`id_contact`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `histo_etat_projet`
--

DROP TABLE IF EXISTS `histo_etat_projet`;
CREATE TABLE IF NOT EXISTS `histo_etat_projet` (
  `id_projet` int(11) NOT NULL,
  `id_etat_projet` int(11) NOT NULL,
  `date_etat_projet` datetime NOT NULL,
  PRIMARY KEY (`id_projet`,`id_etat_projet`),
  KEY `id_etat_projet` (`id_etat_projet`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_10_02_110652_create_administrateur_table', 0),
(2, '2019_10_02_110652_create_code_postal_table', 0),
(3, '2019_10_02_110652_create_contact_table', 0),
(4, '2019_10_02_110652_create_diplome_table', 0),
(5, '2019_10_02_110652_create_domaine_table', 0),
(6, '2019_10_02_110652_create_ecole_table', 0),
(7, '2019_10_02_110652_create_etat_projet_table', 0),
(8, '2019_10_02_110652_create_form_contact_table', 0),
(9, '2019_10_02_110652_create_formation_table', 0),
(10, '2019_10_02_110652_create_histo_etat_projet_table', 0),
(11, '2019_10_02_110652_create_niveau_diplome_table', 0),
(12, '2019_10_02_110652_create_organisation_table', 0),
(13, '2019_10_02_110652_create_porteur_table', 0),
(14, '2019_10_02_110652_create_projet_table', 0),
(15, '2019_10_02_110652_create_realisateur_table', 0),
(16, '2019_10_02_110652_create_realisation_table', 0),
(17, '2019_10_02_110652_create_statut_realisateur_table', 0),
(18, '2019_10_02_110652_create_type_organisation_table', 0),
(19, '2019_10_02_110652_create_type_projet_table', 0),
(20, '2019_10_02_110652_create_validation_real_table', 0),
(21, '2019_10_09_164823_create_password_resets', 1),
(22, '2014_10_12_000000_create_users_table', 2),
(23, '2014_10_12_100000_create_password_resets_table', 2),
(24, '2019_10_02_092658_create_clients_table', 3),
(25, '2019_10_02_120254_create_entreprises_table', 3),
(26, '2019_10_04_073444_add_image_to_clients', 3),
(27, '2019_10_07_072446_create_topics_table', 3),
(28, '2019_10_08_113639_create_comments_table', 3),
(29, '2019_10_18_093511_create_last_ids_table', 3);

-- --------------------------------------------------------

--
-- Structure de la table ` niveau_diplome`
--

DROP TABLE IF EXISTS ` niveau_diplome`;
CREATE TABLE IF NOT EXISTS ` niveau_diplome` (
  `id_niveau_diplome` int(11) NOT NULL AUTO_INCREMENT,
  `label_niveau_diplome` varchar(11) NOT NULL,
  PRIMARY KEY (`id_niveau_diplome`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table ` niveau_diplome`
--

INSERT INTO ` niveau_diplome` (`id_niveau_diplome`, `label_niveau_diplome`) VALUES
(1, 'BAC'),
(2, 'BAC+1'),
(3, 'BAC+2'),
(4, 'BAC+3'),
(5, 'BAC+4'),
(6, 'BAC+5'),
(7, 'BAC+6'),
(8, 'BAC+7'),
(9, 'BAC+8'),
(10, 'Autre');

-- --------------------------------------------------------

--
-- Structure de la table `organisations`
--

DROP TABLE IF EXISTS `organisations`;
CREATE TABLE IF NOT EXISTS `organisations` (
  `id_org` int(11) NOT NULL AUTO_INCREMENT,
  `SIRET` bigint(11) DEFAULT NULL,
  `raison_sociale` varchar(50) DEFAULT NULL,
  `sigle_org` text,
  `logo_URL` text,
  `activite_org` text,
  `tel_orga` int(11) DEFAULT NULL,
  `nb_salaries` int(11) DEFAULT NULL,
  `site_internet_org` text,
  `adresse_org` text,
  `id_cp` int(11) DEFAULT NULL,
  `id_type_org` int(11) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_org`),
  KEY `id_cp` (`id_cp`),
  KEY `idtype_orga` (`id_type_org`),
  KEY `IdPorteur` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `organisations`
--

INSERT INTO `organisations` (`id_org`, `SIRET`, `raison_sociale`, `sigle_org`, `logo_URL`, `activite_org`, `tel_orga`, `nb_salaries`, `site_internet_org`, `adresse_org`, `id_cp`, `id_type_org`, `id`) VALUES
(10, 2365128942356, 'xxxxxxxxxxxx', 'xxxxxxxxxxxxxxxxx', 'xxxxxxxxxxxxxxxx', 'xxxxxxxxxxxxxx', 102030405, 5, 'xxxxxxxxxxxxxxxxxx', 'xxxxxxxxxxxxxx', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `porteurs`
--

DROP TABLE IF EXISTS `porteurs`;
CREATE TABLE IF NOT EXISTS `porteurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `prenom_porteur` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `login_porteur` varchar(50) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `tel_porteur` int(11) DEFAULT NULL,
  `poste_porteur` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `id_org` int(11) DEFAULT NULL,
  `id_cp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Id_org` (`id_org`),
  KEY `id_cp` (`id_cp`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `porteurs`
--

INSERT INTO `porteurs` (`id`, `name`, `prenom_porteur`, `email`, `email_verified_at`, `login_porteur`, `password`, `remember_token`, `tel_porteur`, `poste_porteur`, `updated_at`, `created_at`, `id_org`, `id_cp`) VALUES
(16, 'xxxxxxxxxxxx', 'xxxxxxxxxx', 'yvanmagdeleine@gmail.com', NULL, 'gamerZ01', '$2y$10$bpLegLRQQnDkly2hwCn0tO2l0mtzPjCdra1kzjuhUb8N9.8P1sP2G', NULL, 102030405, 'xxxxxxxxx', '2019-10-16 03:25:21', '2019-10-16 03:25:21', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

DROP TABLE IF EXISTS `projet`;
CREATE TABLE IF NOT EXISTS `projet` (
  `id_projet` int(11) NOT NULL,
  `titre_projet` varchar(100) NOT NULL,
  `desc_projet` varchar(500) NOT NULL,
  `date_butoir_projet` date NOT NULL,
  `date_debut` date NOT NULL,
  `URL_PJ` text NOT NULL,
  `Budget_min_projet` int(11) NOT NULL,
  `budget_max_projet` int(11) NOT NULL,
  `nb_realisateurs` int(11) NOT NULL,
  `stage` tinyint(1) NOT NULL,
  `id_porteur` int(11) NOT NULL,
  `id_type_projet` int(11) NOT NULL,
  PRIMARY KEY (`id_projet`),
  KEY `IdPorteur` (`id_porteur`),
  KEY `id_type_projet` (`id_type_projet`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `realisateurs`
--

DROP TABLE IF EXISTS `realisateurs`;
CREATE TABLE IF NOT EXISTS `realisateurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `prenom_real` varchar(20) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `login_real` varchar(200) DEFAULT NULL,
  `tel_real` int(11) DEFAULT NULL,
  `datenais_real` date DEFAULT NULL,
  `cv_URL` text,
  `linkedin_URL` text,
  `photoprofil_URL` text,
  `updated_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  `id_cp` int(11) DEFAULT NULL,
  `id_ecole` int(11) DEFAULT NULL,
  `id_statut_real` int(11) DEFAULT NULL,
  `id_formation` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cp` (`id_cp`),
  KEY `IdEcole` (`id_ecole`),
  KEY `id_statut_real` (`id_statut_real`),
  KEY `IdFormation` (`id_formation`)
) ENGINE=MyISAM AUTO_INCREMENT=226 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `realisateurs`
--

INSERT INTO `realisateurs` (`id`, `name`, `prenom_real`, `email`, `email_verified_at`, `password`, `remember_token`, `login_real`, `tel_real`, `datenais_real`, `cv_URL`, `linkedin_URL`, `photoprofil_URL`, `updated_at`, `created_at`, `id_cp`, `id_ecole`, `id_statut_real`, `id_formation`) VALUES
(223, '??', NULL, '??', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-18 13:00:48', '2019-10-18 13:00:48', NULL, NULL, NULL, NULL),
(224, '?', NULL, '?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-18 13:00:48', '2019-10-18 13:00:48', NULL, NULL, NULL, NULL),
(225, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-18 13:00:48', '2019-10-18 13:00:48', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `realisation`
--

DROP TABLE IF EXISTS `realisation`;
CREATE TABLE IF NOT EXISTS `realisation` (
  `id_real` int(11) NOT NULL,
  `id_projet` int(11) NOT NULL,
  `date_real` datetime NOT NULL,
  KEY `id_projet` (`id_projet`),
  KEY `id_real` (`id_real`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `statut_realisateur`
--

DROP TABLE IF EXISTS `statut_realisateur`;
CREATE TABLE IF NOT EXISTS `statut_realisateur` (
  `id_statut_real` int(11) NOT NULL AUTO_INCREMENT,
  `label_statut_real` varchar(30) NOT NULL,
  PRIMARY KEY (`id_statut_real`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `statut_realisateur`
--

INSERT INTO `statut_realisateur` (`id_statut_real`, `label_statut_real`) VALUES
(1, 'Etudiant'),
(2, 'Formateur'),
(3, 'Demandeur d\'emploi'),
(4, 'Salarié'),
(5, 'Entrepreneur'),
(6, 'Autre');

-- --------------------------------------------------------

--
-- Structure de la table `topics`
--

DROP TABLE IF EXISTS `topics`;
CREATE TABLE IF NOT EXISTS `topics` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `topics_user_id_foreign` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `type_organisation`
--

DROP TABLE IF EXISTS `type_organisation`;
CREATE TABLE IF NOT EXISTS `type_organisation` (
  `id_type_org` int(11) NOT NULL AUTO_INCREMENT,
  `label_org` varchar(30) NOT NULL,
  PRIMARY KEY (`id_type_org`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_organisation`
--

INSERT INTO `type_organisation` (`id_type_org`, `label_org`) VALUES
(1, 'Association'),
(2, 'Entreprise'),
(3, 'Société'),
(4, 'Organisation publique'),
(5, 'Coopérative');

-- --------------------------------------------------------

--
-- Structure de la table `type_projet`
--

DROP TABLE IF EXISTS `type_projet`;
CREATE TABLE IF NOT EXISTS `type_projet` (
  `id_type_projet` int(11) NOT NULL AUTO_INCREMENT,
  `label_type_projet` varchar(50) NOT NULL,
  PRIMARY KEY (`id_type_projet`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_projet`
--

INSERT INTO `type_projet` (`id_type_projet`, `label_type_projet`) VALUES
(1, 'Informatique'),
(2, 'Infographie'),
(3, 'Communication'),
(4, 'Business'),
(5, 'Télésecrétariat'),
(6, 'Autre');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `validation_real`
--

DROP TABLE IF EXISTS `validation_real`;
CREATE TABLE IF NOT EXISTS `validation_real` (
  `id_admin` int(11) NOT NULL,
  `id_real` int(11) NOT NULL,
  `date_validation_real` datetime NOT NULL,
  PRIMARY KEY (`id_admin`,`id_real`),
  KEY `id_real` (`id_real`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
