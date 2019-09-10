-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 04, 2019 at 11:11 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `connectanou`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrateur/connectanou`
--

DROP TABLE IF EXISTS `administrateur/connectanou`;
CREATE TABLE IF NOT EXISTS `administrateur/connectanou` (
  `IdAdmin` int(11) NOT NULL AUTO_INCREMENT,
  `Mdp_admin` varchar(11) NOT NULL,
  `Tel_admin` int(11) NOT NULL,
  `Email_admin` varchar(11) NOT NULL,
  PRIMARY KEY (`IdAdmin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `codepostale`
--

DROP TABLE IF EXISTS `codepostale`;
CREATE TABLE IF NOT EXISTS `codepostale` (
  `id_cp` int(11) NOT NULL AUTO_INCREMENT,
  `Cp` int(11) NOT NULL,
  `Ville` varchar(11) NOT NULL,
  PRIMARY KEY (`id_cp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacter`
--

DROP TABLE IF EXISTS `contacter`;
CREATE TABLE IF NOT EXISTS `contacter` (
  `IdContacter` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(100) NOT NULL,
  `Prenom` varchar(100) NOT NULL,
  `Email` int(11) NOT NULL,
  `Tel` int(11) NOT NULL,
  `Message` text NOT NULL,
  PRIMARY KEY (`IdContacter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `diplome`
--

DROP TABLE IF EXISTS `diplome`;
CREATE TABLE IF NOT EXISTS `diplome` (
  `id_diplome` int(11) NOT NULL AUTO_INCREMENT,
  `Année_d’obtention` date NOT NULL,
  `Desc_diplome` text NOT NULL,
  PRIMARY KEY (`id_diplome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `domaine`
--

DROP TABLE IF EXISTS `domaine`;
CREATE TABLE IF NOT EXISTS `domaine` (
  `IdDomaine` int(11) NOT NULL AUTO_INCREMENT,
  `label_domaine` int(11) NOT NULL,
  `desc_domaine` int(11) NOT NULL,
  PRIMARY KEY (`IdDomaine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ecole`
--

DROP TABLE IF EXISTS `ecole`;
CREATE TABLE IF NOT EXISTS `ecole` (
  `IdEcole` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_ecole` int(11) NOT NULL,
  `Adresse` int(11) NOT NULL,
  `Tel_ecole` int(11) NOT NULL,
  `Site_internet_ecole` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdEcole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `formation`
--

DROP TABLE IF EXISTS `formation`;
CREATE TABLE IF NOT EXISTS `formation` (
  `IdFormation` int(11) NOT NULL AUTO_INCREMENT,
  `Titre_formation` varchar(200) NOT NULL,
  `Date_debut_formation` date NOT NULL,
  `Date_fin_formation` date NOT NULL,
  `Specialisation_formation` varchar(200) NOT NULL,
  PRIMARY KEY (`IdFormation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `niveau_diplome`
--

DROP TABLE IF EXISTS `niveau_diplome`;
CREATE TABLE IF NOT EXISTS `niveau_diplome` (
  `IdNiveau_diplome` int(11) NOT NULL AUTO_INCREMENT,
  `label_nivdiplome` int(11) NOT NULL,
  PRIMARY KEY (`IdNiveau_diplome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `organisation`
--

DROP TABLE IF EXISTS `organisation`;
CREATE TABLE IF NOT EXISTS `organisation` (
  `Id_org` int(11) NOT NULL AUTO_INCREMENT,
  `SIRET` int(11) NOT NULL,
  `Raison_sociale` int(11) NOT NULL,
  `Sigle_org` int(11) DEFAULT NULL,
  `logo_URL` int(11) DEFAULT NULL,
  `activite_org` int(11) NOT NULL,
  `Tel_org` int(11) NOT NULL,
  `Nombre_de_salarie` int(11) NOT NULL,
  `Site_internet_org` int(11) NOT NULL,
  `Adresse_org` int(11) NOT NULL,
  PRIMARY KEY (`Id_org`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `porteur`
--

DROP TABLE IF EXISTS `porteur`;
CREATE TABLE IF NOT EXISTS `porteur` (
  `IdPorteur` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_porteur` varchar(11) NOT NULL,
  `Prenom_porteur` varchar(11) NOT NULL,
  `Email_porteur` int(11) NOT NULL,
  `Tel_porteur` int(11) NOT NULL,
  `date_creation_compte` datetime NOT NULL,
  PRIMARY KEY (`IdPorteur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `realisateur`
--

DROP TABLE IF EXISTS `realisateur`;
CREATE TABLE IF NOT EXISTS `realisateur` (
  `IdReal` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_real` varchar(11) NOT NULL,
  `Prenom_real` varchar(11) NOT NULL,
  `Email_real` int(11) NOT NULL,
  `Login_real` int(11) NOT NULL,
  `Mdp_real` int(11) NOT NULL,
  `Tel_real` int(11) NOT NULL,
  `Datenais_real` int(11) NOT NULL,
  `CV_URL` int(11) DEFAULT NULL,
  `Linkedin_URL` int(11) DEFAULT NULL,
  `Photoprofil_URL` int(11) NOT NULL,
  `date_creation_compte` datetime NOT NULL,
  PRIMARY KEY (`IdReal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `statut_realisateur`
--

DROP TABLE IF EXISTS `statut_realisateur`;
CREATE TABLE IF NOT EXISTS `statut_realisateur` (
  `id_statut_real` int(11) NOT NULL AUTO_INCREMENT,
  `label_statut_real` int(11) NOT NULL,
  `Etudiant` varchar(100) NOT NULL,
  `Formateur` varchar(100) NOT NULL,
  `Demandeur_d'emploi` varchar(100) NOT NULL,
  PRIMARY KEY (`id_statut_real`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `type_d'organisation`
--

DROP TABLE IF EXISTS `type_d'organisation`;
CREATE TABLE IF NOT EXISTS `type_d'organisation` (
  `idtype_orga` int(11) NOT NULL AUTO_INCREMENT,
  `label_orga` int(11) NOT NULL,
  `Association` varchar(50) NOT NULL,
  `Entreprise` varchar(50) NOT NULL,
  `Fonction_publique` varchar(50) NOT NULL,
  `Entrepreneur` varchar(50) NOT NULL,
  PRIMARY KEY (`idtype_orga`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `mail` varchar(191) DEFAULT NULL,
  `mdp` text,
  `date_creation_compte` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mail` (`mail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `codepostale`
--
ALTER TABLE `codepostale`
  ADD CONSTRAINT `codepostale_ibfk_1` FOREIGN KEY (`id_cp`) REFERENCES `administrateur/connectanou` (`IdAdmin`),
  ADD CONSTRAINT `codepostale_ibfk_2` FOREIGN KEY (`id_cp`) REFERENCES `ecole` (`IdEcole`),
  ADD CONSTRAINT `codepostale_ibfk_3` FOREIGN KEY (`id_cp`) REFERENCES `realisateur` (`IdReal`),
  ADD CONSTRAINT `codepostale_ibfk_4` FOREIGN KEY (`id_cp`) REFERENCES `porteur` (`IdPorteur`),
  ADD CONSTRAINT `codepostale_ibfk_5` FOREIGN KEY (`id_cp`) REFERENCES `organisation` (`Id_org`);

--
-- Constraints for table `diplome`
--
ALTER TABLE `diplome`
  ADD CONSTRAINT `diplome_ibfk_1` FOREIGN KEY (`id_diplome`) REFERENCES `realisateur` (`IdReal`);

--
-- Constraints for table `domaine`
--
ALTER TABLE `domaine`
  ADD CONSTRAINT `domaine_ibfk_1` FOREIGN KEY (`IdDomaine`) REFERENCES `formation` (`IdFormation`);

--
-- Constraints for table `ecole`
--
ALTER TABLE `ecole`
  ADD CONSTRAINT `ecole_ibfk_1` FOREIGN KEY (`IdEcole`) REFERENCES `formation` (`IdFormation`),
  ADD CONSTRAINT `ecole_ibfk_2` FOREIGN KEY (`IdEcole`) REFERENCES `realisateur` (`IdReal`);

--
-- Constraints for table `formation`
--
ALTER TABLE `formation`
  ADD CONSTRAINT `formation_ibfk_1` FOREIGN KEY (`IdFormation`) REFERENCES `realisateur` (`IdReal`);

--
-- Constraints for table `niveau_diplome`
--
ALTER TABLE `niveau_diplome`
  ADD CONSTRAINT `niveau_diplome_ibfk_1` FOREIGN KEY (`IdNiveau_diplome`) REFERENCES `formation` (`IdFormation`),
  ADD CONSTRAINT `niveau_diplome_ibfk_2` FOREIGN KEY (`IdNiveau_diplome`) REFERENCES `diplome` (`id_diplome`);

--
-- Constraints for table `organisation`
--
ALTER TABLE `organisation`
  ADD CONSTRAINT `organisation_ibfk_1` FOREIGN KEY (`Id_org`) REFERENCES `porteur` (`IdPorteur`);

--
-- Constraints for table `porteur`
--
ALTER TABLE `porteur`
  ADD CONSTRAINT `porteur_ibfk_1` FOREIGN KEY (`IdPorteur`) REFERENCES `organisation` (`Id_org`);

--
-- Constraints for table `realisateur`
--
ALTER TABLE `realisateur`
  ADD CONSTRAINT `realisateur_ibfk_1` FOREIGN KEY (`IdReal`) REFERENCES `diplome` (`id_diplome`);

--
-- Constraints for table `statut_realisateur`
--
ALTER TABLE `statut_realisateur`
  ADD CONSTRAINT `statut_realisateur_ibfk_1` FOREIGN KEY (`id_statut_real`) REFERENCES `realisateur` (`IdReal`);

--
-- Constraints for table `type_d'organisation`
--
ALTER TABLE `type_d'organisation`
  ADD CONSTRAINT `type_d'organisation_ibfk_1` FOREIGN KEY (`idtype_orga`) REFERENCES `organisation` (`Id_org`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
